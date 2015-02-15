# Nim-Haskell FFI Example

**(aka: Calling Nim from Haskell)**

As Nim can compile to libraries and I am also interested in some Haskell I thought I could try to call some Nim from Haskell.

_This was largely inspired by the "[Rust-Haskell FFI Example](https://github.com/aisamanra/rust-haskell-ffi)"_ and handles just the fact() case from the Rust example.

At first I just wanted to get it running and simply duplicated the example for an unsigned integer factorial function.

After getting more compfortable I may extend this to more complicated types.

# How it works

Basically I just compile the Nim source with some special compiler flags to a static library and let GHC link against it. The Haskell FFI does the rest.

To check that out you need a working Haskell compiler. I assume you have already if you read this :)

Second you need the [Nim Compiler](http://nim-lang.org/). It is free and probably the start of a long term love.

After that run `make && ./fact` which should output:

```
fact(20) = 2432902008176640000
```

This also is the largest factorial this proc can handle.

> If Haskell calls Nim with 21 it will segfault. If you run that with the Nim compiler (`nim c -r fact.nim`) you will see how Nim generates an exeption for the overflow.

_For more info look at the various sources. I may update this repository with more stuff later._

# Mac OS X specials

Compiling to a static library  with `clang` calls `llvm-ar` which seems not to be installed on OS X.

Compiling with `clang` worked after I simply added a softlink to the system `ar` like this:

```
ls -s /usr/bin/ar /usr/local/bin/llvm-ar
```

Using `--cc=GCC` to compile the lib worked after I removed the `-fasm-blocks` from `/etc/nim.cfg`. This has to go anyway imho!

Thats all so far! Have fun with Nim!
