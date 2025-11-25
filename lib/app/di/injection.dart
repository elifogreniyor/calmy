import 'package:calmy/app/di/injection.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await sl.init();
