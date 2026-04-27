sqoop import \
--connect jdbc:mysql://servidor_db:3306/ventas_db \
--username admin \
--password-file /user/hadoop/seguridad/db_pass.txt \
--table clientes \
--target-dir /datalake/raw/clientes