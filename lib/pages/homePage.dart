import 'package:flutter/material.dart';
import 'package:jsonplaceholder_app/jsonHandlers/jsonPlaceHolderHandler.dart';
import 'package:jsonplaceholder_app/models/jsonPlaceHolderModel.dart';
import 'package:jsonplaceholder_app/pages/sendPost.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  JsonPlaceHolderHandler jsonPlaceHolderHandler = JsonPlaceHolderHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json PlaceHolder'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SendPost(),
              ),
            ),
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: jsonPlaceHolderHandler.getAllPosts(),
          builder: (BuildContext context,
              AsyncSnapshot<List<JsonPlaceHolderModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User_ID : ${snapshot.data![index].user_id.toString()}',
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 25),
                            ),
                            Text(
                              'ID : ${snapshot.data![index].id.toString()}',
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 25),
                            ),
                            Text(
                              'Title: ${snapshot.data![index].title.toString()}\n',
                              style: TextStyle(
                                  color: Colors.teal[900], fontSize: 20),
                            ),
                            Text(
                              'Body :${snapshot.data![index].body.toString()},',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(child: Text('No Data'));
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  semanticsLabel: 'Wait',
                  color: Color.fromARGB(255, 222, 156, 152),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
