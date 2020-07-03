# Overview

This repository accompanies our paper, [**Regulating Accuracy-Efficiency Trade-Offs in Distributed Machine Learning Systems**](https://arxiv.org/abs/2007.02203), presented at ICML 2020's [Law and Machine Learning Workshop](https://sites.google.com/view/icml-law-and-ml-2020/home).

## Paper
We include the raw LaTex and associated with our [`paper`](https://github.com/pasta41/lml-2020/paper), which can also be found on [arXiv](https://arxiv.org/abs/2007.02203).

## Figures
We also include the simple scratch code we used to generate the graph figures in the paper. In order to run this code, please be sure to have [Julialang >=1.4](https://julialang.org/) installed (follow the instructions on their website) and follow these steps:

* Open a terminal / command line program of your choice. Clone this directory to a convenient location, and then change directories into the [`figures`](https://github.com/pasta41/lml-2020/figures) subdirectory.
* We need to then make sure that the appropriate `julia` dependencies are loaded on your machine. To do so, run `julia setup.jl`. *Note*: This only needs to be done **the first time** you run the graphing code.

* To run the code we used for generating Figure 3, which explains sampling via flipping a biased coin, run `julia coin.jl`. This will output the resulting figure in `flip.pdf`. The `flip.pdf` included in this repository is the one we use in the paper. 


