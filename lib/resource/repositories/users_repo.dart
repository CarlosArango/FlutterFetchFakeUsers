import 'package:fetch_user_jsonplaceholder/models/user.dart';
import 'package:fetch_user_jsonplaceholder/resource/providers/api_users.dart';

class UsersRepository {
  final ApiUsersProvider _apiUsersProvider;

  UsersRepository({
    ApiUsersProvider apiUsersProvider,
  }) : _apiUsersProvider = apiUsersProvider ?? ApiUsersProvider();

  Future<List<User>> getUsers() async {
    return await _apiUsersProvider.getUsers();
  }
}
