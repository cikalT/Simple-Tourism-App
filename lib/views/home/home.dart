import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/items/card_item.dart';

import 'home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.isLoading
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/bali.jpg'), fit: BoxFit.cover),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.2),
                        ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const Text(
                              "Temukan Destinasi Wisata Kamu",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 40),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  controller.filterSearch(value);
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                                  hintText: "Nama tempat, lokasi....",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (controller.denpasarList.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Denpasar",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.denpasarList.length,
                                itemBuilder: (context, index) {
                                  return makeItem(destination: controller.denpasarList[index], controller: controller);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (controller.denpasarList.isNotEmpty)
                      const SizedBox(
                        height: 30,
                      ),
                    if (controller.karangasemList.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Karangasem",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.karangasemList.length,
                                itemBuilder: (context, index) {
                                  return makeItem(destination: controller.karangasemList[index], controller: controller);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (controller.karangasemList.isNotEmpty)
                      const SizedBox(
                        height: 30,
                      ),
                    if (controller.bulelengList.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Buleleng",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.bulelengList.length,
                                itemBuilder: (context, index) {
                                  return makeItem(destination: controller.bulelengList[index], controller: controller);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
