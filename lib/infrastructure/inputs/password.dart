import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, legth }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // El punto inicial, cuando se crear el input
  const Password.pure() : super.pure('');

  // Se lo llama cuando se modifica el valor del input
  const Password.dirty(String value) : super.dirty(value);

  // Todas la validaciones a considerar para el input
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.legth;

    return null;
  }
}
