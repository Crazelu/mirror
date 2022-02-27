import '../user_dao.dart';

class UserDaoFake with Fake, UserDao {
  static final List<User> _fakeUsers = [
    User(id: 0, name: "Pelumi"),
    User(id: 1, name: "Jumoke"),
  ];
}

class Fake {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    switch (invocation.memberName) {
      case Symbol("getUsers"):
        return Future.value(UserDaoFake._fakeUsers);

      case Symbol("addUser"):
        final newUser = invocation.positionalArguments.first;
        UserDaoFake._fakeUsers.add(newUser);
        return Future.value();
      case Symbol("getUser"):
        final userId = invocation.positionalArguments.first;
        return Future.value(
            UserDaoFake._fakeUsers.firstWhere((user) => user.id == userId));
      case Symbol("removeUser"):
        final userId = invocation.positionalArguments.first;
        UserDaoFake._fakeUsers.removeWhere((user) => user.id == userId);
        return Future.value();
      case Symbol("updateUser"):
        final newUser = invocation.namedArguments[Symbol("newUser")];
        final userId = invocation.namedArguments[Symbol("id")];
        final index =
            UserDaoFake._fakeUsers.indexWhere(((user) => user.id == userId));
        UserDaoFake._fakeUsers[index] = newUser;
        return Future.value();
    }
  }
}
