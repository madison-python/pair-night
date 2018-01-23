intro-to-pair-programming.pdf: intro-to-pair-programming.Rmd
	Rscript -e "rmarkdown::render('$<', output_file = '$@')"
clean:
	rm -rf *_cache/ *_files/ code*
