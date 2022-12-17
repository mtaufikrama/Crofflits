// ignore_for_file: use_build_context_synchronously

import 'package:dcroffle/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  TextEditingController namaController = TextEditingController();
  TextEditingController tambahController = TextEditingController();
  Future<bool> localStorage = LocalStorage('dcroffle').ready;

  List<List<dynamic>> checked = [];
  List<int> jumlah = [1];
  List<int> totalHargaSatuan = [0];
  List<int> hargaSatuan = [0];
  List<int> hargaDouble = [0];
  int itemTopping = 1;
  bool tambahTopping = false;

  @override
  void initState() {
    checked.add([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> menuTopping = [
      'Original',
      'Cream Vanilla',
      'Coklat',
      'Oreo',
      'Taro',
      'Matcha',
      'Kacang',
      'Red Velvet',
      'Ceres',
      'Strawberry',
      'Blueberry',
    ];
    String waktu = DateFormat.yMd().format(DateTime.now());
    List listPelanggan =
        LocalStorage("dcroffle").getItem("pelanggan$waktu") ?? [];
    List listWaktu = LocalStorage("dcroffle").getItem("waktu") ?? [];
    List<dynamic> listsTopping =
        LocalStorage("dcroffle").getItem("topping$waktu") ?? [];
    List listJumlah = LocalStorage("dcroffle").getItem("jumlah$waktu") ?? [];
    List listHarga = LocalStorage("dcroffle").getItem("harga$waktu") ?? [];
    List listHargaPerorang =
        LocalStorage("dcroffle").getItem("hargaPerorang$waktu") ?? [];
    List listJumlahPerorang =
        LocalStorage("dcroffle").getItem("jumlahPerorang$waktu") ?? [];
    int totalHarga = LocalStorage("dcroffle").getItem("totalHarga$waktu") ?? 0;
    int totalJumlah =
        LocalStorage("dcroffle").getItem("totalJumlah$waktu") ?? 0;
    List tambahanTopping =
        LocalStorage("dcroffle").getItem("tambahTopping") ?? [];
    if (tambahanTopping.isNotEmpty) {
      menuTopping.addAll(tambahanTopping);
    }

    int totalharga = 0;
    int jumlahCounter = 0;
    for (int i = 0; i < totalHargaSatuan.length; i++) {
      totalharga += totalHargaSatuan[i];
      jumlahCounter += jumlah[i];
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "INPUT DATA",
            style: GoogleFonts.asap(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                      right: 10,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: namaController,
                      cursorColor: Colors.white,
                      style:
                          GoogleFonts.asap(color: Colors.white, fontSize: 20),
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelStyle: GoogleFonts.asap(color: Colors.grey),
                        labelText: 'Nama Pelanggan',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                      right: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$jumlahCounter croffle",
                              style: GoogleFonts.asap(
                                  fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              NumberFormat.currency(
                                      symbol: 'Rp ', decimalDigits: 0)
                                  .format(totalharga),
                              style: GoogleFonts.asap(
                                  fontSize: 20, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: checked.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Text(
                                  jumlah[index].toString(),
                                  style: GoogleFonts.asap(color: Colors.white),
                                ),
                                title: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: checked[index].length,
                                  itemBuilder: (context, indexCheck) {
                                    return Text(
                                      checked[index][indexCheck].toString(),
                                      style:
                                          GoogleFonts.asap(color: Colors.white),
                                    );
                                  },
                                )
                                // Text(
                                //   checked[index].toString(),
                                //   style: GoogleFonts.asap(color: Colors.white),
                                // ),
                                );
                          },
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: checked.length,
                    itemBuilder: (context, indexItemTopping) {
                      int counter = jumlah[indexItemTopping];
                      int totalhargasatuan = totalHargaSatuan[indexItemTopping];
                      int hargasatuan = hargaSatuan[indexItemTopping];
                      int hargadouble = hargaDouble[indexItemTopping];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        NumberFormat.currency(
                                                symbol: 'Rp ', decimalDigits: 0)
                                            .format(totalhargasatuan),
                                        style: GoogleFonts.asap(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (counter > 1) {
                                            setState(() {
                                              counter--;
                                              jumlah.removeAt(indexItemTopping);
                                              jumlah.insert(
                                                  indexItemTopping, counter);
                                              if (hargasatuan == 8000) {
                                                print(hargadouble);
                                                double jumlahin = (counter / 2)
                                                        .truncateToDouble() *
                                                    hargadouble;
                                                double jumlahinaja =
                                                    (counter % 2) *
                                                        hargasatuan.toDouble();
                                                totalhargasatuan =
                                                    (jumlahin + jumlahinaja)
                                                        .toInt();
                                              } else if (hargasatuan == 6000) {
                                                print(hargadouble);
                                                print(hargasatuan);
                                                totalhargasatuan =
                                                    hargasatuan * counter;
                                              }
                                              totalHargaSatuan
                                                  .removeAt(indexItemTopping);
                                              totalHargaSatuan.insert(
                                                  indexItemTopping,
                                                  totalhargasatuan);
                                            });
                                          }
                                        },
                                        child: const Icon(
                                          Icons.remove_circle_outline_rounded,
                                          size: 25,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        counter.toString(),
                                        style: GoogleFonts.asap(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            counter++;
                                            jumlah.removeAt(indexItemTopping);
                                            jumlah.insert(
                                                indexItemTopping, counter);
                                            print(hargasatuan);
                                            print(hargadouble);
                                            if (hargasatuan == 8000) {
                                              double jumlahin = (counter / 2)
                                                      .truncateToDouble() *
                                                  hargadouble;
                                              double jumlahinaja =
                                                  (counter % 2) *
                                                      hargasatuan.toDouble();
                                              totalhargasatuan =
                                                  (jumlahin + jumlahinaja)
                                                      .toInt();
                                            } else if (hargasatuan == 6000) {
                                              totalhargasatuan =
                                                  hargasatuan * counter;
                                            }
                                            totalHargaSatuan
                                                .removeAt(indexItemTopping);
                                            totalHargaSatuan.insert(
                                                indexItemTopping,
                                                totalhargasatuan);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add_circle_outline_rounded,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "MENU ${indexItemTopping + 1}",
                                style: GoogleFonts.asap(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: menuTopping.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [Colors.black, Colors.white],
                                    ),
                                  ),
                                  child: CheckboxListTile(
                                    activeColor: Colors.red,
                                    checkColor: Colors.white,
                                    selectedTileColor: Colors.purple,
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    title: Text(
                                      menuTopping[index],
                                      style: GoogleFonts.asap(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    value: checked[indexItemTopping]
                                        .contains(menuTopping[index]),
                                    onChanged: (value) {
                                      if (value == true) {
                                        setState(() {
                                          checked[indexItemTopping]
                                              .add(menuTopping[index]);

                                          if (checked[indexItemTopping]
                                                  .contains(menuTopping[0]) ==
                                              true) {
                                            hargasatuan = 6000;
                                            totalhargasatuan =
                                                hargasatuan * counter;
                                            totalHargaSatuan
                                                .removeAt(indexItemTopping);
                                            totalHargaSatuan.insert(
                                                indexItemTopping,
                                                totalhargasatuan);
                                            hargaSatuan
                                                .removeAt(indexItemTopping);
                                            hargaSatuan.insert(
                                                indexItemTopping, hargasatuan);
                                            hargaDouble
                                                .removeAt(indexItemTopping);
                                            hargaDouble.insert(
                                                indexItemTopping, hargadouble);
                                          } else {
                                            hargasatuan = 8000;
                                            hargadouble = 15000;
                                            double jumlahin = (counter / 2)
                                                    .truncateToDouble() *
                                                hargadouble;
                                            double jumlahinaja = (counter % 2) *
                                                hargasatuan.toDouble();
                                            totalhargasatuan =
                                                (jumlahin + jumlahinaja)
                                                    .toInt();
                                            totalHargaSatuan
                                                .removeAt(indexItemTopping);
                                            totalHargaSatuan.insert(
                                                indexItemTopping,
                                                totalhargasatuan);
                                            hargaSatuan
                                                .removeAt(indexItemTopping);
                                            hargaSatuan.insert(
                                                indexItemTopping, hargasatuan);
                                            hargaDouble
                                                .removeAt(indexItemTopping);
                                            hargaDouble.insert(
                                                indexItemTopping, hargadouble);
                                          }
                                        });
                                      } else {
                                        setState(() {
                                          checked[indexItemTopping]
                                              .remove(menuTopping[index]);
                                          if (checked[indexItemTopping]
                                                  .contains(menuTopping[0]) ==
                                              false) {
                                            if (checked[indexItemTopping]
                                                .isEmpty) {
                                              hargasatuan = 0;
                                              hargadouble = 0;
                                              totalhargasatuan =
                                                  hargasatuan * counter;
                                              totalHargaSatuan
                                                  .removeAt(indexItemTopping);
                                              totalHargaSatuan.insert(
                                                  indexItemTopping,
                                                  totalhargasatuan);
                                              hargaSatuan
                                                  .removeAt(indexItemTopping);
                                              hargaSatuan.insert(
                                                  indexItemTopping,
                                                  hargasatuan);
                                              hargaDouble
                                                  .removeAt(indexItemTopping);
                                              hargaDouble.insert(
                                                  indexItemTopping,
                                                  hargadouble);
                                            } else {
                                              hargadouble = 15000;
                                              hargasatuan = 8000;
                                              double jumlahin = (counter / 2)
                                                      .truncateToDouble() *
                                                  hargadouble;
                                              double jumlahinaja =
                                                  (counter % 2) *
                                                      hargasatuan.toDouble();
                                              totalhargasatuan =
                                                  (jumlahin + jumlahinaja)
                                                      .toInt();
                                              totalHargaSatuan
                                                  .removeAt(indexItemTopping);
                                              totalHargaSatuan.insert(
                                                  indexItemTopping,
                                                  totalhargasatuan);
                                              hargaSatuan
                                                  .removeAt(indexItemTopping);
                                              hargaSatuan.insert(
                                                  indexItemTopping,
                                                  hargasatuan);
                                              hargaDouble
                                                  .removeAt(indexItemTopping);
                                              hargaDouble.insert(
                                                  indexItemTopping,
                                                  hargadouble);
                                            }
                                          }
                                        });
                                      }
                                      print(checked);
                                      print(hargaSatuan);
                                      print(totalHargaSatuan);
                                    },
                                  ),
                                );
                              },
                            ),
                            tambahTopping == false
                                ? Container()
                                : TextField(
                                    controller: tambahController,
                                    decoration: const InputDecoration(
                                        labelText: 'Tambah Topping Baru'),
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (tambahTopping == false) {
                                        tambahTopping = true;
                                      } else {
                                        if (tambahController.text.isNotEmpty) {
                                          tambahanTopping
                                              .add(tambahController.text);
                                          await LocalStorage('dcroffle')
                                              .setItem('tambahTopping',
                                                  tambahanTopping);
                                          tambahController.text = '';
                                          tambahTopping = false;
                                        } else {
                                          tambahTopping = false;
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: Text(
                                      tambahTopping == false
                                          ? "ADD TOPPING ?"
                                          : "SUBMIT",
                                      style:
                                          GoogleFonts.asap(color: Colors.red),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: Colors.red)),
                                    onPressed: () async {
                                      await LocalStorage('dcroffle')
                                          .deleteItem('tambahTopping');
                                      setState(() {});
                                    },
                                    child: Text(
                                      "HAPUS SEMUA TAMBAHAN",
                                      style:
                                          GoogleFonts.asap(color: Colors.red),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 217, 217, 217),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      onPressed: () async {
                        if (namaController.text != '') {
                          String check = 'Belum';
                          for (var i = 0; i < checked.length; i++) {
                            if (checked[i].length <= 2 &&
                                checked[i].isNotEmpty) {
                              if (check == 'Belum') {
                                check = 'Berhasil';
                              }
                            } else {
                              check = 'Gagal';
                            }
                          }
                          if (check == 'Berhasil') {
                            listsTopping.add(checked);
                            listPelanggan.add(namaController.text);
                            listHarga.add(totalHargaSatuan);
                            listJumlah.add(jumlah);
                            listHargaPerorang.add(totalharga);
                            listJumlahPerorang.add(jumlahCounter);
                            totalHarga = totalHarga + totalharga;
                            totalJumlah = totalJumlah + jumlahCounter;
                            print(
                                "$listJumlah + $listsTopping + $listPelanggan + $listWaktu + $totalHarga");
                            await LocalStorage('dcroffle')
                                .deleteItem('topping$waktu');
                            await LocalStorage('dcroffle')
                                .deleteItem('pelanggan$waktu');
                            await LocalStorage('dcroffle')
                                .deleteItem('jumlah$waktu');
                            await LocalStorage('dcroffle')
                                .deleteItem('jumlahPerorang$waktu');
                            await LocalStorage('dcroffle')
                                .deleteItem('harga$waktu');
                            await LocalStorage('dcroffle')
                                .deleteItem('hargaPerorang$waktu');
                            await LocalStorage('dcroffle')
                                .deleteItem('totalHarga$waktu');
                            await LocalStorage('dcroffle')
                                .deleteItem('totalJumlah$waktu');
                            await LocalStorage('dcroffle')
                                .setItem('topping$waktu', listsTopping);
                            await LocalStorage('dcroffle')
                                .setItem('pelanggan$waktu', listPelanggan);
                            await LocalStorage('dcroffle')
                                .setItem('jumlah$waktu', listJumlah);
                            await LocalStorage('dcroffle').setItem(
                                'jumlahPerorang$waktu', listJumlahPerorang);
                            await LocalStorage('dcroffle')
                                .setItem('harga$waktu', listHarga);
                            await LocalStorage('dcroffle').setItem(
                                'hargaPerorang$waktu', listHargaPerorang);
                            await LocalStorage('dcroffle')
                                .setItem('totalHarga$waktu', totalHarga);
                            await LocalStorage('dcroffle')
                                .setItem('totalJumlah$waktu', totalJumlah);
                            if (listWaktu.contains(waktu) == false) {
                              listWaktu.add(waktu);
                              await LocalStorage('dcroffle')
                                  .deleteItem('waktu');
                              await LocalStorage('dcroffle')
                                  .setItem('waktu', listWaktu);
                            }
                            namaController.clear();
                            checked = [];
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          } else if (check == 'Gagal') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "CHECKBOX MAKSIMAL 2",
                                  style: GoogleFonts.asap(),
                                ),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "ISI NAMA PELANGGAN",
                                style: GoogleFonts.asap(),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'SUBMIT',
                        style: GoogleFonts.asap(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    splashColor: Colors.blue,
                    tooltip: 'Tambah Menu',
                    onPressed: () {
                      setState(() {
                        checked.add([]);
                        jumlah.add(1);
                        totalHargaSatuan.add(0);
                        hargaSatuan.add(0);
                        hargaDouble.add(0);
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
