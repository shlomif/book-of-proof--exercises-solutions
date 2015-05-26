BASE = book-of-proof--solutions-for-exercises

all: $(BASE).ps
# $(BASE).xhtml

pdf: $(BASE).pdf

$(BASE).pdf: $(BASE).ps
	ps2pdf $<

$(BASE).dvi: $(BASE).tex
	latex $<

$(BASE).ps: $(BASE).dvi
	dvips -o $@ $<

$(BASE).xml: $(BASE).tex
	mk4ht mzlatex $<

$(BASE).xhtml: $(BASE).xml
	cp -f $< $@

upload: all
	rsync --rsh=ssh -v --progress -a $(BASE).xhtml $(BASE).css $${HOMEPAGE_SSH_PATH}/Files/files/code/bugs/firefox/mathml-xhtml-hangs-ff/

