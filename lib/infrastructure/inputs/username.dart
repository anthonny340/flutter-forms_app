import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, legth }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // El punto inicial, cuando se crear el input
  const Username.pure() : super.pure('');

  // Se lo llama cuando se modifica el valor del input
  const Username.dirty(String value) : super.dirty(value);

  // Todas la validaciones a considerar para el input
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.legth;

    return null;
  }
}
