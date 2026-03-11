# README Penggunaan Template LaTeX Tugas Akhir UNNES 2024

Template ini disusun untuk membantu penulisan dokumen akademik di lingkungan **Universitas Negeri Semarang (UNNES)** berbasis LaTeX. Berdasarkan isi paket saat ini, template sudah mencakup empat kebutuhan utama:

1. **Proposal Skripsi**
2. **Skripsi**
3. **Publikasi Ilmiah**
4. **Book Chapter**

Kelas utama yang direkomendasikan adalah **`unnes-ta_plus.cls`** karena sudah menggabungkan seluruh mode tersebut dalam satu class.

---

## 1. Isi folder

Paket ini berisi file utama berikut:

- `unnes-ta_plus.cls` → class utama yang mendukung proposal, skripsi, publikasi, dan book chapter.
- `unnes-ta.cls` → class versi dasar untuk proposal dan skripsi.
- `proposal.tex` → contoh dokumen proposal skripsi.
- `skripsi.tex` → contoh dokumen skripsi.
- `template_publikasi_proposal.tex` → contoh proposal publikasi ilmiah.
- `template_publikasi_laporan.tex` → contoh laporan/publikasi ilmiah.
- `template_bookchapter_proposal.tex` → contoh proposal book chapter.
- `template_bookchapter_laporan.tex` → contoh laporan book chapter.
- `logo-unnes.png` → logo yang dipakai pada halaman sampul.

---

## 2. Rekomendasi penggunaan

Untuk penggunaan baru, gunakan:

```latex
\documentclass[<opsi>]{unnes-ta_plus}
```

Template lama `unnes-ta.cls` masih bisa dipakai untuk kebutuhan dasar proposal dan skripsi, tetapi untuk konsistensi pengembangan disarankan memakai `unnes-ta_plus.cls`.

---

## 3. Pilihan mode dokumen

Class `unnes-ta_plus.cls` mendukung opsi berikut:

### A. Proposal skripsi

```latex
\documentclass[proposal]{unnes-ta_plus}
```

### B. Skripsi

```latex
\documentclass[skripsi]{unnes-ta_plus}
```

### C. Proposal publikasi ilmiah

```latex
\documentclass[proposal-publikasi]{unnes-ta_plus}
```

Alternatif yang juga diterima:

```latex
\documentclass[proposalpublikasi]{unnes-ta_plus}
```

### D. Laporan/publikasi ilmiah

```latex
\documentclass[publikasi]{unnes-ta_plus}
```

### E. Proposal book chapter

```latex
\documentclass[proposal-bookchapter]{unnes-ta_plus}
```

Alternatif yang juga diterima:

```latex
\documentclass[proposalbookchapter]{unnes-ta_plus}
```

### F. Laporan book chapter

```latex
\documentclass[bookchapter]{unnes-ta_plus}
```

---

## 4. Format dasar yang sudah diatur oleh class

Class ini sudah mengatur beberapa kebutuhan format umum, antara lain:

- Ukuran kertas: **A4**
- Ukuran huruf dasar: **12 pt**
- Margin: **kiri 4 cm**, kanan 3 cm, atas 3 cm, bawah 3 cm
- Font:
  - **Times New Roman** bila menggunakan XeLaTeX/LuaLaTeX
  - fallback **newtx** bila menggunakan pdfLaTeX
- Spasi:
  - **1,15** untuk mode proposal
  - **1,5** untuk mode laporan/skripsi
  - **1,0** untuk abstrak/abstract
- Istilah otomatis dalam bahasa Indonesia:
  - `Daftar Isi`
  - `Daftar Gambar`
  - `Daftar Tabel`
  - label bab menjadi `BAB`

Jadi, untuk pertanyaan sebelumnya tentang mengganti tulisan **“Contents”** menjadi **“Daftar Isi”**, hal itu **sudah diatur otomatis** di dalam class.

---

## 5. Metadata yang harus diisi

Sebelum `\begin{document}`, isi metadata berikut sesuai identitas mahasiswa dan dokumen:

```latex
\unnesSetTitle{Judul Dokumen}
\unnesSetDegree{Sarjana ...}
\unnesSetAuthor{Nama Mahasiswa}
\unnesSetNIM{1234567890}
\unnesSetProdi{Nama Program Studi}
\unnesSetFakultas{Nama Fakultas}
\unnesSetCity{Semarang}
\unnesSetYear{2026}
\unnesSetPembimbing{Nama Pembimbing}{NIP Pembimbing}
```

