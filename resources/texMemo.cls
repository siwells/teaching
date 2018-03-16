% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2010/07/31 - Simple Memo Class, Including Logo]
\RequirePackage{palatino}

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@student{\relax}
\newcommand{\student}[1]{\gdef\@student{#1}}

\def\@matric{\relax}
\newcommand{\matric}[1]{\gdef\@matric{#1}}

\def\@grade{\relax}
\newcommand{\grade}[1]{\gdef\@grade{#1}}

\def\@marker{\relax}
\newcommand{\marker}[1]{\gdef\@marker{#1}}

\def\@subject{\relax}
\newcommand{\subject}[1]{\gdef\@subject{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			%\vspace{-0.6in}
            \vspace{-0.25in}
			\@memologo
			\vspace{-1.0in}
		\par\end{flushright}%
	\end{minipage}
	}
	
	% To, From, Subject Block
	\begin{description}
		\ifthenelse{\equal{\@student}{\relax}}{}{\item [{Student:}] \@student}
        \ifthenelse{\equal{\@matric}{\relax}}{}{\item [{Matriculation Number:}] \@matric}
        \ifthenelse{\equal{\@grade}{\relax}}{}{\item [{Grade:}] \@grade}
		\ifthenelse{\equal{\@marker}{\relax}}{}{\item [{Marker:}] \@marker}
		\ifthenelse{\equal{\@subject}{\relax}}{}{\item [{Subject:}] \@subject}
		%\ifthenelse{\equal{\@date}{\relax}}{}{\item [{Date:}] \@date}
	\end{description}
	\decorativeline\bigskip{}
}
