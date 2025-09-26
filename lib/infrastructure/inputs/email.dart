import 'package:formz/formz.dart';

// Define input validation errors, lo obtenemos llamando al displayError
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // El punto inicial, cuando se crear el input
  const Email.pure() : super.pure('');

  // Se lo llama cuando se modifica el valor del input
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format) {
      return 'No tiene formato de correo electronico';
    }

    return null;
  }

  // Todas la validaciones a considerar para el input
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if (emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
