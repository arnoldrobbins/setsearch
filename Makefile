# Makefile for setsearch doc and code

CFLAGS = -g

TWJRSOURCE = setsearch.twjr

SOURCE = bracketexpr.h bracketexpr.c

OBJ = bracketexpr.o testit.o

DOC = setsearch.texi

PDF = setsearch.pdf

all: $(PDF) testit

$(PDF): $(DOC) texinfo.tex
	texi2pdf $(DOC)

$(DOC): $(TWJRSOURCE)
	./jrweave $(TWJRSOURCE) > $(DOC)

$(OBJ): $(SOURCE)

testit: $(OBJ)
	gcc $(OBJ) -o testit

$(SOURCE): $(TWJRSOURCE)
	./jrtangle $(TWJRSOURCE)

clean:
	rm -f *.[cho] setsearch.?? setsearch.??? setsearch.texi testit
