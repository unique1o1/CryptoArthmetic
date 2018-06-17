from itertools import permutations
import sys


def  solve_problem(list words):
    # Remove duplicate letters and create a list
    cdef:
        tuple perm
        list numbers
        dict lookup
        list letters

    unique_words=list(set(words))
    letters = list(set(''.join(unique_words)))
    
    if len(letters) > 10:
        print('Too many distinct letters ({})'.format(len(letters)))
        exit(0)

    
    for perm in permutations(range(10), len(letters)):
        # Create a hash value for key value pair i.e letter is key number is value

        lookup=dict(zip(letters, perm))
 
        if all(lookup[i[0]] > 0 for i in unique_words):
            # array of words converted into numbers i.e [123,123,432]
            numbers=[]
            for w in unique_words:
                numbers.extend(word_to_number(w,lookup,words))
            if sum(numbers[:-1]) == numbers[-1]:
                yield numbers


def word_to_number(str word, dict lookup,list words):
    """Convert a word to a number by replacing each letter with a digit"""
    cdef :
        
        int size=len(word)
        int it=0
    for i,w in enumerate(word,1):
        it+=lookup[w]*(10**(size-i))
    cdef int c=words.count(word)
    if c>1:
        return [it]*c
    return [it]
