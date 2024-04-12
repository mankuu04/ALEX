import 'dart:html';

import 'package:chatbot/utils/util_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  var promtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('Gemini ChatBOT'),
      ),
      body: Column(
        children: [
          Image(image: AssetImage("assets/images/bg_image.png")),
          Expanded(child: Container(
          )),
          TextField(
            controller: promtController,
            enableSuggestions: true,
            decoration: InputDecoration(
                fillColor: AppColors.secondaryColor,
                filled: true,
                hintText: "Write a Question...",
                suffixIcon: InkWell(
                  onTap : (){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("SendingMessage"),
                    ));
                  },
                    child: Icon(Icons.send)),
                hintStyle: mTextStyle16(mColor: AppColors.mGreyColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                )

            ),
          )
        ],
      ),
    );
  }
}

