// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:dcroffle/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<bool> localStorage = LocalStorage('dcroffle').ready;
  Color colorIcon = Colors.green;
  Color colorListTile = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CROFFLITE',
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
      body: FutureBuilder<bool>(
        future: localStorage,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List listWaktu = LocalStorage("dcroffle").getItem("waktu") ?? [];

          return listWaktu.isNotEmpty && listWaktu != []
              ? ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listWaktu.length,
                      itemBuilder: (BuildContext context, int indexWaktu) {
                        List listPelanggan = LocalStorage("dcroffle")
                                .getItem("pelanggan${listWaktu[indexWaktu]}") ??
                            [];
                        List<dynamic> listsTopping = LocalStorage("dcroffle")
                                .getItem("topping${listWaktu[indexWaktu]}") ??
                            [];
                        List listJumlah = LocalStorage("dcroffle")
                                .getItem("jumlah${listWaktu[indexWaktu]}") ??
                            [];
                        List listHarga = LocalStorage("dcroffle")
                                .getItem("harga${listWaktu[indexWaktu]}") ??
                            [];
                        List listHargaPerorang = LocalStorage("dcroffle")
                                .getItem(
                                    "hargaPerorang${listWaktu[indexWaktu]}") ??
                            [];
                        List listJumlahPerorang = LocalStorage("dcroffle")
                                .getItem(
                                    "jumlahPerorang${listWaktu[indexWaktu]}") ??
                            [];
                        int totalHarga = LocalStorage("dcroffle").getItem(
                                "totalHarga${listWaktu[indexWaktu]}") ??
                            0;
                        int totalJumlah = LocalStorage("dcroffle").getItem(
                                "totalJumlah${listWaktu[indexWaktu]}") ??
                            0;
                        List listPelangganDone = LocalStorage("dcroffle")
                                .getItem(
                                    "pelangganDone${listWaktu[indexWaktu]}") ??
                            [];
                        List<dynamic> listsToppingDone =
                            LocalStorage("dcroffle").getItem(
                                    "toppingDone${listWaktu[indexWaktu]}") ??
                                [];
                        List listJumlahDone = LocalStorage("dcroffle").getItem(
                                "jumlahDone${listWaktu[indexWaktu]}") ??
                            [];
                        List listHargaDone = LocalStorage("dcroffle")
                                .getItem("hargaDone${listWaktu[indexWaktu]}") ??
                            [];
                        List listHargaPerorangDone = LocalStorage("dcroffle")
                                .getItem(
                                    "hargaPerorangDone${listWaktu[indexWaktu]}") ??
                            [];
                        List listJumlahPerorangDone = LocalStorage("dcroffle")
                                .getItem(
                                    "jumlahPerorangDone${listWaktu[indexWaktu]}") ??
                            [];
                        int totalHargaDone = LocalStorage("dcroffle").getItem(
                                "totalHargaDone${listWaktu[indexWaktu]}") ??
                            0;
                        int totalJumlahDone = LocalStorage("dcroffle").getItem(
                                "totalJumlahDone${listWaktu[indexWaktu]}") ??
                            0;
                        print(listPelanggan);
                        print(listsTopping);
                        print(listJumlah);
                        print(listHarga);
                        print(listJumlahPerorang);
                        print(listHargaPerorang);
                        print(totalHarga);
                        print(totalJumlah);
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black),
                                      child: Text(
                                        listWaktu[indexWaktu],
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
                                    totalJumlah.toString(),
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
                                    NumberFormat.currency(
                                            symbol: 'Rp ', decimalDigits: 0)
                                        .format(totalHarga),
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
                              itemCount: listPelanggan.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onDoubleTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('SUDAH SELESAI ?'),
                                          content: const Text(
                                              "Sudah selesai dilayani?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("BELUM"),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                listPelangganDone
                                                    .add(listPelanggan[index]);
                                                listsToppingDone
                                                    .add(listsTopping[index]);
                                                listJumlahDone
                                                    .add(listJumlah[index]);
                                                listHargaDone
                                                    .add(listHarga[index]);
                                                listHargaPerorangDone.add(
                                                    listHargaPerorang[index]);
                                                listJumlahPerorangDone.add(
                                                    listJumlahPerorang[index]);
                                                listPelanggan.removeAt(index);
                                                listsTopping.removeAt(index);
                                                listJumlah.removeAt(index);
                                                listHarga.removeAt(index);
                                                listHargaPerorang
                                                    .removeAt(index);
                                                listJumlahPerorang
                                                    .removeAt(index);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'pelanggan${listWaktu[indexWaktu]}',
                                                        listPelanggan);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'topping${listWaktu[indexWaktu]}',
                                                        listsTopping);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'jumlah${listWaktu[indexWaktu]}',
                                                        listJumlah);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'harga${listWaktu[indexWaktu]}',
                                                        listHarga);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'hargaPerorang${listWaktu[indexWaktu]}',
                                                        listHargaPerorang);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'jumlahPerorang${listWaktu[indexWaktu]}',
                                                        listJumlahPerorang);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'pelangganDone${listWaktu[indexWaktu]}',
                                                        listPelangganDone);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'toppingDone${listWaktu[indexWaktu]}',
                                                        listsToppingDone);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'jumlahDone${listWaktu[indexWaktu]}',
                                                        listJumlahDone);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'hargaDone${listWaktu[indexWaktu]}',
                                                        listHargaDone);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'hargaPerorangDone${listWaktu[indexWaktu]}',
                                                        listHargaPerorangDone);
                                                await LocalStorage("dcroffle")
                                                    .setItem(
                                                        'jumlahPerorangDone${listWaktu[indexWaktu]}',
                                                        listJumlahPerorangDone);
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
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          child: Text(
                                            listJumlahPerorang[index]
                                                .toString(),
                                            style: GoogleFonts.asap(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            listPelanggan[index].toUpperCase(),
                                            style: GoogleFonts.asap(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(listHargaPerorang[index]),
                                          style: GoogleFonts.asap(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: listsTopping[index].length,
                                      itemBuilder: (context, indexMenu) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${listJumlah[index][indexMenu]} X\t\t\t"),
                                            Expanded(
                                              child: listsTopping[index]
                                                              [indexMenu]
                                                          .length ==
                                                      2
                                                  ? Text(
                                                      "${listsTopping[index][indexMenu][0]} + ${listsTopping[index][indexMenu][1]}",
                                                      style: GoogleFonts.asap(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  : listsTopping[index]
                                                              [indexMenu]
                                                          .isEmpty
                                                      ? const Text(' ')
                                                      : Text(
                                                          "${listsTopping[index][indexMenu][0]}",
                                                          style: GoogleFonts
                                                              .asap(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                            ),
                                            Text(NumberFormat.currency(
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(listHarga[index]
                                                    [indexMenu])),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listPelangganDone.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  tileColor: Colors.grey,
                                  title: Row(
                                    children: [
                                      CircleAvatar(
                                          child: Text(
                                              listJumlahPerorangDone[index]
                                                  .toString())),
                                      Expanded(
                                        child: Text(
                                          listPelangganDone[index]
                                              .toUpperCase(),
                                          style: GoogleFonts.asap(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Text(
                                          NumberFormat.currency(
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(
                                                  listHargaPerorangDone[index]),
                                          style: GoogleFonts.asap(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  subtitle: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: listsToppingDone[index].length,
                                    itemBuilder: (context, indexMenu) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "${listJumlahDone[index][indexMenu]} X\t\t\t"),
                                          Expanded(
                                            child: listsToppingDone[index]
                                                            [indexMenu]
                                                        .length ==
                                                    2
                                                ? Text(
                                                    "${listsToppingDone[index][indexMenu][0]} + ${listsToppingDone[index][indexMenu][1]}",
                                                    style: GoogleFonts.asap(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )
                                                : listsToppingDone[index]
                                                            [indexMenu]
                                                        .isEmpty
                                                    ? const Text(" ")
                                                    : Text(
                                                        listsToppingDone[index]
                                                            [indexMenu][0],
                                                        style:
                                                            GoogleFonts.asap(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(listHargaDone[index]
                                                    [indexMenu]),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                )
              : const Center(child: Text("NO DATA"));
        },
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
