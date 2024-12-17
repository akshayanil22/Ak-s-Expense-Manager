import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/custom_widget_imports.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/title_logo.svg',width: 200,),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, 'home', (Route<dynamic> route) => false);
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text("Sign in to your\nAccount",style: Theme.of(context).textTheme.headlineLarge,),
                    const SizedBox(height: 10),
                    const Text("Enter your email and password to login"),
                    const SizedBox(height: 20),
                    CustomTextFormField(emailController: emailController,labelText: 'Email',keyboardType: TextInputType.emailAddress,),
                    const SizedBox(height: 20),
                    CustomTextFormField(emailController: passwordController,labelText: 'Password',obscureText: true,),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: const Text('Forgot Password?'))),
                    CustomElevatedButton(onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },buttonName: "Log in",
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Text('  Or  '),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomOutlinedButton(onPressed: (){
                      context.read<AuthBloc>().add(
                        GoogleSignInEvent(),
                      );
                    }, buttonName: 'Continue with Google'),
                    const SizedBox(height: 20),
                    CustomOutlinedButton( onPressed: () {

                    },buttonName: 'Continue with Facebook',),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(onPressed: (){}, child: const Text('Sign Up'))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
