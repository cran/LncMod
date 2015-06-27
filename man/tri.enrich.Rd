\name{tri.enrich}
\alias{tri.enrich}
\title{
Modulator Functional Enrichment
}
\description{
Targets of a modulator in the triplets is enriched to GOterms based on the hypergeometric distribution.
It can also owe GOterms to disease hallmarks at the same time.
}
\usage{
tri.enrich(tri, GOterms, background, inter.thr = 2,
           GOterms.mark = NULL,correction="BH")
}
\arguments{
  \item{tri}{
a dataframe (or matrix) representing the triplets used to enrich.The first column is modulator;the
second column is effetor;the third column is target.
}
  \item{GOterms}{
a list whose variable is a GOterm name and the content is genes annotated on the GOterm.
}
  \item{background}{
a vector containing a gene set in which GOterm annotated genes must be.Its id style must be consistent with the id format in \emph{GOterms}.
}
  \item{inter.thr}{
a numeric (default 2) representing min number of intersection between a modulator's targets and a GOterms genes.
}
  \item{GOterms.mark}{
a dataframe (or matrix;default NULL) with 2 columns in which the first represent GOterm sets to be enriched while the second represent hallmark to which the GOterm belongs;
}
  \item{correction}{
correction method (default "BH") in one of \code{\link{p.adjust.methods}}.
}
}
\details{
Note:All the arguments without default value must be assigned.

If \emph{background} is NULL,then targets of a modulator is enriched to the GOterms genes passed in;
If \emph{background} is not NULL,then targets of a modulator is enriched to the GOterms genes filterd by the background.

If \emph{GOterms.mark} is NULL,it only do GOterms enrichment;
If \emph{GOterms.mark} is not NULL,it also owe GOterms to disease marks.
}
\value{
If \emph{GOterms.mark} is NULL,it is a 6 column dataframe as following:
\itemize{
\item \code{modulator} the modulator name;
\item \code{GOterm} the GOterm name;
\item \code{mtarnum} the target number of a modulator;
\item \code{GOtarnum} the gene number of a GOterm;
\item \code{internum} the number of intersected factor between a GOterm genes and a modulator targets;
\item \code{P_value} the significance of enrichment;
\item \code{fdr} corrected P_value by the assigned method;
}
If \emph{GOterms.mark} is not NULL,it added a seventh column(named "mark" representing the disease mark) besides six columns above.
}
\seealso{
\code{\link{phyper}}
}
\examples{
#Functional enrichment without disease hallmarks
tri.enrich(tri=datatests[["tri_enrich"]],GOterms=datatests[["GOterms"]],
           background=datatests[["background"]])
#Funtional enrichment with disease hallmarks
tri.enrich(tri=datatests[["tri_enrich"]],GOterms=datatests[["GOterms"]],
           background=datatests[["background"]],
		   GOterms.mark=datatests[["GOterms_mark"]])
}
\keyword{tri.enrich}
