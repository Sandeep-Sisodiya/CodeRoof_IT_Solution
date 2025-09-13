import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showFirstState = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double w(double val) => val / 375 * screenWidth;
    double h(double val) => val / 812 * screenHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
              child: SizedBox(
                height: h(31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mixer",
                      style: GoogleFonts.manrope(
                        fontSize: w(22),
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF22242B),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/homepage/img0a.png',
                          width: w(24),
                          height: h(24),
                        ),
                        SizedBox(width: w(16)),
                        Image.asset(
                          'assets/homepage/img0b.png',
                          width: w(24),
                          height: h(24),
                          color: const Color(0xFF5E1053),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: h(40),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: w(12)),
                children: [
                  const SizedBox(width: 4),
                  _buildFilterButton2(
                    label: "Filters",
                    icon: Icons.tune,
                    selected: true,
                  ),
                  _buildFilterButton(
                    label: "Age",
                    icon: Icons.keyboard_arrow_down,
                  ),
                  _buildFilterButton(
                    label: "Height",
                    icon: Icons.keyboard_arrow_down,
                  ),
                  _buildFilterButton(
                    label: "Habits",
                    icon: Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.15),

            // ✅ Emoji avatars
            Center(
              child: SizedBox(
                width: w(220),
                height: h(120),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 16,
                      child: _buildCircleIcon(
                        "assets/homepage/img2.png",
                        const Color.fromRGBO(255, 197, 202, 1.0),
                        size: w(72),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      child: _buildCircleIcon(
                        "assets/homepage/img3.png",
                        const Color.fromRGBO(255, 218, 163, 1),
                        size: w(72),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white, width: 2.5),
                            ),
                            child: _buildCircleIcon(
                              "assets/homepage/img1.png",
                              const Color.fromRGBO(246, 229, 244, 1.0),
                              size: w(92),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.013),
            Text(
              showFirstState
                  ? "You’ve seen everyone nearby"
                  : "You’ve seen them all",
              style: GoogleFonts.manrope(
                fontSize: w(18),
                fontWeight: FontWeight.w700,
                color: const Color(0xFF22242B),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: h(8)),

            Text(
              showFirstState
                  ? "No more profiles in your area. Check back later or expand your location to see more people."
                  : "No more profiles match your filters. Update your preferences to find more people.",
              style: GoogleFonts.manrope(
                fontSize: w(14),
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6E6F73),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: h(24)),

            SizedBox(
              width: screenWidth * 0.6,
              height: h(46),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showFirstState = !showFirstState;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5E1053),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  "Adjust Location",
                  style: GoogleFonts.manrope(
                    fontSize: w(16),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const Spacer(),

            Container(
              height: h(60),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(width: 0.1),
                  Image.asset(
                    'assets/homepage/img4.png',
                    width: w(40),
                    height: h(40),
                    color: const Color(0xFF5E1053),
                  ),
                  Image.asset(
                    'assets/homepage/img5.png',
                    width: w(40),
                    height: h(40),
                    color: Colors.black,
                  ),
                  Image.asset(
                    'assets/homepage/img6.png',
                    width: w(40),
                    height: h(40),
                    color: Colors.black,
                  ),
                  Image.asset(
                    'assets/homepage/img7.png',
                    width: w(40),
                    height: h(40),
                    color: Colors.black,
                  ),
                  Image.asset(
                    'assets/homepage/img8.png',
                    width: w(40),
                    height: h(40),
                    color: Colors.black,
                  ),
                  const SizedBox(width: 0.1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIcon(String asset, Color bgColor, {double size = 70}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFilterButton2({
    required String label,
    IconData? icon,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF8E9F1) : const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
                color: selected ? const Color(0xFF5E1053) : const Color(0xFF22242B),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selected ? const Color(0xFF5E1053) : const Color(0xFF22242B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton({
    required String label,
    IconData? icon,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF8E9F1) : const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selected ? const Color(0xFF5E1053) : const Color(0xFF22242B),
              ),
            ),
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
                color: selected ? const Color(0xFF5E1053) : const Color(0xFF22242B),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
