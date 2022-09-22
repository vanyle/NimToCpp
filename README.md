# NimToCpp

Let's say you enjoy competitive programming.
You want to solve some challenging program from an only website like [cses](https://cses.fi/) for example.

The issue is that these website only accept Python, C and C++ as valid languages for their inputs!

You start by writing your solution in Python because it's convenient, but turn's out it's a bit
too slow and you want that 80x boost from C++ so you rewrite everything in C++ and it works but you just
wasted your time.

What if you would write your program in a fast but expressive language, like Nim, convert the Nim code
to a self-contained C++ file and submit that file?

Well, now, you can!

## Usage

To install:
- Clone this repo. 
- `nimble build -d:release`
- Put the executable in your path.

Use with: `NimToCpp <nim source file>`

This will create a file named: `<nim file name>.nim_clean.cpp`

You can them compile this C++ file yourself or submit it to a competitive programming website!

```
λ nimtocpp .\test\t1.nim
C++ code available at: .\test\t1.nim_clean.cpp
λ g++ -Os .\test\t1.nim_clean.cpp -o t1.exe
[Warnings ...]
λ ./t1
[Program gets executed]
```

## Requirements

You need to have the nim compiler in your path.

## Limitation and technical details

The GC is not available in the C++ file so that the generate code is not too long.

There is not a lot of testing done, but it seem to work with `seq`, `Table`, `string` and most
element you'd need to solve most elements you'd need to program competitively.

The "readability" of the C++ code produced is not great, don't expect something like:

```
#include <stdio.h>

void main(){
	printf("Hello, world");
}
```

but more like:

```

#include <stdio.h>

// ...1000 lines of junk...

STRING_LITERAL(TM__Ms59a0hH9a45nWiQHsSBSqKw_3, "Hello, world", 12);
static NIM_CONST tyArray__nHXaesL0DJZHyVS07ARPRA TM__Ms59a0hH9a45nWiQHsSBSqKw_2 = {((NimStringDesc*) &TM__Ms59a0hH9a45nWiQHsSBSqKw_3)}
;

// More junk

N_LIB_PRIVATE N_NIMCALL(void, NimMainModule)(void) {
{
	echoBinSafe(TM__Ms59a0hH9a45nWiQHsSBSqKw_2, 1);
}

// Even more junk

```