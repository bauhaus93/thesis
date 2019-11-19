LATEX = pdflatex
LATEX_ARGS = -halt-on-error -file-line-error
NAME = thesis

all: expose $(NAME)

$(NAME): $(NAME).pdf
glossary: $(NAME).acr $(NAME).acn
bibliography: $(NAME).bbl $(NAME).blg

expose: expose.pdf

${NAME}.pdf $(NAME).aux: $(NAME).tex
	$(LATEX) $(LATEX_ARGS) $(NAME).tex

expose.pdf: expose.tex
	$(LATEX) $(LATEX_ARGS) expose.tex

$(NAME).acr $(NAME).acn: $(NAME).aux
	makeglossaries $(NAME)

$(NAME).bbl $(NAME).blg: $(NAME).aux
	bibtex $(NAME)

clean_pdf:
	rm -f $(NAME).pdf

.PHONY: clean
clean:
	rm -f info.txt *.aux *.log *.glo *.acr *.acn *.alg *.ist *.bbl *.blg *.out *.fls *.fdb_latexmk
