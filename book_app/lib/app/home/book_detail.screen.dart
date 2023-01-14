import 'package:book_app/models/item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailScreen extends StatelessWidget {
  final Items item;
  const BookDetailScreen({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color.fromARGB(255, 86, 83, 83),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),

          /// Floating action button to launch url in goolge play books
          ///
          onPressed: () async {
            var url = item.accessInfo.webReaderLink;
            await launchUrl(Uri.parse(url));
          },
          child: const Text(
            "READ BOOK",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// navigate back to previous screen
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Detail Screen",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildBookCover(context),
                        ],
                      ),
                      _buildBookTitle(context),
                      _buildAuthor(context),
                      _buildVolumeInfo(context),
                    ],
                  ),
                ),
              ),
            ),
            _buildDescInfo(context),
          ],
        ),
      ),
    ));
  }

  /// Widget to build book cover
  ///
  Widget _buildBookCover(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        height: 180,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                item.volumeInfo.imageLinks.smallThumbnail,
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildBookTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Flexible(
        child: Text(
          item.volumeInfo.title!,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildAuthor(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "by ${item.volumeInfo.authors}",
        style: GoogleFonts.lato(
            textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  Widget _buildVolumeInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildRatingInfo(context),
          _buildPageInfo(context),
          _buildPublishDateInfo(context)
        ],
      ),
    );
  }

  Widget _buildRatingInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Rating",
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 15, color: Colors.grey[400])),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 18,
            ),
            Text(
              item.volumeInfo.averageRating.toString(),
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPageInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pages",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey[400],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          item.volumeInfo.pageCount.toString(),
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPublishDateInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          "Publish date",
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 15, color: Colors.grey[400])),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          item.volumeInfo.publishedDate.toString(),
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDescInfo(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 25),
              child: ListView(
                children: [
                  Text(
                    "About this book?",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    item.volumeInfo.description.toString(),
                    style:
                        GoogleFonts.lato(color: Colors.grey[600], fontSize: 15),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
