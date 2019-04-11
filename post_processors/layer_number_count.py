#!/usr/bin/python3


import re

from argparse import ArgumentParser
from shutil import copy2 as copy_file
from os import remove as delete_file

LAYER_REGEX = re.compile(r"G[0|1] .*Z([\d,\.]+).* ; move to next layer \((.+)\)")  # noqa: E501


def get_filename_from_commannd_line():
    parser = ArgumentParser(description="Adds a layer count to a G-Code file.")
    parser.add_argument("filename", type=str, help="path to the gcode file")

    args = parser.parse_args()
    return args.filename


def count_layers(path):
    layers_found = 0
    with open(path, 'r') as f:
        for line in f:
            if LAYER_REGEX.match(line):
                layers_found += 1
    return layers_found


if __name__ == '__main__':
    filename = get_filename_from_commannd_line()
    backupname = f"{filename}.bak"

    # Count the layers
    layercount = count_layers(filename)

    # Create a backup
    copy_file(filename, backupname)

    # Process file
    with open(backupname, "r") as src:
        with open(filename, "w") as dest:
            for line in src:
                match = LAYER_REGEX.match(line)
                if match:
                    z_height = float(match.group(1))
                    z_layer = int(match.group(2)) + 1
                    percent = round(z_layer / layercount * 100, 1)
                    dest.write(f"M117 Layer {z_layer}/{layercount} ({percent}%) {z_height}mm\n")  # noqa: E501
                dest.write(line)

    # Delete backup
    delete_file(backupname)
