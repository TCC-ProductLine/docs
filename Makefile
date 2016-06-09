TARGET = TCC_Alex_Jefferson.pdf

BIBTEX = bibtex
LATEX = latex
DVIPS = dvips
PS2PDF = ps2pdf

VERSION = 0.1.0

FIXOS_DIR = fixos
FIXOS_SOURCES = informacoes.tex novosComandos.tex fichaCatalografica.tex \
		folhaDeAprovacao.tex pacotes.tex comandos.tex setup.tex	\
		listasAutomaticas.tex indiceAutomatico.tex

FIXOS_FILES = $(addprefix $(FIXOS_DIR)/, $(FIXOS_SOURCES))

EDITAVEIS_DIR = editaveis
EDITAVEIS_SOURCES = informacoes.tex dedicatoria.tex \
					agradecimentos.tex epigrafe.tex resumo.tex abstract.tex \
					abreviaturas.tex simbolos.tex apendices.tex anexos.tex

CAPITULOS_DIR = capitulos
CAPITULOS_SOURCES = capitulo1.tex capitulo2.tex capitulo3.tex capitulo4.tex capitulo5.tex capitulo6.tex capitulo7.tex 

EDITAVEIS_FILES = $(addprefix $(EDITAVEIS_DIR)/, $(EDITAVEIS_SOURCES))
CAPITULOS_FILES = $(addprefix $(CAPITULOS_DIR)/, $(CAPITULOS_SOURCES))

MAIN_FILE = tcc.tex
DVI_FILE  = $(addsuffix .dvi, $(basename $(MAIN_FILE)))
AUX_FILE  = $(addsuffix .aux, $(basename $(MAIN_FILE)))
PS_FILE   = $(addsuffix .ps, $(basename $(MAIN_FILE)))
PDF_FILE  = $(addsuffix .pdf, $(basename $(MAIN_FILE)))

SOURCES = $(FIXOS_FILES) $(EDITAVEIS_FILES) $(CAPITULOS_FILES)

.PHONY: all clean dist-clean

all: 
	@make $(TARGET)

$(TARGET): $(MAIN_FILE) $(SOURCES) bibliografia.bib
	$(LATEX) $(MAIN_FILE) $(SOURCES)
	$(BIBTEX) $(AUX_FILE)
	$(LATEX) $(MAIN_FILE) $(SOURCES)
	$(LATEX) $(MAIN_FILE) $(SOURCES)
	
	$(DVIPS) $(DVI_FILE)
	$(PS2PDF) $(PS_FILE)

	@evince $(subst tex,pdf,$(MAIN_FILE)) &

clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log *.bak
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx
	rm -f tcc.pdf proposta.pdf

aspell:
	aspell -c -d pt_BR -t $(MAIN_FILE)
	
dist: clean
	tar vczf tcc-fga-latex-$(VERSION).tar.gz *

dist-clean: clean
	rm -f $(PDF_FILE)
