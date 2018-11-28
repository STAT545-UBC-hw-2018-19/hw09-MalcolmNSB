suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(purrr))
suppressPackageStartupMessages(library(tidyverse))


words <- readLines("words.txt")

#To account for capital letters, we will search for either capital or lower case (e.g. A or a)
number_of_words<- function(s,t) {
  length(str_subset(words, 
                    pattern = str_c(s, t, sep = "|")
                    )
         )
}

#compute number of words containing a given letter (vectorised using purrr)
result <- data.frame(Letters = letters, 
                 		Number_of_words = map2_int(letters, LETTERS, number_of_words)
                 	  )

#reorder factors of letters by frequency they occur, and save in RDS to preserve factor level
saveRDS(mutate(result, Letters = fct_reorder(Letters,Number_of_words )),
				"words_containing_letter.rds")


	
