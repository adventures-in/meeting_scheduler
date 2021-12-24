import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_scheduler/auth/auth_gate.dart';
import 'package:meeting_scheduler/meeting/screen_meeting_details.dart';
import 'package:meeting_scheduler/not-found/not_found_screen.dart';
import 'package:meeting_scheduler/organization/screen_org_details.dart';
import 'package:meeting_scheduler/profile/screen_profile_details.dart';
import 'package:meeting_scheduler/project/screen_project_details.dart';
import 'package:meeting_scheduler/team/screen_team_details.dart';

import 'firebase_options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            title: 'Meeting Scheduler',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        }
      },
    );
  }

  final GoRouter _router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        path: '/',
        name: 'auth',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AuthGate(),
        ),
      ),
      // GoRoute(
      //   path: '/',
      //   name: 'home',
      //   pageBuilder: (context, state) => MaterialPage(
      //     key: state.pageKey,
      //     child: const ScreenHome(),
      //   ),
      // ),
      GoRoute(
        path: '/meeting',
        name: 'meeting',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ScreenMeetingDetails(),
        ),
      ),
      GoRoute(
        path: '/organization',
        name: 'organization',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ScreenOrganizationDetails(),
        ),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ScreenProfile(),
        ),
      ),
      GoRoute(
        path: '/project',
        name: 'project',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ScreenProjectDetails(),
        ),
      ),
      GoRoute(
        path: '/team',
        name: 'team',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ScreenTeam(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: NotFoundScreen(exception: state.error!),
    ),
  );
}
