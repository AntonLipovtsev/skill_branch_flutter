import 'package:FlutterGalleryApp/string_util.dart';

class User {
  String email;
  String phone;

  String _firstName;
  String _lastName;

  LoginType _loginType;

  List<User> friends = List<User>();

  User._({String firstName, String lastName, String phone, String email})
      : _firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email {
    _loginType = email != null ? LoginType.EMAIL : LoginType.PHONE;
  }

  factory User({String name, String phone, String email}) {
    if (name.isEmpty) {
      throw Exception("User name is empty");
    }

    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: checkPhone(phone),
        email: email);
  }

  static String _getFirstName(String userName) => userName.split(" ")[0];

  static String _getLastName(String userName) => userName.split(" ")[1];

  static String checkPhone(String phone) {
    if (phone == null) {
      return phone;
    }

    String pattern = r"^(?:[+0])?[0-9]{11}";

    phone = phone.replaceAll(RegExp("[^+\\d]"), "");

    if (phone.isEmpty) {
      throw Exception("Enter don't empty phone number");
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception("Enter a valid phone number starting with a + and containing 11 digits");
    }

    return phone;
  }

  static String checkEmail(String email) {
    if (email == null || email.isEmpty) {
      throw Exception("Email is empty");
    }

    return email;
  }

  String get login {
    if (_loginType == LoginType.EMAIL) {
      return email;
    } else {
      return phone;
    }
  }

  String get name => "${_firstName.capitalize()} ${_lastName.capitalize()}";

  void addFriends(Iterable<User> newFriends) {
    friends.addAll(newFriends);
  }

  void removeFriend(User user) {
    friends.remove(user);
  }

  String get userInfo => '''
    name: $name
    email: $email
    firstName: $_firstName
    lastName: $_lastName
    friends: ${friends.toList()}
  ''';

  @override
  String toString() {
    return '''
    name: $name
    email: $email
    friends: ${friends.toList()}
  ''';
  }

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }

    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          (phone == object.phone || email == object.email);
    }
  }
}

enum LoginType { EMAIL, PHONE }
