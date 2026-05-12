import '../models/question.dart';

const Map<String, List<Question>> questionBank = {
  'Общие знания': [
    Question(category: 'Общие знания', difficulty: 'easy', question: 'Сколько цветов в радуге?', correctAnswer: '7', incorrectAnswers: ['5', '6', '8']),
    Question(category: 'Общие знания', difficulty: 'easy', question: 'Какая самая большая планета Солнечной системы?', correctAnswer: 'Юпитер', incorrectAnswers: ['Сатурн', 'Нептун', 'Уран']),
    Question(category: 'Общие знания', difficulty: 'easy', question: 'Сколько континентов на Земле?', correctAnswer: '7', incorrectAnswers: ['5', '6', '8']),
    Question(category: 'Общие знания', difficulty: 'easy', question: 'Какой газ растения поглощают при фотосинтезе?', correctAnswer: 'Углекислый газ', incorrectAnswers: ['Кислород', 'Азот', 'Водород']),
    Question(category: 'Общие знания', difficulty: 'medium', question: 'Какой элемент обозначается символом Au?', correctAnswer: 'Золото', incorrectAnswers: ['Серебро', 'Алюминий', 'Железо']),
    Question(category: 'Общие знания', difficulty: 'medium', question: 'В каком году началась Вторая мировая война?', correctAnswer: '1939', incorrectAnswers: ['1940', '1941', '1938']),
    Question(category: 'Общие знания', difficulty: 'medium', question: 'Какова скорость света в вакууме?', correctAnswer: '300 000 км/с', incorrectAnswers: ['150 000 км/с', '500 000 км/с', '100 000 км/с']),
    Question(category: 'Общие знания', difficulty: 'medium', question: 'Сколько костей в теле взрослого человека?', correctAnswer: '206', incorrectAnswers: ['186', '226', '256']),
    Question(category: 'Общие знания', difficulty: 'hard', question: 'Как называется самая маленькая кость человека?', correctAnswer: 'Стремечко', incorrectAnswers: ['Наковальня', 'Молоточек', 'Фаланга']),
    Question(category: 'Общие знания', difficulty: 'hard', question: 'Что такое апогей?', correctAnswer: 'Наиболее удалённая от Земли точка орбиты', incorrectAnswers: ['Ближайшая к Земле точка орбиты', 'Центр орбиты', 'Точка пересечения орбит']),
  ],
  'История': [
    Question(category: 'История', difficulty: 'easy', question: 'Кто был первым президентом США?', correctAnswer: 'Джордж Вашингтон', incorrectAnswers: ['Авраам Линкольн', 'Томас Джефферсон', 'Бенджамин Франклин']),
    Question(category: 'История', difficulty: 'easy', question: 'В каком году произошла Октябрьская революция в России?', correctAnswer: '1917', incorrectAnswers: ['1905', '1914', '1922']),
    Question(category: 'История', difficulty: 'easy', question: 'Кто написал «Войну и мир»?', correctAnswer: 'Лев Толстой', incorrectAnswers: ['Фёдор Достоевский', 'Антон Чехов', 'Александр Пушкин']),
    Question(category: 'История', difficulty: 'easy', question: 'В каком году Гагарин полетел в космос?', correctAnswer: '1961', incorrectAnswers: ['1957', '1965', '1969']),
    Question(category: 'История', difficulty: 'medium', question: 'Как звали последнего российского императора?', correctAnswer: 'Николай II', incorrectAnswers: ['Александр III', 'Пётр I', 'Александр II']),
    Question(category: 'История', difficulty: 'medium', question: 'В каком году пала Берлинская стена?', correctAnswer: '1989', incorrectAnswers: ['1991', '1985', '1993']),
    Question(category: 'История', difficulty: 'medium', question: 'Кто основал Санкт-Петербург?', correctAnswer: 'Пётр I', incorrectAnswers: ['Екатерина II', 'Иван Грозный', 'Александр I']),
    Question(category: 'История', difficulty: 'medium', question: 'Сколько лет длилась Столетняя война?', correctAnswer: '116 лет', incorrectAnswers: ['100 лет', '87 лет', '134 года']),
    Question(category: 'История', difficulty: 'hard', question: 'В каком году Россия приняла христианство?', correctAnswer: '988', incorrectAnswers: ['980', '1054', '862']),
    Question(category: 'История', difficulty: 'hard', question: 'Как называлась столица Византийской империи?', correctAnswer: 'Константинополь', incorrectAnswers: ['Афины', 'Рим', 'Александрия']),
  ],
  'Наука': [
    Question(category: 'Наука', difficulty: 'easy', question: 'Что такое H2O?', correctAnswer: 'Вода', incorrectAnswers: ['Кислород', 'Водород', 'Углекислый газ']),
    Question(category: 'Наука', difficulty: 'easy', question: 'Какой орган отвечает за перекачку крови?', correctAnswer: 'Сердце', incorrectAnswers: ['Лёгкие', 'Печень', 'Почки']),
    Question(category: 'Наука', difficulty: 'easy', question: 'Из чего состоит молекула воды?', correctAnswer: '2 атома водорода и 1 атом кислорода', incorrectAnswers: ['1 атом водорода и 2 атома кислорода', '2 атома кислорода и 1 атом водорода', '3 атома водорода']),
    Question(category: 'Наука', difficulty: 'medium', question: 'Кто открыл закон всемирного тяготения?', correctAnswer: 'Исаак Ньютон', incorrectAnswers: ['Альберт Эйнштейн', 'Галилео Галилей', 'Никола Тесла']),
    Question(category: 'Наука', difficulty: 'medium', question: 'Что изучает сейсмология?', correctAnswer: 'Землетрясения', incorrectAnswers: ['Звёзды', 'Океаны', 'Атмосферу']),
    Question(category: 'Наука', difficulty: 'medium', question: 'Какой учёный разработал теорию относительности?', correctAnswer: 'Альберт Эйнштейн', incorrectAnswers: ['Исаак Ньютон', 'Стивен Хокинг', 'Нильс Бор']),
    Question(category: 'Наука', difficulty: 'medium', question: 'Сколько хромосом в клетке человека?', correctAnswer: '46', incorrectAnswers: ['23', '48', '44']),
    Question(category: 'Наука', difficulty: 'hard', question: 'Что такое кварк?', correctAnswer: 'Элементарная частица', incorrectAnswers: ['Вид атома', 'Тип молекулы', 'Вид излучения']),
    Question(category: 'Наука', difficulty: 'hard', question: 'Какова температура плавления железа?', correctAnswer: '1538°C', incorrectAnswers: ['1200°C', '1800°C', '900°C']),
    Question(category: 'Наука', difficulty: 'hard', question: 'Как называется единица измерения электрического сопротивления?', correctAnswer: 'Ом', incorrectAnswers: ['Ватт', 'Ампер', 'Вольт']),
  ],
  'География': [
    Question(category: 'География', difficulty: 'easy', question: 'Какая самая длинная река в мире?', correctAnswer: 'Нил', incorrectAnswers: ['Амазонка', 'Янцзы', 'Миссисипи']),
    Question(category: 'География', difficulty: 'easy', question: 'Какая самая высокая гора в мире?', correctAnswer: 'Эверест', incorrectAnswers: ['К2', 'Килиманджаро', 'Эльбрус']),
    Question(category: 'География', difficulty: 'easy', question: 'Сколько океанов на Земле?', correctAnswer: '5', incorrectAnswers: ['4', '3', '6']),
    Question(category: 'География', difficulty: 'easy', question: 'Какая страна самая большая по площади?', correctAnswer: 'Россия', incorrectAnswers: ['Китай', 'США', 'Канада']),
    Question(category: 'География', difficulty: 'easy', question: 'Столица Франции?', correctAnswer: 'Париж', incorrectAnswers: ['Лион', 'Марсель', 'Бордо']),
    Question(category: 'География', difficulty: 'medium', question: 'Какое самое глубокое озеро в мире?', correctAnswer: 'Байкал', incorrectAnswers: ['Каспийское море', 'Танганьика', 'Верхнее']),
    Question(category: 'География', difficulty: 'medium', question: 'Как называется самый большой остров в мире?', correctAnswer: 'Гренландия', incorrectAnswers: ['Австралия', 'Борнео', 'Мадагаскар']),
    Question(category: 'География', difficulty: 'medium', question: 'Какая столица Австралии?', correctAnswer: 'Канберра', incorrectAnswers: ['Сидней', 'Мельбурн', 'Брисбен']),
    Question(category: 'География', difficulty: 'hard', question: 'Какая самая длинная горная цепь в мире?', correctAnswer: 'Анды', incorrectAnswers: ['Гималаи', 'Скалистые горы', 'Альпы']),
    Question(category: 'География', difficulty: 'hard', question: 'Через сколько часовых поясов проходит Россия?', correctAnswer: '11', incorrectAnswers: ['9', '12', '8']),
  ],
  'Спорт': [
    Question(category: 'Спорт', difficulty: 'easy', question: 'Сколько игроков в футбольной команде на поле?', correctAnswer: '11', incorrectAnswers: ['10', '12', '9']),
    Question(category: 'Спорт', difficulty: 'easy', question: 'В какой стране зародились Олимпийские игры?', correctAnswer: 'Греция', incorrectAnswers: ['Рим', 'Египет', 'Китай']),
    Question(category: 'Спорт', difficulty: 'easy', question: 'Сколько колец в олимпийском символе?', correctAnswer: '5', incorrectAnswers: ['4', '6', '3']),
    Question(category: 'Спорт', difficulty: 'medium', question: 'Сколько геймов нужно выиграть в сете в теннисе?', correctAnswer: '6', incorrectAnswers: ['5', '7', '4']),
    Question(category: 'Спорт', difficulty: 'medium', question: 'Какова длина марафонской дистанции?', correctAnswer: '42,195 км', incorrectAnswers: ['40 км', '45 км', '50 км']),
    Question(category: 'Спорт', difficulty: 'medium', question: 'Сколько очков даётся за трёхочковый бросок в баскетболе?', correctAnswer: '3', incorrectAnswers: ['2', '4', '1']),
    Question(category: 'Спорт', difficulty: 'hard', question: 'Кто выиграл больше всего титулов Большого шлема среди мужчин?', correctAnswer: 'Новак Джокович', incorrectAnswers: ['Рафаэль Надаль', 'Роджер Федерер', 'Пит Сампрас']),
    Question(category: 'Спорт', difficulty: 'hard', question: 'Какой вид спорта называют «игрой джентльменов»?', correctAnswer: 'Крикет', incorrectAnswers: ['Гольф', 'Поло', 'Регби']),
    Question(category: 'Спорт', difficulty: 'hard', question: 'На каком покрытии проводится Уимблдонский турнир?', correctAnswer: 'Трава', incorrectAnswers: ['Грунт', 'Хард', 'Ковёр']),
    Question(category: 'Спорт', difficulty: 'hard', question: 'В каком году прошли первые современные Олимпийские игры?', correctAnswer: '1896', incorrectAnswers: ['1900', '1892', '1904']),
  ],
  'Кино': [
    Question(category: 'Кино', difficulty: 'easy', question: 'Кто сыграл Железного человека в киновселенной Marvel?', correctAnswer: 'Роберт Дауни мл.', incorrectAnswers: ['Крис Эванс', 'Крис Хемсворт', 'Марк Руффало']),
    Question(category: 'Кино', difficulty: 'easy', question: 'Как называется самый кассовый фильм всех времён?', correctAnswer: 'Аватар', incorrectAnswers: ['Мстители: Финал', 'Титаник', 'Звёздные войны']),
    Question(category: 'Кино', difficulty: 'easy', question: 'Кто сыграл главную роль в фильме «Форрест Гамп»?', correctAnswer: 'Том Хэнкс', incorrectAnswers: ['Том Круз', 'Брэд Питт', 'Кевин Костнер']),
    Question(category: 'Кино', difficulty: 'medium', question: 'В каком году вышел первый фильм о Гарри Поттере?', correctAnswer: '2001', incorrectAnswers: ['1999', '2000', '2002']),
    Question(category: 'Кино', difficulty: 'medium', question: 'Кто снял фильм «Андрей Рублёв»?', correctAnswer: 'Андрей Тарковский', incorrectAnswers: ['Сергей Эйзенштейн', 'Никита Михалков', 'Элем Климов']),
    Question(category: 'Кино', difficulty: 'medium', question: 'Какой фильм Кубрика основан на романе Артура Кларка?', correctAnswer: '2001: Космическая одиссея', incorrectAnswers: ['Заводной апельсин', 'Сияние', 'Барри Линдон']),
    Question(category: 'Кино', difficulty: 'hard', question: 'Как называется приём монтажа, открытый Эйзенштейном?', correctAnswer: 'Монтаж аттракционов', incorrectAnswers: ['Параллельный монтаж', 'Рирпроекция', 'Метод Станиславского']),
    Question(category: 'Кино', difficulty: 'hard', question: 'Какой фильм получил первый «Оскар» в истории?', correctAnswer: 'Крылья (1927)', incorrectAnswers: ['Бродвейская мелодия', 'Большой парад', 'Седьмое небо']),
    Question(category: 'Кино', difficulty: 'hard', question: 'Кто является автором термина «монтаж» в кино?', correctAnswer: 'Лев Кулешов', incorrectAnswers: ['Сергей Эйзенштейн', 'Дзига Вертов', 'Всеволод Пудовкин']),
    Question(category: 'Кино', difficulty: 'hard', question: 'В каком году вышел фильм «Броненосец Потёмкин»?', correctAnswer: '1925', incorrectAnswers: ['1920', '1930', '1917']),
  ],
};

List<Question> getQuestions(String category, String difficulty) {
  final all = List<Question>.from(questionBank[category] ?? []);
  final filtered = all.where((q) => q.difficulty == difficulty).toList();
  filtered.shuffle();
  return filtered.take(10).toList();
}