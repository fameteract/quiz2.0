import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'main_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _controller = TextEditingController();
  int _selectedAvatar = 0;

  final List<String> avatars = ['🦊', '🐯', '🦁', '🐺', '🦅', '🐉'];

  Future<void> _save() async {
    if (_controller.text.trim().isEmpty) return;
    await StorageService.saveName(_controller.text.trim());
    await StorageService.saveAvatar(_selectedAvatar);
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6200EE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Создай профиль',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 8),
              const Text('Как тебя зовут?',
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
              const SizedBox(height: 32),
              // Выбор аватара
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(avatars.length, (i) {
                  return GestureDetector(
                    onTap: () => setState(() => _selectedAvatar = i),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _selectedAvatar == i
                            ? Colors.white
                            : Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(avatars[i],
                          style: const TextStyle(fontSize: 28)),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Введи своё имя',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6200EE),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Начать играть',
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