all: report.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html words_containing_letter.tsv words_containing_letter.png

report.html: report.rmd histogram.tsv histogram.png words_containing_letter.png words_containing_letter.tsv
	Rscript -e 'rmarkdown::render("$<")'

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

histogram.tsv: histogram.r words.txt
	Rscript $<
	
words_containing_letter.tsv: words_containing_letter.R words.txt 
	Rscript $< 

words_containing_letter.png: words_containing_letter.rds
	Rscript -e 'library(ggplot2);  ggplot(readRDS("$<"), aes(Letters, Number_of_words)) + geom_point(); ggsave("$@")'
	rm Rplots.pdf
#words.txt: /usr/share/dict/words
#	cp $< $@

words.txt:
	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
