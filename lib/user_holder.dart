import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    var user = User(name: name, phone: phone, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception("A user with this email already exists");
    }
  }

  User registerUserByEmail(String fullName, String email) {
    if (!email.contains("@")) {
      throw Exception();
    }

    var user = User(name: fullName, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception("A user with this email already exists");
    }

    return user;
  }

  User registerUserByPhone(String fullName, String phone) {
    if (phone == null || phone.isEmpty) {
      throw Exception("Enter don't empty phone number");
    }

    var user = User(name: fullName, phone: phone);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception("A user with this phone already exists");
    }

    return user;
  }

  User findUserInFriends(String fullName, User user) {
    User necessaryFriend;

    users[fullName].friends.forEach((friend) {
      if (friend == user) {
        necessaryFriend = user;
      }
    });

    if (necessaryFriend == null) {
      throw Exception("${user.login} is not a friend of the login");
    }

    return necessaryFriend;
  }

  void setFriends(String login, List<User> friends) {
    users[login].friends = friends;
  }

  User getUserByLogin(String login) {
    return users[login];
  }

  List<User> importUsers(List<String> list) {
    var users = List<User>();

    list.forEach((element) {
      String name = element.split(";")[0].trim();
      String email = element.split(";")[1].trim();
      String phone = element.split(";")[2].trim();
      users.add(User(name: name, email: email, phone: phone));
    });

    return users;
  }
}