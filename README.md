## TUGAS 7 

Stateless widget adalah widget yang state nya tidak bisa diubah setelah built selesai
Stateful widget adalah widget yang state nya bisa diubah berkali-kali setelah built selesai

- Scaffold : kontainer dasar yang memiliki beberapa elemen seperti AppBar dan floatingActionButton
- Column : Untuk menampilkan children nya dalam format vertikal
- Row : Untuk menampilkan children nya dalam format horizontal
- Text: Menampilkan String dalam satu line
- Icon: Menampilkan suatu icon
- Appbar: widget yang berada di paling atas untuk menampilkan judul dsb

`setState()` adalah suatu cara flutter melakukan rebuild untuk suatu widget dan descendant-nya, atau dengan kata lain setState() digunakan mengupdate UI ketika ada perubahan
pada stateful widget. 

Const dan Final sama-sama digunakan untuk menyimpan variabel yang static, yaitu variabel yang nilainya tidak berubah setelah di-compile. Perbedaannya adalah pada const nilai dari suatu variabel const harus sudah di assign saat compile time sedangkan variabel final tidak harus sudah ada nilainya saat compile.

Cara saya mengerjakan tugas 7 ini adalah:
1. Menambah variabel `teks` yaitu suatu string yang menampilkan tulisan GANJIL/GENAP
2. Menambah variabel `warna` yaitu suatu object Color yang akan diubah sesuai nilai counter
3. Membuat fungsi baru yaitu `_decrementCounter()` yang mirip dengan fungsi `_incrementCounter()` akan tetapi memiliki conditional untuk counter>0
4. Membuat fungsi baru untuk mengubah nilai pada variabel  `teks` dan `warna` sesuai nilai pada counter
5. Menambah `FloatingActionButton` baru untuk mengimplementasikan fungsi `_decrementCounter()`
6. Menambah widget `Text` untuk menampilkan variabel `teks` di atas counter
