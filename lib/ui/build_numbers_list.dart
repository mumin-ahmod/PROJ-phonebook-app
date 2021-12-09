import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonebook_murad/controller/number_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildNumbersList extends StatelessWidget {
  BuildNumbersList({Key? key}) : super(key: key);

  final NumberController numberController = Get.put(NumberController());


  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const SizedBox(height: 18,),
        const Text(
          "My Contacts:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        const SizedBox(height: 18,),

        Expanded(
          child: Obx(
            () => ListView.builder(
                itemCount: numberController.numberList.length,
                scrollDirection: Axis.vertical,
               shrinkWrap: true,
                itemBuilder: (context, index) {
                  final number = numberController.numberList[index];
                  return ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${number.name}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${number.phoneNumber}',
                      ),
                    ),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () async {
                                await launch('tel:${number.phoneNumber}');
                              },
                              icon: const Icon(
                                Icons.phone,
                              )),
                          IconButton(
                              onPressed: () async {
                                await launch('mailto:${number.email}');
                              },
                              icon: const Icon(Icons.email_outlined)),
                        ],
                      ),
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }
}
