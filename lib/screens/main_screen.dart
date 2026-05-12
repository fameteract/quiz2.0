import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../data/questions_data.dart';
import 'quiz_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? selectedCategory;
  String? selectedDifficulty;
  String _userName = '';
  int _avatarIndex = 0;

  final List<String> categories = questionBank.keys.toList();

  final Map<String, String> difficulties = {
    'easy': 'Лёгкий',
    'medium': 'Средний',
    'hard': 'Сложный',
  };

  final Map<String, IconData> categoryIcons = {
    'Общие знания': Icons.lightbulb_outline,
    'История': Icons.history_edu,
    'Наука': Icons.science_outlined,
    'География': Icons.public,
    'Спорт': Icons.sports_soccer,
    'Кино': Icons.movie_outlined,
  };

  final List<String> avatars = ['🦊', '🐯', '🦁', '🐺', '🦅', '🐉'];

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final name = await StorageService.getName();
    final avatar = await StorageService.getAvatar();
    if (mounted) setState(() { _userName = name; _avatarIndex = avatar; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Шапка с профилем
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()))
                        .then((_) => _loadProfile()),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6200EE),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(avatars[_avatarIndex],
                          style: const TextStyle(fontSize: 24)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Привет, $_userName!',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Text('Готов к викторине?',
                            style: TextStyle(
                                color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Text('Выбери тему',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              // Сетка категорий
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = selectedCategory == cat;
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategory = cat),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6200EE)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF6200EE)
                              : Colors.grey.shade200,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? const Color(0xFF6200EE).withOpacity(0.3)
                                : Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categoryIcons[cat] ?? Icons.quiz,
                            size: 32,
                            color: isSelected ? Colors.white : const Color(0xFF6200EE),
                          ),
                          const SizedBox(height: 8),
                          Text(cat,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected ? Colors.white : Colors.black87)),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text('Сложность',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Row(
                children: difficulties.entries.map((entry) {
                  final isSelected = selectedDifficulty == entry.key;
                  final colors = {
                    'easy': Colors.green,
                    'medium': Colors.orange,
                    'hard': Colors.red,
                  };
                  final color = colors[entry.key]!;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          setState(() => selectedDifficulty = entry.key),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: isSelected ? color : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: isSelected ? color : Colors.grey.shade200),
                        ),
                        child: Text(entry.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : color)),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedCategory != null && selectedDifficulty != null
                      ? () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(
                          category: selectedCategory!,
                          difficulty: selectedDifficulty!,
                        ),
                      ))
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6200EE),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                  ),
                  child: const Text('Начать викторину',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}