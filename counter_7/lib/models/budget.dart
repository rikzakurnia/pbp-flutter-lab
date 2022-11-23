class Budget {
    Budget(
        this.judul,
        this.nominal,
        this.jenis,
        this.tanggal
    );
    
    String judul;
    int nominal;
    String jenis;
    DateTime tanggal;
    static List<Budget> listBudget = [];
}