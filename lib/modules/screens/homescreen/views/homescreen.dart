import 'package:flutter/material.dart';

import '../../../../utils/helpers/apihelper.dart';
import '../../../../utils/model/apimodel.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News app"),
      ),
      body: FutureBuilder(
        future: Apihelper.newsHelper.ApiData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<Apimodel>? apimodel = snapshot.data;

            return GridView.builder(
              itemCount: apimodel!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisExtent: 250,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, i) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Text(
                    apimodel[i].description,
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
