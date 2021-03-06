import 'dart:io';

import 'package:flutter/material.dart';
import 'package:agendacontatos/helpers/contact_helper.dart';

class ContactPage extends StatefulWidget {

  final Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController(),
        _emailController = TextEditingController(),
        _phoneController = TextEditingController(),
        _nameFocus = FocusNode();

  bool _userEdited = false;
  Contact _editedContact;

  @override
  void initState() {
    super.initState();

    if(widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(_editedContact.name != null && _editedContact.name.isNotEmpty) {
            Navigator.pop(context, _editedContact);
          } else {
            FocusScope.of(context).requestFocus(_nameFocus);
          }
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.red
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: _editedContact.img != null ?
                        FileImage(File(_editedContact.img)) :
                        AssetImage("images/person.png")
                    )
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              focusNode: _nameFocus,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                _userEdited = true;
                setState(() {
                  if (text == "") {
                    _editedContact.name = "Novo Contato";
                  } else {
                    _editedContact.name = text;
                  }
                });
              },
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              onChanged: (text) {
                _userEdited = true;
                _editedContact.email = text;
              }
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Phone"),
              keyboardType: TextInputType.phone,
              //maxLines: 9,
              onChanged: (text) {
                _userEdited = true;
                _editedContact.phone = text;
              },
            )
          ],
        ),
      ),
    );
  }


}
