import 'package:book_app/app/home/widgets/health.dart';
import 'package:book_app/app/home/widgets/travel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/adventure.dart';
import 'widgets/arts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Book App',
        style: GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                child: Text(
                  'Discover Latest Book',
                  style: GoogleFonts.openSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const HealthWidget(),
              const Divider(thickness: 1),
              const AdventureWidgets(),
              const Divider(thickness: 1),
              const TravelWidgets(),
              const Divider(thickness: 1),
              const ArtWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
