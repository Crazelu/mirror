import '../user_dao.dart';
import 'user_dao_fake.dart';

void main() async {
  UserDaoFake userDao = UserDaoFake();
  print(await userDao.getUsers());

  await userDao.addUser(User(id: 2, name: "John"));
  print(await userDao.getUsers());

  print(await userDao.getUser(1));

  userDao.removeUser(0);
  print(await userDao.getUsers());

  userDao.updateUser(
    newUser: User(id: 2, name: "Peter"),
    id: 2,
  );

  print(await userDao.getUsers());
}
