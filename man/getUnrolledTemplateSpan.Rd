\name{getUnrolledTemplateSpan}
\alias{getUnrolledTemplateSpan}
\alias{getUnrolledReadLength}
\alias{getMoleculeIndex}
\title{
  Compute the Unrolled Template Span
}
\description{
  'getUnrolledTemplateSpan' commputes the unrolled template span.
}
\usage{
  getUnrolledTemplateSpan(cmpH5, idx = 1:nrow(cmpH5), unique = TRUE)
}
\arguments{
  \item{cmpH5}{
    An object of class \code{PacBioCmpH5}.
  }
  \item{idx}{
    The indices of the alignments to retrieve.
  }
  \item{unique}{
    Boolean statement whether the unrolled template span is unique.
  }
}
\details{
  The getUnrolledTemplateSpan is based on the getMoleculeIndex function
  which returns a vector of length(idx) of type factor designating the
  molecule's ID. the vector is ordered as idx, therefore the default
  behavior of \code{idx = 1:nrow(cmpH5)} means that the vector is as the
  cmpH5 object -- this is only distinct from other functions in that
  there are repeats in the vector, hence the \code{unique = TRUE}
  argument of getUnrolledTemplateSpan.
}
\value{
  'getUnrolledTemplateSpan' returns an array with molecule index and the
  unrolled span length.
}
\examples{
  gc()
  require(pbh5)
  cmpH5 <- PacBioCmpH5(system.file("h5_files",  "aligned_reads.cmp.h5",
  package = "pbh5"))
  mi <- getMoleculeIndex(cmpH5)
  head(mi)
  uts <- getUnrolledTemplateSpan(cmpH5)
  head(uts)
  ylim = c(0, 0.0015)
  xlim = c(-1000, 5000)
  plot(density(uts), xlim = xlim, ylim = ylim, xlab = '', main = '', col
  = 'red', lwd = 2)
  par(new = TRUE)
  plot(density(getTemplateSpan(cmpH5)), xlim = xlim, ylim = ylim, xlab =
  '', main = '', lwd = 2)
  legend('topright',legend = c('unrolledTemplateSpan', 'templateSpan'),
  fill = c('red', 'black'))
}
\keyword{datasets}

