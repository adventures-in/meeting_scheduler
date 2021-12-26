import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_scheduler/auth/auth_gate.dart';
import 'package:meeting_scheduler/meeting/meeting_details_screen.dart';
import 'package:meeting_scheduler/not-found/not_found_screen.dart';
import 'package:meeting_scheduler/organization/organization_details_screen.dart';
import 'package:meeting_scheduler/profile/profile_details_screen.dart';
import 'package:meeting_scheduler/project/project_details_screen.dart';
import 'package:meeting_scheduler/team/team_details_screen.dart';

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
						debugShowCheckedModeBanner: false,
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
          child: const MeetingDetailsScreen(),
        ),
      ),
      GoRoute(
        path: '/organization',
        name: 'organization',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const OrganizationDetailsScreen(),
        ),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ProfileScreen(),
        ),
      ),
      GoRoute(
        path: '/project',
        name: 'project',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ProjectDetailsScreen(),
        ),
      ),
      GoRoute(
        path: '/team',
        name: 'team',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const TeamDetailsScreen(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: NotFoundScreen(exception: state.error!),
    ),
  );
}
