import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieatta/configuration.dart';
import 'package:ieatta/src/app.dart';
import 'package:ieatta/src/blocs/authentication/authentication_bloc.dart';
import 'package:ieatta/src/blocs/bloc_delegate.dart';
import 'package:ieatta/src/blocs/signin/signin_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    DevicePreview(
      enabled: kUseDevicePreview,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (_) => AuthenticationBloc()..add(AppStarted()),
            ),
            BlocProvider<SignInBloc>(create: (_) => SignInBloc()),
          ],
          child: UPFRApp(),
        );
      },
    ),
  );
}
