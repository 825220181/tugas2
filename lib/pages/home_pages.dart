import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String cityName = "Jakarta";
    int currTemp = 32;
    int maxTemp = 35;
    int minTemp = 31;
    String condition = "Sunny";
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration:
        BoxDecoration(color: isDarkMode ? Colors.black : Colors.white),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top navigation bar
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bars,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                          Align(
                            child: Text(
                              "Weather App",
                              style: GoogleFonts.questrial(
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.blueAccent),
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.circlePlus,
                            color: isDarkMode ? Colors.white : Colors.black,
                          )
                        ],
                      ),
                    ),

                    // City Name and Temperature Details
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: Align(
                        child: Text(
                          cityName,
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.blueAccent,
                            fontSize: size.height * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.005),
                      child: Align(
                        child: Text(
                          "Today",
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.blueAccent,
                            fontSize: size.height * 0.035,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: Align(
                        child: Text(
                          "$currTemp° C",
                          style: GoogleFonts.questrial(
                            color: currTemp <= 0
                                ? Colors.blue[100]
                                : currTemp > 0 && currTemp <= 20
                                ? Colors.indigo[50]
                                : currTemp > 21 && currTemp <= 32
                                ? Colors.deepPurple[300]
                                : Colors.red[900],
                            fontSize: size.height * 0.1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      child: Align(
                        child: Text(
                          condition,
                          style: GoogleFonts.questrial(
                            color:
                            isDarkMode ? Colors.white : Colors.blueAccent,
                            fontSize: size.height * 0.035,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.005),
                      child: Align(
                        child: Text(
                          "$minTemp°C/$maxTemp°C",
                          style: GoogleFonts.questrial(
                            color:
                            isDarkMode ? Colors.white : Colors.blueAccent,
                            fontSize: size.height * 0.03,
                          ),
                        ),
                      ),
                    ),

                    // Forecast details
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                          horizontal: size.width * 0.05),
                      child: Container(
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.grey[900]
                                : Colors.blue[50],
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  forecastCard("Now", "2°C", FontAwesomeIcons.sun, "0%"),
                                  forecastCard("15:00", "1°C", FontAwesomeIcons.cloud, "40%"),
                                  forecastCard("16:00", "0°C", FontAwesomeIcons.cloudShowersHeavy, "80%"),
                                  forecastCard("17:00", "-2°C", FontAwesomeIcons.snowflake, "60%"),
                                ],
                              ),
                            ],
                          ),
                        ),
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

  Widget forecastCard(String time, String temp, IconData icon, String rainProb) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          time,
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white : Colors.blueAccent,
            fontSize: size.height * 0.025,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: FaIcon(
            icon,
            color: isDarkMode ? Colors.white : Colors.blueAccent,
            size: size.height * 0.03,
          ),
        ),
        Text(
          temp,
          style: GoogleFonts.questrial(
            color: isDarkMode ? Colors.white : Colors.blueAccent,
            fontSize: size.height * 0.025,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(
            rainProb,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.blueAccent,
              fontSize: size.height * 0.02,
            ),
          ),
        ),
      ],
    );
  }
}
