\name{datatests}
\alias{datatests}
\docType{data}
\title{
Data for Examples
}
\description{
This object contains data for examples.
}
\format{
A list with 18 variables:
  \describe{
	 \item{m_app}{
	  four lncRNA symbols of which,the first two,as a modulator,can affect the ability of effectors to regulate their corresponding targets,the third expression is not in initial expression profile,the last expression is in initial expression profile but not in filterd expression profile by IQR.
	}\item{ET}{
	  a dataframe representing TF-target regulations,all of which are gene symbols,in glioblastoma.It includes 20 rows standing for 20 pairs of regulation and 2 columns (the first is TF and the second is corresponding target).
    }\item{M_exp}{
      a dataframe representing lncRNAs expression profile in glioblastoma.It includes 4 rows standing for 4 lncRNAs and 451 columns standing for 451 samples.Its rownames are lncRNA symbols.
    }\item{E_exp}{
      a dataframe representing TFs expression profile in glioblastoma.It includes 12 rows standing for 12 TFs and 451 columns standing for 451 samples.Its rownames are TF gene symbols.
    }\item{T_exp}{
      a dataframe representing targets expression profile in glioblastoma.It includes 22 rows standing for 22 targets and 451 columns standing for 451 samples.Its rownames are target gene symbols.
    }\item{tri_bs}{
	  2 lncRNA-TF-target (modulator-effector-target) symbol triplets whose factors are not only in expression profile (\emph{M_exp,E_exp,T_exp}),respectively,but also in the expression and survival profile (\emph{exp_sur}).
	}\item{tri_enrich}{
	  30 lncRNA-TF-target symbol triplets in glioblastoma.
	}\item{background}{
      an character vector representing all genes expressed in glioblastoma.It includes 18275 gene symbols.
	}\item{GOterms}{
      a list with 3 goterms and corresponding gene symbols.
	}\item{GOterms_mark}{
      a dataframe with two columns(the first is GOterm name,the second is the corresponding cancerhallmark to which goterm belongs).
	}\item{exp_sur}{
      a dataframe representing expression and survival information.It includes 426 rows standing for samples (rownames are sample tags) and 6 columns(the first 4 columns are molecular names while the rest columns are the survival information).
	}\item{train}{
      a character vector representing 213 trainning sample tags(There is no significant difference in some irrelevant factors (eg:age,gender,et al) between trainning samples and testing samples).
	}\item{test}{
      a character vector representing 212 test sample tags.
	}
  }
}
\details{
All epression data is from a study about glioblastoma.The survival information is from TCGA.
}
\source{
Zhou Du,T. et al.
\emph{Integrative genomic analyses reveal clinically relevant long noncoding RNAs in human cancer}
nature structural & molecular biology,\bold{20}, 908-913 (2013).
}
\keyword{datasets}
