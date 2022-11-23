import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/budget.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = 'Pilih Jenis';
  int _nominalBudget = 0;
  DateTime _tanggal = DateTime.now();
  String? _jenisBudgetUsed;
  List<String> _jenisBudget = ['Pemasukkan', 'Pengeluaran'];
  List<String> judul = [];
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form'),
            ),

            drawer: MyDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                          Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Judul  ",
                                      labelText: "Judul :",
   
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          _judulBudget = value!;
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                      setState(() {
                                          _judulBudget = value!;
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Judul tidak boleh kosong!';
                                      }
                                      return null;
                                  },
                              ),
                          ),

                         Padding(
                              // Menggunakan padding sebesar 8 pixels
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Nominal",
                                      labelText: "Nominal :",
      
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0),
                                      ),
                                  ),

                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  // Menambahkan behavior saat nama diketik 
                                  onChanged: (String? value) {
                                      setState(() {
                                          _nominalBudget = int.parse(value!);
                                      });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                      setState(() {
                                          _nominalBudget = int.parse(value!);
                                      });
                                  },
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                          return 'Judul tidak boleh kosong!';
                                      }
                                      final n = int.tryParse(value);
                                      if(n == null) {
                                        return '"$value" is not a valid number';
                                      }
                                      return null;
                                  },
                              ),
                          ),
                        ListTile(
                          title: Text("Jenis Pengeluaran"),
                          trailing: DropdownButton(
                              value: _jenisBudgetUsed,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: _jenisBudget.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                              );
                              }).toList(),
                              onChanged: (String? newValue) {
                              setState(() {
                                  _jenisBudgetUsed= newValue!;
                              });
                              },
                          ),
                        ),

                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),

                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Budget.listBudget.add(Budget(_judulBudget, _nominalBudget,
                                  _jenisBudgetUsed.toString(), _tanggal));

                              _judulBudget = "";
                              _nominalBudget = 0;
                              _tanggal = DateTime.now();

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                      child: ListView(
                                        padding:
                                            const EdgeInsets.only(top: 10, bottom: 10),
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          Center(child: const Text('Status')),
                                          SizedBox(height: 20),
                                          // TODO: Munculkan informasi yang didapat dari form
                                          Center(
                                            child: 
                                              Text('Data Berhasil Disimpan !'),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              foregroundColor: Color.fromARGB(255, 39, 74, 139),
                                              padding: const EdgeInsets.all(16.0),

                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Tutup'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              _formKey.currentState!.reset();
                            }
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
        );
    }
}