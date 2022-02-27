import '../user_dao.dart';
import 'user_dao_stub.dart';

void main() {
  UserDaoStub userDao = UserDaoStub();
  userDao.getUsers();
  userDao.addUser(User(id: 1, name: "John"));
  userDao.getUser(1);
  userDao.removeUser(1);
  userDao.updateUser(
    newUser: User(id: 1, name: "Peter"),
    id: 1,
  );
}
