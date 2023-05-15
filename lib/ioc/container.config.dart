// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/foo_local_data_source.dart' as _i3;
import '../repository/foo_remote_data_source.dart' as _i4;
import '../repository/foo_repository.dart' as _i6;
import '../repository/i_foo_repository.dart' as _i5;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.FooLocalDataSource>(_i3.FooLocalDataSource());
  gh.singleton<_i4.FooRemoteDataSource>(_i4.FooRemoteDataSource());
  gh.singleton<_i5.IFooRepository>(_i6.FooRepository(
    gh<_i3.FooLocalDataSource>(),
    gh<_i4.FooRemoteDataSource>(),
  ));
  return getIt;
}
