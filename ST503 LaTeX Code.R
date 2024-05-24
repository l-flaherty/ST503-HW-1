\documentclass[12pt, letterpaper]{article}
\usepackage[left=2.5cm,right=2.5cm, top=2.5cm, bottom=2.5cm]{geometry}
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[R]{Flaherty, \thepage}
\renewcommand{\headrulewidth}{2pt}
\setlength{\headheight}{15pt}
\usepackage{lipsum}
\usepackage{amsmath}
\usepackage[makeroom]{cancel}
\usepackage{cancel}
\usepackage{array,polynom}
\newcolumntype{C}{>{{}}c<{{}}} 
\newcolumntype{R}{>{\displaystyle}r}  
\usepackage{xcolor}
\newcommand\Ccancel[2][black]{\renewcommand\CancelColor{\color{#1}}\cancel{#2}}
\usepackage{amssymb}
\usepackage{bbm}
\usepackage{mathrsfs}
\usepackage[toc]{glossaries}
\usepackage{amsthm}
\usepackage{indentfirst}
\usepackage[utf8]{inputenc}
\usepackage[thinc]{esdiff}
\usepackage{graphicx}
\graphicspath{{./images/}}
\usepackage{subfig}
\usepackage{chngcntr}
\usepackage{placeins}
\usepackage{caption}
\usepackage{float}
\usepackage{comment}
\usepackage{sectsty}
\sectionfont{\fontsize{15}{15}\selectfont}
\usepackage{subcaption}
\setlength\abovedisplayskip{0pt}
\usepackage[hidelinks]{hyperref}
\usepackage[nottoc,numbib]{tocbibind}
\renewcommand{\qedsymbol}{\rule{0.7em}{0.7em}}
\newcommand{\Mod}[1]{\ (\mathrm{mod}\ #1)}
\counterwithin{figure}{section}
\usepackage{centernot}
 \usepackage{enumitem}  
                          
                          
                          
%Numbering and Math Types%             
  \theoremstyle{definition}
\newtheorem{exmp}{Example}
\newtheorem{nonexmp}{Non-Example}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{corollary}{Corollary}[theorem]
\newtheorem{definition}{Definition}[section]
\newtheorem{prop}{Proposition}[section]
\newtheorem{lemma}{Lemma}[theorem]
\numberwithin{equation}{section}
\newenvironment{ex}{
  \par\smallskip 
  \noindent\textit{Example:\hspace{-0.25em}}
  \leftskip=0.5em
}{
  \par\smallskip
  \leftskip=0em
}

\newenvironment{nonex}{
  \par\smallskip
  \noindent\textit{Non-example:\hspace{-0.25em}}
  \leftskip=0.5em 
}{
  \par\smallskip 
  \leftskip=0em 
}

\newcommand{\problem}[1]{\noindent \textbf{Problem \thesection.#1)}}
  
  

%References%
\newcommand{\mydef}[1]{(Definition \ref{#1}, Page \pageref{#1})}
\newcommand{\mytheorem}[1]{(Theorem \ref{#1}, Page \pageref{#1})}
\newcommand{\mycor}[1]{(Corollary \ref{#1}, Page \pageref{#1})}
\newcommand{\mylemma}[1]{(Lemma \ref{#1}, Page \pageref{#1})}
\newcommand{\myprob}[1]{(Problem \ref{#1}, Page \pageref{#1})}
\newcommand{\clickableword}[2]{\hyperref[#1]{#2}}



%Commutative Diagrams%
\usepackage{tikz}                     
\usetikzlibrary{arrows}               
\usetikzlibrary{shapes.geometric}  
\usetikzlibrary{calc}
\pgfkeys{/tikz/.cd,
num vertex/.initial=4,
num vertex/.get=\vertices,
num vertex/.store in=\vertices,
circle radius/.initial=3,
circle radius/.get=\circleradius,
circle radius/.store in=\circleradius,
shift angle/.initial=0,
shift angle/.get=\shiftangle,
shift angle/.store in=\shiftangle, 
at pos/.initial={(0,0)},
at pos/.get=\position,
at pos/.store in=\position,
vertex radius/.initial=1.5pt,
vertex radius/.get=\vertexradius,
vertex radius/.store in=\vertexradius,
}
\makeatletter
\def\drawvertices{\tikz@path@overlay{node}}
\makeatother   
\pgfkeys{/tikz/circumference with labels/.code={
\pgfmathsetmacro\halfcircleradius{\circleradius/2}
\draw \position circle (\halfcircleradius cm) node[regular polygon, regular polygon sides=\vertices, minimum size=\circleradius cm, draw=none, name={vertex set}] {};
\foreach \textlabel/\circlecolor [count=\x] in {#1}{
\node[draw,circle, inner sep=\vertexradius,black, fill=\circlecolor] at (vertex set.corner \x) {};
\pgfmathparse{\shiftangle-360*(\x-1)/ \vertices}
\node at ($(vertex set)+(\pgfmathresult:\halfcircleradius)$)[label={[font=\small]\pgfmathresult:$\textlabel$}]{};
}
}
}



%Custom command for matrices%
\newcommand{\mymatrix}[1]{
\renewcommand{\arraystretch}{0.5} 
\setlength\arraycolsep{3pt}       
\scalebox{0.90}{                  
$\begin{bmatrix}
#1
\end{bmatrix}$
}                   
\renewcommand{\arraystretch}{1.0} 
\setlength\arraycolsep{6pt}       
}



%underscript for operations%
\newcommand{\+}[1]{+_{\scalebox{.375}{#1}}}
\newcommand{\mult}[1]{\cdot_{\scalebox{.375}{#1}}}



%limits for summands and such%
\newcommand{\mysum}[2]{\sum\limits_{#1}^{#2}}
\newcommand{\mylim}[2]{\lim\limits_{#1}^{#2}}
\newcommand{\myint}[2]{\int\limits_{#1}^{#2}}
\newcommand{\myprod}[2]{\prod\limits_{#1}^{#2}}



%blackboard for letters%
\newcommand{\E}{\mathbb{E}}
\newcommand{\V}{\mathbb{V}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\F}{\mathbb{F}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\K}{\mathbb{K}}
\newcommand{\1}{\mathbbm{1}}
\newcommand{\Prob}{\mathbbm{P}}

\title{Linear Models HW \# 1}
\author{Liam Flaherty}
\date{\parbox{\linewidth}{\centering%
Professor Maity\endgraf\bigskip
NCSU: ST503-651\endgraf\bigskip
May 20, 2024 \endgraf}}

\begin{document}
\maketitle
\thispagestyle{empty}


\newpage\clearpage\noindent


\noindent\textbf{1) \boldmath{Consider the analysis of covariance (ANCOVA) model: $y_{i,j}=\mu+\alpha_i+x_{i,j} \beta+\epsilon_{i,j}$ for $i=1,2,3$ and $j=1,\dots, n$.}}

\vspace{\baselineskip}
\noindent\textbf{\boldmath{a. Write the model in matrix form, clearly specifying all model components.}}
\vspace{\baselineskip}

Our equations are:

\vspace{-0.5cm}
\begin{align*}
y_{1,1}&=1\cdot \mu+1\cdot \alpha_1+0\cdot\alpha_2+0\cdot\alpha_3+x_{1,1}\beta+\epsilon_{1,1}\\
\vdots&=\vdots\\ 
y_{1,n}&=1\cdot \mu+1\cdot \alpha_1+0\cdot\alpha_2+0\cdot\alpha_3+x_{1,n}\beta+\epsilon_{1,n}\\
y_{2,1}&=1\cdot \mu+0\cdot \alpha_1+1\cdot\alpha_2+0\cdot\alpha_3+x_{2,1}\beta+\epsilon_{2,1}\\
\vdots &= \vdots\\
y_{2,n}&=1\cdot \mu+0\cdot \alpha_1+1\cdot\alpha_2+0\cdot\alpha_3+x_{2,n}\beta+\epsilon_{2,n}\\
y_{3,1}&=1\cdot \mu+0\cdot \alpha_1+0\cdot\alpha_2+1\cdot\alpha_3+x_{3,1}\beta+\epsilon_{3,1}\\
\vdots &= \vdots\\
y_{3,n}&=1\cdot \mu+0\cdot \alpha_1+0\cdot\alpha_2+1\cdot\alpha_3+x_{3,n}\beta+\epsilon_{3,n}
\end{align*}

This can be neatly placed in the matrix form $\underset{\sim}{y}=X\underset{\sim}{\beta}+\underset{\sim}{\epsilon}$ where $\underset{\sim}{y}$ is the $3n \times 1$ \textbf{response vector}, $X$ is the $3n \times 5$ model matrix of \textbf{covariates (predictors)}, $\underset{\sim}{\beta}$ is the $5 \times 1$ vector of the \textbf{regression coefficients}, and $\underset{\sim}{\epsilon}$ is the vector of our \textbf{error terms}.
\vspace{\baselineskip}

Explicitly, we have:

\vspace{-0.5cm}
\begin{align*}
\mymatrix{y_{1,1}\\ \vdots \\
y_{1,n}\\ y_{2,1} \\ \vdots \\
y_{2,n}\\ y_{3,1} \\ \vdots \\ y_{3,n}	}=
\mymatrix{1&1&0&0&x_{1,1}\\
\vdots & \vdots & \vdots &\vdots &\vdots\\
1&1&0&0&x_{1,n}\\
1&0&1&0&x_{2,1}\\
\vdots & \vdots & \vdots &\vdots &\vdots\\
1&0&1&0&x_{2,n}\\
\vdots & \vdots & \vdots &\vdots &\vdots\\
1&0&0&1&x_{3,1}\\
\vdots & \vdots & \vdots &\vdots &\vdots\\
1&0&0&1&x_{3,n}}\mymatrix{\mu\\ \alpha_1 \\ \alpha_2 \\ \alpha_3 \\ \beta}+\mymatrix{
\epsilon_{1,1} \\
\vdots\\
\epsilon_{1,n}\\
\epsilon_{2,1} \\
\vdots\\
\epsilon_{2,n}\\
\epsilon_{3,1} \\
\vdots\\
\epsilon_{3,n}
}
\end{align*}


\vspace{\baselineskip}
\noindent\textbf{\boldmath{b. Is the model matrix $X$ full column rank?}}
\vspace{\baselineskip}

No, $X$ is rectangular with more rows than columns, so by rank-nullity, the null space must be non-trivial (indeed,  $\mymatrix{1&-1&-1&-1&0}^T$ is one such element since the first column is the sum of the middle three).





\newpage
\noindent\textbf{2) \boldmath{Consider the teen gambling data, teengamb, in the R package faraway.}}

\vspace{\baselineskip}
\noindent\textbf{\boldmath{a. Write a brief description of the dataset. Produce some numerical and graphical summaries of the dataset.}}
\vspace{\baselineskip}


According to the documentation for the faraway package, the teengamb dataset consists of 47 observations on 5 variables dealing with teenage gambling in Britain. The variables collected on the observations include sex (0 for male, 1 for female), status (an integer score based on the parents' socioeconomic status), income (in pounds per week), verbal (an integer score giving the number of words correctly defined out of 12 tested), and gamble (in pounds spent on gambling per year). The specifics are given in Figure \ref{fig.description} below, while some data visualizations are given in Figure \ref{fig.datavis}.

\begin{figure}[H]
\centering
\includegraphics[width=12cm]{Teen Gambling 1}
\caption{Dataset Description}
\label{fig.description}
\end{figure}
\vspace{-0.5cm}

\begin{figure}[H]
\centering
\includegraphics[width=12cm]{Teen Gambling Income And Spending}
\end{figure}
\vspace{-0.5cm}

\begin{figure}[H]
\centering
\includegraphics[width=12cm]{Teen Gambling SES And Verbal}
\caption{Data Visualizations}
\label{fig.datavis}
\end{figure}

\vspace{\baselineskip}
\noindent\textbf{\boldmath{b. Fit a linear model using the lm() function with gample variable as response, and the income variable as predictors, and report the regression coefficients.}}
\vspace{\baselineskip}

With this simple model, there are only two regression coefficients to report, the slope (which is 5.52), and the intercept (which is -6.325).

\begin{figure}[H]
\centering
\includegraphics[width=12cm]{Teen Gambling Income And Spending Regression Code}
\caption{R Code For Regression}
\end{figure}
\vspace{-0.5cm}



\vspace{\baselineskip}
\noindent\textbf{\boldmath{c. Write the mathematical form of the model you fit in part b. Clearly define each component in your model.}}
\vspace{\baselineskip}

In a general least squares scenario, our model is $y_i=\beta_0+\beta_1x_i+\epsilon_i$ for a given predictor $x_i$ where the $y_i$ is our response, the $\beta$'s are our regression coefficients, and the $\epsilon$ is our error. Here we have $y_i=-6.352+5.52(x_i)+\epsilon_i$. In matrix form:

\vspace{-0.5cm}
\begin{align*}
\mymatrix{y_1\\ \vdots \\y_n}=\mymatrix{1 & x_1\\ \vdots &\vdots\\1&x_n} \mymatrix{-6.352\\5.52}+\mymatrix{\epsilon_1\\ \vdots\\ \epsilon_n}
\end{align*}



\vspace{\baselineskip}
\noindent\textbf{\boldmath{d. Compute the mean and standard deviation of gamble and income for males (sex=0) and females (sex=1) separately. Comment on the results.}}
\vspace{\baselineskip}

The mean annual gambling expenditure for males in the dataset was about 29.78 pounds per year versus about 3.87 pounds per year for females (standard deviations of about 37.32 and 5.15 respectively). Such an extreme difference suggests a two-sample problem might be the way to go when fitting a model.

\begin{figure}[H]
\centering
\includegraphics[width=12cm]{Teen Gambling Male Vs Female}
\caption{Differences In Male And Female}
\label{fig.femalevsmale}
\end{figure}
\vspace{-0.5cm}



\vspace{\baselineskip}
\noindent\textbf{\boldmath{e. Fit the same linear regression as in part b, but separately for males and females. Report the regression coefficients.}}
\vspace{\baselineskip}

The slope and intercepts are 6.518 and -2.66 for males, and 0.1749 and 3.14 for females.

\begin{figure}[H]
\centering
\includegraphics[width=12cm]{Teen Gambling Income And Spending Sex Differences Regression Code}
\caption{Linear Model For Males And Females}
\label{fig.genderdifferencescode}
\end{figure}


\noindent\textbf{\boldmath{f. Create a scatterplot between gamble (in y axis) and income (x axis), and color the points by sex. Then add two fitted regression lines from part e to the plot.}}
\vspace{\baselineskip}

When filtering results by gender, our model is significantly different than when we report results together (i.e. sex seems to be a moderating variable).

\begin{figure}[H]
\centering
\includegraphics[width=12cm]{Teen Gambling Income And Spending By Sex Code}
\end{figure}
\vspace{-0.5cm}

\begin{figure}[H]
\centering
\includegraphics[width=16cm]{Teen Gambling Income And Spending By Sex}
\caption{Income And Spending Regression By Sex}
\label{fig.incomeandspendingbysex}
\end{figure}




\newpage
\noindent\textbf{3) \boldmath{Consider the simple linear regression model $y_i=\beta_0+x_i\beta_1+\epsilon_i$ for $i=1,\dots, n$ where the $x$ variable has been centered and scaled so that $\sum x_i=0$ and $\sum x_i^2=1$.}}

\vspace{\baselineskip}
\noindent\textbf{\boldmath{a. Write the model matrix, $X$.}}
\vspace{\baselineskip}

The model matrix is $\mymatrix{1&x_1\\\vdots &\vdots \\ 1 &x_n}$. This is multiplied by the regression coefficients $\underset{\sim}{\beta}=\mymatrix{\beta_0\\ \beta_1}$ and added to the error terms $\mymatrix{\epsilon_1 \\ \vdots \\ \epsilon_n}$ to yield our predicted values.


\vspace{\baselineskip}
\noindent\textbf{\boldmath{b. Write the expression for $X^TX$ and solve the normal equations.}}
\vspace{\baselineskip}

By the rules of matrix multiplication, $X^TX=\mymatrix{1 & \dots &1\\x_1 & \dots &x_n}\mymatrix{1&x_1\\\vdots &\vdots \\ 1 &x_n}=\mymatrix{1 & \sum\limits_{i=1}^{n}x_i\\\sum\limits_{i=1}^{n}x_i &\sum\limits_{i=1}^{n}x_i^2}$. By assumption of the problem, this is the identity in $\K ^{2\times 2}$, $I=\mymatrix{1&0\\0&1}$.
\vspace{\baselineskip}

The normal equation is $X^TX \underset{\sim}{\beta}=X^T\underset{\sim}{y}$. Since $X^TX$ was determined to be the identity, we have $\underset{\sim}{\beta}=X^T\underset{\sim}{y}=\mymatrix{1 & \dots &1\\x_1 & \dots &x_n}\mymatrix{y_1 \\ \vdots \\ y_n}=\mymatrix{\sum\limits_{i=1}^{n}y_i\\\sum\limits_{i=1}^{n}x_iy_i}$. 


\newpage
\section*{R Code}

\begin{figure}[H]
\centering
\includegraphics[width=16cm]{R Code 1}
\end{figure}
\begin{figure}[H]
\centering
\includegraphics[width=16cm]{R Code 2}
\end{figure}
\begin{figure}[H]
\centering
\includegraphics[width=16cm]{R Code 3}
\end{figure}


\end{document}