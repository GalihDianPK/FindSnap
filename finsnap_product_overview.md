# FinSnap - Product Overview & App Flow

Dokumen ini menjelaskan rancangan utama dari **FinSnap**, sebuah aplikasi pencatatan keuangan pribadi (MVP). Aplikasi ini dibangun dengan prinsip fondasi yang solid, di mana pada fase MVP ini fokus utamanya adalah pencatatan manual yang cepat, pengelolaan data yang akurat, serta tampilan *dashboard* yang sangat informatif.

---

## 🌟 Core Features (Fitur Utama)

Fitur inti ini dirancang untuk menjawab kebutuhan utama pengguna tanpa kompleksitas berlebihan, sehingga mudah dipahami oleh klien maupun pengguna akhir.

### 1. Manual Transaction Tracking (Pencatatan Transaksi Manual)
Fokus pada kecepatan dan kemudahan input.
- **Input Cepat**: Mencatat pemasukan (*income*) dan pengeluaran (*expense*) hanya dalam beberapa ketukan.
- **Kategorisasi**: Mengelompokkan transaksi (misal: Makanan, Transportasi, Gaji, Hiburan) untuk kemudahan analisis.
- **Catatan Tambahan**: Ruang untuk menambahkan detail transaksi secara spesifik.

### 2. Simple Analytics Dashboard (Dasbor Analitik)
Memberikan visibilitas instan terhadap kondisi keuangan pengguna.
- **Ringkasan Saldo**: Menampilkan saldo total secara real-time.
- **Visualisasi Data**: Menggunakan diagram sederhana (seperti *Pie Chart* atau *Bar Chart*) untuk memvisualisasikan proporsi pengeluaran per kategori.
- **Riwayat Terkini**: Daftar transaksi yang paling baru dilakukan.

### 3. Burn-Rate Calculator (Kalkulator Tingkat Pengeluaran)
Fitur unik yang jarang ada di aplikasi dasar, memberikan pandangan ke depan bagi pengguna.
- Menghitung **rata-rata pengeluaran harian/mingguan**.
- Memberikan **estimasi ketahanan saldo**: "Jika Anda menghabiskan uang dengan kecepatan seperti ini, saldo Anda akan habis dalam X hari."

---

## 📱 App Flow (Alur Penggunaan Aplikasi)

Alur ini menggambarkan bagaimana pengguna (User Journey) berinteraksi dengan aplikasi dari awal hingga akhir.

### 1. Onboarding & Setup Awal
- **Splash Screen**: Logo FinSnap.
- **Welcome Screen**: Penjelasan singkat 3 nilai utama aplikasi (Track, Analyze, Control).
- **Initial Setup**: Pengguna memasukkan **Saldo Awal** (*Initial Balance*) untuk mulai menggunakan aplikasi. 

### 2. Main Navigation (Navigasi Utama)
Aplikasi memiliki tab navigasi bawah (Bottom Navigation Bar) yang sederhana:
- **Home** (Beranda)
- **Analytics** (Laporan)
- **Settings** (Pengaturan)

### 3. Home Dashboard (Beranda)
Saat pengguna membuka aplikasi, mereka langsung melihat kondisi keuangan mereka:
- **Header**: Menampilkan "Total Saldo Saat Ini" dan indikator "Burn-Rate" (contoh: *Pengeluaran rata-rata Rp100.000/hari*).
- **Highlight**: Grafik ringkas pengeluaran bulan berjalan.
- **Recent Activity**: *List* 5 transaksi terakhir.
- **Floating Action Button (Tombol +)**: Terletak di tengah bawah, menonjol, untuk langsung menambah transaksi baru.

### 4. Alur Menambah Transaksi (Add Transaction)
Dirancang sesingkat mungkin agar pengguna tidak malas mencatat:
1. Pengguna menekan tombol **(+)**.
2. Muncul *form* bersih. Pengguna memilih *tab* **Income** atau **Expense**.
3. Memasukkan **Nominal Angka**.
4. Memilih **Kategori** dari *dropdown* atau *grid* ikon.
5. (Opsional) Memilih tanggal (default: hari ini) dan menulis catatan.
6. Menekan **Simpan**. 
7. *Sistem memproses, saldo ter-update seketika, dan pengguna kembali ke Home Dashboard.*

### 5. Analytics (Halaman Laporan)
Untuk pengguna yang ingin melihat rincian lebih dalam:
- Filter waktu (Minggu ini, Bulan ini, Tahun ini).
- Grafik pengeluaran secara komprehensif.
- Tabel daftar pengeluaran terbesar (Top Expenses) sehingga pengguna tahu kemana uang mereka paling banyak mengalir.

### 6. Settings (Pengaturan)
- Manajemen Profil & Keamanan (Opsional untuk MVP).
- Manajemen Kategori (Menambah atau menghapus kategori custom).
- Export Data (Opsional: Download laporan ke CSV).

---

## 🛠️ Ringkasan Teknologi (Tech Stack)
Informasi tambahan untuk tim teknis / klien:
- **Frontend / Mobile App**: Flutter (Mendukung iOS dan Android dalam 1 basis kode, performa tinggi, animasi mulus).
- **Backend / API**: Python dengan FastAPI (Sangat cepat, modern, dan mudah dikembangkan untuk integrasi AI di masa depan).
- **Database**: PostgreSQL / SQLite (Tergantung skala *deployment*).
