\name{tri.app}
\alias{tri.app}
\title{
Modulators Prediction
}
\description{
This function predicts a modulator affecting the ability of a effector to regulate its targets based 
on expression profiles.
}
\usage{
tri.app(ms, ET, M.exp, E.exp, T.exp, N = 0.25, method = "pearson",
       iqr.filter = c(log2(1.5), log2(1.5), log2(1.5)), 
       cor.MvsET = c(0.3, 0.3), cor.EvsT.dif = 0.45, cor.EvsT.abs = 0.4, 
       ET.fc.filter = log2(1.5) , ET.p.filter = 0.01 , 
       rand = 100,correction="BH",cores=1)
}
\arguments{
  \item{ms}{
a character string (vector) specifying candidate modulator names to predict.
}
  \item{ET}{
a dataframe representing effector-target regulations in which factors are effector/target names.
}
  \item{M.exp}{
a numeric dataframe representing expression profile of candidate modulator whose rownames is the 
candidate modulator names.
}
  \item{E.exp}{
a numeric dataframe representing expression profile of effectors whose rownames are effector names 
and column number must be equal to \emph{M_exp}.
}
  \item{T.exp}{
a numeric dataframe representing expression profile of targets whose rownames are target names and 
column number must be equal to \emph{M_exp}.
}
  \item{N}{
a numeric (rangs from 0 to 0.5,default 0.25) specifying proportion,by which LOW/HIGH sample group 
are extracted from a sorted modulator expression samples.
}
  \item{method}{
a character string (default "pearson") indicating which correlation coefficient is to be computed.
One of "pearson" (default), "kendall", or "spearman", can be abbreviated.
}
  \item{iqr.filter}{
a numeric vector of the form c(modulator_iqr,effector_iqr,target_iqr) specifying IQR threshold  to 
filter expression profiles (default (log2(1.5), log2(1.5), log2(1.5))).
}
  \item{cor.MvsET}{
a numeric vector of the form c(cor.MvsE,corMvsT) specifying threshold for correlation between 
modulator and effector/target (default (0.3, 0.3)).
}
  \item{cor.EvsT.dif}{
a numeric (default 0.45) specifying threshold for difference between effector-target correlation in 
LOW and HIGH sample group.
}
  \item{cor.EvsT.abs}{
a numeric (default 0.4) specifying threshold for effector-target correlation either in LOW sample 
group or HIGH.
}
  \item{ET.fc.filter}{
a numeric specifying threshold for fold change of effector expression in LOW sample group versus 
HIGH (default log2(1.5)).
}
  \item{ET.p.filter}{
a numeric specifying threshold for p value of effector expression in LOW sample group versus HIGH 
(default 0.01).
}
  \item{rand}{
a numeric specifying the number of disturbance (default 100).
}
  \item{correction}{
Correction method (default "BH") in one of \code{\link{p.adjust.methods}}.
}
  \item{cores}{
The number of cores (default 1) to use, i.e. at most how many child processes will be run 
simultaneously. Must be exactly 1 on Windows (which uses the master process).
}
}
\details{
Note:All the arguments without default value must be assigned.

This function running a time checked whether a modulator in a sets,one by one,can affect the ability 
of a effector sets to regulate their corresponding targets.Please go to \emph{Kai Wang,M. et al. 
Genome-wide identification of post-translational modulators of transcription factor activity in human 
B cells. Nature biotechnology,\bold{27}, 829-837 (2009)} for detailed information.

The running time and the memory required was increasing as the possible triplets increased.To speed-up 
the analysis,the function implemented parallel computations when runned on multi-core machines. It 
used mclapply function in the parallel package to make use of all the CPUs available on the system,
with each core simultaneously performing part of the runs.If the possible triplets are big,please 
work on a big memory machine.
}
\value{
A list containing following components:
\itemize{
\item \code{triplets} predicted triplets and related information,a 7 columns dataframe as following:
\itemize{
\item \code{modulator effector target} represented modulator/effector/target names,respectively;
\item \code{R_low R_high} effector-target correlation in LOW/HIGH sample group,respectively;
\item \code{P_value} significance of the triplet;
\item \code{fdr} corrected P_value by the assigned method;
}
\item \code{initialnot} names of modulators whose expression is not in initial expression profile 
(\emph{M.exp});
\item \code{filterdnot} names of modulators whose expression is in initial expression profile but 
not in filterd profile by IQR;
}
}
\examples{
##Different types of candidate modulators to predict
##Here we take four candidate modulators for example
##Two for modulator;one for initialnot;one for filterdnot(see value section in details)
tri.app(ms=datatests[["m_app"]],ET=datatests[["ET"]],M.exp=datatests[["M_exp"]],
        E.exp=datatests[["E_exp"]],T.exp=datatests[["T_exp"]])
}
\keyword{tri.app}
