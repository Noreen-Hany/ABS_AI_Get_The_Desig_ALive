import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      //Remove the Debug Banner
      debugShowCheckedModeBanner: false,

      home: const MyHomePage(title: 'Pet Market'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  //List of the pets
  final List<Map<String, dynamic>> _allListItems = [
    {
      "image": "assets/dog1.jfif",
      "type": "Golden",
      "category": "Dog",
      "pet Love": "Pet Love: 20",
    },
    {
      "image": "assets/dog2.jfif",
      "type": "Lablador",
      "category": "Dog",
      "pet Love": "Pet Love: 18",
    },
    {
      "image": "assets/dog3.jfif",
      "type": "Cardigan",
      "category": "Dog",
      "pet Love": "Pet Love: 12",
    },
    {
      "image": "assets/cat1.jfif",
      "type": "Street Cat",
      "category": "Cat",
      "pet Love": "Pet Love: 17",
    },
    {
      "image": "assets/cat2.jfif",
      "type": "White Cat",
      "category": "Cat",
      "pet Love": "Pet Love: 19",
    },
    {
      "image": "assets/cat3.jfif",
      "type": "Kitten",
      "category": "Cat",
      "pet Love": "Pet Love: 18",
    },
    {
      "image": "assets/bird1.jfif",
      "type": "House Bird",
      "category": "Bird",
      "pet Love": "Pet Love: 15",
    },
    {
      "image": "assets/bird2.jfif",
      "type": "Parrot",
      "category": "Bird",
      "pet Love": "Pet Love: 14",
    },
    {
      "image": "assets/bird3.png",
      "type": "Pink Bird",
      "category": "Bird",
      "pet Love": "Pet Love: 15",
    },
    {
      "image": "assets/bird3 (1).png",
      "type": "Talking Parrot",
      "category": "Bird",
      "pet Love": "Pet Love: 17",
    },
    {
      "image": "assets/hamster1.jfif",
      "type": "Hamster",
      "category": "Rat",
      "pet Love": "Pet Love: 9",
    },
    {
      "image": "assets/rabbit1.jfif",
      "type": "Brown Rabbit",
      "category": "Rabbit",
      "pet Love": "Pet Love: 16",
    },
    {
      "image": "assets/rabbit2.jfif",
      "type": "Gray Rabbit",
      "category": "Rabbit",
      "pet Love": "Pet Love: 17",
    },
  ];

  //This list holds the data for the list view
  List<Map<String, dynamic>> _foundItems = [];

  @override
  initState() {
    // TODO: implement initState all items are shown
    _foundItems = _allListItems;
    super.initState();
  }

  //the called function when the text field change
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      //if the search field is empty or only contains white space,
      // we'll display all items
      results = _allListItems;
    } else {
      results = _allListItems
          .where((pet) =>
          pet["type"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundItems = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),

            //UI of Textfiled
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search, color: Colors.amber,),
                labelText: 'Search by Pet Type',
              ),
            ),

            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: _foundItems.isNotEmpty
              //UI of deisplay search results in listview by Pet type
                  ? ListView.builder(
                itemCount: _foundItems.length,
                itemBuilder: (context, index) =>
                    Card(
                      key: ValueKey(_foundItems[index]["type"]),
                      color: Colors.white,
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(vertical: 5,
                          horizontal: 5),

                      child: ListTile(
                        //TO call pet image
                        leading: Image.asset(_foundItems[index]['image'],
                          matchTextDirection: true,),

                        //to call pet type of items list
                        title: Text(
                          _foundItems[index]["type"],
                          style: const TextStyle(fontSize: 24),
                        ),

                        //to call pet category of items list
                        subtitle: Text(_foundItems[index]["category"]),

                        //to call pet love count of items list
                        trailing: Text(
                          '(${_foundItems[index]["pet Love"]})',
                          style: const TextStyle(color: Colors.deepOrange),

                        ),
                      ),
                    ),
              )

              //UI of empty page
                  : const Text(
                'No Results Found',
                style: TextStyle(fontSize: 24, color: Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
