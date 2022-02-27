import '../user_dao.dart';
import 'mock.dart';
import 'user_dao_mock.dart';

void main() async {
  UserDaoMock userDao = UserDaoMock();
  when(userDao.getUsers()).thenReturn(Future.value(
    [
      User(id: 0, name: "Ada"),
    ],
  ));

  print(await userDao.getUsers());

  when(userDao.getUser(1)).thenReturn(
    Future.value(
      User(id: 1, name: "John"),
    ),
  );

  when(userDao.getUser(2)).thenReturn(
    Future.value(
      User(id: 2, name: "Jessey"),
    ),
  );

  print(await userDao.getUser(1));
  print(await userDao.getUser(1));
  print(await userDao.getUser(2));

  verifyN(await userDao.getUser(1), 2);

  when(userDao.updateUser(
    newUser: User(id: 2, name: "Peter"),
    id: 2,
  )).thenReturn(Future.value());

  await userDao.updateUser(
    newUser: User(id: 2, name: "Peter"),
    id: 2,
  );

  verifyN(
      await userDao.updateUser(
        newUser: User(id: 2, name: "Peter"),
        id: 2,
      ),
      1);

  // await userDao.addUser(User(id: 2, name: "John"));
  // print(await userDao.getUsers());

  // print(await userDao.getUser(1));

  // userDao.removeUser(0);
  // print(await userDao.getUsers());

  // userDao.updateUser(
  //   newUser: User(id: 2, name: "Peter"),
  //   id: 2,
  // );

  // print(await userDao.getUsers());
}
