import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yangi_prekt/model/model.dart';
import 'package:yangi_prekt/page/details_page.dart';
import 'package:yangi_prekt/server/hhtp_server.dart';

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  final respons = Respons();
  CatFactModel? fact;
  bool islod = true;


  getFacts() async {
    fact = await respons.getData();
    setState(() {
      islod = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFacts();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: islod
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fact!.text,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        DateFormat('dd.MM.yyy').format(DateTime.now()),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: size.height * 0.5,
                        width: size.width,
                        child: Image.network('https://cataas.com/cat'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  getFacts();
                                });
                              },
                              child: const Text("Facts")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Details()));
                              },
                              child: const Text("History")),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
  }
}
