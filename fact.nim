# Simple example for calling Nim from Haskell

# This will be called from Haskell
proc fact*(x: int64): int64 {.exportc: "fact".} =
    # I use int64 to make sure it matches Haskells Int the best
    if x == 0: 1'i64
    else: x * fact(x-1)

# use `nim c -r fact.nim` to test this

when isMainModule:

    echo "fact(20) = ", fact(20) # thats the max for u64
    # using 21 will case an OverFlowError exeption
    # which causes a segfault when called from Haskell
