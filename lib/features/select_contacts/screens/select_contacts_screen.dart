import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/common/widgets/Loaader.dart';
import 'package:whatsapp/common/widgets/error.dart';
import 'package:whatsapp/features/select_contacts/controller/select_contact_controller.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = 'Select Contacts';
  const SelectContactsScreen({super.key});

//
void selectContact(WidgetRef ref, Contact selectedContact , BuildContext context){
  ref.read(selectContactControllerProvider).selectContact(selectedContact, context);
}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contact'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ],
      ),
      body: ref.watch(getcontactsProvider).when(
          data: (contactList) => ListView.builder(
                itemCount: contactList.length,
                itemBuilder: ((context, index) {
                  final contact = contactList[index];
                  return InkWell(
                    onTap: () => selectContact(ref , contact  , context),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          contact.displayName,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        leading: contact.photo == null
                            ? null
                            : CircleAvatar(
                                backgroundImage: MemoryImage(contact.photo!),
                                radius: 30.0,
                              ),
                      ),
                    ),
                  );
                }),
              ),
          error: (err, trace) => ErrorScreen(error: err.toString()),
          loading: () => const Loader()),
    );
  }
}
