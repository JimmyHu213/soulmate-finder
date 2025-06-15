// ignore_for_file: avoid_print

import 'package:logging/logging.dart';

class AppLogger {
  static late Logger _logger;
  static bool _isInitialized = false;

  static void init() {
    if (_isInitialized) return;

    Logger.root.clearListeners();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      // Add space after emoji for better readability
      String levelName = record.level.name.padRight(8);
      String timestamp = record.time.toString().substring(11, 23);
      print('$levelName: $timestamp: ${record.message}');
    });

    _logger = Logger('AppLogger');
    _isInitialized = true;
  }

  static void info(String message) {
    _logger.info('✅ $message'); // Added space after emoji
  }

  static void warning(String message) {
    _logger.warning('⚠️ $message'); // Added space after emoji
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.severe('❌ $message', error, stackTrace);
  }

  static void critical(String message,
      [Object? error, StackTrace? stackTrace]) {
    _logger.shout(
        '🚨 $message', error, stackTrace); // Changed emoji for critical
  }

  static void config(String message) {
    _logger.config('⚙️ $message'); // Added emoji for config
  }

  static void debug(String message) {
    _logger.fine('🔍 $message'); // Changed emoji for debug
  }
}
