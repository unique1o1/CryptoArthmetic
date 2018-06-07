
from itertools import permutations
import sys


def word_to_number(word, lookup):
    """Convert a word to a number by replacing each letter with a digit, using a lookup dictionary."""
    return int(''.join(str(lookup[letter]) for letter in word))


def solve_problem(words):
    words = [word.upper() for word in words]
    letters = list(set(''.join(words)))
    if len(letters) > 10:
        print('Too many distinct letters ({})'.format(len(letters)))
        exit(0)

    for perm in permutations(range(10), len(letters)):
        lookup = dict(zip(letters, perm))

        numbers = [word_to_number(w, lookup) for w in words]

        if sum(numbers[:-1]) == numbers[-1]:
            yield numbers


if __name__ == "__main__":
    if len(sys.argv) < 4:
        print('At least three arguments required.')
    else:
        for answer in solve_problem(sys.argv[1:]):
            print("{}+{}={}".format(*answer))
