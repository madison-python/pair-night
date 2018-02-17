cwd := $(shell pwd)/

all: slides.pdf flyer.pdf logo.png
slides.pdf: intro-to-pair-programming.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@')"
flyer.pdf: flyer.svg
	inkscape --export-pdf=${cwd}$@ ${cwd}$<
logo.png: logo.svg
	inkscape --export-png=${cwd}$@ ${cwd}$<
clean:
	rm -rf *_cache *_files code*
