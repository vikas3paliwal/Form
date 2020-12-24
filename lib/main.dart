import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:studentform/models/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  Student _student = Student(
      gen: null,
      dateOfBirth: null,
      name: null,
      address: null,
      course: null,
      fatherName: null,
      group: null,
      institute: null,
      mobileNo: null,
      motherName: null,
      nationality: null,
      instituteId: null);
  bool _isLoading = false;
  void _selectDate(BuildContext ctx) async {
    _student.dateOfBirth = await showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(1965),
        lastDate: DateTime(2021));
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      _formKey.currentState.reset();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _submit,
          child: _isLoading ? CircularProgressIndicator() : Text('Submit'),
        ),
        appBar: AppBar(),
        body: Card(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(labelText: 'Name'),
                            validator: (value) {
                              if (value.trim().isEmpty)
                                return 'This field can\'t be empty';
                              return null;
                            },
                            onSaved: (value) {
                              _student = Student(
                                  gen: _student.gen,
                                  dateOfBirth: _student.dateOfBirth,
                                  name: value,
                                  address: _student.address,
                                  course: _student.course,
                                  fatherName: _student.fatherName,
                                  group: _student.group,
                                  institute: _student.institute,
                                  mobileNo: _student.mobileNo,
                                  motherName: _student.motherName,
                                  nationality: _student.nationality,
                                  instituteId: _student.instituteId);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(fontSize: 15),
                            ),
                            DropdownButton(
                                icon: Icon(Icons.person),
                                iconEnabledColor: Colors.blue,
                                autofocus: true,
                                items: [
                                  DropdownMenuItem(
                                    value: gender.M,
                                    child: Text('M'),
                                  ),
                                  DropdownMenuItem(
                                      value: gender.F, child: Text('F'))
                                ],
                                onChanged: (value) {
                                  _student.gen = value;
                                })
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Father Name',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _student = Student(
                              gen: _student.gen,
                              dateOfBirth: _student.dateOfBirth,
                              name: _student.name,
                              address: _student.address,
                              course: _student.course,
                              fatherName: value,
                              group: _student.group,
                              institute: _student.institute,
                              mobileNo: _student.mobileNo,
                              motherName: _student.motherName,
                              nationality: _student.nationality,
                              instituteId: _student.instituteId);
                        });
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Mother Name',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        return null;
                      },
                      onSaved: (value) {
                        _student = Student(
                            gen: _student.gen,
                            dateOfBirth: _student.dateOfBirth,
                            name: _student.name,
                            address: _student.address,
                            course: _student.course,
                            fatherName: _student.fatherName,
                            group: _student.group,
                            institute: _student.institute,
                            mobileNo: _student.mobileNo,
                            motherName: value,
                            nationality: _student.nationality,
                            instituteId: _student.instituteId);
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text('Date of Birth'),
                        IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () => _selectDate(context))
                      ],
                    ),
                    Divider(
                      height: 3,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your institute name here',
                        labelText: 'Institute',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        return null;
                      },
                      onSaved: (value) {
                        _student = Student(
                            gen: _student.gen,
                            dateOfBirth: _student.dateOfBirth,
                            name: _student.name,
                            address: _student.address,
                            course: _student.course,
                            fatherName: _student.fatherName,
                            group: _student.group,
                            institute: value,
                            mobileNo: _student.mobileNo,
                            motherName: _student.motherName,
                            nationality: _student.nationality,
                            instituteId: _student.instituteId);
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text('Nationality'),
                        CountryListPick(
                          appBar: AppBar(
                            title: Text('Select Country'),
                          ),
                          theme: CountryTheme(
                              isShowCode: false,
                              isShowFlag: true,
                              isShowTitle: true,
                              showEnglishName: true,
                              searchText: 'Search'),
                          onChanged: (value) {
                            setState(() {
                              _student.nationality = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Enter your course of study',
                        labelText: 'Course',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        return null;
                      },
                      onSaved: (value) {
                        _student = Student(
                            gen: _student.gen,
                            dateOfBirth: _student.dateOfBirth,
                            name: _student.name,
                            address: _student.address,
                            course: value,
                            fatherName: _student.fatherName,
                            group: _student.group,
                            institute: _student.institute,
                            mobileNo: _student.mobileNo,
                            motherName: _student.motherName,
                            nationality: _student.nationality,
                            instituteId: _student.instituteId);
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Address',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        return null;
                      },
                      onSaved: (value) {
                        _student = Student(
                            gen: _student.gen,
                            dateOfBirth: _student.dateOfBirth,
                            name: _student.name,
                            address: value,
                            course: _student.course,
                            fatherName: _student.fatherName,
                            group: _student.group,
                            institute: _student.institute,
                            mobileNo: _student.mobileNo,
                            motherName: _student.motherName,
                            nationality: _student.nationality,
                            instituteId: _student.instituteId);
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Institute Id',
                        hintText: 'Enter your Institute Id',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        return null;
                      },
                      onSaved: (value) {
                        _student = Student(
                            gen: _student.gen,
                            dateOfBirth: _student.dateOfBirth,
                            name: _student.name,
                            address: _student.address,
                            course: _student.course,
                            fatherName: _student.fatherName,
                            group: _student.group,
                            institute: _student.institute,
                            mobileNo: _student.mobileNo,
                            motherName: _student.motherName,
                            nationality: _student.nationality,
                            instituteId: value);
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        labelText: 'Mobile No.',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        else if (value.length != 10)
                          return 'Please enter a valid number';
                        return null;
                      },
                      onSaved: (value) {
                        _student = Student(
                            gen: _student.gen,
                            dateOfBirth: _student.dateOfBirth,
                            name: _student.name,
                            address: _student.address,
                            course: _student.course,
                            fatherName: _student.fatherName,
                            group: _student.group,
                            institute: _student.institute,
                            mobileNo: int.parse(value),
                            motherName: _student.motherName,
                            nationality: _student.nationality,
                            instituteId: _student.instituteId);
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your class group',
                        labelText: 'Group',
                      ),
                      validator: (value) {
                        if (value.trim().isEmpty)
                          return 'This field can\'t be empty';
                        return null;
                      },
                      onSaved: (value) {
                        _student = Student(
                            gen: _student.gen,
                            dateOfBirth: _student.dateOfBirth,
                            name: _student.name,
                            address: _student.address,
                            course: _student.course,
                            fatherName: _student.fatherName,
                            group: value,
                            institute: _student.institute,
                            mobileNo: _student.mobileNo,
                            motherName: _student.motherName,
                            nationality: _student.nationality,
                            instituteId: _student.instituteId);
                      },
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              )),
        )));
  }
}
