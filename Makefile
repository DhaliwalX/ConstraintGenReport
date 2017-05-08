REPORT := Report.tex
PPT := Presentation.tex

all: Reportpdf Presentationpdf

Reportpdf: Report.tex
	pdflatex -shell-escape Report.tex
	bibtex Report
	pdflatex -shell-escape Report.tex
	pdflatex -shell-escape Report.tex

Presentationpdf: Presentationps
	ps2pdf Presentation.ps

Presentationps: Presentationdvi
	dvips Presentation.dvi

Presentationdvi: Presentation.tex
	latex Presentation.tex

.PHONY:
	
clean:
	rm -rf *.log  *.ps *.dvi *.bbl *.aux *.blg *.toc *.ilg *.ind *.backup *.pdf *.snm *.nav *.out _minted-Report

