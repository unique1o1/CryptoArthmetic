
from itertools import permutations
import sys


def solve_problem(words):
    # Remove duplicate letters and create a list
    letters = list(set(''.join(words)))
    if len(letters) > 10:
        print('Too many distinct letters ({})'.format(len(letters)))
        exit(0)

    for perm in permutations(range(10), len(letters)):
        # Create a hash value for key value pair i.e letter is key number is value
        lookup = dict(zip(letters, perm))
        if all(lookup[i[0]] > 0 for i in words):
            # array of words converted into numbers i.e [123,123,432]
            numbers = [word_to_number(w, lookup) for w in words]

            if sum(numbers[:-1]) == numbers[-1]:
                yield numbers


def word_to_number(word, lookup):
    """Convert a word to a number by replacing each letter with a digit"""
    return int(''.join(str(lookup[letter]) for letter in word))


