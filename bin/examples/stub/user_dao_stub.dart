import '../user_dao.dart';

class UserDaoStub with Stub, UserDao {}

class Stub {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    switch (invocation.memberName) {
      case Symbol("getUsers"):
        return Future.value(<User>[User(id: 1, name: "John Paul")]);
      case Symbol("addUser"):
        return Future.value();
      case Symbol("getUser"):
        return Future.value(User(id: 1, name: "John Paul"));
      case Symbol("removeUser"):
        return Future.value();
      case Symbol("updateUser"):
        return Future.value();
    }
  }
}
