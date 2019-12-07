# GesInf
Repositorio del grupo de C++ y MySQL de Gestión de Información

# Cómo configurar el servidor
1. Descargar el instalador de MySQL https://dev.mysql.com/downloads/windows/installer/8.0.html.
2. Instalar "MySQL Notifier", "MySQL for Visual Studio", "MySQL Server" y "MySQL Workbench".
3. Configuramos el servidor dejando el puerto en 3306 y la contraseña "admin".
4. Abrimos MySQL Workbench y en "Options File" ponemos lower_case_table_names a 2.
5. Detenemos / Iniciamos el servidor.
6. Vamos a Server -> Data Import e importamos el archivo de generación SQL de este repositorio.

# Cómo configurar el conector
1. Anteriormente podíamos seleccionar en el instalador el conector con C++, pero en la MV da error al instalarlo así que lo descargamos de aquí: https://dev.mysql.com/downloads/connector/cpp/ (descomprimidlo en la raíz de C:\).
2. Descargamos Boost https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.zip y descomprimimos la carpeta "boost" en "C:\mysql-connector-c++-8.0.18-win32\include\jdbc"
3. En el proyecto de Visual Studio, en el configurador de soluciones elegimos "Release" en lugar de "Debug"
4. En configuración del proyecto, vamos a "C/C++->General" y en "Directorio de inclusión adicionales" añadimos la ruta "C:\mysql-connector-c++-8.0.18-win32\include\jdbc"
5. Vamos a "C/C++->Generación de código" y en "Biblioteca en tiempo de ejecución" escogemos "DLL multiproceso (/MD)"
6. Vamos a "Vinculador->General" y en "Directorios de bibliotecas adicionales" añadimos la ruta "C:\mysql-connector-c++-8.0.18-win32\lib"
7. Vamos a "Vinculador->Entrada" y en "Dependencias adicionales" añadimos el fichero "vs14/mysqlcppconn.lib"
8. En el explorador abrimos "C:\mysql-connector-c++-8.0.18-win32\lib" y copiamos "libcrypto-1_1.dll", "libssl-1_1.dll" y "mysqlcppconn-7-vs14.dll" a la carpeta donde esta(rá) el ejecutable de nuestro proyecto (normalmente en "NombreProyecto\NombreProyecto")
