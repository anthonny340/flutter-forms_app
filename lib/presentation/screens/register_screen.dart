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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //Cuando se emplea el watch cada que el estado cambia flutter va a ser la reenderizacion
    //de los componentes afectados
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            hintText: 'Anthonny Sacheri',
            onChanged: (value) {
              registerCubit.usernameChanged(value);
              //Cada vez que hay un cambio mando a validar todos los campos del formulario (a considerar)
              _formKey.currentState?.validate();
            },
            // TODO Evitar repetir codigo con las validaciones para ello podemos emplear varias soluciones
            // Hacer las validaciones en el register_state o crear un archivo con todas las validaciones
            // y las mandamos a llamar cuando las necesitemos
            validator: (value) {
              if (value == null) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Mas de 6 letras';
              return null;
            },
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            label: 'Correo electronico',
            hintText: 'anthonnysacheri@gmail.com',
            onChanged: (value) {
              registerCubit.emailChanged(value);
              _formKey.currentState?.validate();
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
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Mas de 6 letras';
              return null;
            },
          ),
          SizedBox(height: 25),
          FilledButton.tonalIcon(
            onPressed: () {
              //TODO bloquear el boton cuando los valores estan cargando
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;

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
