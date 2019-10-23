NAME = thesis

all: $(NAME)

$(NAME): $(NAME).pdf
glossary: $(NAME).acr $(NAME).acn
bibliography: $(NAME).bbl $(NAME).blg

${NAME}.pdf $(NAME).aux: ${NAME}.tex
	pdflatex -halt-on-error -file-line-error ${NAME}.tex

$(NAME).acr $(NAME).acn: $(NAME).aux
	makeglossaries $(NAME)

$(NAME).bbl $(NAME).blg: $(NAME).aux
	bibtex $(NAME)

clean_pdf:
	rm -f $(NAME).pdf

.PHONY: clean
clean:
	rm -f info.txt *.aux *.log *.glo *.acr *.acn *.alg *.ist *.bbl *.blg
