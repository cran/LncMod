\name{tri.basic}
\alias{tri.basic}
\title{
Overview of Triplets' Expression
}
\description{
Plot to show effector/target expression in a triplet (or triplets).
}
\usage{
tri.basic(tri, M.exp, E.exp, T.exp, index = 1, N = 0.25)
}
\arguments{
  \item{tri}{
a dataframe (or matrix) representing triplets to plot in which the first column is modulator id,the 
second is effector id and the third column is target id.The id style must be consistent with rownames 
of \emph{M.exp E.exp T.exp},respectively.
}
  \item{M.exp}{
a numeric dataframe (or matrix) representing modulator expression profile whose rownames is modulator id.
}
  \item{E.exp}{
a numeric dataframe (or matrix) representing effector expression profile whose rownames is effector id.
}
  \item{T.exp}{
a numeric dataframe (or matrix) representing target expression profile whose rownames is target id.
}
  \item{index}{
a numeric vector (default 1) specifying rowindex of triplets to plot.
}
  \item{N}{
a numeric (rangs from 0 to 0.5,default 0.25) specifying proportion,by which LOW/HIGH sample group are 
extracted from a sorted modulator expression samples.
}
}
\details{
Note:All the arguments without default value must be assigned.

For each triplet,the plot consists of 3 parts.

The left-top is a barplot showing expression of effector in LOW/HIGH sample group.
The right-top is a scatter diagram with a linear fitted line using the function \emph{lm}.The scatter 
diagram shows expression of target versus effector in LOW/HIGH sample group in which red is the HIGH 
while green is the LOW.The right-bottom is a barplot showing expression of target in LOW/HIGH sample 
group.
}
\value{
A dataframe whose rownames represent rowindex of triplets and columns represent 6 kinds of value of 
the plot (P_effector_target, P_effector, P_target, R_low, R_high, P_low, P_high).

\itemize{
  \item \code{P_effector_target} the significance of linear fitted lines;
  \item \code{P_effector} the significance of difference between effector expression in LOW/HIGH 
sample group.
  \item \code{P_target} the significance of difference between target expression in LOW/HIGH 
sample group.
  \item \code{R_low} the effector-target correlation in LOW sample group;
  \item \code{R_high} the effector-target correlation in HIGH sample group;
  \item \code{P_low} the significance of R_low;
  \item \code{P_high} the significance of R_high;
  }
}
\examples{
#One triplet
tri.basic(tri=datatests[["tri_bs"]],M.exp=datatests[["M_exp"]],
          E.exp=datatests[["E_exp"]],T.exp=datatests[["T_exp"]])
#Two triplets (or more)
tri.basic(tri=datatests[["tri_bs"]],M.exp=datatests[["M_exp"]],
          E.exp=datatests[["E_exp"]],T.exp=datatests[["T_exp"]],
		  index=c(1,2))
}
\keyword{tri.basic}
