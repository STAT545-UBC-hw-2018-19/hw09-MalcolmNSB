---
title: "How many words contain a given letter of the alphabet?"
author: "Malcolm Bowles"
date: "27 November, 2018"
output:
  html_document:
    keep_md: yes
---

In this analysis, we investigate the frequency of words that contain a given letter of the alphabet. The list of words we use is available from the web at [http://svnweb.freebsd.org/base/head/share/dict/web2?view=co](http://svnweb.freebsd.org/base/head/share/dict/web2?view=co). 



The most frequent letter appearing in the list of words is the letter e, and the least frequent is the letter j.


![*Fig. 1* Number of words in the `words.txt` file containing a given letter](words_containing_letter.png)


```r
knitr::kable(freq_data)
```



Letters    Number_of_words
--------  ----------------
a                   145443
b                    37564
c                    86159
d                    60881
e                   158121
f                    21800
g                    43279
h                    57186
i                   145338
j                     3129
k                    15288
l                   105454
m                    62827
n                   121120
o                   123424
p                    67606
q                     3641
r                   129109
s                   103593
t                   120363
u                    75600
v                    19416
w                    13229
x                     6905
y                    48576
z                     8046







