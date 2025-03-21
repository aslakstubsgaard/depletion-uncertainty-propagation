manuscript = depletion-uncertainty-propagation

sources = $(wildcard *.tex)
#bibliography.bib

latexopt = -halt-on-error -file-line-error

.PHONY: all
all: $(manuscript).pdf
$(manuscript).pdf: $(sources)
	pdflatex $(latexopt) $(manuscript).tex

.PHONY: full
full: $(manuscriptFULL).pdf

$(manuscriptFULL).pdf: $(sources)
	pdflatex $(latexopt) $(manuscript).tex
	# bibtex -terse $(manuscript).aux
	pdflatex $(latexopt) $(manuscript).tex
	pdflatex $(latexopt) $(manuscript).tex

.PHONY: clean
clean:
	@rm -f *.aux *.bbl *.blg *.log *.out *.spl *.lof *.lot *.toc \
	$(manuscript).pdf
