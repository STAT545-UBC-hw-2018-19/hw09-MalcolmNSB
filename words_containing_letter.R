suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(tidyverse))


words <- readLines("words.txt")


number_of_words<- function(s,t) {
  length(str_subset(words, 
                    pattern = str_c(s, t, sep = "|")
                    )
         )
}
result <- data.frame(Letters = letters, 
                 		Number_of_words = map2_int(letters, LETTERS, number_of_words)
                 	)


saveRDS(mutate(result, Letters = fct_reorder(Letters,Number_of_words )),
				"words_containing_letter.rds")


	
