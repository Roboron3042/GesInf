# GesInf
Repositorio del grupo de C++ y MySQL de Gestión de Información

# Cómo empezar
1. Descargar el instalador de MySQL https://dev.mysql.com/downloads/windows/installer/8.0.html.
2. Instalar "MySQL Notifier", "MySQL for Visual Studio", "MySQL Server" y "MySQL Workbench".
3. Configuramos el servidor dejando el puerto en 3306 y la contraseña "admin".
4. Anteriormente podíamos seleccionar el conector con C++, pero en la MV da error al instalarlo así que lo descargamos de aquí: https://dev.mysql.com/downloads/connector/cpp/ (como ZIP, lo descomprimís en C: por ejemplo).
5. Abrimos MySQL Workbench y en "Options File" ponemos lower_case_table_names a 2.
6. Detenemos / Iniciamos el servidor.
7. Vamos a Server -> Data Import e importamos el archivo de generación SQL de este repositorio.