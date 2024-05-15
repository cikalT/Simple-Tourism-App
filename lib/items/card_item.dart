import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourism_app/models/destinations.dart';
import 'package:tourism_app/views/home/home_controller.dart';

Widget makeItem({required Datum destination, required HomeController controller}) {
  return GestureDetector(
    onTap: () {
      controller.tapCard(destination);
    },
    child: AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage("assets/images/${destination.image}.jpeg"), fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ])),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    RatingBar.builder(
                      itemSize: 10,
                      initialRating: destination.rate,
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
