import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlanIndex = 0;

  final List<Map<String, dynamic>> _plans = [
    {
      'title': 'Mixer',
      'price': '\$24.99',
      'features': [
        'Unlimited Likes',
        'See who liked you',
        'Find people with wide range',
        'Access to events'
      ],
      'defaultColor': const Color(0xFFFFFCFD),
      'selectedColor': const Color(0xFFFDF3F9),
      'borderColor': Color(0xB3D7CAB2),
      'selectedborderColor': Color(0xB3E37C9A),

    },
    {
      'title': 'Mixer VIP',
      'price': '\$99.99',
      'features': [
        'Unlimited Likes',
        'See who liked you',
        'Find people with wide range',
        'Access to events',
        'VIP seating, food & beverages'
      ],
      'defaultColor': const Color(0xFFFFFFFF),
      'selectedColor': const Color(0xFFFCF5EC),
      'borderColor': const Color(0xFFEFEFEF),
      'selectedBorderColor': const Color(0xFFF1D09D),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double w(double val) => val / 375 * screenWidth;
    double h(double val) => val / 812 * screenHeight;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: _selectedPlanIndex == 1
              ? const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 244, 228, 1.0),
              Color.fromRGBO(255, 255, 255, 0.0),
            ],
            stops: [0.0, 0.23],
          )
              : const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 152, 210, 0.35),
              Color.fromRGBO(255, 255, 255, 0.0),
            ],
            stops: [0.0, 0.23],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top + h(20),
              left: w(20),
              right: w(20),
              child: SizedBox(
                height: h(31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mixer',
                      style: GoogleFonts.onest(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: const Color(0xFF22242B),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/button_heart.png",
                          width: w(28),
                          height: h(28),
                        ),
                        SizedBox(width: w(10)),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                            color: Color(0xFFB3B4B7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + h(78),
              left: w(20),
              child: SizedBox(
                width: w(304),
                height: h(27),
                child: Text(
                  'Level Up Your Mixer Experience',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: const Color(0xFF5E1053),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + h(155),
              left: w(20),
              child: SizedBox(
                width: w(193),
                height: h(24),
                child: Text(
                  'Select a plan',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xFF6E6F73),
                  ),
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).padding.top + h(204),
              left: w(14),
              child: _buildCard(0, w, h, "assets/mixer_heart.png"),
            ),

            Positioned(
              top: MediaQuery.of(context).padding.top + h(204),
              left: w(198),
              child: _buildCard(1, w, h, "assets/mixer_vip_heart.png"),
            ),

            Positioned(
              top: MediaQuery.of(context).padding.top + h(381),
              left: w(14),
              child: _buildIncludedBox(w, h),
            ),

            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + h(55),
              left: (screenWidth - w(360)) / 2,
              child: _buildContinueButton(w, h),
            ),

            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + h(10),
              left: (screenWidth - w(329)) / 2,
              child: SizedBox(
                width: w(329),
                height: h(34),
                child: Text(
                  'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer’s Terms.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: const Color(0xFF6E6F73),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      int index,
      double Function(double) w,
      double Function(double) h,
      String heartAsset,
      ) {
    bool isSelected = _selectedPlanIndex == index;

    Color bgColor = isSelected
        ? (_plans[index]['selectedColor'] ?? _plans[index]['defaultColor'])
        : _plans[index]['defaultColor'];

    Color borderColor = isSelected
        ? (_plans[index]['selectedBorderColor'] ?? _plans[index]['borderColor'])
        : _plans[index]['borderColor'];

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlanIndex = index;
        });
      },
      child: Container(
        width: w(index == 0 ? 168 : 166),
        height: h(146),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1),
        ),
        padding: EdgeInsets.symmetric(horizontal: w(12), vertical: h(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _plans[index]['title'],
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xFF22242B),
                  ),
                ),
                Image.asset(
                  heartAsset,
                  width: index == 0 ? w(35.2) : w(37.5),
                  height: index == 0 ? h(35.2) : h(37.5),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              _plans[index]['price'],
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: index == 0
                    ? const Color(0xFF5E1053)
                    : const Color(0xFFAD6906),
              ),
            ),
            const Spacer(),
            Text(
              index == 0
                  ? 'All of the below'
                  : isSelected
                  ? 'Mixer + VIP seating,\nfood & beverages'
                  : 'All 3 + VIP seating,\nfood & beverages',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: const Color(0xFF6E6F73),
              ),
            ),
            SizedBox(height: 3,)
          ],
        ),
      ),
    );
  }

  Widget _buildIncludedBox(double Function(double) w, double Function(double) h) {
    final plan = _plans[_selectedPlanIndex];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: w(350),
          height: _selectedPlanIndex == 1 ? h(204) : h(170),
          decoration: BoxDecoration(
            border: Border.all(
              color: _selectedPlanIndex == 1
                  ? const Color(0xFFF1CD95)
                  : const Color(0xFFEAB8CB),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h(24)),
              ...plan['features'].map<Widget>((f) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: w(20), vertical: h(6)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check,
                        size: 16,
                        color: _selectedPlanIndex == 1
                            ? const Color(0xFFE78A00)
                            : const Color(0xFF5E1053),
                      ),
                      SizedBox(width: w(10)),
                      Expanded(
                        child: Text(
                          f,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color(0xFF44464B),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
        Positioned(
          top: -h(12),
          left: (w(350) - w(180)) / 2,
          child: Container(
            width: w(180),
            padding: EdgeInsets.symmetric(horizontal: w(12), vertical: h(4)),
            decoration: BoxDecoration(
              color: _selectedPlanIndex == 1
                  ? const Color(0xFFFCF5EC)
                  : Colors.white,
              borderRadius: BorderRadius.circular(39),
              border: Border.all(
                color: _selectedPlanIndex == 1
                    ? const Color(0xFFF1CD95)
                    : const Color(0xFFEAB8CB),
              ),
            ),
            child: Center(
              child: Text(
                'Included with Mixer VIP',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: const Color(0xFF505254),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton(double Function(double) w, double Function(double) h) {
    final plan = _plans[_selectedPlanIndex];
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      child: Container(
        width: w(360),
        height: h(48),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(39),
          gradient: _selectedPlanIndex == 1
              ? const LinearGradient(
            colors: [
              Color(0xFFD59331),
              Color(0xFFA96F18),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : const LinearGradient(
            colors: [
              Color(0xFF880078),
              Color(0xFFD5144E),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/button_heart.png',
                width: 26,
                height: 23,
              ),
              const SizedBox(width: 3.5),
              Text(
                'Continue – ${plan['price']} total',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: _selectedPlanIndex == 1 ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}