import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_project_3/config/assets.dart';
import 'package:software_project_3/src/pesentation/common_widgets/common_appbar.dart';
import 'package:software_project_3/src/pesentation/common_widgets/loading_shimmer.dart';
import 'package:software_project_3/src/pesentation/pages/group_chat/create_group_chat/create_group_view.dart';
import 'package:software_project_3/src/pesentation/pages/group_chat/group_chat_ctrl.dart';

import '../room_chat/room_chat_view.dart';

class GroupChatView extends GetView<GroupChatController> {
  static const String routerName = '/GroupChatView';
  const GroupChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
        title: 'Group Chat',
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [GroupList()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[500],
        onPressed: () =>
            Get.bottomSheet(isScrollControlled: true, const CreateGroupView()),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GroupList extends GetView<GroupChatController> {
  const GroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const LoadingShimmer();
          } else {
            return ListView.builder(
              itemCount: controller.listGroup.length,
              itemBuilder: (context, index) {
                var item = controller.listGroup[index];
                if (item.groupType == 'group') {
                  return GestureDetector(
                    onTap: () =>
                        Get.toNamed(RoomChatView.routerName, arguments: {
                      'idGroup': item.idGroup,
                      'idMember': null,
                      'groupName': item.groupName,
                      'model': item,
                    }),
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.2,
                            height: Get.width * 0.2,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ClipOval(
                                child: ExtendedImage.network(
                                  item.pictures ?? '',
                                  fit: BoxFit.cover,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  shape: BoxShape.rectangle,
                                  loadStateChanged: (ExtendedImageState state) {
                                    switch (state.extendedImageLoadState) {
                                      case LoadState.loading:
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      case LoadState.completed:
                                        return null;
                                      case LoadState.failed:
                                        return Image.asset(
                                          ImageAssets.defaultUser,
                                        );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.groupName ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  textScaleFactor: 1,
                                  style: Get.theme.textTheme.titleMedium,
                                ),
                                const Text(
                                  'New message',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            );
          }
        },
      ),
    );
  }
}
