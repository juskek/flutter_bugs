import 'package:injectable/injectable.dart';

import './foo_local_data_source.dart';
import './foo_remote_data_source.dart';
import './i_foo_repository.dart';

@Singleton(as: IFooRepository)
class FooRepository implements IFooRepository {
  FooRepository(this._fooLocalDataSource, this._fooRemoteDataSource);

  final FooLocalDataSource _fooLocalDataSource;
  final FooRemoteDataSource _fooRemoteDataSource;

  @override
  Future<void> foo() async {
    try {
      await Future.delayed(const Duration(seconds: 1), () => throw Exception());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
