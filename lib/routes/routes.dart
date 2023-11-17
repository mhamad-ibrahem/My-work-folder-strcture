import 'package:new_structure/routes/routes_imports.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(

      name: AppRoute.splashRoute,
      page: () => TestPage(),
      // middlewares: [MiddleWare()],
      transition: Transition.fade,
      binding: TestBindings(),
      transitionDuration: const Duration(milliseconds: 700)),
// //=====================Auth=====================
//   GetPage(
//       name: AppRoute.signIn,
//       page: () => const SignIn(),
//       transition: Transition.fade,
//       transitionDuration: const Duration(milliseconds: 700)),
];
