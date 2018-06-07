
from itertools import permutations
import sys


if __name__ == "__main__":
    if len(sys.argv) < 4:
        print('At least three arguments required.')
    else:
        for answer in solve.problem(sys.argv[1:]):
            print("{}+{}={}".format(*answer))
