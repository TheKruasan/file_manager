import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileWidget extends StatefulWidget {
  final Set<PlatformFile> pickedfiles;
  final bool isDel;
  const FileWidget(this.pickedfiles, this.isDel, {super.key});

  @override
  State<FileWidget> createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widget.pickedfiles.map(
              (e) => Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 40,
                          child: Image.asset("assets/images/fileicon.png"),
                        ),
                        if (widget.isDel)
                          Container(
                            width: 25,
                            height: 25,
                            margin: EdgeInsets.only(right: 10),
                            child: IconButton(
                              icon: const Icon(
                                size: 17,
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.pickedfiles.remove(e);
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                    TextButton(child: Text ("${toFifth(e.name.toString())}")  , onPressed: () {
                      downloadFile(e);
                    },)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String toFifth(String name) {
  String n = "";
  if (name.length >= 10) {
    for (int i = 0; i < 10; i++) {
      n += name[i];
    }
    n += "..";
  } else {
    n = name;
  }

  return n;
}

void downloadFile (PlatformFile e){

}