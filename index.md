# templateRpackage

A modern template for R packages with Rcpp, CI/CD, and documentation.

## Features

| Feature            | Description                                                |
|--------------------|------------------------------------------------------------|
| **Rcpp**           | C++ integration with example function using loop unrolling |
| **testthat**       | Unit testing framework with separate test files            |
| **roxygen2**       | Documentation generation from code comments                |
| **pkgdown**        | Automatic documentation website                            |
| **renv**           | Reproducible dependency management                         |
| **GitHub Actions** | CI/CD for R-CMD-check and pkgdown deployment               |
| **air**            | Extremely fast R code formatter (Rust-based)               |

## Project Structure

``` R
├── R/
│   ├── add.R              # Pure R function example
│   └── cpp.R              # Rcpp configuration
├── src/
│   └── sum_array.cpp      # C++ function with Rcpp
├── tests/testthat/        # Unit tests
├── vignettes/             # Package vignettes
├── scripts/
│   └── BUILD.sh           # Build automation script
├── .github/workflows/     # CI/CD workflows
└── _pkgdown.yml           # Documentation site config
```

## Build Commands

``` bash
# Full workflow: document → clean → build → check → install
./scripts/BUILD.sh all

# Quick development iteration (skip R CMD check)
./scripts/BUILD.sh quick

# Generate documentation only
./scripts/BUILD.sh document

# Format R code with air
./scripts/BUILD.sh format

# Check formatting (for CI)
./scripts/BUILD.sh format-check

# Build pkgdown site
./scripts/BUILD.sh pkgdown

# Render README.Rmd to README.md
./scripts/BUILD.sh readme

# See all options
./scripts/BUILD.sh help
```

## Usage

``` r
library(templateRpackage)

# Pure R function
add(1, 2)
#> [1] 3

# Rcpp function (C++)
sum_array_cpp(1:1000000)
#> [1] 500000500000
```

## Installation

``` r
# From GitHub
# install.packages("remotes")
remotes::install_github("derecksprojects/templateRpackage")

# From CRAN (when available)
install.packages("templateRpackage")
```

## Using This Template

1.  Click “Use this template” on GitHub
2.  Clone your new repository
3.  Update `DESCRIPTION` with your package details
4.  Rename the package: update `DESCRIPTION`, `NAMESPACE`, and
    `_pkgdown.yml`
5.  Replace example functions in `R/` and `src/`
6.  Update tests in `tests/testthat/`
7.  Run `./scripts/BUILD.sh all` to verify everything works

### Requirements

- R ≥ 4.0
- Rtools (Windows) or Xcode CLI (macOS) for C++ compilation
- [air](https://posit-dev.github.io/air/) for code formatting (optional)

## CI/CD

GitHub Actions workflows included:

- **R-CMD-check**: Tests on macOS, Windows, Ubuntu with multiple R
  versions
- **pkgdown**: Builds and deploys documentation to GitHub Pages

Both workflows use `concurrency` to cancel in-progress runs when new
commits are pushed.

## License

MIT License with Citation Requirement
