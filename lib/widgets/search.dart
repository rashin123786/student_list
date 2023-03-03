import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_1/providers/db_function_provider.dart';
import 'package:students_1/widgets/studentdetails.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final enterdText = TextEditingController();
bool ist = true;

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DbProvider>(context, listen: false).getallstudent();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 25,
                right: 25,
              ),
              child: Consumer(
                builder: (context, value, child) {
                  return TextFormField(
                    controller: enterdText,
                    onChanged: (value) =>
                        Provider.of<DbProvider>(context, listen: false)
                            .searchResult(value),
                    validator: (value) =>
                        value!.isEmpty ? 'Please Enter a the name' : null,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      fillColor: Colors.grey,
                      hintText: 'Search Your Location',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Provider.of<DbProvider>(context).foundetails.isEmpty
                ? Consumer<DbProvider>(
                    builder: (context, value, child) {
                      return Text(
                        value.notfound,
                      );
                    },
                  )
                : Consumer<DbProvider>(
                    builder: (context, value, child) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final resultdata = value.foundetails[index];
                            return ListTile(
                              title: Text(resultdata.names),
                              leading: CircleAvatar(
                                backgroundColor: Colors.accents[index],
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StudentDetails(datas: resultdata),
                                ),
                              ),
                            );
                          },
                          itemCount: value.foundetails.length,
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
