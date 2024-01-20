import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  // This widget is the root of your application.
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HOME(),
    );
  }
}

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  int selectedindex = 0;
  GlobalKey<ScaffoldState> scaffold = GlobalKey();
  List<Widget> listwidget = [
    const Text(
      "I'm in the Home Page",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ),
    const Text(
      "I'm in the Setting Page",
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (val) {
              setState(
                () {
                  selectedindex = val;
                },
              );
            },
            currentIndex: selectedindex,
            backgroundColor: Colors.blue,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting'),
            ]),
        key: scaffold,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.laptop),
              child: Text("Icon"),
            ),
            Tab(
              icon: Icon(Icons.mobile_friendly),
              child: Text("PageView"),
            ),
            Tab(
              icon: Icon(Icons.computer),
              child: Text("PC"),
            ),
          ]),
          title: const Text("Flutter"),
        ),
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Icon(Icons.account_box),
                      ),
                    ),
                    const Expanded(
                        child: ListTile(
                      title: Text("shaden duaibes"),
                      subtitle: Text("shadendaibes@gmail.com"),
                    ))
                  ],
                ),
                const ListTile(
                  title: Text("HomePage"),
                  leading: Icon(Icons.home),
                ),
                const ListTile(
                  title: Text("second page"),
                  leading: Icon(Icons.two_k),
                ),
                const ListTile(
                  title: Text("third page"),
                  leading: Icon(Icons.thirty_fps_rounded),
                ),
                const ListTile(
                  title: Text("four"),
                  leading: Icon(Icons.four_g_mobiledata),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              width: 100,
              height: 100,
              child: TabBarView(children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  height: 300,
                  width: 300,
                  child: const Image(
                    image: AssetImage("assets/images/account.jpg"),
                  ),
                ),
                SizedBox(
                  height: 500,
                  width: 500,
                  child: PageView(
                    children: [
                      Image.asset(
                        "assets/images/phone1.jpeg",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/phone2.jpeg",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "assets/images/phone3.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                const Text("My PC"),
              ]),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  color: Colors.red,
                  height: 300,
                  width: 300,
                ),
                Container(
                  color: Colors.green,
                  height: 200,
                  width: 200,
                ),
                Container(
                  color: Colors.yellow,
                  height: 100,
                  width: 100,
                ),
                const Positioned(top: 0, child: Text("shaden"))
              ],
            ),
            const SizedBox(
              child: Column(
                children: [
                  CustomeListTitle(
                    name: "shaden",
                    email: "shaden@outlook.com",
                    date: "12.10.2000",
                    //imagename:'assets/images/phone1.jpeg',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            listwidget.elementAt(selectedindex),
          ]),
        ),
      ),
    ));
  }
}

class CustomeListTitle extends StatelessWidget {
  final String name;
  final String email;
  final String date;
  const CustomeListTitle({
    super.key,
    required this.name,
    required this.email,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
     child: ListTile(
        title: Text(name),
        subtitle: Text(email),
        trailing: Text(date),
      ),
    );
  }
}
