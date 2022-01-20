import 'package:e_commerce_ui/data/example_data.dart';
import 'package:e_commerce_ui/widgets/appbar.dart';
import 'package:e_commerce_ui/widgets/bottom_nav_bar.dart';
import 'package:e_commerce_ui/widgets/homePage/category.dart';
import 'package:e_commerce_ui/widgets/homePage/product.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;
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
        Icon(
          UniconsLine.bars,
          //icon bg color
          color: isDarkMode ? Colors.white : const Color(0xff3b22a1),

          size: size.height * 0.025,
        ),
        Icon(
          UniconsLine.search,
          //icon bg color
          color: isDarkMode ? Colors.white : const Color(0xff3b22a1),
          size: size.height * 0.025,
        ),
        isDarkMode,
        size,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: buildBottomNavBar(0, size, isDarkMode),
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
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.01,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.width * 0.08,
                          width: size.width * 0.96,
                          child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == selectedCategory) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: buildCategory(
                                    categories[index],
                                    secondColor,
                                    defaultColor,
                                    size,
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                  ),
                                  child: InkWell(
                                    onTap: () => setState(() {
                                      selectedCategory = index;
                                    }),
                                    child: buildCategory(
                                      categories[index],
                                      defaultColor,
                                      secondColor,
                                      size,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: items.length,
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, i) {
                        return buildProduct(
                          items[i]['name'],
                          items[i]['room'],
                          items[i]['assetURL'],
                          items[i]['rating'],
                          items[i]['price'],
                          items[i]['colors'],
                          defaultColor, //default color
                          secondColor, //second color
                          size, // device size
                        );
                      },
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
