import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/ auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository repository;

  GoogleSignInUseCase(this.repository);

  Future<Either<String, User>> call() {
    return repository.googleSignIn();
  }
}
