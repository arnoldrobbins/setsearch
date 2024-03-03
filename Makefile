# Makefile for setsearch doc and code

CFLAGS = -g

TWJRSOURCE = setsearch.twjr

SOURCE = bracketexpr.h bracketexpr.c

OBJ = bracketexpr.o

DOC = setsearch.texi

PDF = setsearch.pdf

all: $(PDF) btest

$(PDF): $(DOC) texinfo.tex
	texi2pdf $(DOC)

$(DOC): $(TWJRSOURCE)
	./jrweave $(TWJRSOURCE) > $(DOC)

$(OBJ): $(SOURCE)

btest.o: btest.c

btest.c: $(TWJRSOURCE)
	./jrtangle $(TWJRSOURCE)

btest: $(OBJ) btest.o
	gcc $(CFLAGS) $(OBJ) btest.o -o btest

$(SOURCE): $(TWJRSOURCE)
	./jrtangle $(TWJRSOURCE)

clean:
	rm -f *.[cho] setsearch.?? setsearch.??? setsearch.texi btest runtests.sh

spell:
	spell $(TWJRSOURCE) | LC_ALL=C sort -u | LC_ALL=C comm -23 - wordlist

check: btest
	./runtests.sh > _tests ; \
	if cmp -s tests.good _tests ; \
	then	rm _tests; \
	else	diff -u tests.good _tests | more ; \
	fi
