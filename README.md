# UNIFIED-C

###### By Panoramix de Druïde, 2024

> What is UNIFIED-C?

UNIFIED-C is C-compatible (ish, read on for the details) source code that's written using a small subset of the available character space. It's named after the characters `d`, `e`, `f`, `i`, `n`, and `u`, which are all the letters you need to type fluent UNIFIED-C.
The full UNIFIED-C character set consists of the aforementioned letters, the digits `0` through `9`, the brackets `(` and `)`, the comma `,` and pound sign `#`, and, for rather arcane reasons, the question mark `?`, forward and backward slashes `/` and `\` and equals sign `=`. Oh, and the space character is also necessary. That's a total of only 25 different characters to write *any* C program!

> How does it work?

The UNIFIED-C translator takes a "normal" `.c` or `.h` file as its input (either provided as an argument to the script or on `STDIN`) and spits out UNIFIED-C code, simple as that! (Example: `< myfile.c ./unified.sh > unified.c`)

> I can't get my UNIFIED-C to compile, what now?

As implied earlier, UNIFIED-C has its fair share of quirks. For starters, it only compiles with `gcc`. Sorry, `clang` aficionados, but your compiler (somewhat understandibly) can't be forced to not-really comply with the C standard like `gcc` can!

> OK, I switched to `gcc` but I'm still getting a boatful of errors. Shouldn't it work now?

Yes, it should, *if* you tell `gcc` what to do. Here's how to do that:

- First, pre-process your file with trigraph support disabled. The `-o` flag for output won't work here because of the "errors" (ha!) `gcc` believes are there, so simply redirect `STDOUT` to a file. (`cpp -P unified.c > step1.c` will perform the first step. Adding `2> /dev/null` is advised to avoid looking at the ugly error messages)
- Then, pre-process *that* file again, but now with trigraph support enabled. `-o` still won't work, and the errors are still obnoxiously there, but we're fine, I promise! (To enable trigraphs support, add `-trigraphs` to the command above, so that it reads `cpp -P -trigraphs step1.c > step2.c`. We still recommend to add `2> /dev/null`.
- Check out the file the previous step created to confirm it's the same as your input. The only notable difference will be some missing whitespace, and who doesn't love that! Feel free to compile it with `gcc` as normal.

> So, if I understand this correctly, UNIFIED-C is C-compatible-ish code that's generated from "normal" C by a shell script, and it takes just the C preprocessor to undo the obfuscation? That's nifty!

That is indeed exactly what it is, enjoy!
