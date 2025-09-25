part of 'register_cubit.dart';

//Pensemos que es el estado del formulario

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final String email;
  final Password password;

  const RegisterFormState({
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.username = const Username.pure(),
    this.email = '',
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    bool? isValid,
    FormStatus? formStatus,
    Username? username,
    String? email,
    Password? password,
  }) => RegisterFormState(
    isValid: isValid ?? this.isValid,
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
