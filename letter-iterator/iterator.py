# iterator.py
# Given a string containing a single asterisk, iterate over each letter of the
# alphabet, replace the asterisk with the letter, and print the result.
# eg. p*thon prints: pathon, pbthon, pcthon ... python, pzthon

import re
import string
import sys

def main():
    USAGE = "usage: " + sys.argv[0] + " word \n word: word containing one *"
    try:
        input = sys.argv[1]
        if not len(sys.argv) == 2 \
        or not re.compile("[a-zA-Z\*]").match(input) \
        or not input.count('*') == 1: # to simplify: use regex to count *s
            print USAGE
        else:
            iterate(input)
    except IndexError:
        print USAGE

def iterate(word):
    split = word.split('*')
    for letter in list(string.ascii_lowercase):
        print split[0].lower() + letter + split[1].lower()

main()
