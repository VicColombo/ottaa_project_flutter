import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottaa_project_flutter/app/theme/app_theme.dart';

import 'icon_widget.dart';

final Map<int, Color> groupColor = {
  1: Colors.yellow,
  2: kOTTAAOrange,
  3: Colors.green,
  4: Colors.blue,
  5: Colors.purple,
  6: Colors.black,
};

class CategoryPageWidget extends StatelessWidget {
  const CategoryPageWidget(
      {Key? key,
      required this.name,
      required this.imageName,
      this.border = false,
      this.color = 0})
      : super(key: key);
  final String name;
  final String imageName;
  final bool border;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 12,
          ),
          //placeholder for the photos
          Container(
            decoration: BoxDecoration(
                border: border
                    ? Border.all(
                        color: groupColor[color]!,
                        width: 6,
                      )
                    : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8)),
            child: kIsWeb
                ? Image.network(
                    imageName,
                    height: Get.height * 0.5,
                    fit: BoxFit.fitHeight,
                    width: Get.width * 0.4,
                  )
                : CachedNetworkImage(
                    imageUrl: imageName,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    height: Get.height * 0.5,
                    fit: BoxFit.fitHeight,
                    width: Get.width * 0.4,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            //filler for the text
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              IconWidget(icon: Icons.timer_off),
              IconWidget(icon: Icons.location_off),
              IconWidget(icon: Icons.face),
              IconWidget(icon: Icons.wc),
            ],
          ),
        ],
      ),
    );
  }
}
