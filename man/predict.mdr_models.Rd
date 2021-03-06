% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbmdrc.R
\name{predict.mdr_models}
\alias{predict.mdr_models}
\alias{predict.mbmdr}
\alias{predict.mbmdrc}
\title{MB-MDR classifier prediction}
\usage{
\method{predict}{mdr_models}(object, newdata, type = "response", top.results,
  all = FALSE, o.as.na = TRUE, global.mean = 0.5, ...)

\method{predict}{mbmdr}(object, newdata, ...)

\method{predict}{mbmdrc}(object, newdata, type = "response", top.results,
  o.as.na = TRUE, ...)
}
\arguments{
\item{object}{[\code{mbmdr}]\cr
MB-MDR models and HLO tables as output from \code{\link{mbmdrc}}.}

\item{newdata}{[\code{newdata}]\cr
New data to predict class status for.}

\item{type}{[\code{string}]\cr
Type of prediction. One of \code{response}, \code{prob},
\code{score} or \code{scoreprob}. See details.
Default is \code{response}.}

\item{top.results}{[\code{int}]\cr
How many models are used for prediction.}

\item{all}{[\code{bool}]\cr
Output predictions for all possible top results.}

\item{o.as.na}{[\code{bool}]\cr
Encode non informative cells with NA or with 0.5.}

\item{...}{Further arguments passed to or from other methods.}
}
\value{
A \code{data.table} object with an ID column and the prediction value.
}
\description{
Prediction with new data and saved MB-MDR classifier object.
}
\details{
For \code{type='response'} (the default), the predicted classes, for
\code{type='prob'} the predicted case probabilities, for \code{type='score'}
the predicted risk scores and for \code{type='scoreprob'} the predicted risk
scores transformed to the [0, 1] interval are returned.

For \code{type='score'} and \code{type='scoreprob'} genotypes classified as
H contribute +1, as L contribute -1 and as O contribute 0 to the score.

If a genotype combination is classified as O by MB-MDR, the case probability
is not significantly different from the global mean. On the other hand, there
might have been just too few observations in the training data so that
\code{NA} might be more reasonable as contribution to \code{response} and
\code{prob} type predictions.
}
