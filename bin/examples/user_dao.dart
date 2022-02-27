import 'package:equatable/equatable.dart';

abstract class UserDao {
  Future<List<User>> getUsers();
  Future<void> addUser(User user);
  Future<User> getUser(int id);
  Future<void> removeUser(int id);
  Future<void> updateUser({required User newUser, required int id});
}

class User extends Equatable {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return "User(id: $id, name: $name)";
  }

  @override
  List<Object?> get props => [id, name];
}
