\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adeckcv}[2025/02/08] 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax % process given options
\LoadClass{extarticle}
\setlength{\parindent}{0mm}
\usepackage[hidelinks]{hyperref}
\pagestyle{empty}
\usepackage{moresize}
\usepackage{graphicx}
\usepackage{mathrsfs}
\usepackage{longtable}
\usepackage{geometry}
\geometry{
	paper=a4paper, % a4paper or letterpaper
	top=1.75cm,
	bottom=1.75cm,
	left=2cm,
	right=2cm,
	headheight=0.75cm,
	footskip=1cm,
	headsep=0.5cm,
	%showframe, % Uncomment to show how the type block is set on the page
}
\usepackage{fontawesome5}
\usepackage{xcolor} %\RequirePackage{xcolor}
\definecolor{maroon}{RGB}{128, 0, 0} % Using RGB
\usepackage{microtype}
\usepackage[utf8]{inputenc} 
\usepackage[T1]{fontenc}
%\usepackage{fontspec}
%\setmainfont{Times New Roman}
%\newfontfamily\Cambria{Cambria}[Scale=MatchLowercase,
  %                              Ligatures=TeX]
%\newfontfamily\Verdana{Verdana}[Scale=MatchLowercase,
 %                               Ligatures=TeX]
\usepackage{roboto} % can add other fonts with raleway \usepackage[defaultsans]{droidsans} or \usepackage{cmbright}; other fonts are cmbright, fetamont, gillius, roboto
\renewcommand*\familydefault{\sfdefault} % force sans-serif

% color codes
\definecolor{VividPurple}{HTML}{2E64FE}
\definecolor{SlateGrey}{HTML}{2E2E2E}
\definecolor{LightGrey}{HTML}{555555}
\definecolor{AzureRadiance}{HTML}{00ABFF}
\definecolor{DodgerBlue}{HTML}{4F83FF}
\definecolor{ElectricViolet}{HTML}{9F00FF}
\definecolor{Black}{HTML}{000000}
\colorlet{accent}{DodgerBlue}
\colorlet{accesso}{gray}
\colorlet{body}{Black!80}
\colorlet{bodied}{gray}


%----------------------------------------------------------------------------------------
%	UTILS
%---------------------------------------------------------------------------------------- 

%----------------------------------------------------------------------------------------
%	SLASH SEPARATOR
%---------------------------------------------------------------------------------------- 

\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS
%---------------------------------------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

%----------------------------------------------------------------------------------------
%	DUMMY TEXT
%---------------------------------------------------------------------------------------- 

\newcommand{\lorem}{I am a believer in Christ and for me and my house we will serve the LORD.}

%----------------------------------------------------------------------------------------
% VERTICAL CENTER
%---------------------------------------------------------------------------------------- 

\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}


%----------------------------------------------------------------------------------------
%	ICONS STYLING
%---------------------------------------------------------------------------------------- 

