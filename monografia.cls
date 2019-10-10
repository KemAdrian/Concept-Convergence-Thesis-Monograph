\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{monografia}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[10pt,a4paper]{book}
% PAGE LAYOUT
\setlength{\textwidth}      {12.2truecm}
\setlength{\textheight}     {19.3truecm}
\setlength{\oddsidemargin}  {18.6mm}   % 7.8mm
\setlength{\evensidemargin} {18.6mm}   % 28.6mm
\setlength{\topmargin}      {12.6mm}   % -8.5mm
% paper size  176mm * 240mm

\setlength{\lineskip}       {1pt}
\setlength{\normallineskip} {1pt}
\setlength{\marginparwidth} {19mm}
\setlength{\marginparsep}   {7pt}
\setlength{\headheight}     {12pt}
\setlength{\headsep}        {9mm}
\setlength{\footskip}       {9mm}
\setlength{\columnsep}      {10pt}
\setlength{\columnseprule}  {0pt}
\setlength{\footnotesep}    {6.65pt}
\setlength{\skip\footins}   {9pt plus 4pt minus 2pt}

% MARGINAL NOTES

\setlength{\marginparpush} {5pt}

% PARAGRAPHS

\setlength{\parskip}   {0pt plus 1pt}
\setlength{\parindent} {15pt}
\setlength{\partopsep} {2pt plus 1pt minus 1pt}

% LISTS

\setlength{\leftmargini}   {25pt}
\setlength{\leftmarginii}  {22pt}
\setlength{\leftmarginiii} {18.7pt}
\setlength{\leftmarginiv}  {17pt}
\setlength{\leftmarginv}   {10pt}
\setlength{\leftmarginvi}  {10pt}
\leftmargin\leftmargini
\labelsep      5pt
\labelwidth\leftmargini\advance\labelwidth-\labelsep

\def\ps@monoheadings{%
     \let\@oddfoot\@empty\let\@evenfoot\@empty
     \def\@evenhead{\rm\thepage \hfil \sf\leftmark}%
     \def\@oddhead{\hbox{}\sf\rightmark \hfil \rm\thepage}%
     \let\@mkboth\markboth
\def\chaptermark##1{\markboth {\ifnum \c@secnumdepth >\m@ne
       \@chapapp\ \thechapter. \ \fi ##1}{}}%
\def\sectionmark##1{\markright {\ifnum \c@secnumdepth >\z@
    \thesection. \ \fi ##1}}
     }

\def\ps@chapheadings{%
     \def\@oddfoot{\hfil \rm\thepage \hfil}
     \let\@evenfoot\@empty
     \let\@evenhead\@empty
     \let\@oddhead\@empty
   %  \def\@oddhead{\hfil \sf\today}
     \let\@mkboth\markboth
\def\chaptermark##1{\markboth {\ifnum \c@secnumdepth >\m@ne
       \@chapapp\ \thechapter. \ \fi ##1}{}}%
\def\sectionmark##1{\markright {\ifnum \c@secnumdepth >\z@
    \thesection. \ \fi ##1}}
     }

\renewcommand{\chapter}{\if@openright
                              \clearpage\thispagestyle{empty}\cleardoublepage
                         \else\clearpage\fi
                     \thispagestyle{chapheadings}%   \thispagestyle{plain}
                     \global\@topnum\z@
                     \@afterindentfalse
                     \secdef\@chapter\@schapter}
\renewcommand{\part}{\clearpage\thispagestyle{empty}\cleardoublepage
                  \thispagestyle{empty}%
                  \if@twocolumn
                      \onecolumn
                      \@tempswatrue
                    \else
                      \@tempswafalse
                  \fi
                  \null\vfil
                  \secdef\@part\@spart}


\renewcommand{\listoffigures}{%
     \chapter*{\listfigurename
       \@mkboth{\listfigurename}{\listfigurename}}%
     \@starttoc{lof}%
     }
\renewcommand{\listoftables}{%
     \chapter*{\listtablename
       \@mkboth{\listtablename}{\listtablename}}%
     \@starttoc{lot}%
     }
\renewcommand{\tableofcontents}{%
     \chapter*{\contentsname
         \@mkboth{\contentsname}{\contentsname}}%
     \@starttoc{toc}%
     }

\renewenvironment{thebibliography}[1]
      {\chapter*{\bibname
         \@mkboth{\bibname}{\bibname}}%
       \list{\@biblabel{\@arabic\c@enumiv}}%
            {\settowidth\labelwidth{\@biblabel{#1}}%
             \leftmargin\labelwidth
             \advance\leftmargin\labelsep
             \@openbib@code
             \usecounter{enumiv}%
             \let\p@enumiv\@empty
             \renewcommand\theenumiv{\@arabic\c@enumiv}}%
       \sloppy\clubpenalty4000\widowpenalty4000%
       \sfcode`\.\@m}
      {\def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
       \endlist}

\renewenvironment{theindex}
                {\if@twocolumn
                   \@restonecolfalse
                 \else
                   \@restonecoltrue
                 \fi
                 \columnseprule \z@
                 \columnsep 35\p@
                 \twocolumn[\@makeschapterhead{\indexname}]%
                 \@mkboth{\indexname}{\indexname}%
                 \thispagestyle{plain}\parindent\z@
                 \parskip\z@ \@plus .3\p@\relax
                 \let\item\@idxitem}
                {\if@restonecol\onecolumn\else\clearpage\fi}

\pagestyle{monoheadings}
\normalsize
\endinput
