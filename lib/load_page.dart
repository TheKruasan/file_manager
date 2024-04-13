import 'dart:io';

import 'package:file_manager/file_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  bool isLoading = false;
  bool isDel = false;
  Set<PlatformFile> pickedfiles = {};
  FilePickerResult? res;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      res = await FilePicker.platform.pickFiles(
        type: FileType.any,
        // allowedExtensions: ,
        allowMultiple: true,
      );

      if (res != null) {
        pickedfiles.addAll(res!.files);
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? const CircularProgressIndicator()
                    : TextButton(
                        onPressed: () {
                          pickFile();
                        },
                        child: const Text("Add files"),
                      ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isDel = !isDel;
                    });
                  },
                  child: const Text("Delete files"),
                ),
              ],
            ),
            if (pickedfiles.isNotEmpty) FileWidget(pickedfiles,isDel)
          ],
        ),
      ),
    );
  }
}
