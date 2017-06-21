PDFDIR= docs/pdf
TEXDIR= tex
DOCDIR= docs

vpath %.tex $(TEXDIR)

ALL= \
	$(PDFDIR)/syllabus.pdf \
	$(PDFDIR)/example.pdf \
	$(PDFDIR)/intro.pdf \
	$(PDFDIR)/intro-answers.pdf  

all: $(ALL) $(DOCDIR)/example.tex

$(PDFDIR)/%.pdf $(PDFDIR)/%-answers.pdf: $(TEXDIR)/%.tex \
	$(TEXDIR)/%-text.tex $(TEXDIR)/%-answers.tex $(TEXDIR)/computational_defs.tex
	cd $(TEXDIR); pdflatex $(*F); bibtex $(*F); pdflatex $(*F); pdflatex $(*F)
	cd $(TEXDIR); pdflatex $(*F)-answers; bibtex $(*F)-answers; pdflatex $(*F)-answers; pdflatex $(*F)-answers
	mv $(TEXDIR)/$(*F).pdf $(PDFDIR)
	mv $(TEXDIR)/$(*F)-answers.pdf $(PDFDIR)

$(PDFDIR)/example.pdf: $(TEXDIR)/example.tex $(TEXDIR)/scatter.png
	cd $(TEXDIR); pdflatex example; pdflatex example; pdflatex example
	mv $(TEXDIR)/example.pdf $(PDFDIR)

$(DOCDIR)/example.tex: $(TEXDIR)/example.tex
	cp -f $(TEXDIR)/example.tex $(DOCDIR)

texclean:
	rm -f $(TEXDIR)/*.log $(TEXDIR)/*.aux $(TEXDIR)/*.bbl $(TEXDIR)/*.blg $(TEXDIR)/*.out

fullclean: texclean
	rm -f $(PDFDIR)/*.pdf

dummy:
