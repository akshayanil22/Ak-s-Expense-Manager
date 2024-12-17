import 'package:dartz/dartz.dart';
import '../../domain/repositories/ auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(User(uid: userModel.uid, email: userModel.email));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> signup(String email, String password) async {
    try {
      final userModel = await remoteDataSource.signup(email, password);
      return Right(User(uid: userModel.uid, email: userModel.email));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, User>> googleSignIn() async {
    try {
      final userModel = await remoteDataSource.signInWithGoogle();
      return Right(User(uid: userModel.uid, email: userModel.email));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
