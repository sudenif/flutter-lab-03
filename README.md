# Лабораторная работа 3. Подробный экран и навигация

Дисциплина: кроссплатформенные средства разработки программного обеспечения. Учебная тема — «Книга рецептов», вариант 3.


## Что выполнено

**Второй статический экран.** Карточка открывает /content/:id. Подробности выбираются из локального набора по id; работают ингредиенты, прокрутка инструкции и возврат. 
## Запуск

Нужен Flutter SDK с Dart >= 3.10. Исходная реализация подготовлена на Flutter 3.47.9 / Dart 3.13.7; точные разрешенные зависимости находятся в `pubspec.lock`.
Установите SDK и добавьте `flutter/bin` в PATH. Для Windows нужны Visual Studio Build Tools с C++; для Web — браузер Chrome или Edge.
Клонируйте проект в путь без кириллицы, например `C:/projects/flutter-lab-03`.

```powershell
flutter pub get
flutter run -d windows
# или Web
flutter run -d chrome
```


## Исходники для проверки

| Файл или каталог | Назначение |
|---|---|
| `lib/app/router/router.dart` | /content/:id и проверка параметра |
| `lib/app/features/content/content_screen.dart` | Статический поиск, подробная разметка и возврат |
| `lib/app/features/home/home_screen.dart` | Переход из карточки по id |
| `assets/` | Локальные данные и фотографии |

## Проверки

```powershell
flutter analyze
flutter test --reporter expanded
flutter test integration_test/app_test.dart -d windows
flutter build web --release --no-wasm-dry-run
```

## Платформы

Проект содержит оболочки Windows, Web и Android.
