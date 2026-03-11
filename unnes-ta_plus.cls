% unnes-ta.cls  (UNNES TA - Proposal & Skripsi)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unnes-ta_plus}[2026/02/11 UNNES TA Proposal/Skripsi class]

% ---- Document mode & type options ----
\newif\ifunnes@proposal
\newif\ifunnes@publikasi
\newif\ifunnes@bookchapter

% defaults
\unnes@proposalfalse
\unnes@publikasifalse
\unnes@bookchapterfalse

% internal labels (will be overwritten by options)
\def\unnes@coverlabel{PROPOSAL SKRIPSI}
\def\unnes@objlabel{Skripsi}
\def\unnes@ujianlabel{skripsi}
\def\unnes@pernyataantitle{PERNYATAAN KEASLIAN}
\def\unnes@pembimbinglabel{Pembimbing}

% ---- tanggal khusus ----
\def\@tanggalpersetujuan{}
\def\@tanggalpernyataan{}

\newcommand{\tanggalPersetujuan}[1]{\gdef\@tanggalpersetujuan{#1}}
\newcommand{\tanggalPernyataan}[1]{\gdef\@tanggalpernyataan{#1}}

% ---- hari dan tanggal pengesahan ----
\def\@haripengesahan{}
\def\@tanggalpengesahan{}
\def\@tahunpengesahan{}

\newcommand{\hariPengesahan}[1]{\gdef\@haripengesahan{#1}}
\newcommand{\tanggalPengesahan}[1]{\gdef\@tanggalpengesahan{#1}}
\newcommand{\tahunPengesahan}[1]{\gdef\@tahunpengesahan{#1}}

% Book-chapter extra metadata (only used when bookchapter option is active)
\def\unnes@booktitle{...}
\def\unnes@bookpublisher{...}
\def\unnes@bookstatus{akan/telah}
% Materai line on statement page (customizable)
\def\unnes@materai{Materai 10.000}
\newcommand{\materai}[1]{\def\unnes@materai{#1}}


\newcommand{\booktitle}[1]{\def\unnes@booktitle{#1}}
\newcommand{\bookpublisher}[1]{\def\unnes@bookpublisher{#1}}
\newcommand{\bookstatus}[1]{\def\unnes@bookstatus{#1}}

% setters
\def\unnes@setkind@skripsi{%
  \unnes@publikasifalse \unnes@bookchapterfalse
  \def\unnes@objlabel{Skripsi}%
  \def\unnes@ujianlabel{skripsi}%
  \def\unnes@pernyataantitle{PERNYATAAN KEASLIAN}%
  \def\unnes@pembimbinglabel{Pembimbing}%
  \ifunnes@proposal
    \def\unnes@coverlabel{PROPOSAL SKRIPSI}%
  \else
    \def\unnes@coverlabel{SKRIPSI}%
  \fi
}
\def\unnes@setkind@publikasi{%
  \unnes@publikasitrue \unnes@bookchapterfalse
  \def\unnes@objlabel{Publikasi ilmiah}%
  \def\unnes@ujianlabel{publikasi}%
  \def\unnes@pernyataantitle{PERNYATAAN}%
  \def\unnes@pembimbinglabel{Pembimbing}%
  \ifunnes@proposal
    \def\unnes@coverlabel{Proposal Artikel Ilmiah}%
  \else
    \def\unnes@coverlabel{Publikasi Ilmiah}%
  \fi
}
\def\unnes@setkind@bookchapter{%
  \unnes@publikasifalse \unnes@bookchaptertrue
  \def\unnes@objlabel{Naskah chapter}%
  \def\unnes@ujianlabel{book chapter}%
  \def\unnes@pernyataantitle{PERNYATAAN KEASLIAN}%
  \def\unnes@pembimbinglabel{Dosen pembimbing}%
  \ifunnes@proposal
    \def\unnes@coverlabel{Proposal Naskah Chapter}%
  \else
    \def\unnes@coverlabel{Laporan Book Chapter}%
  \fi
}
\newcommand{\unnes@setkind}[1]{\csname unnes@setkind@#1\endcsname}

% options: skripsi (existing)
\DeclareOption{proposal}{\unnes@proposaltrue \unnes@setkind{skripsi}}
\DeclareOption{skripsi}{\unnes@proposalfalse \unnes@setkind{skripsi}}

% options: publikasi ilmiah
\DeclareOption{proposal-publikasi}{\unnes@proposaltrue \unnes@setkind{publikasi}}
\DeclareOption{proposalpublikasi}{\unnes@proposaltrue \unnes@setkind{publikasi}}
\DeclareOption{publikasi}{\unnes@proposalfalse \unnes@setkind{publikasi}}

% options: book chapter
\DeclareOption{proposal-bookchapter}{\unnes@proposaltrue \unnes@setkind{bookchapter}}
\DeclareOption{proposalbookchapter}{\unnes@proposaltrue \unnes@setkind{bookchapter}}
\DeclareOption{bookchapter}{\unnes@proposalfalse \unnes@setkind{bookchapter}}

% default option
\ExecuteOptions{skripsi}
\ProcessOptions\relax


% Base class
\LoadClass[12pt,a4paper,oneside]{report}

% ---- engine/font handling ----
\RequirePackage{iftex}
\ifPDFTeX
  % fallback: Times-like (not exactly Times New Roman)
  \RequirePackage{newtxtext}
  \RequirePackage{newtxmath}
\else
  \RequirePackage{fontspec}
  \setmainfont{Times New Roman}
\fi

% ---- page layout: A4, margins (left 4cm, others 3cm) ----
\RequirePackage[left=4cm,right=3cm,top=3cm,bottom=3cm]{geometry}

% ---- spacing: proposal 1.15, skripsi 1.5; abstract single ----
\RequirePackage{setspace}
\ifunnes@proposal
  \setstretch{1.15}
\else
  \setstretch{1.5}
\fi

% ---- Indonesian chapter label "BAB" ----
\renewcommand{\chaptername}{BAB}
\renewcommand{\contentsname}{Daftar Isi}
\renewcommand{\listfigurename}{Daftar Gambar}
\renewcommand{\listtablename}{Daftar Tabel}


% ---- basic packages ----
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{tocloft}
\RequirePackage{titlesec}
\RequirePackage{etoolbox}

% ---- heading formatting (simple & clean; can be adjusted) ----
\titleformat{\chapter}
  {\bfseries\Large}
  {\chaptername~\thechapter.}
  {0.5em}
  {\bfseries\MakeUppercase}

\titleformat{\section}{\bfseries\large}{\thesection}{0.5em}{}
\titleformat{\subsection}{\bfseries\normalsize}{\thesubsection}{0.5em}{}

% ---- metadata ----
\newcommand{\unnesTitle}{}
\newcommand{\unnesType}{Skripsi} % or "Proposal Skripsi"
\newcommand{\unnesDegree}{Sarjana \dots} % Sarjana ... (S1)
\newcommand{\unnesAuthor}{Nama}
\newcommand{\unnesNIM}{NIM}
\newcommand{\unnesProdi}{NAMA PRODI}
\newcommand{\unnesFakultas}{NAMA FAKULTAS}
\newcommand{\unnesYear}{TAHUN}
\newcommand{\unnesCity}{Semarang}
\newcommand{\unnesPembimbingNama}{Nama Pembimbing}
\newcommand{\unnesPembimbingNIP}{NIP}

\newcommand{\unnesSetTitle}[1]{\renewcommand{\unnesTitle}{#1}}
\newcommand{\unnesSetType}[1]{\renewcommand{\unnesType}{#1}}
\newcommand{\unnesSetDegree}[1]{\renewcommand{\unnesDegree}{#1}}
\newcommand{\unnesSetAuthor}[1]{\renewcommand{\unnesAuthor}{#1}}
\newcommand{\unnesSetNIM}[1]{\renewcommand{\unnesNIM}{#1}}
\newcommand{\unnesSetProdi}[1]{\renewcommand{\unnesProdi}{#1}}
\newcommand{\unnesSetFakultas}[1]{\renewcommand{\unnesFakultas}{#1}}
\newcommand{\unnesSetYear}[1]{\renewcommand{\unnesYear}{#1}}
\newcommand{\unnesSetCity}[1]{\renewcommand{\unnesCity}{#1}}
\newcommand{\unnesSetPembimbing}[2]{%
  \renewcommand{\unnesPembimbingNama}{#1}%
  \renewcommand{\unnesPembimbingNIP}{#2}%
}

% ---- cover/title page (mengikuti contoh: judul 14pt, lainnya 12pt) ----
\newcommand{\unnesCoverPage}[1]{% #1 = "Proposal Skripsi" / "Skripsi"
\thispagestyle{empty}
\begin{center}
  % Logo: panduan menyebut logo proporsional (P:L = 1:1) tanpa teks UNNES
  % Silakan taruh file logo: logo-unnes.png
  \vspace*{1.5cm}
  \includegraphics[width=3.2cm]{logo-unnes.png}\par
  \vspace{1.2cm}

  {\fontsize{14}{16}\selectfont\bfseries \MakeUppercase{\unnesTitle}\par}
  \vspace{0.6cm}
  {\fontsize{14}{16}\selectfont #1\par}
  \vspace{0.8cm}

  {\fontsize{12}{14}\selectfont
    diajukan sebagai salah satu syarat untuk memperoleh gelar \par
    \unnesDegree\par
  }
  \vspace{0.8cm}
  {\fontsize{12}{14}\selectfont oleh\par}
  \vspace{0.3cm}
  {\fontsize{12}{14}\selectfont \unnesAuthor\par}
  {\fontsize{12}{14}\selectfont \unnesNIM\par}

  \vfill
  {\fontsize{12}{14}\selectfont \MakeUppercase{\unnesProdi}\par}
  {\fontsize{12}{14}\selectfont \MakeUppercase{\unnesFakultas}\par}
  {\fontsize{12}{14}\selectfont \MakeUppercase{Universitas Negeri Semarang}\par}
  {\fontsize{12}{14}\selectfont \unnesCity, \unnesYear\par}
\end{center}
\clearpage
}

\newcommand{\maketitleunnes}{%
  \unnesCoverPage{\unnes@coverlabel}%
}


% ---- helper: blok tanda tangan rata kanan ----
\newcommand{\unnesRightSignBlock}[1]{%
\begin{flushright}
  \begin{minipage}{0.38\textwidth}
    \raggedright
    #1
  \end{minipage}
\end{flushright}%
}

% ---- Persetujuan Pembimbing (sesuai contoh format) ----
\newcommand{\unnesPersetujuanPembimbing}{%
\thispagestyle{empty}
\begin{center}
  \textbf{PERSETUJUAN PEMBIMBING}
\end{center}
\vspace{0.6cm}
\noindent
\ifunnes@bookchapter
Naskah chapter berjudul ``\unnesTitle'' yang disusun oleh\\
\else
  \ifunnes@publikasi
  Publikasi ilmiah berjudul ``\unnesTitle'' yang disusun oleh\\
  \else
    \ifunnes@proposal
    Proposal skripsi berjudul ``\unnesTitle'' yang disusun oleh\\
    \else
    Skripsi berjudul ``\unnesTitle'' yang disusun oleh\\
    \fi
  \fi
\fi
\noindent
nama \hspace{1.1cm}: \unnesAuthor\\
NIM \hspace{1.35cm}: \unnesNIM\\
Prodi/Fakultas : \unnesProdi{} / \unnesFakultas\\[0.6cm]
\ifunnes@bookchapter
\noindent dalam book chapter berjudul ``\unnes@booktitle'' yang \unnes@bookstatus\ diterbitkan oleh \unnes@bookpublisher.\\[0.6cm]
\fi
\noindent telah disetujui untuk diajukan ke penilaian proposal/ujian \unnes@ujianlabel.\\[1.2cm]
\unnesRightSignBlock{%
%\unnesCity, \rule{4cm}{0.4pt}\\[0.8cm]
\unnesCity%
\ifx\@tanggalpersetujuan\@empty\else, \@tanggalpersetujuan\fi\\
\unnes@pembimbinglabel\\[1.8cm]
\unnesPembimbingNama\\
\unnesPembimbingNIP
}
\clearpage
}

% ---- Pengesahan Tim Penguji (khusus skripsi) ----
\newcommand{\unnesPengesahanPenguji}[4]{% ketua, sekretaris, penguji1, penguji2
\thispagestyle{empty}
\begin{center}
  \textbf{PENGESAHAN PENGUJI}
\end{center}
\vspace{0.4cm}
\noindent
\ifunnes@bookchapter
Naskah chapter berjudul ``\unnesTitle'' yang disusun oleh\\
\else
  \ifunnes@publikasi
  Publikasi ilmiah berjudul ``\unnesTitle'' yang disusun oleh\\
  \else
  Skripsi berjudul ``\unnesTitle'' yang disusun oleh\\
  \fi
\fi
nama \hspace{1.1cm}: \unnesAuthor\\
NIM \hspace{1.35cm}: \unnesNIM\\
Prodi/Fakultas : \unnesProdi{} / \unnesFakultas\\[0.45cm]
\ifunnes@bookchapter
\noindent dalam book chapter berjudul ``\unnes@booktitle'' yang \unnes@bookstatus\ diterbitkan oleh \unnes@bookpublisher.\\[0.45cm]
\fi
\noindent telah dipertahankan dalam ujian \unnes@ujianlabel\ pada hari
\ifx\@haripengesahan\@empty \rule{2cm}{0.4pt}\else \@haripengesahan\fi,
tanggal
\ifx\@tanggalpengesahan\@empty \rule{2cm}{0.4pt}\else \@tanggalpengesahan \fi
tahun
\ifx\@tahunpengesahan\@empty \rule{1.5cm}{0.4pt}\else \@tahunpengesahan\fi.\\[0.55cm]

\begin{center}
Tim Penguji
\end{center}
\vspace{0.15cm}

\begin{center}
{\small
\setlength{\tabcolsep}{5pt}
\renewcommand{\arraystretch}{1.0}
\begin{tabular}{|p{0.48\textwidth}|p{0.40\textwidth}|}
\hline
\parbox[t][1.55cm][t]{\linewidth}{\raggedright\textbf{Ketua Penguji}\par\vspace{0.18em}#1} &
\parbox[t][1.55cm][t]{\linewidth}{} \tabularnewline \hline

\parbox[t][1.55cm][t]{\linewidth}{\raggedright\textbf{Sekretaris}\par\vspace{0.18em}#2} &
\parbox[t][1.55cm][t]{\linewidth}{} \tabularnewline \hline

\parbox[t][1.55cm][t]{\linewidth}{\raggedright\textbf{Penguji 1}\par\vspace{0.18em}#3} &
\parbox[t][1.55cm][t]{\linewidth}{} \tabularnewline \hline

\parbox[t][1.55cm][t]{\linewidth}{\raggedright\textbf{Penguji 2}\par\vspace{0.18em}#4} &
\parbox[t][1.55cm][t]{\linewidth}{} \tabularnewline \hline
\end{tabular}
}
\end{center}
\clearpage
}

% ---- Pernyataan Keaslian (khusus skripsi) ----
\newcommand{\unnesPernyataanKeaslian}{%
\thispagestyle{empty}
\begin{center}
  \textbf{\unnes@pernyataantitle}
\end{center}
\vspace{0.6cm}
\noindent
\ifunnes@bookchapter
Naskah chapter yang ditulis berjudul ``\unnesTitle'' dalam book chapter berjudul
``\unnes@booktitle'' yang \unnes@bookstatus\ diterbitkan oleh \unnes@bookpublisher\ merupakan karya ilmiah
asli dan bukan hasil plagiasi dari karya ilmiah orang lain.
\else
  \ifunnes@publikasi
  Publikasi ilmiah yang ditulis berjudul ``\unnesTitle'' merupakan karya ilmiah asli dan
  bukan hasil plagiasi dari karya ilmiah orang lain.
  \else
  Skripsi yang ditulis berjudul ``\unnesTitle'' merupakan karya ilmiah asli dan
  bukan hasil plagiasi dari karya ilmiah orang lain.
  \fi
\fi
Pendapat atau temuan orang lain yang dikutip di dalam karya ini telah ditulis berdasarkan kode etik ilmiah.
Berdasarkan pernyataan ini, saya siap menanggung sanksi hukum apabila ditemukan pelanggaran terhadap integritas
akademik dalam karya ini.\\[1.4cm]
\unnesRightSignBlock{%
%\unnesCity, \rule{4cm}{0.4pt}\\[0.8cm]
\ifx\@tanggalpernyataan\@empty
  \unnesCity\\
\else
  \unnesCity, \@tanggalpernyataan\\
\fi
Yang menyatakan\\[1.2cm]
(\unnes@materai)\\[1.2cm]
\unnesAuthor\\
NIM \unnesNIM
}
\clearpage
}

% ---- Abstract environment: single spacing ----
\newenvironment{unnesabstract}{%
  \chapter*{ABSTRAK}%
  \addcontentsline{toc}{chapter}{ABSTRAK}%
  \begin{spacing}{1.0}%
}{%
  \end{spacing}\clearpage
}
\newenvironment{unnesabstracten}{%
  \chapter*{ABSTRACT}%
  \addcontentsline{toc}{chapter}{ABSTRACT}%
  \begin{spacing}{1.0}%
}{%
  \end{spacing}\clearpage
}

% ---- Simple front-matter helper ----
\newcommand{\unnesFrontMatter}{%
  \pagenumbering{roman}
}
\newcommand{\unnesMainMatter}{%
  \clearpage
  \pagenumbering{arabic}
}
