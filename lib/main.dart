import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Colors.orange,
        )
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Kategori { lampu, monitoring, alarm, audio, kosong }

String getKategori(Kategori value) {
  if (value == Kategori.lampu) {
    return "Lampu";
  } else if (value == Kategori.monitoring) {
    return "Monitoring";
  } else if (value == Kategori.alarm) {
    return "Alarm";
  } else if (value == Kategori.audio) {
    return "Audio";
  } else {
    return "Belum Diisi";
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String namaPerabot = '', namaRuangan = '', opsi = '', status = '';
  bool isPublik = false;
  Kategori kategori = Kategori.kosong;
  final ctrlNamaPerabot = TextEditingController();
  final ctrlNamaRuangan = TextEditingController();

  @override
  void dispose() {
    ctrlNamaPerabot.dispose();
    ctrlNamaRuangan.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop),
          image: const AssetImage("assets/bg.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Smart Home"),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Nama Widget :",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  width: 280,
                  height: 50,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextField(
                    controller: ctrlNamaPerabot,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Isi Nama Widget",
                      labelText: "Nama Widget",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Kategori :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ListTile(
                  title: const Text("Lampu", style: TextStyle(fontSize: 18)),
                  leading: Radio(
                    groupValue: kategori,
                    value: Kategori.lampu,
                    onChanged: (Kategori? value) {
                      setState(() {
                        kategori = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Monitoring", style: TextStyle(fontSize: 18)),
                  leading: Radio(
                    groupValue: kategori,
                    value: Kategori.monitoring,
                    onChanged: (Kategori? value) {
                      setState(() {
                        kategori = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Alarm", style: TextStyle(fontSize: 18)),
                  leading: Radio(
                    groupValue: kategori,
                    value: Kategori.alarm,
                    onChanged: (Kategori? value) {
                      setState(() {
                        kategori = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Audio", style: TextStyle(fontSize: 18)),
                  leading: Radio(
                    groupValue: kategori,
                    value: Kategori.audio,
                    onChanged: (Kategori? value) {
                      setState(() {
                        kategori = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Nama Ruangan :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  width: 280,
                  height: 50,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextField(
                    controller: ctrlNamaRuangan,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Isi Nama Ruangan",
                      labelText: "Nama Ruangan",
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Status :",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ListTile(
                  title: const Text("Publik"),
                  leading: Checkbox(
                      value: isPublik,
                      onChanged: (bool? value) {
                        setState(() {
                          isPublik = value!;
                        });
                      }),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        namaPerabot = ctrlNamaPerabot.text;
                        namaRuangan = ctrlNamaRuangan.text;
                        opsi = getKategori(kategori);
                        status = isPublik ? "Publik" : "Private";
                      });
                    },
                    child: const Text('Tampilkan')),
                const SizedBox(height: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Widget    : $namaPerabot",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                    Text("Kategori             : $opsi",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                    Text("Nama Ruangan : $namaRuangan",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 25),
                    Text("Status                 : $status",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 35),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  child: const Text(
                    "Yudi Aulia 1915016084",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
