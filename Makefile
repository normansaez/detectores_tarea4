TEXFILES = $(wildcard *.tex)
PDFFILES = $(TEXFILES:.tex=.pdf)
PNGFILES = $(PDFFILES:.pdf=.png)

all: pdf

pdf: $(PDFFILES)

%.pdf: %.tex
	echo $(TEXFILES)
	@rubber --pdf $<
	@if [ -d doc ];then mv *.pdf doc; else mkdir doc; mv *.pdf doc/;fi

clean:
	@rubber --clean $(TEXFILES:.tex=)
	@rm -rf *.bak

distclean: clean
	@rubber --clean --pdf $(TEXFILES:.tex=)
#	@rm -rf doc

display: clean all
	okular doc/$(PDFFILES) &> /dev/null &

