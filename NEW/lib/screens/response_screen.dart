import 'package:flutter/material.dart';

import '../data/remote/api/ResponseModel.dart';

class ResponseScreen extends StatelessWidget {
  final Response response;

  const ResponseScreen({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Candidates:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (response.candidates != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: response.candidates!.map((candidate) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Finish Reason: ${candidate.finishReason ?? ""}'),
                      Text('Index: ${candidate.index ?? ""}'),
                      Text('Content Role: ${candidate.content?.role ?? ""}'),
                      SizedBox(height: 10),
                      if (candidate.safetyRatings != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: candidate.safetyRatings!.map((rating) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Category: ${rating.category ?? ""}'),
                                Text('Probability: ${rating.probability ?? ""}'),
                                SizedBox(height: 5),
                              ],
                            );
                          }).toList(),
                        ),
                      SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
