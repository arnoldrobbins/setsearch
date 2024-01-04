# Makefile for setsearch doc and code

CFLAGS = -g

TWJRSOURCE = setsearch.twjr

SOURCE = bracketexpr.h bracketexpr.c

OBJ = bracketexpr.o

DOC = setsearch.texi

PDF = setsearch.pdf

all: $(PDF) testit1 testit2

$(PDF): $(DOC) texinfo.tex
	texi2pdf $(DOC)

$(DOC): $(TWJRSOURCE)
	./jrweave $(TWJRSOURCE) > $(DOC)

$(OBJ) testit1.o testit2.o: $(SOURCE)

testit1: $(OBJ) testit1.o
	gcc $(OBJ) testit1.o -o testit1

testit2: $(OBJ) testit2.o
	gcc $(OBJ) testit2.o -o testit2

$(SOURCE): $(TWJRSOURCE)
	./jrtangle $(TWJRSOURCE)

clean:
	rm -f *.[cho] setsearch.?? setsearch.??? setsearch.texi testit[12]
