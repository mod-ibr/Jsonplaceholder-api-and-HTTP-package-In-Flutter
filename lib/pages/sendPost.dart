import 'package:flutter/material.dart';
import 'package:jsonplaceholder_app/jsonHandlers/jsonPlaceHolderHandler.dart';
import 'package:jsonplaceholder_app/models/jsonPlaceHolderModel.dart';

class SendPost extends StatefulWidget {
  const SendPost({Key? key}) : super(key: key);

  @override
  State<SendPost> createState() => _SendPostState();
}

class _SendPostState extends State<SendPost> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  JsonPlaceHolderHandler jsonPlaceHolderHandler = JsonPlaceHolderHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: Text('Send A Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              // User Id
              TextField(
                controller: userIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Enter your User ID '),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Title
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  filled: true,
                  label: const Text('Enter your Title'),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              // Body
              TextField(
                controller: bodyController,
                decoration: InputDecoration(
                  label: const Text('Enter your Body'),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              // Send Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
//**********************************************************************
                    //*************To POST a post**************
                    // jsonPlaceHolderHandler.sendPost(
                    //   JsonPlaceHolderModel(
                    //     body: bodyController.text,
                    //     title: titleController.text,
                    //     user_id: userIdController.text,
                    //   ),
                    // );
                    // print('Data Sended Using Post');
//**********************************************************************
                    //**************To PUT a post******************
                    // jsonPlaceHolderHandler.updatePost(
                    //   model: JsonPlaceHolderModel(
                    //       body: bodyController.text,
                    //       title: titleController.text,
                    //       user_id: userIdController.text),
                    //   id: 20,
                    // );
                    // print('Data Updated Using PUT function');
//**********************************************************************
                    //*************To PATCH title in a post******************
                    // jsonPlaceHolderHandler.updateTitleInPost(
                    //     title: titleController.text, id: 90);
                    // print('Title Updated Using PATCH function');
//**********************************************************************
                    //*************To DELETE Post By Id******************
                    // jsonPlaceHolderHandler.deletePost(25);
                    // print('Post Whechit\'s ID = 25 is DELETED ');
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Send'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
