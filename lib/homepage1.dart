// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:dcroffle/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<HomePage1> {
  Future<bool> localStorage = LocalStorage('dcroffle').ready;
  Color colorIcon = Colors.green;
  Color colorListTile = Colors.white;
  List<Map<String, dynamic>> crofflits = [
    {
      "total produk": 8,
      "tanggal": "12/18/2022",
      "total harga": 56000,
      "data": [
        {
          "jumlah": 3,
          "status": false,
          "nama pelanggan": "Taufik",
          "harga": 21000,
          "produk": [
            {
              "topping": ["Coklat"],
              "harga": 15000,
              "jumlah": 2
            },
            {
              "topping": ["Original"],
              "harga": 6000,
              "jumlah": 1
            }
          ]
        },
        {
          "jumlah": 2,
          "status": true,
          "nama pelanggan": "Qwerty",
          "harga": 12000,
          "produk": [
            {
              "topping": ["Original"],
              "harga": 6000,
              "jumlah": 1
            }
          ]
        },
        {
          "jumlah": 3,
          "status": true,
          "nama pelanggan": "Metir",
          "harga": 23000,
          "produk": [
            {
              "topping": ["Coklat"],
              "harga": 15000,
              "jumlah": 2
            },
            {
              "topping": ["Cream Vanilla", "Coklat"],
              "harga": 15000,
              "jumlah": 2
            }
          ]
        }
      ]
    },
    {
      "total produk": 2,
      "tanggal": "11/12/2022",
      "total harga": 12000,
      "data": [
        {
          "jumlah": 2,
          "status": false,
          "nama pelanggan": "Taufik",
          "harga": 12000,
          "produk": [
            {
              "topping": ["Coklat", "Strawberry"],
              "harga": 7000,
              "jumlah": 1
            },
            {
              "topping": ["Original"],
              "harga": 5000,
              "jumlah": 1
            }
          ]
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CROFFLITS',
          style: GoogleFonts.asap(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'HAPUS SEMUA LIST',
                        style: GoogleFonts.asap(),
                      ),
                      content: Text(
                        "Yakin ingin menghapus semua list ??",
                        style: GoogleFonts.asap(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "BELUM",
                            style: GoogleFonts.asap(),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            LocalStorage("dcroffle").clear();
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Text(
                            "YAKIN",
                            style: GoogleFonts.asap(),
                          ),
                        ),
                      ],
                    );
                  },
                );
                setState(() {});
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: crofflits.length,
            itemBuilder: (BuildContext context, int indexWaktu) {
              Map<String, dynamic> mappingcroffle = crofflits[indexWaktu];
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Text(
                              mappingcroffle["tanggal"],
                              style: GoogleFonts.asap(
                                color: Colors.white,
                                fontSize: 17,
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          mappingcroffle["total produk"].toString(),
                          style: GoogleFonts.asap(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: Text(
                          NumberFormat.currency(symbol: 'Rp ', decimalDigits: 0)
                              .format(mappingcroffle["total harga"]),
                          style: GoogleFonts.asap(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mappingcroffle["data"].length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> datamapping =
                          mappingcroffle["data"][index];
                      return GestureDetector(
                        onDoubleTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('SUDAH SELESAI ?'),
                                content: const Text("Sudah selesai dilayani?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("BELUM"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      datamapping["status"] = true;
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "YAKIN",
                                      style: GoogleFonts.asap(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: ListTile(
                          tileColor: datamapping["status"] != true
                              ? Colors.white
                              : Colors.grey,
                          title: Row(
                            children: [
                              CircleAvatar(
                                child: Text(
                                  datamapping["jumlah"].toString(),
                                  style: GoogleFonts.asap(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  datamapping["nama pelanggan"].toUpperCase(),
                                  style: GoogleFonts.asap(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                        symbol: 'Rp ', decimalDigits: 0)
                                    .format(datamapping["harga"]),
                                style: GoogleFonts.asap(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: datamapping["produk"].length,
                            itemBuilder: (context, indexMenu) {
                              Map<String, dynamic> produkmapping =
                                  datamapping["produk"][indexMenu];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${produkmapping["jumlah"]} X\t\t\t"),
                                  Expanded(
                                    child: produkmapping["topping"].length == 2
                                        ? Text(
                                            "${produkmapping["topping"][0]} + ${produkmapping["topping"][1]}",
                                            style: GoogleFonts.asap(),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : produkmapping["topping"].isEmpty
                                            ? const Text(' ')
                                            : Text(
                                                "${produkmapping["topping"][0]}",
                                                style: GoogleFonts.asap(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                  ),
                                  Text(NumberFormat.currency(
                                          symbol: 'Rp ', decimalDigits: 0)
                                      .format(produkmapping["harga"])),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: listPelangganDone.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ListTile(
                  //       tileColor: Colors.grey,
                  //       title: Row(
                  //         children: [
                  //           CircleAvatar(
                  //               child: Text(
                  //                   listJumlahPerorangDone[index].toString())),
                  //           Expanded(
                  //             child: Text(
                  //               listPelangganDone[index].toUpperCase(),
                  //               style: GoogleFonts.asap(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 20,
                  //               ),
                  //               textAlign: TextAlign.center,
                  //             ),
                  //           ),
                  //           Text(
                  //               NumberFormat.currency(
                  //                       symbol: 'Rp ', decimalDigits: 0)
                  //                   .format(listHargaPerorangDone[index]),
                  //               style: GoogleFonts.asap(
                  //                   fontWeight: FontWeight.bold)),
                  //         ],
                  //       ),
                  //       subtitle: ListView.builder(
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         itemCount: listsToppingDone[index].length,
                  //         itemBuilder: (context, indexMenu) {
                  //           return Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text(
                  //                   "${listJumlahDone[index][indexMenu]} X\t\t\t"),
                  //               Expanded(
                  //                 child: listsToppingDone[index][indexMenu]
                  //                             .length ==
                  //                         2
                  //                     ? Text(
                  //                         "${listsToppingDone[index][indexMenu][0]} + ${listsToppingDone[index][indexMenu][1]}",
                  //                         style: GoogleFonts.asap(),
                  //                         overflow: TextOverflow.ellipsis,
                  //                       )
                  //                     : listsToppingDone[index][indexMenu]
                  //                             .isEmpty
                  //                         ? const Text(" ")
                  //                         : Text(
                  //                             listsToppingDone[index][indexMenu]
                  //                                 [0],
                  //                             style: GoogleFonts.asap(),
                  //                             overflow: TextOverflow.ellipsis,
                  //                           ),
                  //               ),
                  //               Text(
                  //                 NumberFormat.currency(
                  //                         symbol: 'Rp ', decimalDigits: 0)
                  //                     .format(listHargaDone[index][indexMenu]),
                  //               ),
                  //             ],
                  //           );
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "TAMBAH DATA",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InputData(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
