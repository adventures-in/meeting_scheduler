import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_scheduler/home/home_screen.dart';
import 'package:meeting_scheduler/meeting_details/screen_meeting_details.dart';
import 'package:meeting_scheduler/organization_details/screen_org_details.dart';
import 'package:meeting_scheduler/profile/screen_profile_details.dart';
import 'package:meeting_scheduler/project_details/screen_project_details.dart';
import 'package:meeting_scheduler/team_details/screen_team_details.dart';

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
          return const CircularProgressIndicator();
        } else {
          return MaterialApp(
            title: 'Meeting Scheduler',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const AuthGate(),
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
        name: 'home',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ScreenHome(),
        ),
      ),
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
  );
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // User is not signed in
            if (!snapshot.hasData) {
              return const SignInScreen(providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                  clientId: '220727339122-b3fflgie9rq6b6atu8sfml3274snrs31.apps.googleusercontent.com',
                ),
              ]);
            }

            // Render your application if authenticated
            return const ScreenHome();
          },
        );
      },
    );
  }
}

