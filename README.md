# TemanPPK

## Kelompok 1 - RiSa

### Anggota Tim:

* Ridho Sulistyo Saputro (241511059)
* Rifky Hermawan (241511060)
* Salma Arifah Zahra (241511062)
* Samudra Putra Gunawan (241511063)

---

## Deskripsi Aplikasi

**TemanPPK** adalah aplikasi mobile yang dirancang untuk memfasilitasi pelaporan kejadian kekerasan fisik maupun seksual di lingkungan kampus.

Aplikasi ini bertujuan untuk:

* Memberikan wadah pelaporan yang aman dan mudah diakses
* Membantu pihak kampus dalam menangani kasus secara terstruktur
* Meningkatkan kesadaran dan keamanan di lingkungan kampus

Dengan pendekatan **offline-first**, pengguna tetap dapat membuat laporan meskipun tidak memiliki koneksi internet, dan data akan disinkronkan ketika perangkat kembali online.

---

## Fitur Utama

* Membuat laporan kekerasan (fisik & seksual)
* Melihat riwayat laporan
* Mode offline (laporan tetap bisa dibuat tanpa internet)
* Sinkronisasi otomatis saat online
* Identitas pelapor dapat dilindungi (opsional anonim)

---

## Teknologi yang Digunakan

* **Flutter** → Framework utama untuk pengembangan aplikasi mobile
* **Hive** → Database lokal untuk penyimpanan offline
* **hive_flutter** → Integrasi Hive dengan Flutter
* **connectivity_plus** → Mengecek status koneksi internet
* **lottie** → Animasi UI
* **path_provider** → Mengakses direktori penyimpanan perangkat
* **shadcn_flutter** → UI Component shadcn untuk flutter

---

## Arsitektur Aplikasi

Aplikasi ini menggunakan pendekatan:

* **MVVM (Model - View - View Model)**
* **SRP (Single Responsibility Principle)**

Struktur utama:

```
lib/
├── models/
├── views/
├── viewmodels/
├── services/
├── routes/
```

---

## Cara Menjalankan Project

1. Clone repository

```
git clone [link repository]
```

2. Masuk ke folder project

```
cd nama_project
```

3. Install dependency

```
flutter pub get
```

4. Jalankan aplikasi

```
flutter run
```

---

## Tujuan Pengembangan

Aplikasi ini dikembangkan sebagai bagian dari:

> Proyek pengembangan aplikasi mobile untuk meningkatkan keamanan dan sistem pelaporan di lingkungan kampus.

---

## Catatan

Aplikasi ini masih dalam tahap pengembangan dan akan terus diperbaiki serta dikembangkan untuk meningkatkan fitur dan keamanan sistem.

---

## Penutup

Diharapkan aplikasi ini dapat memberikan kontribusi nyata dalam menciptakan lingkungan kampus yang lebih aman dan responsif terhadap kasus kekerasan.