Keterangan:

- `\unnesSetTitle` → judul proposal/skripsi/artikel/chapter
- `\unnesSetDegree` → gelar yang dituju, sesuaikan dengan prodi
- `\unnesSetAuthor` → nama mahasiswa
- `\unnesSetNIM` → nomor induk mahasiswa
- `\unnesSetProdi` → nama program studi
- `\unnesSetFakultas` → nama fakultas
- `\unnesSetCity` → umumnya `Semarang`
- `\unnesSetYear` → tahun dokumen
- `\unnesSetPembimbing` → nama dan NIP pembimbing

---

## 6. Perintah-perintah penting

### A. Bagian awal dokumen

```latex
\unnesFrontMatter
```

Dipakai untuk memulai bagian awal dengan nomor halaman romawi.

### B. Membuat halaman sampul/judul

```latex
\maketitleunnes
```

Label pada sampul akan menyesuaikan mode dokumen, misalnya:

- `PROPOSAL SKRIPSI`
- `SKRIPSI`
- `Proposal Artikel Ilmiah`
- `Publikasi Ilmiah`
- `Proposal Naskah Chapter`
- `Laporan Book Chapter`

### C. Halaman persetujuan pembimbing

```latex
\unnesPersetujuanPembimbing
```

### D. Halaman pengesahan penguji

Biasanya dipakai pada dokumen final, misalnya skripsi atau laporan:

```latex
\unnesPengesahanPenguji
  {Nama Ketua Penguji / NIP}
  {Nama Sekretaris / NIP}
  {Nama Penguji 1 / NIP}
  {Nama Penguji 2 / NIP}
```

### E. Halaman pernyataan keaslian

```latex
\unnesPernyataanKeaslian
```

Pada `unnes-ta_plus.cls`, judul dan isi pernyataan akan menyesuaikan jenis dokumen.

### F. Abstrak dan abstract

```latex
\begin{unnesabstract}
Isi abstrak bahasa Indonesia.
\end{unnesabstract}

\begin{unnesabstracten}
English abstract.
\end{unnesabstracten}
```

### G. Memulai isi utama

```latex
\unnesMainMatter
```

Dipakai untuk memulai bagian isi utama dengan nomor halaman Arab.

---

## 7. Contoh susunan dokumen proposal skripsi

Gunakan file `proposal.tex` sebagai acuan. Struktur sederhananya:

```latex
\documentclass[proposal]{unnes-ta_plus}

% metadata

\begin{document}
\unnesFrontMatter
\maketitleunnes
\unnesPersetujuanPembimbing
\tableofcontents
\clearpage

\unnesMainMatter

\chapter{Pendahuluan}
\chapter{Kajian Pustaka}
\chapter{Metode Penelitian}

\chapter*{Daftar Pustaka}
\addcontentsline{toc}{chapter}{Daftar Pustaka}
\end{document}
```

---

## 8. Contoh susunan dokumen skripsi

Gunakan file `skripsi.tex` sebagai acuan. Struktur sederhananya:

```latex
\documentclass[skripsi]{unnes-ta_plus}

% metadata

\begin{document}
\unnesFrontMatter
\maketitleunnes
\unnesPersetujuanPembimbing
\unnesPengesahanPenguji{...}{...}{...}{...}
\unnesPernyataanKeaslian
\begin{unnesabstract}
...
\end{unnesabstract}
\begin{unnesabstracten}
...
\end{unnesabstracten}
\tableofcontents
\clearpage

\unnesMainMatter
\chapter{Pendahuluan}
\chapter{Tinjauan Pustaka}
\chapter{Metode Penelitian}
\chapter{Hasil dan Pembahasan}
\chapter{Simpulan dan Saran}
\end{document}
```

---

## 9. Contoh publikasi ilmiah dan book chapter

Template publikasi ilmiah dan book chapter pada paket ini bersifat fleksibel. Naskah utama dapat ditulis langsung di file `.tex` atau disisipkan dari PDF menggunakan `pdfpages`.

### Menyisipkan PDF artikel/chapter

```latex
\usepackage{pdfpages}
```

Lalu pada isi dokumen:

```latex
\includepdf[pages=-]{naskah_artikel.pdf}
```

