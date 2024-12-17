import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/ auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/signup_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance; // sl = Service Locator

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => AuthBloc(sl(), sl())); // Pass use cases

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(sl()));

  // Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(FirebaseAuth.instance));

  // External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
