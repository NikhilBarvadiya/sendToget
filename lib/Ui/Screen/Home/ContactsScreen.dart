// ignore_for_file: file_names
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:sendtoget/Common/Widget/Custom.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text('Contacts'),
        ),
        body: _permissionDenied
            ? const Center(child: Text('Permission denied'))
            : _contacts == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _contacts!.length,
                    itemBuilder: (context, i) {
                      Uint8List? image = _contacts![i].photo;
                      return ListTile(
                        leading: _contacts![i].photo != null
                            ? CircleAvatar(backgroundImage: MemoryImage(image!))
                            : const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(_contacts![i].displayName),
                        onTap: () async {
                          final fullContact = await FlutterContacts.getContact(
                              _contacts![i].id);
                          show(context, fullContact);
                        },
                      );
                    },
                  ),
      );
}
