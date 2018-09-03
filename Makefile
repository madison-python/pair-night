all: slides.pdf flyer.pdf logo.png img/pair-programming.png

slides.pdf: intro-to-pair-programming.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@')"
flyer.pdf: flyer.svg
	inkscape --export-pdf=$(pwd)/$@ $(pwd)/$<
logo.png: logo.svg
	inkscape --export-png=$(pwd)/$@ $(pwd)/$<

img/pair-programming.png: dot/pair-programming.gv
	dot -Tpng -Gdpi=200 -o$@ $<

clean:
	rm -rf *_cache *_files code*
