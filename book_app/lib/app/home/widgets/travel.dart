import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/preview_list.dart';

class TravelWidgets extends StatelessWidget {
  const TravelWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Travel',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const HomeWidgetPreviewList(
            title: 'fiction',
          )
        ],
      ),
    );
  }
}
