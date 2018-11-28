all: report.html number_of_words_report.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html number_of_words_report.html number_of_words_report.md words_containing_letter.rds words_containing_letter.png

words.txt:
	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'

histogram.tsv: histogram.r words.txt
	Rscript $<

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf
	
report.html: report.rmd histogram.tsv histogram.png  
	Rscript -e 'rmarkdown::render("$<")'
	
words_containing_letter.rds: words_containing_letter.r words.txt
	Rscript $<
	
words_containing_letter.png: words_containing_letter.rds
	Rscript -e 'library(ggplot2);  ggplot(readRDS("$<"), aes(Letters, Number_of_words)) + geom_point(); ggsave("$@")'
	rm Rplots.pdf

number_of_words_report.html: number_of_words_report.rmd words_containing_letter.rds words_containing_letter.png
		Rscript -e 'rmarkdown::render("$<")'