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
// import 'package:advance_flutter_examm/utils/helper/apihelper.dart';
// import 'package:advance_flutter_examm/utils/model/apimodel.dart';
// import 'package:flutter/material.dart';
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController search = TextEditingController(text: "");
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(23),
//                 color: Colors.blue.shade50,
//               ),
//               child: TextField(
//                 controller: search,
//                 decoration: const InputDecoration(
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Colors.blueAccent,
//                   ),
//                   hintText: "Search",
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(borderSide: BorderSide.none),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: FutureBuilder(
//                 future: Apihelper.newsHelper.ApiData(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text('${snapshot.error}'),
//                     );
//                   } else if (snapshot.hasData) {
//                     List<Apimodel>? wallpapers = snapshot.data;
//
//                     return GridView.builder(
//                       itemCount: wallpapers!.length,
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 2,
//                         mainAxisExtent: 250,
//                         mainAxisSpacing: 2,
//                       ),
//                       itemBuilder: (context, i) {
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               'sub',
//                               arguments: wallpapers[i],
//                             );
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               // color: Colors.red,
//                               borderRadius: BorderRadius.circular(23),
//
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   Apimodel![i].description,
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   } else {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
