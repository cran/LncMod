\name{tri.surv}
\alias{tri.surv}
\title{
Survival Analysis of Triplets
}
\description{
Generate plots describing expression and survival comparison for train/test sample groups of a
triplet (or triplets).
}
\usage{
tri.surv(tri, exp.sur, train, test, index = 1)
}
\arguments{
  \item{tri}{
a character string dataframe (or matrix) specifying triplets in which the first column is modulator,the
second is effector,the third is target.
}
  \item{exp.sur}{
a dataframe specifying expression and survival information.Its rownames are sample names.Its colnames
are factor names in triplets and survival tag (see example data in details).
}
  \item{train}{
a character string vector specifying train sample names.
}
  \item{test}{
a character string vector specifying test sample names.
}
  \item{index}{
a numeric vector (default 1) reprsenting rowindex of triplets analyed.
}
}
\details{
Note:All the arguments without default value must be assigned.

For the output,a triplet corresponds 6 plots,3 for train samples and 3 for test samples.For train
sameples,one plot is to show expression of triplet,another is to show risk scores,the other
is comparison of survivorship curve between highrisk and lowrisk sameples.
}
\value{
A dataframe whose rows represent different triplets while columns represent 15 kinds of information
on the triplet.
The columns are:
\itemize{
\item \code{modulator} the modulator name;
\item \code{effector} the effector name;
\item \code{target} the target name;
\item \code{coef_modulator} the \emph{coxph} coefficient of modulator;
\item \code{p_modulator} the significance of \emph{coef_lnc};
\item \code{coef_effector} the \emph{coxph} coefficient of effector;
\item \code{p_effector} the significance of \emph{coef_effector};
\item \code{coef_target} the \emph{coxph} coefficient of target;
\item \code{p_target} the significance of \emph{coef_target};
\item \code{N_train1} the sample number with low risk score in train sameples;
\item \code{N_train2} the sample number with high risk score in train sameples;
\item \code{dif_train} the significance of survival difference between low/high risk sameples in
train samples;
\item \code{N_test1} the sample number with low risk score in test sameples;
\item \code{N_test2} the sample number with high risk score in test sameples;
\item \code{dif_test} the significance of survival difference between low/high risk sameples in
test samples;
}
}
\seealso{
\code{\link{coxph}},\code{\link{Surv}},\code{\link{survdiff}}
}
\examples{
#a triplet
tri.surv(tri=datatests[["tri_bs"]],exp.sur=datatests[["exp_sur"]],
         train=datatests[["train"]],test=datatests[["test"]])
#two triplets(or more)
tri.surv(tri=datatests[["tri_bs"]],exp.sur=datatests[["exp_sur"]],
         train=datatests[["train"]],test=datatests[["test"]],
		 index=c(1,2))
}
\keyword{tri.surv}
