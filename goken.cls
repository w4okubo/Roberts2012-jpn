%% file `goken.cls',
%% 『語研論集』用スタイルファイル
%% 2020/11/17 v1.0
%% 2020/12/07 v1.1: 日本語フォント、ヘッダー位置、英語用ヘッダー著者名、titlesecがparagraphを扱えないのを解決
%% 2021/03/13 v1.2:
%% - 引用の際の「:」の後に半角スペースを追加
%% - p. 1ヘッダーの欧文のフォントをCentury Schoolbookにし、最後にピリオド追加
%% - ページ番号フォントをCentury Schoolbookに
%% - MS Wordテンプレートでグリッド線に合わせない箇所（英文タイトル、要旨、所属、脚注、参考文献）の行間を0ptに
%% 2021/03/31 v1.3: 副題をダッシュ囲みからコロンに
%% 野元　裕樹
%% nomoto@tufs.ac.jp
%% TO DO: 欧文のサイズを少し小さくする、タイトルに謝辞を付けられるようにする
%\NeedsTeXFormat{pLaTeX2e}
\ProvidesFile{goken}[2021/03/31 v1.3]
\LoadClass[11pt,twoside,dvipdfmx]{jsarticle}
%10ptにすると和文が小さく見えるので1pt追加。ここでa4paperを指定すると、geometryの余白調整が失敗する。
\RequirePackage{etoolbox}

\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
\RequirePackage{helvet}
%\RequirePackage[ms-dx]{pxjafont} %v1.0 (pxjafont obsolete, replaced by pxchfon)
\RequirePackage[noalphabet]{pxchfon}
\setminchofont[0]{msmincho.ttc} % ＭＳ明朝
\setboldminchofont{yumindb.ttf} % 游明朝
\setgothicfont[0]{msgothic.ttc} % ＭＳゴシック
\setboldgothicfont{yugothb.ttc} % 游ゴシック
\RequirePackage[deluxe,multi]{otf} %multi for Korean v1.1

\RequirePackage[dvipdfmx]{graphicx}
\RequirePackage[dvipdfmx]{color}

\RequirePackage{calc}
\RequirePackage[a4paper,truedimen,hmargin=25truemm,vmargin=30truemm,%showframe,
headheight=15truemm, headsep=15truemm-\headheight, footskip=16truemm]{geometry}

\def\@title{!INSERT TITLE!}
\def\@entitle{!INSERT ENGLISH TITLE!}
\def\@subtitle{}
\def\@ensubtitle{}
\def\@author{!INSERT AUTHOR NAME!}
\def\@hauthor{!INSERT AUTHOR NAME!}
\def\@enauthor{!INSERT ROMINIZED AUTHOR NAME!}
\def\@enhauthor{!INSERT ROMINIZED AUTHOR NAME!} %1.1
\def\@affil{!INSERT AFFILIATION!}
\def\@startpage{!INSERT START PAGE NUMBER!}
\def\@endpage{!INSERT END PAGE NUMBER!}
\def\@date{!INSERT YEAR!}
\def\@jourvolume{!INSERT VOLUME NUMBER!}
\def\@category{!CHOOSE CATEGORY!}
\def\@email{!INSERT CONTACT E-MAIL ADDRESS!}
\def\@received{!INSERT DATE RECEIVED!}

\def\title#1{\gdef\@title{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\entitle#1{\gdef\@entitle{#1}}
\def\ensubtitle#1{\gdef\@ensubtitle{#1}}
\def\hauthor#1{\gdef\@hauthor{#1}}
\def\enauthor#1{\gdef\@enauthor{#1}}
\def\enhauthor#1{\gdef\@enhauthor{#1}} %1.1
\def\affil#1{\gdef\@affil{#1}}
\def\startpage#1{\gdef\@startpage{#1}\setcounter{page}{#1}}
\def\endpage#1{\gdef\@endpage{#1}}
\def\date#1{\gdef\@date{#1}}
\def\jourvolume#1{\gdef\@jourvolume{#1}}
\def\category#1{\gdef\@category{#1}}
\def\email#1{\gdef\@email{#1}}
\def\received#1{\gdef\@received{#1}}

%% タイトル短縮版（必要な場合）
\def\runningtitle#1{\gdef\@runningtitle{#1}}

%% ヘッダー用の著者名
\def\headerauthor#1{\gdef\@headerauthor{#1}}

%% タイトル、著者、所属
\renewcommand{\maketitle}{%
	\begin{center}
	%% タイトル、MSゴシック 12pt; 副題、MSゴシック 11pt Bold
		\ifdefempty{\@subtitle}{{\fontsize{12pt}{12pt}\selectfont\textsf{\@title}}\par}{{\large\textsf{\@title：}}\par{\fontsize{11pt}{11pt}\selectfont\textsf{\@subtitle}}\par} %v1.3
	%% タイトル（英）、Times New Roman 11pt Bold;
	%% 副題（英）、Times New Roman 10pt Bold
		\ifdefempty{\@ensubtitle}{{\fontsize{11pt}{11pt}\selectfont\textbf{\@entitle}}\par}{{\fontsize{11pt}{11pt}\selectfont\textbf{\@entitle: }}\par{\fontsize{10pt}{12pt}\selectfont\textbf{\@ensubtitle}\par}} %v1.2
		\vspace{.7\baselineskip}
	%% 著者、MS明朝 12pt bold
	\textbf{\fontsize{12pt}{12pt}\selectfont\@author}\par
	%% 著者（英）、Times New Roman 12pt bold
	\textbf{\fontsize{12pt}{12pt}\selectfont\@enauthor}\par
	\vspace{.7\baselineskip}
	%% 所属、MS明朝 8pt
	{\fontsize{8pt}{10pt}\selectfont\@affil\par} %v1.2 \small > \fontsize
	\vspace{.7\baselineskip}
	\end{center}
	%CC-BY記載
	\begin{figure}[b]
		\includegraphics[width=\linewidth]{cc-by.png}
		\vspace{-2\baselineskip}
	\end{figure}
	\thispagestyle{first}
}

%% 要旨、MS明朝 10pt
\renewenvironment{abstract}
{\fontsize{10pt}{12pt}\selectfont\noindent\textgt{要旨：}}{\par\vspace{\baselineskip}} %v1.2 \fontsize
%% 要旨（英）、Times New Roman 10pt
\newenvironment{enabstract}
{\fontsize{10pt}{12pt}\selectfont\noindent\textbf{Abstract: }}{\par\vspace{.8\baselineskip}} %v1.2 \fontsize

%% キーワード、MS明朝 10pt
\newcommand{\keyword}[1]{\noindent\textgt{キーワード：}#1 \par}
%% キーワード（英）、Times New Roman 10pt
\newcommand{\enkeyword}[1]{\noindent\textbf{Keywords:} #1 \par\vspace{1.4\baselineskip}}

%% 連絡先、原稿受理日
\newcommand{\metainfo}{%
	\vspace{1.4\baselineskip}
	\noindent\textgt{執筆者連絡先：}\@email\par\noindent\textgt{原稿受理日：}\@received}

%%段落はじめの字下げ
\RequirePackage{indentfirst}

%% Might as well redefine the quote environments too!
\renewenvironment{quote}
{\list{}{
	\setlength{\leftmargin}{1cm}%
	\setlength{\rightmargin}{\leftmargin}%
	}%
	\item\relax}
{\endlist}

\renewenvironment{quotation}
{\list{}{
	\setlength{\leftmargin}{1cm}%
	\setlength{\rightmargin}{\leftmargin}%
	}%
	\item\relax}
{\endlist}

\RequirePackage{enumitem}
\setlist[itemize]{nosep}
\setlist[enumerate]{nosep}

%% sectional titles
\RequirePackage{titlesec}
\titleformat{\section}{\sffamily}{\thesection.}{.5em}{}
\titlespacing*{\section}{0pt}{*1.5}{0pt}
\titleformat{\subsection}{\sffamily}{\thesubsection}{.5em}{}
\titlespacing*{\subsection}{0pt}{*1.5}{0pt}
\titleformat{\subsubsection}{\sffamily}{\thesubsubsection}{.5em}{}
\titlespacing*{\subsubsection}{0pt}{*1.5}{0pt}
\renewcommand{\jsParagraphMark}{} %v1.1

%% Running headers and footers
\RequirePackage{fancyhdr}
\fancyhf{}
\fancyhead[CO]{{\fontsize{8pt}{8pt}\selectfont \@title，\@hauthor\\\vspace{-5pt}\@entitle, \@enhauthor}\vfill} %1.1 (@enauthor > @enhauthor)
\cfoot{\fontfamily{pnc}{\fontsize{9pt}{9pt}\selectfont －\thepage－}} %v1.2
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{first}{
	\fancyhf{}
	\rhead{\fontfamily{pnc}{\fontsize{8pt}{8pt}\selectfont 東京外国語大学語学研究所『語学研究所論集』第\@jourvolume{}号 (\@date), pp.~\@startpage--\@endpage.\\\vspace{2pt} %v1.2
	Tokyo University of Foreign Studies, \textit{Journal of the Institute of Language Research} No.~\@jourvolume{} (\@date), pp.~\@startpage--\@endpage.\\\vspace{.4\baselineskip}＜\@category＞\hfill}} %v1.2
	\cfoot{\fontfamily{pnc}{\fontsize{9pt}{9pt}\selectfont －\thepage－}} %v1.2
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{fancy}

%% Footnotes
\renewcommand\thefootnote{\arabic{footnote}}
%\renewcommand{\footnotesize}{\normalsize}
\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont} %v1.2
% From E-Ching Ng's ``A LaTeX setup''
\addtolength{\skip\footins}{10pt} % More space between body text and footnote rule
\addtolength{\footnotesep}{2pt}   % More space between footnote items %v1.2 (5pt > 2pt)
% Modified version of epltxfn.sty to get the footnote number in superscript (cf. section 6.8, ExPex documentation)
\RequirePackage{expex}
\def\everyfootnote{%
   \keepexcntlocal
   \excnt=1
   \lingset{exskip=1ex,interpartskip=0pt,exnotype=roman,sampleexno=,
      labeltype=alpha,labelanchor=numright,labeloffset=.6em,
      aboveglftskip=0pt,
      textoffset=.6em}
}
\renewcommand{\@makefntext}[1]{%
   \everyfootnote
   \parindent=1em
   \noindent
   \@textsuperscript{\scriptsize\@thefnmark}\enspace #1%
}

%% Float captions
\RequirePackage[singlelinecheck=false]{caption}
\captionsetup[table]{justification=raggedright,labelsep=period,font={sf}}
\captionsetup[figure]{justification=centering,labelsep=period,font={sf}}
\RequirePackage{floatrow}
\floatsetup[table]{style=plaintop,justification=raggedright}

%% natbib commands with unified bibliography style from http://celxj.org/
\RequirePackage{natbib}[2007/10/30]
\bibliographystyle{unified}
%% Citation style is (author date:page) e.g. (Sneddon 2006: 70)
\setcitestyle{authoryear,round,citesep={;},aysep={},yysep={,},notesep={:~}}%v1.1ではnotesep={:}
\renewcommand{\refname}{\centerline{参考文献}\vspace{-\baselineskip}}
%https://tex.stackexchange.com/questions/93859/condense-the-space-between-bibliographic-entries v1.2
\let\OLDthebibliography\thebibliography
\renewcommand\thebibliography[1]{%
  \OLDthebibliography{#1}
  \setlength{\baselineskip}{11pt}
  \setlength{\parskip}{2pt}
%  \setlength{\itemsep}{1pt plus 0.3ex}
}

%%Bookmarks and links
\RequirePackage[pdfusetitle,dvipdfmx]{hyperref}
\hypersetup{
     bookmarksnumbered=true,
     colorlinks=true,
     linkcolor=black,
     citecolor=blue,
     filecolor=black,
     urlcolor=black,
}
\RequirePackage{pxjahyper}%bookmark in Japanese

\RequirePackage{doi}
