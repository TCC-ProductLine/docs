TARGET = Presentation_TCC.pdf

.PHONY: all clean dist-clean

all: 
	@latex presentation_tcc2.tex
	@latex presentation_tcc2.tex
	@latex presentation_tcc2.tex
	@dvips presentation_tcc2.dvi
	@ps2pdf presentation_tcc2.ps
	@evince presentation_tcc2.pdf &

clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log *.bak *.toc *.nav *.out *.snm *.vrb
	rm -f presentation_tcc2.pdf

aspell:
	aspell -c -d pt_BR -t presentation_tcc2.tex
