// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bannasornpea/models/job_model.dart';
import 'package:bannasornpea/utility/my_constant.dart';
import 'package:bannasornpea/widgets/show_progress.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:bannasornpea/widgets/show_text.dart';

class NonFinishJob extends StatefulWidget {
  final List<String> dataUserLogins;

  const NonFinishJob({
    Key? key,
    required this.dataUserLogins,
  }) : super(key: key);

  @override
  State<NonFinishJob> createState() => _NonFinishJobState();
}

class _NonFinishJobState extends State<NonFinishJob> {
  var dataUserLogin = <String>[];
  var jobModels = <JobModel>[];

  @override
  void initState() {
    super.initState();
    dataUserLogin = widget.dataUserLogins;
    readDataJob();
  }

  Future<void> readDataJob() async {
    String idOfficer = dataUserLogin[0];
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereIdOfficertam.php?isAdd=true&idOfficer=$idOfficer';

    await Dio().get(path).then((value) {
      print('value ==> $value');

      var result = json.decode(value.data);
      for (var element in result) {
        JobModel jobModel = JobModel.fromMap(element);
        print('job ===> ${jobModel.job}');

        if (jobModel.status == 'start') {
          jobModels.add(jobModel);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showTitle(head: 'ชื่อพนักงาน :', value: dataUserLogin[1]),
        showTitle(head: 'ตำแหน่ง :', value: dataUserLogin[2]),
        jobModels.isEmpty
            ? const ShowProgress()
            : ListView.builder(
                shrinkWrap: true,
                physics:  const ScrollPhysics(),
                itemCount: jobModels.length,
                itemBuilder: (context, index) =>
                    ShowText(text: jobModels[index].job),
              ),
      ],
    );
  }

  Card showTitle({required String head, required String value}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: MyConstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 2,
              child: ShowText(text: value),
            ),
          ],
        ),
      ),
    );
  }
}
