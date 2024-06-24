import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en', 'kk'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
    String? kkText = '',
  }) =>
      [ruText, enText, kkText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // mainPage
  {
    'kj98k9ed': {
      'ru': 'Главная',
      'en': 'home',
      'kk': 'Басты бет',
    },
    'gfftilfo': {
      'ru': 'Есильский район',
      'en': 'Yesilsky district',
      'kk': 'Есіл ауданы',
    },
    'tuy7z9md': {
      'ru': '5.0',
      'en': '5.0',
      'kk': '5.0',
    },
    'vtx4ms5x': {
      'ru': '~500м - 1000м',
      'en': '~500m - 1000m',
      'kk': '~500м - 1000м',
    },
    'dlx6wybb': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // regPage
  {
    'gplcje70': {
      'ru': 'Salem Taraz',
      'en': 'Salem Taraz',
      'kk': 'Салем Тараз',
    },
    'jwazstge': {
      'ru': 'Введите данные',
      'en': 'Enter data',
      'kk': 'Деректерді енгізіңіз',
    },
    'abbbg9jq': {
      'ru': 'Имя...',
      'en': 'Name...',
      'kk': 'Аты...',
    },
    'zmlum727': {
      'ru': 'Почта...',
      'en': 'Mail...',
      'kk': 'Пошта...',
    },
    'di232crm': {
      'ru': 'Пароль...',
      'en': 'Password...',
      'kk': 'Құпия сөз...',
    },
    'y05slkrb': {
      'ru': 'Подтверждение пароля...',
      'en': 'Password confirmation...',
      'kk': 'Құпиясөзді растау...',
    },
    'h67e53im': {
      'ru': 'Уже есть аккаунт?',
      'en': 'Already have an account?',
      'kk': 'Парақшаңыз бар ма?',
    },
    'gakoedkb': {
      'ru': 'Войти',
      'en': 'Log in',
      'kk': 'Кіру',
    },
    'bmo51kyf': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'kk': 'Тіркелу',
    },
    'uvl81f7p': {
      'ru': 'withLove',
      'en': 'withLove',
      'kk': 'withLove',
    },
    '36gtirti': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // authPage
  {
    'hdxprw3o': {
      'ru': 'Salem Taraz',
      'en': 'Salem Taraz',
      'kk': 'Салем Тараз',
    },
    'ltjxtejq': {
      'ru': 'Введите данные',
      'en': 'Enter data',
      'kk': 'Деректерді енгізіңіз',
    },
    '4qozbepy': {
      'ru': 'Почта...',
      'en': 'Mail...',
      'kk': 'Пошта...',
    },
    '7y4wb7yk': {
      'ru': 'Пароль...',
      'en': 'Password...',
      'kk': 'Құпия сөз...',
    },
    'stvctz2f': {
      'ru': 'Нет аккаунта?',
      'en': 'Don\'t have an account?',
      'kk': 'Парақшаңыз жоқ па?',
    },
    'kvq68b03': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'kk': 'Тіркелу',
    },
    'xsybg0jd': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot your password?',
      'kk': 'Құпия сөзіңізді ұмыттыңыз ба?',
    },
    'qyxlkqg4': {
      'ru': 'Войти',
      'en': 'To come in',
      'kk': 'Кіру үшін',
    },
    'wew7sdw9': {
      'ru': 'withLove',
      'en': 'withLove',
      'kk': 'withLove',
    },
    '2g6ro7zi': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // profilePage
  {
    'r3f3y419': {
      'ru': 'Редактировать',
      'en': 'Edit',
      'kk': 'Өңдеу',
    },
    'mpg6fvs6': {
      'ru': 'подписчиков',
      'en': 'subscribers',
      'kk': 'Жазылушылар',
    },
    'iwvr679d': {
      'ru': 'статей',
      'en': 'articles',
      'kk': 'Мақалалар',
    },
    'cohzwjed': {
      'ru': 'подписок',
      'en': 'subscriptions',
      'kk': 'Жазылымдар',
    },
    'tk6j46zp': {
      'ru': 'Сохраненные места',
      'en': 'Saved Places',
      'kk': 'Сақталған орындар',
    },
    '3bc8gwvw': {
      'ru': 'История путешествий',
      'en': 'Travel history',
      'kk': 'Саяхат тарихы',
    },
    'nk66qzry': {
      'ru': 'Мои статьи',
      'en': 'My articles',
      'kk': 'Менің мақалаларым',
    },
    'i5pbx9el': {
      'ru': 'Поменять язык',
      'en': 'Change language',
      'kk': 'Тілді өзгерту',
    },
    '2dodgip5': {
      'ru': 'Выйти',
      'en': 'Go out',
      'kk': 'Шығу',
    },
    '9sqxaqed': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // articlePage
  {
    'mgus8r5t': {
      'ru': 'Статьи',
      'en': 'Articles',
      'kk': 'Мақалалар',
    },
    'gb0gwtwz': {
      'ru': '21 минут назад',
      'en': '21 minutes ago',
      'kk': '21 минут бұрын',
    },
    '18kljctp': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // friendsPage
  {
    's1t5mgdc': {
      'ru': 'Туристы',
      'en': 'Tourists',
      'kk': 'Туристер',
    },
    'pyti881e': {
      'ru': 'Ищут партнера',
      'en': 'Looking for a partner',
      'kk': 'Серіктес іздеуде',
    },
    'hq8drojk': {
      'ru': 'Совместные путешествия',
      'en': 'Traveling together',
      'kk': 'Бірге саяхаттау',
    },
    '1h88b4p2': {
      'ru': 'участников',
      'en': 'participants',
      'kk': 'Қатысушылар',
    },
    'pm8p62tc': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // sightPage
  {
    'f6aj3mxy': {
      'ru': '5.0',
      'en': '5.0',
      'kk': '5.0',
    },
    'jbd503nw': {
      'ru': '(105 отзывов)',
      'en': '(105 reviews)',
      'kk': '(105 шолу)',
    },
    'uc6wetis': {
      'ru': 'Похожие места',
      'en': 'Similar places',
      'kk': 'Ұқсас орындар',
    },
    'ds7j5i52': {
      'ru': 'Отзывы',
      'en': 'Reviews',
      'kk': 'Пікірлер',
    },
    'vjhyb6lv': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // favAreasPage
  {
    'nybrb631': {
      'ru': 'Сохраненные места',
      'en': 'Saved Places',
      'kk': 'Сақталған орындар',
    },
    'd4r814cn': {
      'ru': '5.0',
      'en': '5.0',
      'kk': '5.0',
    },
    'ov26tpiu': {
      'ru': '~500м - 1000м',
      'en': '~500m - 1000m',
      'kk': '~500м - 1000м',
    },
    'xoxa4n5k': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // createArticlePage
  {
    '5n0xmi99': {
      'ru': 'Написать статью',
      'en': 'To write an article',
      'kk': 'Мақала жазу үшін',
    },
    'b2kvh1t7': {
      'ru': 'Заголовок',
      'en': 'Heading',
      'kk': 'Тақырып',
    },
    'kjadgl8v': {
      'ru': 'Напишите текст...',
      'en': 'Write the text...',
      'kk': 'Мәтінді жаз...',
    },
    'd2bj15oe': {
      'ru': 'Опубликовать',
      'en': 'Publish',
      'kk': 'Жариялау',
    },
    '0tp32s2e': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // trash
  {
    'nb4o20sv': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // readingArticlePage
  {
    'gumo2kkx': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // myArticlesPage
  {
    '75vr07rq': {
      'ru': 'Мои статьи',
      'en': 'My articles',
      'kk': 'Менің мақалаларым',
    },
    'ws97qjns': {
      'ru': '21 минут назад',
      'en': '21 minutes ago',
      'kk': '21 минут бұрын',
    },
    'c1h0s82k': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // lobbyPage
  {
    'tdc0zs9h': {
      'ru': 'Покорители Тараза',
      'en': 'Conquerors of Taraz',
      'kk': 'Таразды жаулап алушылар',
    },
    'xawtzydd': {
      'ru': 'участников',
      'en': 'participants',
      'kk': 'Қатысушылар',
    },
    'wmjeg1bk': {
      'ru': 'Присоединиться',
      'en': 'Join',
      'kk': 'Қосылыңыз',
    },
    'ml5xwlfq': {
      'ru': 'Чат',
      'en': 'Chat',
      'kk': 'Чат',
    },
    'uf2u2tcv': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // editProfilePage
  {
    'smxps5sl': {
      'ru': 'Сохранить',
      'en': 'Save',
      'kk': 'Сақтау',
    },
    '2webdjel': {
      'ru': 'Поменять фото',
      'en': 'Change photo',
      'kk': 'Фотосуретті өзгерту',
    },
    'bphj4bld': {
      'ru': 'Жумабай Даулет  ',
      'en': 'Zhumabay Daulet',
      'kk': 'Жұмабай Дәулет',
    },
    'bk0w9hxf': {
      'ru': 'Турист',
      'en': 'Tourist',
      'kk': 'Турист',
    },
    'zbozn1uv': {
      'ru': 'Житель',
      'en': 'Inhabitant',
      'kk': 'Тұрғын',
    },
    'xnz674kh': {
      'ru': 'Писатель',
      'en': 'Writer',
      'kk': 'Жазушы',
    },
    'hmz8jkrm': {
      'ru': 'Search for an item...',
      'en': 'Search for an item...',
      'kk': 'Элементті іздеу...',
    },
    'l3s69coo': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Басты бет',
    },
  },
  // chatPersonPage
  {
    'bmao17io': {
      'ru':
          '1. Специальное предложение: УЗИ четырех  любых органов по сниженной цене! Теперь всего за 15 000 тенге вместо обычных 30 000 тенге.\n+Бесплатная консультация\n\nБрюшная полость\nПочки\nПечень \nЖелчный пузырь\nПлевральная полость\nПоджелудочная железа \nНадпочечники\nПредстательная железа\nМочевой пузырь\nЩитовидная железа\nМолочная железа\nОрганы малого таза\nФолликулометрия\nМошонка\nЛонного сочленения\nРанний срок беременности\nПоверхностные органы\n\n\n2. Гинекологические заболевания у женщин\n\n- Нарушение менструального цикла\n- Молочница\n- Эрозия шейки матки\n- Миома матки\n- Воспаление придатков\n- Эндометриоз\n- Кольпит\n- Мастит\n\nУзи для профилактики этих болезней за 9900 тенге \n+ Консультация гинеколога\n\n\n3. Акция «Семейный CHECK-UP Мама+Ребенок»\nКомпексное УЗИ печени, желчного пузыря, поджелудочной железы, селезенка почка\n\nПолный | 33 000 тенге\n+ Консультация гинеколога',
      'en':
          '1. Special offer: Ultrasound of any four organs at a reduced price! Now for only 15,000 tenge instead of the usual 30,000 tenge.\n+Free consultation\n\nAbdomen\nKidneys\nLiver \nGallbladder\nPleural cavity\nPancreas \nAdrenal glands\nProstate\nBladder\nThyroid\nBreast\nPelvic organs\nFolliculometry\nScrotum\nsymphysis pubis\nEarly pregnancy\nSuperficial organs\n\n\n2. Gynecological diseases in women\n\n- Menstrual irregularities\n- Thrush\n- Cervical erosion\n- Uterine fibroids\n- Inflammation of the appendages\n- Endometriosis\n- Colpitis\n- Mastitis\n\nUltrasound for the prevention of these diseases for 9900 tenge \n+ Consultation with a gynecologist\n\n\n3. Promotion “Family CHECK-UP Mom + Child”\nComprehensive ultrasound of the liver, gallbladder, pancreas, spleen, kidney\n\nFull | 33,000 tenge\n+ Consultation with a gynecologist',
      'kk':
          '1. Арнайы ұсыныс: Кез келген төрт мүшені УДЗ жеңілдетілген бағамен! Енді әдеттегі 30 000 теңгенің орнына небәрі 15 000 теңгеге.\n+Тегін кеңес беру\n\nІш\nБүйрек\nБауыр \nӨт қабы\nПлевра қуысы\nҰйқы безі \nБүйрек үсті бездері\nПростата\nҚуық\nҚалқанша безі\nСүт безі\nЖамбас мүшелері\nФолликулометрия\nЖұлын\nсимфиз pubis\nЕрте жүктілік\nБеткей мүшелер\n\n\n2. Әйелдердің гинекологиялық аурулары\n\n- етеккір циклінің бұзылуы\n- молочница\n- жатыр мойны эрозиясы\n- Жатыр миомасы\n- қосалқылардың қабынуы\n- Эндометриоз\n- Колпит\n- Мастит\n\nОсы аурулардың алдын алу үшін УДЗ 9900 теңгеге \n+ Гинекологтың кеңесі\n\n\n3. «Отбасылық CHECK-UP ана + бала» акциясы\nБауырдың, өт қабының, ұйқы безінің, көкбауырдың, бүйректің кешенді ультрадыбыстық зерттеуі\n\nТолық | 33 000 теңге\n+ Гинекологтың кеңесі',
    },
    'eauglh36': {
      'ru': 'Hello World',
      'en': 'Hello World',
      'kk': 'Сәлем Әлем',
    },
    'm5hgbnwz': {
      'ru': 'Home',
      'en': 'Home',
      'kk': 'Үй',
    },
  },
  // mapPage
  {
    'sw4tj6am': {
      'ru': 'Home',
      'en': '',
      'kk': '',
    },
  },
  // addDos
  {
    '0nrts3g4': {
      'ru': 'Добавить достопримечательность',
      'en': 'Add point of interest',
      'kk': 'Қызықты нүкте қосыңыз',
    },
    '7onv9ej8': {
      'ru': 'Название',
      'en': 'Name',
      'kk': 'Аты',
    },
    '46dbhg7r': {
      'ru': 'Select Location',
      'en': '',
      'kk': '',
    },
    't8rl930b': {
      'ru': 'Район',
      'en': 'Area',
      'kk': 'Аудан',
    },
    'rzhuvi43': {
      'ru': 'Описание',
      'en': 'Description',
      'kk': 'Сипаттама',
    },
    '6ikx4x8s': {
      'ru': 'Добавить',
      'en': 'Add',
      'kk': 'қосу',
    },
  },
  // chooseTypeFriendshipPage
  {
    'b6ojrj4d': {
      'ru': 'Выберите один из вариантов',
      'en': 'Choose one of the options',
      'kk': 'Опциялардың бірін таңдаңыз',
    },
    'hen9jeei': {
      'ru': 'Ищу партнера',
      'en': 'Looking for a partner',
      'kk': 'Серіктес іздеуде',
    },
    'v0htc5tc': {
      'ru': 'Создать лобби',
      'en': 'Create a lobby',
      'kk': 'Лобби жасаңыз',
    },
  },
  // createPartner
  {
    'hii0edu8': {
      'ru': 'Поиск партнера',
      'en': 'Search for a partner',
      'kk': 'Серіктес іздеңіз',
    },
    's39cnyxk': {
      'ru': 'Откуда',
      'en': 'Where',
      'kk': 'Қайда',
    },
    'erlgu920': {
      'ru': '-',
      'en': '-',
      'kk': '-',
    },
    'qm0ztsto': {
      'ru': 'Куда',
      'en': 'Where',
      'kk': 'Қайда',
    },
    '7bg3rpsg': {
      'ru': '-',
      'en': '-',
      'kk': '-',
    },
    'wahpuhjg': {
      'ru': 'Создать',
      'en': 'Create',
      'kk': 'Жасау',
    },
  },
  // createLobby
  {
    '5tvek36l': {
      'ru': 'Создать лобби',
      'en': 'Create a lobby',
      'kk': 'Лобби жасаңыз',
    },
    '244s578d': {
      'ru': 'Название',
      'en': 'Name',
      'kk': 'Аты',
    },
    '11yahhs6': {
      'ru': 'Откуда',
      'en': 'Where',
      'kk': 'Қайда',
    },
    'ht9bk58d': {
      'ru': '-',
      'en': '-',
      'kk': '-',
    },
    'vbfg1u2k': {
      'ru': 'Куда',
      'en': 'Where',
      'kk': 'Қайда',
    },
    '5dp1ms8p': {
      'ru': '-',
      'en': '-',
      'kk': '-',
    },
    '60irruua': {
      'ru': 'Создать',
      'en': 'Create',
      'kk': 'Жасау',
    },
  },
  // changeLang
  {
    'v841zbsq': {
      'ru': 'Выберите один из вариантов',
      'en': 'Choose one of the options',
      'kk': 'Опциялардың бірін таңдаңыз',
    },
    'ucewbcfb': {
      'ru': '🇰🇿',
      'en': '🇰🇿',
      'kk': '🇰🇿',
    },
    '7cltwndd': {
      'ru': 'Казахский',
      'en': 'Kazakh',
      'kk': 'қазақ',
    },
    'ie1uvsfs': {
      'ru': '🇷🇺',
      'en': '🇷🇺',
      'kk': '🇷🇺',
    },
    '7vw77m8z': {
      'ru': 'Русский',
      'en': 'Russian',
      'kk': 'орыс',
    },
    'tkug1ixk': {
      'ru': '🇺🇸',
      'en': '🇺🇸',
      'kk': '🇺🇸',
    },
    'ktg56hyh': {
      'ru': 'Английский',
      'en': 'English',
      'kk': 'Ағылшын',
    },
  },
  // dosPreview
  {
    'lgbh57oy': {
      'ru': 'Перейти',
      'en': 'To come in',
      'kk': 'Кіру үшін',
    },
  },
  // Miscellaneous
  {
    'e87dx48u': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'nd9dj169': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '42pzje4q': {
      'ru': 'Allow to get your location',
      'en': '',
      'kk': '',
    },
    '4dbv54xl': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'qywiyh2d': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '6udh9f4a': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'syjptyzg': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '0pqt9ubu': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '8c53k2fx': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '3j28r58s': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'cahdady9': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'uah2tf0g': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'uwtypikn': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'qyvtzzxu': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '09rf23c3': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'ue74be5a': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'oqbrgrjy': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'is02ti64': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '3pbk4v27': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'nf1i8fsh': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'ocybfzlr': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'zh6bsul6': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'crpoo4ty': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'a0dnnkti': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'spqb10fg': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    '5mt8oygs': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'ctml92ls': {
      'ru': '',
      'en': '',
      'kk': '',
    },
    'q3h2h0yq': {
      'ru': '',
      'en': '',
      'kk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