\newcommand{\icon}[3]{
	\vcenteredhbox{\colorbox{gray}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}}
	\hspace{0.2cm}
	\vcenteredhbox{\textcolor{black}{#3}}
}

%----------------------------------------------------------------------------------------
%	CHARTS
%---------------------------------------------------------------------------------------- 

\newcounter{barcount}

\newenvironment{barchart}[1]{ 
	\newcommand{\barwidth}{0.35}
	\newcommand{\barsep}{0.2}
	
	\newcommand{\baritem}[2]{ 
		\pgfmathparse{##2}
		\let\perc\pgfmathresult
		
		\pgfmathparse{#1}
		\let\barsize\pgfmathresult
		
		\pgfmathparse{\barsize*##2/100}
		\let\barone\pgfmathresult
		
		\pgfmathparse{(\barwidth*\thebarcount)+(\barsep*\thebarcount)}
		\let\barx\pgfmathresult
		
		\filldraw[fill=gray, draw=none] (0,-\barx) rectangle (\barone,-\barx-\barwidth);
		
		\node [label=180:\colorbox{gray}{\textcolor{white}{##1}}] at (0,-\barx-0.175) {};
		\addtocounter{barcount}{1}
	}
	\begin{tikzpicture}
		\setcounter{barcount}{0}
}{
	\end{tikzpicture}
}

%------------------------------------------------

\newcounter{a}
\newcounter{b}
\newcounter{c}

% Command to output a number of automatically-sized bubbles from a string in the format of '<size>/<label>', e.g. \bubbles{5/Eclipse, 6/git, 4/Office, 3/Inkscape, 3/Blender}
\newcommand{\bubbles}[1]{
	% Reset counters
	\setcounter{a}{0}
	\setcounter{c}{150}
	
	\begin{tikzpicture}[scale=3]
		\foreach \p/\t in {#1} {
			\addtocounter{a}{1}
			\bubble{\thea/2}{\theb}{\p/25}{\t}{1\p0}
		}
	\end{tikzpicture}
}

% Command to output a bubble at a specific position with a specific size
\newcommand{\bubble}[5]{
	\filldraw[fill=black, draw=none] (#1,0.5) circle (#3); % Bubble
	\node[label=\textcolor{black}{#4}] at (#1,0.7) {}; % Label
}

%----------------------------------------------------------------------------------------
%	MAIN
%---------------------------------------------------------------------------------------- 

%----------------------------------------------------------------------------------------
%	CV HEADER
%---------------------------------------------------------------------------------------- 

\newcommand{\myphone}[1]{%
    \icon{Mobile}{12}{\href{tel:#1}{#1}}\\%
}

\newcommand{\cvheader}[9]{
\begin{minipage}[t]{0.45\textwidth}
	\vspace{-\baselineskip} 
	\colorbox{gray}{{\HUGE\textcolor{white}{\textbf{\MakeUppercase{#1}}}}}
	
	\colorbox{gray}{{\HUGE\textcolor{white}{\textbf{\MakeUppercase{#2}}}}}
	
	\vspace{6pt}
	
	{\huge{ \textbf{#3} } }
\end{minipage}
\begin{minipage}[t]{0.35\textwidth}
	\vspace{-\baselineskip} 
	
	\icon{MapMarker}{12}{#4}\\
	\myphone{#5}\\ % Phone
	\icon{Envelope}{12}{\href{mailto:#6}{tingweiCOG@outlook.com}}\\	% At can also be used
\end{minipage}
\begin{minipage}[t]{0.275\textwidth}
	\vspace{-\baselineskip} 
	
	\icon{Github}{12}{\href{#7}{GitHub}}\\
	\icon{Linkedin}{12}{\href{#8}{LinkedIn}}\\
	\icon{Orcid}{12}{\href{#9}{ORCIDiD}}\\
\end{minipage}

\vspace{0.5cm}
}

%----------------------------------------------------------------------------------------
%	SECTION TITLE
%----------------------------------------------------------------------------------------

\newcommand{\cvsectiontitle}[1]{
	\vspace{\baselineskip}
	\colorbox{gray}{\textcolor{white}{\Huge{ \MakeUppercase{\textbf{#1}}} }}\\
}

%----------------------------------------------------------------------------------------
%	EXECUTIVE SUMMARY
%---------------------------------------------------------------------------------------- 

\newcommand{\executiveSummary}[3]{
{#1}\\
{#2}\\
{#3}\\
}

%----------------------------------------------------------------------------------------
%	ITEMIZE EXPERIENCE
%---------------------------------------------------------------------------------------- 

\newcommand{\itemizeexperience}[3]{%
    \vspace{-8pt}
    \textcolor{white}{\hrule}
    $\cdot$ #1 \\[0pt]
    $\cdot$ #2 \\[0pt]
    $\cdot$ #3 \\[0pt]
    \vspace{8pt}
}

%----------------------------------------------------------------------------------------
%	ITEMIZE EDUCATION
%---------------------------------------------------------------------------------------- 

\newcommand{\itemizeeducation}[2]{%
    \vspace{-8pt}
    \textcolor{white}{\hrule}
    $\cdot$ #1 \\[0pt]
    $\cdot$ #2 \\[0pt]
    \vspace{1pt}
}

\newcommand{\itemizeeducationthree}[3]{%
    \vspace{-8pt}
    \textcolor{white}{\hrule}
    $\cdot$ #1 \\[0pt]
    $\cdot$ #2 \\[0pt]
    $\cdot$ #3 \\[0pt]
    \vspace{1pt}
}

\newcommand{\itemizeeducationone}[2]{%
    \begin{itemize}
        \item #1 \smallskip
        \item #2 \smallskip
    \end{itemize}
}

\newcommand{\itemizeeducationtwo}[2]{%
    \begin{itemize}
        \item #1 \smallskip
    \end{itemize} #2
}

%----------------------------------------------------------------------------------------
%	PROJECT
%---------------------------------------------------------------------------------------- 

\newcommand{\project}[6]{%
  {\textbf{\large\color{body}#1}\itemizeeducationone{#5}{#6}\par}
  \smallskip\normalsize
  \ifstrequal{#2}{}{}{
  \textbf{\color{accent}#2}\par
  \smallskip}
  \ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\faCalendar\hspace{0.5em}#3}}}%
  \ifstrequal{#4}{}{}{{\small\makebox[0.5\linewidth][l]{\faMapMarker\hspace{0.5em}#4}}}\par
  \medskip\normalsize
}

%----------------------------------------------------------------------------------------
%	HOBBIES
%---------------------------------------------------------------------------------------- 

\newcommand{\hobbies}[6]{%
  {\textbf{\large\color{body}#1}\itemizeeducationone{#5}{#6}\par}
  \smallskip\normalsize
  \ifstrequal{#2}{}{}{
  \textbf{\color{accent}#2}\par
  \smallskip}
  \ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\faCalendar\hspace{0.5em}#3}}}%
  \ifstrequal{#4}{}{}{{\small\makebox[0.5\linewidth][l]{\faMapMarker\hspace{0.5em}#4}}}\par
  \medskip\normalsize
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{1pt} % No spacing between table columns

% Environment to hold a new list of entries-This is the environment here
% Write the code 
\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\company}[4]{%
    \smallskip
    {\small\textls[140]{\textbf{\MakeUppercase{#1}}}} &           {\small\textls[140]{\textbf{\MakeUppercase{#2}}}} \\
    \smallskip
    {\faMapMarker\hspace{0.5em}#3} & {\faCalendar\hspace{0.5em}#4} \\
    \smallskip 
}

\newcommand{\entry}[5]{%
    \begin{minipage}[t]{0.5\textwidth}
        \raggedright
        {\small\textls[140]{\textbf{\MakeUppercase{#1}}}} \\
        \vspace{5pt}
        \raggedright
        {\color {accesso}\faMapMarker\hspace{0.5em}\textcolor{gray}{#2} } 
    \end{minipage}%
    \hfill 
    \begin{minipage}[t]{0.5\textwidth}
        \raggedleft
        {\textbf{\textcolor{black}{\MakeUppercase{#3}}}} \\
        \vspace{5pt}
        \raggedleft
        {\color {accesso} \faCalendar\hspace{0.5em}\textcolor{gray}{#4} } \\ 
    \end{minipage}

    \\\\
    
    \vspace{0.5em}
    \begin{minipage}[t]{\textwidth} 
        #5 
    \end{minipage}
    \\\\
}

