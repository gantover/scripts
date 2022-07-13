#!/usr/bin/python3

import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument("filename", help="desired file to execute the script on", type=str)
args = parser.parse_args()

filepath = f"{os.getcwd()}/{args.filename}.tex"

file = open(filepath,"r")
lines = file.readlines()

# keeps a copy in case it goes wrong
"""
save = open(args.filename+".old","w+")
for x in lines:
    save.writelines(x)
save.close()
"""

# define desired values
to_treat = {r"\chapter":4, r"\section":3, r"\subsection":2}

diffs = {}
j = 0
for index in range(len(lines)):
    for x in to_treat.items():
        if x[0] in lines[index]:
            i = 1 
            while lines[index-i] == "\n":
                i += 1
            if lines[index-1] != "\n":
                diffs[index + j] = x[1]-1
                j += x[1]-1
            elif i != x[1]:
                diff = x[1]-i
                diffs[index + j] = diff
                j += diff 

for it in diffs.items():
    if it[1] > 0:
        lines[it[0]:it[0]] = ["\n" for x in range(it[1])]
    elif it[1] < 0:
        for x in range(-1*it[1]):
            lines.pop(it[0]+it[1])

file.close()

file = open(args.filename,"w+")
for x in lines:
    file.writelines(x)
