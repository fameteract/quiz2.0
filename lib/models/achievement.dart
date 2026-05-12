class Achievement {
  final String id;
  final String title;
  final String description;
  final String icon;

  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });
}

const List<Achievement> allAchievements = [
  Achievement(id: 'first_win', title: 'Первая победа', description: 'Завершите первую викторину', icon: '🏆'),
  Achievement(id: 'perfect', title: 'Идеальный результат', description: 'Ответьте верно на все 10 вопросов', icon: '⭐'),
  Achievement(id: 'streak_3', title: 'Серия побед', description: 'Пройдите 3 викторины подряд с результатом 7+', icon: '🔥'),
  Achievement(id: 'all_categories', title: 'Эрудит', description: 'Пройдите викторину в 5 разных категориях', icon: '🎓'),
  Achievement(id: 'hard_win', title: 'Мастер', description: 'Наберите 8+ на сложном уровне', icon: '💎'),
  Achievement(id: 'play_10', title: 'Постоянный игрок', description: 'Сыграйте 10 викторин', icon: '🎮'),
];