import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/ auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<String, User>> call(String email, String password) {
    return repository.signup(email, password);
  }
}
