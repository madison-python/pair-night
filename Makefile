cwd := $(shell pwd)/

all: slides.pdf flyer.pdf logo.png img/pair-programming.png

slides.pdf: intro-to-pair-programming.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@')"
flyer.pdf: flyer.svg
	inkscape --export-pdf=${cwd}$@ ${cwd}$<
logo.png: logo.svg
	inkscape --export-png=${cwd}$@ ${cwd}$<

img/pair-programming.png: dot/pair-programming.gv
	dot -Tpng -Gdpi=200 -o$@ $<
img/back-to-back.pdf: src/back-to-back.gv src/laptop.svg
	dot -Tpdf -o $@ $<
src/laptop.svg:
	curl -o $@ https://upload.wikimedia.org/wikipedia/commons/b/b9/Laptop_font_awesome.svg

clean:
	rm -rf *_cache *_files code*
