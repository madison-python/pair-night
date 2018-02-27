intro-to-pair-programming.pdf: intro-to-pair-programming.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@')"
img/back-to-back.pdf: src/back-to-back.gv src/laptop.svg
	dot -Tpdf -o $@ $<
src/laptop.svg:
	curl -o $@ https://upload.wikimedia.org/wikipedia/commons/b/b9/Laptop_font_awesome.svg
clean:
	rm -rf *_cache/ *_files/ code*
