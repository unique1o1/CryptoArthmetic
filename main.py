import cy_thon

import sys
if __name__ == "__main__":
    if len(sys.argv) < 4:
        print('At least three arguments are required.')
    else:
        for answer in cy_thon.solve_problem(sys.argv[1:]):
            print(' + '.join(str(n)
                             for n in answer[:-1]) + ' = ' + str(answer[-1]))
