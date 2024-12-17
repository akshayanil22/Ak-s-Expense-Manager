import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/google_signin_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final GoogleSignInUseCase googleSignInUseCase;

  AuthBloc(this.loginUseCase, this.signupUseCase, this.googleSignInUseCase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUseCase(event.email, event.password);
      result.fold(
            (error) => emit(AuthFailure(message: error)),
            (user) => emit(AuthSuccess(user: user)),
      );
    });

    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signupUseCase(event.email, event.password);
      result.fold(
            (error) => emit(AuthFailure(message: error)),
            (user) => emit(AuthSuccess(user: user)),
      );
    });

    on<GoogleSignInEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await googleSignInUseCase();
      result.fold(
            (error) => emit(AuthFailure(message: error)),
            (user) => emit(AuthSuccess(user: user)),
      );
    });
  }
}
