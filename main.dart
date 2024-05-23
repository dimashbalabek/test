import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(), // Start with SearchPage as the home
    );
  }
}

class University {
  final String img;
  final String title;
  final String location;
  final String phone;
  final String num;
  final String p1;

  University({
    required this.img,
    required this.title,
    required this.location,
    required this.phone,
    required this.num,
    required this.p1,
  });

  static List<University> universities = [
    University(
      img: "assets/images/dima.jpg",
      title: "Kazakh Agrotechnical University named after S. Seifullin",
      location: "Nur-Sultan",
      phone: "8(7172)53 94-24",
      num: "001",
      p1: '11textasd asd as das das da sd asd1',
    ),
    University(
      img: "assets/images/2.jpg",
      title: "Kazakh Agrotechnical University named after S. Seifullin",
      location: "Nur-Sultan",
      phone: "8(7172)53 94-24",
      num: "002",
      p1: '22textasd asd as das das da sd asd',
    ),
    University(
      img: "assets/images/2.jpg",
      title: "Caspian State University of Technologies and Engineering named after Sh. Yessenov",
      location: "Aktau",
      phone: "8(7172)53 94-24",
      num: "003",
      p1: '33textasd asd as das das da sd asd',
    ),
    University(
      img: "assets/images/2.jpg",
      title: "West Kazakhstan State Medical University named after M. Ospanov",
      location: "Aktau",
      phone: "8(7172)53 94-24",
      num: "004",
      p1: '44textasd asd as das das da sd asd',
    ),
  ];
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<University> filteredUniversities = University.universities;
  String selectedCity = 'All Cities';

  void searchU(String query) {
    final suggestions = University.universities.where((university) {
      final universityTitle = university.title.toLowerCase();
      final input = query.toLowerCase();
      return universityTitle.contains(input);
    }).toList();

    setState(() {
      filteredUniversities = suggestions;
    });
  }

  void _showCityFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select City'),
          content: DropdownButton<String>(
            isExpanded: true,
            value: selectedCity,
            items: <String>[
              'All Cities',
              'Nur-Sultan',
              'Almaty',
              'Karaganda',
              'Shymkent',
              'Oral',
              'Atyrau',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCity = newValue!;
                _filterUniversities();
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  void _filterUniversities() {
    setState(() {
      filteredUniversities = University.universities.where((university) {
        if (selectedCity == 'All Cities') {
          return true;
        }
        return university.location == selectedCity;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LIST OF UNIVERSITIES"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: searchU,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search",
                      filled: true,
                      fillColor: const Color.fromARGB(255, 194, 194, 194),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: _showCityFilterDialog,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredUniversities.length,
                itemBuilder: (context, index) {
                  final university = filteredUniversities[index];
                  return Card(
                    key: ValueKey(university.num),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(university: university),
                          ),
                        );
                      },
                      trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.grey,
                        ),
                        height: 50,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(university.num),
                        ),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10)),
                        child: Container(
                            height: 400,
                            width: 80,
                            child: Image.asset(university.img, fit: BoxFit.fill, width: 100)),
                      ),
                      title: Text(university.title),
                      subtitle: Text(university.location),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final University university;

  const HomePage({Key? key, required this.university}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(university.img),
            fit: BoxFit.cover,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 207, 207, 207)),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: 300,
                    height: 200,
                    child: Card(
                      elevation: 0,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              university.title,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 18),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                SizedBox(width: 10),
                                Text(university.location),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.phone_outlined),
                                SizedBox(width: 10),
                                Text(university.phone),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text("№", style: TextStyle(fontSize: 20)),
                                SizedBox(width: 10),
                                Text(university.num),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // To prevent conflict with outer ListView
                    itemCount: University.universities.length, // Displaying each university in the list
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Container(

                            width: 300,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(university.p1),
                            ),
                          ),
                        ),
                      ); // Add your ListTile details here
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

