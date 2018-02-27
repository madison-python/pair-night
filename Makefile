cwd := $(shell pwd)/

all: slides.pdf flyer.pdf logo.png house-rules.pdf img/pair-programming.png

slides.pdf: intro-to-pair-programming.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@')"
house-rules.pdf: house-rules.Rmd
%.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@')"

flyer.pdf: flyer.svg
	inkscape --export-pdf=${cwd}$@ ${cwd}$<
logo.png: logo.svg
	inkscape --export-png=${cwd}$@ ${cwd}$<

img/pair-programming.png: dot/pair-programming.gv
	dot -Tpng -Gdpi=200 -o$@ $<
src/laptop.svg:
	curl -o $@ https://upload.wikimedia.org/wikipedia/commons/b/b9/Laptop_font_awesome.svg

clean:
	rm -rf *_cache *_files code*
