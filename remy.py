# implement algorithm 7.2.1.6.R of Knuth's volume 4 on generating trees
# http://www.cs.utsa.edu/~wagner/knuth/fasc4a.pdf

import random


def randomBinTreeLink(N):
    ''' 
    Input:
    N: number of internal nodes

    Output:
    Linked representation L_0 L_1 ... L_{2N} of a uniformly 
    random binary tree with N internal nodes
    '''

    n = 0
    L = [0]*(2*N+1)

    while (n < N):
        X = random.randint(0, 4*n+1)
        n = n+1
        b = X % 2
        k = X // 2
        tn = 2*n
        L[tn-b] = tn
        L[tn-1+b] = L[k]
        L[k] = tn-1

    return L


def linkToTree(k, L):
    if k%2 == 0:
        # even numbers -> external leaf
        return ()
    else:
        return linkToTree(L[k], L), linkToTree(L[k+1], L)


def randomBinTree(N):
    L = randomBinTreeLink(N)
    # L[0] is the root
    return linkToTree(L[0], L)
