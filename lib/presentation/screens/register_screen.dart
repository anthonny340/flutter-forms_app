import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Nuevo usuario')),
      //NO olvidar de envolver todos los widgets que van a tener acceso a nuestro registerCubit
      //Con esto nos aseguramos de que el BlocProvider (RegisterCubit) sea parte del BuildContext
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FlutterLogo(size: 200),
              SizedBox(height: 25),
              _RegisterForm(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    /*Cuando se emplea el watch cada que el estado cambia flutter va a ser la reenderizacion
    de los componentes afectados

    Toda la data de nuestro formulario se encuentra en registerCubit, como se encuentra la data
    como esta el estado de cada uno de nuestro campos, todo esta alli
    */
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            hintText: 'Anthonny Sacheri',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            label: 'Correo electronico',
            hintText: 'anthonnysacheri@gmail.com',
            onChanged: (value) {
              registerCubit.emailChanged(value);
            },
            validator: (value) {
              if (value == null) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

              if (!emailRegExp.hasMatch(value)) {
                return 'No tiene formato de correo';
              }
              return null;
            },
          ),
          SizedBox(height: 25),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),
          SizedBox(height: 25),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
              // print('$username, $email, $password');
            },
            icon: Icon(Icons.save_outlined),
            label: Text('Guardar usuario'),
          ),
        ],
      ),
    );
  }
}
