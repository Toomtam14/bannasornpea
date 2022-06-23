// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bannasornpea/utility/my_constant.dart';
import 'package:bannasornpea/widgets/show_text.dart';
import 'package:flutter/material.dart';

import 'package:bannasornpea/models/job_model.dart';

class Detail extends StatefulWidget {
  final JobModel jobModel;

  const Detail({
    Key? key,
    required this.jobModel,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  JobModel? jobModel;

  @override
  void initState() {
    super.initState();
    jobModel = widget.jobModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ShowText(
          text: jobModel!.job,
          textStyle: MyConstant().h2Style(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: MyConstant.dark,
      ),
    );
  }
}
