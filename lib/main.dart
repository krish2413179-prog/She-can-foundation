import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(const FundraisingApp());
}


class Leaderboard {
  final String name;
  final int score;
  final String avatarUrl;

  Leaderboard({required this.name, required this.score, required this.avatarUrl});
}


class Announcements {
  final String title;
  final String content;
  final String date;

  Announcements({required this.title, required this.content, required this.date});
}


final List<Leaderboard> mockLeaderboard = [
  Leaderboard(name: 'Priya Sharma', score: 7500, avatarUrl: 'https://placehold.co/100x100/EFEFEF/333333?text=PS'),
  Leaderboard(name: 'Krish Sharma', score: 6800, avatarUrl: 'https://placehold.co/100x100/EFEFEF/333333?text=RV'),
  Leaderboard(name: 'Diya Sharma', score: 6500, avatarUrl: 'https://placehold.co/100x100/EFEFEF/333333?text=AK'),
  Leaderboard(name: 'Vikram Singh', score: 5200, avatarUrl: 'https://placehold.co/100x100/EFEFEF/333333?text=VS'),
  Leaderboard(name: 'Neha Sharma', score: 4800, avatarUrl: 'https://placehold.co/100x100/EFEFEF/333333?text=NR'),
];

final List<Announcements> Announcements1 = [
  Announcements(title: 'New Rewards', content: 'Congratulations! You\'ve hit your first milestone. Check the rewards section for a new reward.', date: 'Aug 05, 2025'),
  Announcements(title: 'Weekly  Session', content: 'Join us this Friday at 4 PM for a live Q&A ', date: 'Aug 01, 2025'),
];



class FundraisingApp extends StatelessWidget {
  const FundraisingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Fundraising Project',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        textTheme: GoogleFonts.interTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.inter(textStyle: textTheme.bodyMedium),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87),
          titleTextStyle: GoogleFonts.inter(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: Colors.grey[200]!, width: 1),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=296,fit=crop,q=95/Aq2NJ23MzBH2rx2j/she-YlenJon1O7ieeEoa.jpg',
                    height: 120,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Intern Portal',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const MainPage()),
                      );
                    },
                    child: Text('Login', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 20),
                  Text('Sign Up', style: GoogleFonts.inter(color: Colors.white70)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    DashboardPage(),
    LeaderboardPage(),
    AnnouncementsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[600],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
        ],
      ),
    );
  }
}



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Stack(
        fit: StackFit.expand,
        children: [

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/abstract_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Page Content
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            children: [
              _buildWelcomeSection(),
              _buildDonationCard(),
              _buildRewardsSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, KRISH!',
            style: GoogleFonts.inter(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Referral Code: KRISH2006',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationCard() {
    return Card(
      // Made card slightly transparent
      color: Colors.deepPurple.withOpacity(0.85),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Total Donations Raised',
              style: GoogleFonts.inter(color: Colors.white.withOpacity(0.9), fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '₹5,250',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            'Rewards ',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ),
        _buildRewardCard('Certificate of Appreciation', 'Reach ₹2,500', true),
        _buildRewardCard('Official Merch', 'Reach ₹5,000', true),
      ],
    );
  }

  Widget _buildRewardCard(String title, String requirement, bool unlocked) {
    return Card(
      // Made card slightly transparent
      color: Colors.white.withOpacity(0.85),
      child: ListTile(
        leading: Icon(
          unlocked ? Icons.check_circle : Icons.lock_outline,
          color: unlocked ? Colors.green : Colors.grey,
          size: 30,
        ),
        title: Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
        subtitle: Text(requirement),
        tileColor: unlocked ? Colors.green.withOpacity(0.05) : null,
      ),
    );
  }
}

// --- MODIFIED LEADERBOARD PAGE ---
class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/abstract_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Page Content
          ListView.builder(
            itemCount: mockLeaderboard.length,
            itemBuilder: (context, index) {
              final user = mockLeaderboard[index];
              return Card(
                // Made card slightly transparent
                color: Colors.white.withOpacity(0.85),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl),
                    child: (index < 3) ? _getMedal(index) : null,
                  ),
                  title: Text(user.name, style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                  trailing: Text('₹${user.score}', style: GoogleFonts.inter(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getMedal(int index) {
    switch (index) {
      case 0:
        return const Text('🥇', style: TextStyle(fontSize: 20));
      case 1:
        return const Text('🥈', style: TextStyle(fontSize: 20));
      case 2:
        return const Text('🥉', style: TextStyle(fontSize: 20));
      default:
        return const SizedBox.shrink();
    }
  }
}

// --- MODIFIED ANNOUNCEMENTS PAGE ---
class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Announcements')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/abstract_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Page Content
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: Announcements1.length,
            itemBuilder: (context, index) {
              final announcement = Announcements1[index];
              return Card(
                // Made card slightly transparent
                color: Colors.white.withOpacity(0.85),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(announcement.title, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(announcement.date, style: GoogleFonts.inter(color: Colors.grey[600], fontSize: 12)),
                      const SizedBox(height: 12),
                      Text(announcement.content, style: GoogleFonts.inter(fontSize: 14, height: 1.5)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}