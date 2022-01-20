import 'package:e_commerce_ui/widgets/appbar.dart';
import 'package:e_commerce_ui/widgets/detailsPage/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String room;
  final String assetURL;
  final int rating;
  final double price;
  final List colors;
  const DetailsPage({
    Key? key,
    required this.name,
    required this.room,
    required this.assetURL,
    required this.rating,
    required this.price,
    required this.colors,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode
    Color defaultColor =
        isDarkMode ? Colors.white.withOpacity(0.8) : Colors.black;
    Color secondColor = isDarkMode ? Colors.black : Colors.white;
    return Scaffold(
      appBar: buildAppBar(
        InkWell(
          onTap: () => Get.back(),
          child: Icon(
            UniconsLine.arrow_circle_left,
            color: isDarkMode
                ? Colors.white
                : const Color(0xff3b22a1), //icon bg color
            size: size.height * 0.035,
          ),
        ),
        Icon(
          UniconsLine.ellipsis_v,
          color: isDarkMode ? Colors.white : const Color(0xff3b22a1),
          size: size.height * 0.025,
        ),
        isDarkMode,
        size,
      ),
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xff06090d)
                : const Color(0xfff8f8f8), //background color
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.05,
                right: size.width * 0.05,
              ),
              child: ListView(
                children: [
                  Image.network(
                    widget.assetURL,
                    height: size.height * 0.5,
                    width: size.width * 0.8,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return SizedBox(
                        width: size.width * 0.5,
                        height: size.width * 0.5,
                        child: Align(
                          child: CircularProgressIndicator(
                            color: defaultColor,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        width: size.width * 0.5,
                        height: size.width * 0.5,
                        child: Align(
                          child: CircularProgressIndicator(
                            color: defaultColor,
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.5,
                        child: ListView.builder(
                          itemCount: widget.colors.length,
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index == selectedColor) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width: size.width * 0.12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      width: 0.8,
                                    ),
                                  ),
                                  child: buildColorPicker(
                                      widget.colors[index], isDarkMode, size),
                                ),
                              );
                            }
                            return InkWell(
                              onTap: () => setState(() {
                                selectedColor = index;
                              }),
                              child: buildColorPicker(
                                widget.colors[index],
                                isDarkMode,
                                size,
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        '${widget.price}\$',
                        style: GoogleFonts.poppins(
                          color: defaultColor,
                          fontSize: size.height * 0.03,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.room,
                            style: GoogleFonts.poppins(
                              color: defaultColor,
                              fontSize: size.height * 0.02,
                            ),
                          ),
                          Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: size.width * 0.7,
                                child: Text(
                                  widget.name,
                                  style: GoogleFonts.lato(
                                    color: defaultColor,
                                    fontSize: size.height * 0.035,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.01,
                        ),
                        child: SizedBox(
                          height: size.width * 0.12,
                          width: size.width * 0.12,
                          child: Container(
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () =>
                                  print('purchase'), //TODO: add purchase action
                              child: Icon(
                                UniconsLine.shopping_cart_alt,
                                color: secondColor,
                                size: size.width * 0.07,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                    width: size.width * 0.3,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index < widget.rating) {
                          return Icon(
                            Icons.star,
                            color: defaultColor,
                            size: size.height * 0.025,
                          );
                        } else {
                          return Icon(
                            Icons.star_outline,
                            color: defaultColor,
                            size: size.height * 0.025,
                          );
                        }
                      },
                    ),
                  ),
                  Divider(
                    color: defaultColor,
                  ),
                  Text(
                    //TODO: change description
                    //! EXAMPLE DESCRIPTION
                    "Hi! I am Martin Gogołowicz - Flutter developer from Poland. This is example item description. Please edit it.\nFollow me on LinkedIn: Martin Gogołowicz\nFollow me on GitHub: MonsieurZbanowanYY",
                    style: GoogleFonts.poppins(
                      color: defaultColor,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
