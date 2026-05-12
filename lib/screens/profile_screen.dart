import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../models/achievement.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> _stats = {};
  List<String> _unlockedAchievements = [];
  String _name = '';
  int _avatarIndex = 0;
  final List<String> avatars = ['🦊', '🐯', '🦁', '🐺', '🦅', '🐉'];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stats = await StorageService.getStats();
    final ach = await StorageService.getUnlockedAchievements();
    final name = await StorageService.getName();
    final avatar = await StorageService.getAvatar();
    if (mounted) {
      setState(() {
        _stats = stats;
        _unlockedAchievements = ach;
        _name = name;
        _avatarIndex = avatar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalGames = _stats['totalGames'] ?? 0;
    final bestScore = _stats['bestScore'] ?? 0;
    final avgScore = totalGames > 0
        ? ((_stats['totalScore'] ?? 0) / totalGames).toStringAsFixed(1)
        : '0';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FF),
      appBar: AppBar(
        title: const Text('Мой профиль'),
        backgroundColor: const Color(0xFF6200EE),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Профиль
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF6200EE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(avatars[_avatarIndex],
                      style: const TextStyle(fontSize: 56)),
                  const SizedBox(height: 8),
                  Text(_name,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Статистика
            Row(
              children: [
                _statCard('Игр', '$totalGames', Icons.sports_esports),
                const SizedBox(width: 12),
                _statCard('Рекорд', '$bestScore/10', Icons.emoji_events),
                const SizedBox(width: 12),
                _statCard('Среднее', avgScore, Icons.bar_chart),
              ],
            ),
            const SizedBox(height: 24),
            // Достижения
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Достижения (${_unlockedAchievements.length}/${allAchievements.length})',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            ...allAchievements.map((ach) {
              final unlocked = _unlockedAchievements.contains(ach.id);
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: unlocked ? Colors.white : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: unlocked
                        ? Colors.amber.shade300
                        : Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                        unlocked ? ach.icon : '🔒',
                        style: TextStyle(
                            fontSize: 28,
                            color: unlocked ? null : Colors.grey)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ach.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: unlocked
                                      ? Colors.black87
                                      : Colors.grey)),
                          Text(ach.description,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: unlocked
                                      ? Colors.grey.shade600
                                      : Colors.grey.shade400)),
                        ],
                      ),
                    ),
                    if (unlocked)
                      const Icon(Icons.check_circle,
                          color: Colors.amber, size: 20),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF6200EE), size: 24),
            const SizedBox(height: 6),
            Text(value,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label,
                style: TextStyle(
                    fontSize: 12, color: Colors.grey.shade500)),
          ],
        ),
      ),
    );
  }
}