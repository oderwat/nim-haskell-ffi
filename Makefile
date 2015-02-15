# change the compiler with a nim.cfg if needed
NIM = nim
GHC = ghc

all: fact

libfact.nim.a: fact.nim
	$(NIM) c --app:staticlib --noMain fact.nim

fact: libfact.nim.a fact.hs
	$(GHC) fact.hs libfact.nim.a -o fact

clean:
	rm -fr nimcache libfact.nim.a fact.hi fact.o fact
