import 'package:flutter/material.dart';
import '../models/achievement.dart';
import 'main_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final String category;
  final String difficulty;
  final List<String> newAchievements;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.category,
    required this.difficulty,
    required this.newAchievements,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (score / total * 100).round();
    final String message;
    final Color color;
    final String emoji;

    if (score == total) {
      message = 'Идеальный результат!';
      color = Colors.green;
      emoji = '🏆';
    } else if (percent >= 70) {
      message = 'Отличная работа!';
      color = const Color(0xFF6200EE);
      emoji = '⭐';
    } else if (percent >= 40) {
      message = 'Неплохо!';
      color = Colors.orange;
      emoji = '👍';
    } else {
      message = 'Попробуй ещё раз!';
      color = Colors.red;
      emoji = '💪';
    }

    final diffNames = {'easy': 'Лёгкий', 'medium': 'Средний', 'hard': 'Сложный'};

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 72)),
              const SizedBox(height: 16),
              Text(message,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: color)),
              const SizedBox(height: 8),
              Text('$category · ${diffNames[difficulty]}',
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 32),
              // Счёт
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Text('$score / $total',
                        style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                            color: color)),
                    Text('правильных ответов',
                        style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: score / total,
                        minHeight: 10,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation(color),
                      ),
                    ),
                  ],
                ),
              ),
              // Новые достижения
              if (newAchievements.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text('🎉 Новые достижения!',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...newAchievements.map((id) {
                  final ach =
                  allAchievements.firstWhere((a) => a.id == id);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber.shade200),
                    ),
                    child: Row(
                      children: [
                        Text(ach.icon,
                            style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ach.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(ach.description,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600)),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .popUntil((route) => route.isFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6200EE),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Вернуться в меню',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}