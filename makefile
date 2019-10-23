NAME = thesis

all: clean_pdf $(NAME) glossary

$(NAME): $(NAME).pdf

glossary: $(NAME).acr $(NAME).acn

${NAME}.pdf $(NAME).aux: ${NAME}.tex bib.tex
	pdflatex -halt-on-error -file-line-error ${NAME}.tex

$(NAME).acr $(NAME).acn: $(NAME).aux
	makeglossaries $(NAME)


clean_pdf:
	rm -f $(NAME).pdf

.PHONY: clean
clean:
	rm -f info.txt *.pdf *.aux *.log *.glo *.acr *.acn *.alg *.ist
