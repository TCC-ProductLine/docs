TARGET = Presentation_TCC.pdf

.PHONY: all clean dist-clean

all: 
	@pdflatex presentation.tex
	@evince presentation.pdf &

clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log *.bak *.toc *.nav *.out *.snm *.vrb
	rm -f presentation.pdf

aspell:
	aspell -c -d pt_BR -t presentation.tex
