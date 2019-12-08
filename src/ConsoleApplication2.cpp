// ConsoleApplication2.cpp: define el punto de entrada de la aplicación de consola.
//

/* Standard C++ includes */
#include <stdlib.h>
#include <iostream>

/*
Include directly the different
headers from cppconn/ and mysql_driver.h + mysql_util.h
(and mysql_connection.h). This will reduce your build time!
*/
#include "mysql_connection.h"

#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>

using namespace std;

int main(void)
{
	cout << endl;
	cout << "Running 'SELECT Cultivo FROM tMuestra'" << endl;

		try {
		sql::Driver *driver;
		sql::Connection *con;
		sql::Statement *stmt;
		sql::PreparedStatement *pstmt;
		sql::ResultSet *res;

		/* Create a connection */
		driver = get_driver_instance();
		con = driver->connect("tcp://127.0.0.1:3306", "root", "admin");
		/* Connect to the MySQL test database */
		con->setSchema("GI");
		stmt = con->createStatement();
		pstmt = con->prepareStatement("SELECT Cultivo FROM tMuestra");
		res = pstmt->executeQuery();

		while (res->next()) {
			cout << "\t... MySQL replies: ";
			cout << res->getString("Cultivo") << endl;
		}
		delete res;
		delete stmt;
		delete con;
		delete pstmt;
	}
	catch (sql::SQLException &e) {
		cout << "# ERR: SQLException in " << __FILE__;
		cout << "(" << __FUNCTION__ << ") on line " << __LINE__ << endl;
		cout << "# ERR: " << e.what();
		cout << " (MySQL error code: " << e.getErrorCode();
		cout << ", SQLState: " << e.getSQLState() << " )" << endl;
	}

	cout << endl;

	while (1);

	return EXIT_SUCCESS;
}

