import 'package:flutter/material.dart';
import 'dart:io';
import 'package:whatsapp/common/utils/utils.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});
  static const String routeName = '/user-iformation';

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    nameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void selectImage() async {
    setState(() async{
      image = await pickImageFromGallery(context);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                image==null ?const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1711861413115-797ee0655214?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ):  CircleAvatar(
                  radius: 64,
                  backgroundImage: FileImage(image!),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*0.05,),
            Row(
              children: [
                Container(
                  width: size.width * 0.80,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Enter your name'),
                  ),
                ),
               IconButton(onPressed: () {}, icon:const Icon(Icons.edit))
              ],
            )
          ],
        ),
      ))),
    );
  }
}
