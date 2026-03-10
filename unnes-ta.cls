% unnes-ta.cls  (UNNES TA - Proposal & Skripsi)
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unnes-ta}[2026/02/11 UNNES TA Proposal/Skripsi class]

% ---- options: proposal | skripsi (default skripsi) ----
\newif\ifunnes@proposal
\DeclareOption{proposal}{\unnes@proposaltrue}
\DeclareOption{skripsi}{\unnes@proposalfalse}
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
\ifunnes@proposal
  \unnesCoverPage{Proposal Skripsi}
\else
  \unnesCoverPage{Skripsi}
\fi
}

% ---- Persetujuan Pembimbing (sesuai contoh format) ----
\newcommand{\unnesPersetujuanPembimbing}{%
\thispagestyle{empty}
\begin{center}
  \textbf{PERSETUJUAN PEMBIMBING}
\end{center}
\vspace{0.6cm}
\noindent
\ifunnes@proposal
Proposal skripsi berjudul ``\unnesTitle'' yang disusun oleh\\
\else
Skripsi berjudul ``\unnesTitle'' yang disusun oleh\\
\fi
\noindent
nama \hspace{1.1cm}: \unnesAuthor\\
NIM \hspace{1.35cm}: \unnesNIM\\
Prodi/Fakultas : \unnesProdi{} / \unnesFakultas\\[0.6cm]
\noindent telah disetujui untuk diajukan ke penilaian proposal/ujian skripsi.\\[0.8cm]
\noindent \unnesCity, \rule{4cm}{0.4pt}\\
\noindent Pembimbing\\[1.2cm]
\noindent \unnesPembimbingNama\\
\noindent \unnesPembimbingNIP
\clearpage
}

% ---- Pengesahan Tim Penguji (khusus skripsi) ----
\newcommand{\unnesPengesahanPenguji}[4]{% ketua, sekretaris, penguji1, penguji2 (nama+NIP bebas)
\thispagestyle{empty}
\begin{center}
  \textbf{PENGESAHAN PENGUJI}
\end{center}
\vspace{0.6cm}
\noindent
Skripsi berjudul ``\unnesTitle'' yang disusun oleh\\
nama \hspace{1.1cm}: \unnesAuthor\\
NIM \hspace{1.35cm}: \unnesNIM\\
Prodi/Fakultas : \unnesProdi{} / \unnesFakultas\\[0.6cm]
\noindent telah dipertahankan dalam ujian \rule{3cm}{0.4pt} pada hari \rule{2cm}{0.4pt},
tanggal \rule{2cm}{0.4pt} tahun \rule{1.5cm}{0.4pt}.\\[0.8cm]
\noindent Tim Penguji\\[0.6cm]
\begin{tabular}{@{}p{5cm}p{8cm}@{}}
Ketua Penguji & #1\\[1.0cm]
Sekretaris    & #2\\[1.0cm]
Penguji 1     & #3\\[1.0cm]
Penguji 2     & #4\\
\end{tabular}
\clearpage
}

% ---- Pernyataan Keaslian (khusus skripsi) ----
\newcommand{\unnesPernyataanKeaslian}{%
\thispagestyle{empty}
\begin{center}
  \textbf{PERNYATAAN}
\end{center}
\vspace{0.6cm}
\noindent
Skripsi yang ditulis berjudul ``\unnesTitle'' merupakan karya ilmiah asli dan
bukan hasil plagiasi dari karya ilmiah orang lain. Pendapat atau temuan orang
lain yang dikutip di dalam skripsi ini telah ditulis berdasarkan kode etik ilmiah.
Berdasarkan pernyataan ini, saya siap menanggung sanksi hukum apabila ditemukan
pelanggaran terhadap integritas akademik dalam karya ini.\\[1.0cm]
\noindent \unnesCity, \rule{4cm}{0.4pt}\\[2.0cm]
\noindent (\unnesAuthor)
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
