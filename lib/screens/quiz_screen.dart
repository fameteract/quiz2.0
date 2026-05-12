import 'package:flutter/material.dart';
import '../models/question.dart';
import '../data/questions_data.dart';
import '../services/storage_service.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final String difficulty;

  const QuizScreen(
      {super.key, required this.category, required this.difficulty});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late List<Question> _questions;
  late List<String> _options;
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool _answered = false;
  late AnimationController _animController;
  late Animation<double> _progressAnim;

  @override
  void initState() {
    super.initState();
    _questions = getQuestions(widget.category, widget.difficulty);
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _progressAnim = Tween<double>(begin: 0, end: 1).animate(_animController);
    _loadOptions();
    _animController.forward();
  }

  void _loadOptions() {
    final q = _questions[_currentIndex];
    _options = [q.correctAnswer, ...q.incorrectAnswers]..shuffle();
  }

  void _selectAnswer(String answer) {
    if (_answered) return;
    final q = _questions[_currentIndex];
    final isCorrect = answer == q.correctAnswer;

    setState(() {
      _answered = true;
      _selectedAnswer = answer;
      if (isCorrect) _score++;
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      if (_currentIndex < _questions.length - 1) {
        setState(() {
          _currentIndex++;
          _answered = false;
          _selectedAnswer = null;
          _loadOptions();
        });
        _animController.forward(from: 0);
      } else {
        _finishQuiz();
      }
    });
  }

  Future<void> _finishQuiz() async {
    await StorageService.saveGameResult(
      score: _score,
      category: widget.category,
      difficulty: widget.difficulty,
    );
    final newAchievements = await StorageService.checkAndSaveAchievements(
        _score, widget.difficulty);
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          score: _score,
          total: _questions.length,
          category: widget.category,
          difficulty: widget.difficulty,
          newAchievements: newAchievements,
        ),
      ),
    );
  }

  Color _buttonColor(String option) {
    if (!_answered) return Colors.white;
    final q = _questions[_currentIndex];
    if (option == q.correctAnswer) return Colors.green.shade400;
    if (option == _selectedAnswer) return Colors.red.shade400;
    return Colors.white;
  }

  Color _buttonTextColor(String option) {
    if (!_answered) return Colors.black87;
    final q = _questions[_currentIndex];
    if (option == q.correctAnswer || option == _selectedAnswer) {
      return Colors.white;
    }
    return Colors.black87;
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Викторина')),
        body: const Center(child: Text('Нет вопросов для этой категории')),
      );
    }

    final q = _questions[_currentIndex];
    final progress = (_currentIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.category,
            style: const TextStyle(color: Colors.black87, fontSize: 16)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Прогресс
            Row(
              children: [
                Text('${_currentIndex + 1}/${_questions.length}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFF6200EE))),
                const SizedBox(width: 12),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation(Color(0xFF6200EE)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    Text(' $_score',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            // Вопрос
            FadeTransition(
              opacity: _progressAnim,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF6200EE),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6200EE).withOpacity(0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Text(q.question,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.4)),
              ),
            ),
            const SizedBox(height: 24),
            // Варианты ответов
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, i) {
                  final option = _options[i];
                  final isCorrect = _answered &&
                      option == _questions[_currentIndex].correctAnswer;
                  final isWrong =
                      _answered && option == _selectedAnswer && !isCorrect;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () => _selectAnswer(option),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: _buttonColor(option),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isCorrect
                                ? Colors.green.shade400
                                : isWrong
                                ? Colors.red.shade400
                                : Colors.grey.shade200,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(option,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: _buttonTextColor(option))),
                            ),
                            if (isCorrect)
                              const Icon(Icons.check_circle,
                                  color: Colors.white, size: 22),
                            if (isWrong)
                              const Icon(Icons.cancel,
                                  color: Colors.white, size: 22),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}