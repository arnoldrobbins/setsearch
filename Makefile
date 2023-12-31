# Makefile for setsearch doc and code

TWJRSOURCE = setsearch.twjr

SOURCE = bracketexpr.h bracketexpr.c

OBJ = bracketexpr.o

DOC = setsearch.texi

PDF = setsearch.pdf

all: $(PDF) $(OBJ)

$(PDF): $(DOC) texinfo.tex
	texi2pdf $(DOC)

$(DOC): $(TWJRSOURCE)
	./jrweave $(TWJRSOURCE) > $(DOC)

$(OBJ): $(SOURCE)

$(SOURCE): $(TWJRSOURCE)
	./jrtangle $(TWJRSOURCE)

clean:
	rm -f *.[cho] setsearch.?? setsearch.??? setsearch.texi
