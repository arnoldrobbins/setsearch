# Makefile for setsearch doc and code

TWJRSOURCE = setsearch.twjr

SOURCE = bracketexpr.h bracketexpr.c

OBJ = bracketexpr.o

DOC = setsearch.texi

PDF = setsearch.pdf

all: $(PDF) $(OBJ)

$(PDF): $(DOC) texinfo.tex
	./jrweave $(TWJRSOURCE) > $(DOC)
	texi2pdf $(DOC)

$(OBJ): $(SOURCE)

$(SOURCE): $(TWJRSOURCE)
	./jrtangle $(TWJRSOURCE)

clean:
	rm -f *.[ch] setsearch.?? setsearch.???
