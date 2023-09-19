class Validator {
  static String? validateEmail(String email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (email.isEmpty) {
      return "Required Field";
    } else if (!regExp.hasMatch(email)) {
      return "Please enter valid Email Id";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Required Field";
    } else if (password.length < 8) {
      return "Password is short";
    }
    return null;
  }
}
