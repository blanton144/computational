PDFDIR= docs/pdf
TEXDIR= tex
DOCDIR= docs

vpath %.tex $(TEXDIR)

ALL= \
	$(PDFDIR)/syllabus.pdf \
	$(PDFDIR)/example.pdf \
	$(PDFDIR)/ps-1.pdf \
	$(PDFDIR)/ps-2.pdf \
	$(PDFDIR)/ps-3.pdf \
	$(PDFDIR)/ps-4.pdf \
	$(PDFDIR)/ps-5.pdf \
	$(PDFDIR)/ps-6.pdf \
	$(PDFDIR)/ps-7.pdf \
	$(PDFDIR)/ps-8.pdf \
	$(PDFDIR)/ps-9.pdf \
	$(PDFDIR)/ps-11.pdf \
	$(PDFDIR)/fft.pdf \
	$(PDFDIR)/fft-answers.pdf \
	$(PDFDIR)/boundary.pdf \
	$(PDFDIR)/boundary-answers.pdf \
	$(PDFDIR)/integration.pdf \
	$(PDFDIR)/integration-answers.pdf \
	$(PDFDIR)/eigensystems.pdf \
	$(PDFDIR)/eigensystems-answers.pdf \
	$(PDFDIR)/linear-algebra.pdf \
	$(PDFDIR)/linear-algebra-answers.pdf \
	$(PDFDIR)/differentiation.pdf \
	$(PDFDIR)/differentiation-answers.pdf \
	$(PDFDIR)/random.pdf \
	$(PDFDIR)/random-answers.pdf \
	$(PDFDIR)/arrays.pdf \
	$(PDFDIR)/arrays-answers.pdf \
	$(PDFDIR)/roots.pdf \
	$(PDFDIR)/roots-answers.pdf \
	$(PDFDIR)/minimization.pdf \
	$(PDFDIR)/minimization-answers.pdf \
	$(PDFDIR)/numerics.pdf \
	$(PDFDIR)/numerics-answers.pdf \
	$(PDFDIR)/ode.pdf \
	$(PDFDIR)/ode-answers.pdf \
	$(PDFDIR)/pde.pdf \
	$(PDFDIR)/pde-answers.pdf \
	$(PDFDIR)/intro.pdf \
	$(PDFDIR)/intro-answers.pdf \
	$(PDFDIR)/project-double-pendulum.pdf \
	$(PDFDIR)/project-soliton.pdf \
	$(PDFDIR)/project-stellar-structure.pdf \
	$(PDFDIR)/project-psf.pdf \
	$(PDFDIR)/project-telescope.pdf \
	$(PDFDIR)/project-three-body.pdf \
	$(PDFDIR)/project-gravity-mesh.pdf \
	$(PDFDIR)/project-ising.pdf \
	$(PDFDIR)/project-ligo.pdf  

all: $(ALL) $(DOCDIR)/example.tex

$(PDFDIR)/%.pdf $(PDFDIR)/%-answers.pdf: $(TEXDIR)/%.tex \
	$(TEXDIR)/%-text.tex $(TEXDIR)/%-answers.tex $(TEXDIR)/computational_defs.tex
	cd $(TEXDIR); pdflatex $(*F); bibtex $(*F); pdflatex $(*F); pdflatex $(*F)
	cd $(TEXDIR); pdflatex $(*F)-answers; bibtex $(*F)-answers; pdflatex $(*F)-answers; pdflatex $(*F)-answers
	mv $(TEXDIR)/$(*F).pdf $(PDFDIR)
	mv $(TEXDIR)/$(*F)-answers.pdf $(PDFDIR)

$(PDFDIR)/%.pdf: $(TEXDIR)/%.tex
	cd $(TEXDIR); pdflatex $(*F); pdflatex $(*F); pdflatex $(*F)
	mv $(TEXDIR)/$(*F).pdf $(PDFDIR)

$(PDFDIR)/example.pdf: $(TEXDIR)/example.tex $(TEXDIR)/scatter.png
	cd $(TEXDIR); pdflatex example; bibtex example; pdflatex example; pdflatex example
	mv $(TEXDIR)/example.pdf $(PDFDIR)

$(DOCDIR)/example.tex: $(TEXDIR)/example.tex
	cp -f $(TEXDIR)/example.tex $(DOCDIR)

texclean:
	rm -f $(TEXDIR)/*.log $(TEXDIR)/*.aux $(TEXDIR)/*.bbl $(TEXDIR)/*.blg $(TEXDIR)/*.out

fullclean: texclean
	rm -f $(PDFDIR)/*.pdf

dummy:
