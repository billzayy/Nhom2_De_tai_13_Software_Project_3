import 'package:get/get.dart';
import 'package:software_project_3/src/pesentation/pages/app_start.dart';
import 'package:software_project_3/src/pesentation/pages/contact/contact_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/contact/contact_view.dart';
import 'package:software_project_3/src/pesentation/pages/goup_chat/group_chat_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/login/login_view.dart';
import 'package:software_project_3/src/pesentation/pages/profile/profile_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/profile/profile_view.dart';

import 'package:software_project_3/src/pesentation/pages/root_app.dart';
import 'package:software_project_3/src/pesentation/pages/update_user/update_user_ctrl.dart';
import 'package:software_project_3/src/pesentation/pages/update_user/update_user_view.dart';

import '../src/pesentation/pages/room_chat/room_chat_ctrl.dart';
import '../src/pesentation/pages/room_chat/room_chat_view.dart';
import '../src/pesentation/pages/sign/sign_ctrl.dart';
import '../src/pesentation/pages/sign/sign_view.dart';

class RouterConfigs {
  static final List<GetPage> routes = [
    GetPage(
      name: AppStartView.routeName,
      page: () => const AppStartView(),
    ),
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => LoginController());
        },
      ),
    ),
    GetPage(
      name: SignView.routeName,
      page: () => const SignView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => SignController());
          // Get.put(DashBoardController());
        },
      ),
    ),
    GetPage(
        name: RootApp.routerName,
        page: () => const RootApp(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ContactController());
          Get.lazyPut(() => RoomChatController());
          Get.lazyPut(() => ProFileController());
          Get.lazyPut(() => GroupChatController());
          // Get.lazyPut(() => LoginController());
        })),
    GetPage(
      name: RoomChatView.routerName,
      page: () => const RoomChatView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => RoomChatController());
          // Get.put(DashBoardController());
        },
      ),
    ),
    GetPage(
      name: ContactView.routerName,
      page: () => const ContactView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => ContactController());
        },
      ),
    ),
    GetPage(
      name: ProFileView.routerName,
      page: () => const ProFileView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => LoginController());
          Get.lazyPut(() => ProFileController());
        },
      ),
    ),
    GetPage(
      name: UpdateUserView.routerName,
      page: () => const UpdateUserView(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut(() => UpdateUserController());
        },
      ),
    ),

  ];
}
