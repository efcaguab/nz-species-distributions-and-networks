We want to investigate whether species interact differently at the core of their range compared to the fringes of their distribution. One could expect species to diversify their interactions as interaction parters become less common/available. Alternatively, one could expect species to interact with only a subset of the interaction partners, as they cannot develop new interactions when environemntal conditions are close to the limits of where possitive groth rates occur.

The aim of this document is to explore whether the interaction data available in the Bascompte's Web of Life could be adequate to answer this question or not.

We start by checking wether species (and interactions) occur in enough localities to be able to detect a change across the species ranges.

Species & interaction turnover
------------------------------

### Species turnover

![](turnover_files/figure-markdown_github/unnamed-chunk-1-1.png)

|     | guild | species               |  \# locations|
|-----|:------|:----------------------|-------------:|
| 1   | pla   | Trifolium repens      |            10|
| 2   | pla   | Achillea millefolium  |             6|
| 3   | pla   | Hypochoeris radicata  |             6|
| 4   | pla   | Ixeris dentata        |             6|
| 5   | pla   | Prunella vulgaris     |             6|
| 6   | pla   | Taraxacum officinale  |             6|
| 7   | pla   | Cerastium alpinum     |             5|
| 8   | pla   | Cirsium arvense       |             5|
| 9   | pla   | Fuchsia regia         |             5|
| 10  | pla   | Lantana camara        |             5|
| 1   | pol   | Apis mellifera        |            34|
| 2   | pol   | Eristalis tenax       |            20|
| 3   | pol   | Episyrphus balteatus  |            13|
| 4   | pol   | Syritta pipiens       |            11|
| 5   | pol   | Melanostoma scalare   |             9|
| 6   | pol   | Bombus terrestris     |             8|
| 7   | pol   | Bombylius major       |             8|
| 8   | pol   | Lycaena phlaeas       |             8|
| 9   | pol   | Melanostoma mellinum  |             8|
| 10  | pol   | Sphaerophoria scripta |             8|

### Interaction turnover

![](turnover_files/figure-markdown_github/unnamed-chunk-3-1.png)

|     | plant                 | pollinator               |  \# locations|
|-----|:----------------------|:-------------------------|-------------:|
| 1   | Fuchsia regia         | Thalurania glaucopis     |             4|
| 2   | Hydrangea paniculata  | Lasioglossum apristum    |             4|
| 3   | Hypochoeris radicata  | Episyrphus balteatus     |             4|
| 4   | Lathyrus pratensis    | Bombus pascuorum         |             4|
| 5   | Persicaria thunbergii | Eristalis cerealis       |             4|
| 6   | Astilbe thunbergii    | Lasioglossum apristum    |             3|
| 7   | Calluna vulgaris      | Apis mellifera           |             3|
| 8   | Calluna vulgaris      | Episyrphus balteatus     |             3|
| 9   | Calluna vulgaris      | Eristalis tenax          |             3|
| 10  | Calluna vulgaris      | Mellinus arvensis        |             3|
| 11  | Cirsium arvense       | Bombus lapidarius        |             3|
| 12  | Cirsium arvense       | Bombus terrestris        |             3|
| 13  | Cirsium arvense       | Maniola jurtina          |             3|
| 14  | Cistus salvifolius    | Apis mellifera           |             3|
| 15  | Deutzia crenata       | Eristalis cerealis       |             3|
| 16  | Deutzia crenata       | Sphaerophoria menthastri |             3|
| 17  | Epilobium latifolium  | Nysius groenlandicus     |             3|
| 18  | Fuchsia regia         | Clytolaema rubricauda    |             3|
| 19  | Galactites tomentosa  | Apis mellifera           |             3|
| 20  | Galium propinquum     | Heteria appendiculata    |             3|

### Degree vs. widespread

![](turnover_files/figure-markdown_github/unnamed-chunk-6-1.png)

| guild | species               |  \# locations|  degree|
|:------|:----------------------|-------------:|-------:|
| pla   | Fuchsia regia         |             5|       6|
| pla   | Ixeris dentata        |             6|      38|
| pla   | Hypochoeris radicata  |             6|      72|
| pla   | Cirsium arvense       |             5|      83|
| pol   | Andrena Knuthi        |             5|       9|
| pol   | Clytolaema rubricauda |             5|      16|
| pol   | Helophilus virgatus   |             6|      24|
| pol   | Maniola jurtina       |             7|      30|
| pol   | Thalurania glaucopis  |             5|      31|
| pol   | Bombus lapidarius     |             6|      33|
| pol   | Bombus terrestris     |             8|      42|
| pol   | Eristalis cerealis    |             6|      49|
| pol   | Bombus pascuorum      |             6|      55|
| pol   | Eristalis tenax       |            20|     107|
| pol   | Episyrphus balteatus  |            13|     143|
| pol   | Apis mellifera        |            34|     444|