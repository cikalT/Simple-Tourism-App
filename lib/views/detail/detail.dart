import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/items/icon_with_border.dart';
import 'package:tourism_app/items/text_with_border.dart';

import 'detail_controller.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) => controller.isLoading
          ? Container()
          : Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/${controller.destinations?.image}.jpeg",
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: 350,
                            color: Colors.black12,
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 24,
                                    right: 24,
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          child: const Icon(
                                            Icons.arrow_back,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.favorite, color: controller.isLiked ? Colors.red : Colors.white),
                                          onPressed: () {
                                            controller.saveFavorite(controller.destinations);
                                          })
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 24,
                                    right: 24,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWithBorder(
                                        text: controller.destinations?.name ?? '-',
                                        textStyle: const TextStyle(fontSize: 30, color: Colors.white),
                                        borderWidth: 2.0,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          const IconWithBorder(
                                            iconData: Icons.location_on,
                                            size: 25,
                                            iconColor: Colors.white,
                                            borderColor: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          TextWithBorder(
                                            text: controller.destinations?.location ?? '-',
                                            textStyle: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            borderWidth: 2.0,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 16,
                                            initialRating: controller.destinations?.rate ?? 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            ignoreGestures: true,
                                            itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "${controller.destinations?.rate ?? 0}",
                                            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 17),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                                  height: 50,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FeaturesTile(
                            icon: const Icon(Icons.card_travel, color: Color(0xff5A6C64)),
                            label: controller.destinations?.feature[0] ?? '-',
                          ),
                          FeaturesTile(
                            icon: const Icon(Icons.deck_outlined, color: Color(0xff5A6C64)),
                            label: controller.destinations?.feature[1] ?? '-',
                          ),
                          FeaturesTile(
                            icon: const Icon(Icons.diversity_2_outlined, color: Color(0xff5A6C64)),
                            label: controller.destinations?.feature[2] ?? '-',
                          ),
                          FeaturesTile(
                            icon: const Icon(Icons.gavel_outlined, color: Color(0xff5A6C64)),
                            label: controller.destinations?.feature[3] ?? '-',
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          controller.destinations?.description ?? '-',
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 15, height: 1.5, fontWeight: FontWeight.w600, color: Color(0xff879D95)),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: const Text(
                          'Apa Kata Mereka?',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18, height: 1.5, fontWeight: FontWeight.w600, color: Color(0xff879D95)),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (var item in controller.destinations?.review ?? [])
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.people,
                                      color: Color(0xff879D95),
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        item ?? '-',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic,
                                          color: Color(0xff879D95),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  final Icon icon;
  final String label;
  FeaturesTile({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff5A6C64).withOpacity(0.5)), borderRadius: BorderRadius.circular(40)),
              child: icon,
            ),
            const SizedBox(
              height: 9,
            ),
            Container(
                width: 70,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff5A6C64)),
                ))
          ],
        ),
      ),
    );
  }
}
