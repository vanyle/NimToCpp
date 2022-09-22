# A sample Nim program that you could use to solve
# a competitive programming task.

# This one count the number of repetition of a letter in a string.
# Notice that we use the standard nim library and it just works!

import tables

var input = readLine(stdin)
var prev = ' '
var slen = 0
var ctable: Table[char,int]

for idx in 0..<input.len:
    let i = input[idx]
    if i != prev:
        ctable[prev] = slen
        slen = 1
        prev = i
    else:
        inc slen

echo ctable

ctable[prev] = slen

var maxval = 0
for v in ctable.values():
    if v > maxval: maxval = v
echo maxval