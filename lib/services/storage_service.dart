import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/achievement.dart';

class StorageService {
  static const _keyName = 'user_name';
  static const _keyAvatar = 'user_avatar';
  static const _keyTotalGames = 'total_games';
  static const _keyTotalScore = 'total_score';
  static const _keyBestScore = 'best_score';
  static const _keyAchievements = 'achievements';
  static const _keyHistory = 'history';
  static const _keyStreak = 'streak';
  static const _keyCategoriesPlayed = 'categories_played';

  static Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  static Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName) ?? '';
  }

  static Future<void> saveAvatar(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyAvatar, index);
  }

  static Future<int> getAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyAvatar) ?? 0;
  }

  static Future<void> saveGameResult({
    required int score,
    required String category,
    required String difficulty,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final totalGames = (prefs.getInt(_keyTotalGames) ?? 0) + 1;
    final totalScore = (prefs.getInt(_keyTotalScore) ?? 0) + score;
    final bestScore = score > (prefs.getInt(_keyBestScore) ?? 0)
        ? score
        : (prefs.getInt(_keyBestScore) ?? 0);

    await prefs.setInt(_keyTotalGames, totalGames);
    await prefs.setInt(_keyTotalScore, totalScore);
    await prefs.setInt(_keyBestScore, bestScore);

    // Серия
    final streak = score >= 7
        ? (prefs.getInt(_keyStreak) ?? 0) + 1
        : 0;
    await prefs.setInt(_keyStreak, streak);

    // Категории
    final cats = prefs.getStringList(_keyCategoriesPlayed) ?? [];
    if (!cats.contains(category)) cats.add(category);
    await prefs.setStringList(_keyCategoriesPlayed, cats);

    // История
    final history = prefs.getStringList(_keyHistory) ?? [];
    history.insert(0, jsonEncode({
      'score': score,
      'category': category,
      'difficulty': difficulty,
      'date': DateTime.now().toIso8601String(),
    }));
    if (history.length > 20) history.removeLast();
    await prefs.setStringList(_keyHistory, history);
  }

  static Future<Map<String, dynamic>> getStats() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'totalGames': prefs.getInt(_keyTotalGames) ?? 0,
      'totalScore': prefs.getInt(_keyTotalScore) ?? 0,
      'bestScore': prefs.getInt(_keyBestScore) ?? 0,
      'streak': prefs.getInt(_keyStreak) ?? 0,
      'categoriesPlayed': prefs.getStringList(_keyCategoriesPlayed) ?? [],
    };
  }

  static Future<List<Map<String, dynamic>>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_keyHistory) ?? [];
    return history.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }

  static Future<List<String>> getUnlockedAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyAchievements) ?? [];
  }

  static Future<List<String>> checkAndSaveAchievements(
      int score, String difficulty) async {
    final prefs = await SharedPreferences.getInstance();
    final unlocked = prefs.getStringList(_keyAchievements) ?? [];
    final newlyUnlocked = <String>[];

    final totalGames = prefs.getInt(_keyTotalGames) ?? 0;
    final streak = prefs.getInt(_keyStreak) ?? 0;
    final cats = prefs.getStringList(_keyCategoriesPlayed) ?? [];

    void check(String id, bool condition) {
      if (condition && !unlocked.contains(id)) {
        unlocked.add(id);
        newlyUnlocked.add(id);
      }
    }

    check('first_win', totalGames >= 1);
    check('perfect', score == 10);
    check('streak_3', streak >= 3);
    check('all_categories', cats.length >= 5);
    check('hard_win', difficulty == 'hard' && score >= 8);
    check('play_10', totalGames >= 10);

    await prefs.setStringList(_keyAchievements, unlocked);
    return newlyUnlocked;
  }
}