atau

```latex
\includepdf[pages=-]{naskah_chapter.pdf}
```

Cara ini cocok bila artikel atau chapter sudah diformat mengikuti template jurnal/penerbit tersendiri.

---

## 10. Metadata tambahan untuk book chapter

Untuk mode book chapter, tambahkan informasi berikut sebelum `\begin{document}`:

```latex
\booktitle{Judul Book Chapter / Buku}
\bookpublisher{Nama Penerbit}
\bookstatus{akan/telah}
```

Jika diperlukan, teks materai pada halaman pernyataan dapat diubah dengan:

```latex
\materai{Materai 10.000}
```

---

## 11. Cara kompilasi

Template dapat dikompilasi dengan `pdflatex`, `xelatex`, atau `latexmk`.

### Opsi paling praktis

```bash
latexmk -pdf proposal.tex
latexmk -pdf skripsi.tex
```

### Jika ingin kompilasi manual

```bash
pdflatex proposal.tex
pdflatex proposal.tex
```

Untuk dokumen dengan daftar pustaka otomatis, jalankan sesuai backend yang digunakan, misalnya BibTeX atau Biber.

---

## 12. Hasil pengecekan cepat

Dari pemeriksaan file paket ini:

- `proposal.tex` berhasil dikompilasi
- `skripsi.tex` berhasil dikompilasi
- label `Daftar Isi` sudah otomatis aktif
- penambahan mode publikasi ilmiah dan book chapter dilakukan melalui `unnes-ta_plus.cls`
- struktur proposal dan skripsi lama pada dasarnya **tetap sama**, hanya class sekarang diperluas agar mendukung jenis dokumen tambahan

Artinya, untuk proposal skripsi dan skripsi, **tidak ada perubahan mendasar pada alur penulisan**, hanya ada perluasan kemampuan class agar satu paket bisa dipakai untuk beberapa luaran akademik.

---

## 13. Saran penggunaan praktis

Agar lebih rapi, gunakan pendekatan berikut:

- `proposal.tex` untuk proposal skripsi
- `skripsi.tex` untuk skripsi final
- `template_publikasi_proposal.tex` untuk proposal artikel ilmiah
- `template_publikasi_laporan.tex` untuk laporan/publikasi ilmiah
- `template_bookchapter_proposal.tex` untuk proposal book chapter
- `template_bookchapter_laporan.tex` untuk laporan book chapter

Jika ingin mengembangkan lebih lanjut, naskah utama dapat dipisah ke file lain lalu dipanggil dengan:

```latex
\input{bab1.tex}
\input{bab2.tex}
```

atau untuk artikel:

```latex
\input{artikel.tex}
```

---

## 14. Catatan penting

1. Template ini sudah menyiapkan kerangka format dasar, tetapi isi final tetap perlu disesuaikan dengan:
   - panduan resmi fakultas/prodi,
   - ketentuan pembimbing,
   - format jurnal atau penerbit yang dituju.

2. Jika kampus/prodi mewajibkan detail khusus seperti:
   - format daftar pustaka tertentu,
   - urutan bagian awal tertentu,
   - lampiran,
   - daftar istilah/lambang,
   maka bagian tersebut bisa ditambahkan di file `.tex` tanpa harus mengubah class utama.

3. File `unnes-ta.cls` dapat dipertahankan untuk kompatibilitas, tetapi pengembangan lanjutan sebaiknya difokuskan ke `unnes-ta_plus.cls`.

---

## 15. Ringkasan singkat

- Gunakan **`unnes-ta_plus.cls`** sebagai class utama.
- Untuk **proposal skripsi** dan **skripsi**, alur dasarnya tetap sama.
- Kelas baru menambahkan dukungan untuk **publikasi ilmiah** dan **book chapter**.
- Tulisan **Daftar Isi** sudah otomatis diatur oleh class.
- Template contoh sudah tersedia dan dapat langsung diedit.

---

## 16. Lisensi dan pengembangan lanjutan

README ini disusun berdasarkan struktur file paket saat ini dan diskusi pengembangan pada proyek **Panduan Skripsi UNNES**. Jika nantinya template akan dipublikasikan lebih luas, disarankan menambahkan:

- informasi versi,
- changelog,
- lisensi penggunaan,
- contoh output PDF untuk tiap mode dokumen.
