# Demonstrating templateRpackage

## Introduction

This vignette demonstrates the two main functions in `templateRpackage`:

1.  [`add()`](https://dereckmezquita.github.io/templateRpackage/reference/add.md) -
    A simple R function to add two numbers
2.  [`sum_array_cpp()`](https://dereckmezquita.github.io/templateRpackage/reference/sum_array_cpp.md) -
    An Rcpp function to sum a numeric vector using loop unrolling

``` r
box::use(templateRpackage[ add, sum_array_cpp ])
```

## Using the add() function

The
[`add()`](https://dereckmezquita.github.io/templateRpackage/reference/add.md)
function is a simple R function that adds two numbers:

``` r
add(2, 3)
#> [1] 5
add(10.5, 20.3)
#> [1] 30.8
add(-5, 5)
#> [1] 0
```

## Using the sum_array_cpp() function

The
[`sum_array_cpp()`](https://dereckmezquita.github.io/templateRpackage/reference/sum_array_cpp.md)
function sums a numeric vector using C++ with loop unrolling for
performance:

``` r
sum_array_cpp(1:10)
#> [1] 55
sum_array_cpp(c(1.5, 2.5, 3.5))
#> [1] 7.5

# Works with larger vectors
x <- rnorm(1000)
sum_array_cpp(x)
#> [1] 4.339615
```

## Benchmarking: Rcpp vs Base R

Let’s compare the performance of
[`sum_array_cpp()`](https://dereckmezquita.github.io/templateRpackage/reference/sum_array_cpp.md)
against base R’s [`sum()`](https://rdrr.io/r/base/sum.html):

``` r
box::use(microbenchmark[ microbenchmark ])
box::use(ggplot2[ autoplot, labs, theme_minimal ])

# Create test vectors of different sizes
set.seed(42)
small <- rnorm(1e3)
medium <- rnorm(1e5)
large <- rnorm(1e6)

# Benchmark with a large vector
mb <- microbenchmark(
  "Base R sum()" = sum(large),
  "Rcpp sum_array_cpp()" = sum_array_cpp(large),
  times = 100
)

print(mb)
#> Unit: microseconds
#>                  expr      min       lq      mean   median       uq      max
#>          Base R sum() 1861.301 1870.258 1872.9103 1871.541 1875.643 1890.335
#>  Rcpp sum_array_cpp()  929.774  939.046  941.2256  939.567  941.125  965.280
#>  neval
#>    100
#>    100
```

``` r
autoplot(mb) +
  labs(
    title = "Performance Comparison: Base R vs Rcpp",
    subtitle = "Summing 1 million random numbers (100 iterations)"
  ) +
  theme_minimal()
```

![](demo_files/figure-html/benchmark-plot-1.png)

## Verify correctness

Both functions should return the same result:

``` r
all.equal(sum(large), sum_array_cpp(large))
#> [1] TRUE
```
