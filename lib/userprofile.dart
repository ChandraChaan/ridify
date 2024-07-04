
import 'package:flutter/material.dart';

class UserprofileWidget extends StatefulWidget {
  const UserprofileWidget({Key? key}) : super(key: key);

  @override
  State<UserprofileWidget> createState() => _UserprofileWidgetState();
}

class _UserprofileWidgetState extends State<UserprofileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 8),
              Container(
                width: 30,
                height: 28,
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.edit_outlined,
                  size: 24,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text(
                            'Followers',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.green,
                          ],
                          stops: [0, 1],
                          begin: AlignmentDirectional(1, -1),
                          end: AlignmentDirectional(-1, 1),
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/842/600',
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text(
                            'Following',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Text(
                  'Siva krishna Reddy',
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, -1),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Stats',
                            ),
                            SizedBox(height: 16),
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              children: [
                                _buildStatItem('56.4k', 'Customers', Icons.supervisor_account_rounded, context),
                                _buildStatItem('56.4k', 'Customers', Icons.supervisor_account_rounded, context),
                                _buildStatItem('56.4k', 'Customers', Icons.supervisor_account_rounded, context),
                                _buildStatItem('56.4k', 'Customers', Icons.supervisor_account_rounded, context),
                              ],
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Icon(
                                Icons.loop_outlined,
                                size: 24,
                              ),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 100, // Set a fixed height as an example
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
          ),
          SizedBox(height: 8),
          Text(value),
          Text(label),
        ],
      ),
    );
  }
}
