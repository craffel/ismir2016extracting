SRC = ISMIR2016Template

all: $(SRC).tex
	pdflatex $<
	bibtex $(SRC)
	pdflatex $<
	pdflatex $<

check: $(SRC).tex
	chktex $<
	ispell -t $<

gray: $(SRC).pdf
	pdf2ps -sDEVICE=psgray $(SRC).pdf - |ps2pdf - $(SRC)-gray.pdf


clean:
	rm -f *.aux *.log

spotless: clean
	rm -f *.dvi *.bak *.bbl *.blg
