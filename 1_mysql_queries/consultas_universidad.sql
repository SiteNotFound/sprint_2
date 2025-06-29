SELECT apellido1, apellido2, nombre FROM persona WHERE tipo LIKE 'alumno' ORDER BY apellido1;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo LIKE 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo LIKE 'alumno' AND fecha_nacimiento LIKE '1999%';
SELECT * FROM persona WHERE tipo LIKE 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM asignatura INNER JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE nif LIKE '26902806M';
SELECT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_grado = 4;
SELECT * FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno WHERE id_curso_escolar = 5;

SELECT departamento.nombre, apellido1, apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id INNER JOIN departamento ON departamento.id = profesor.id_departamento ORDER BY departamento.nombre;
SELECT departamento.nombre, apellido1, apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id INNER JOIN departamento ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL ORDER BY departamento.nombre;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL; 
SELECT * FROM persona LEFT JOIN asignatura ON asignatura.id_profesor = persona.id WHERE persona.tipo LIKE 'profesor' AND asignatura.id_profesor IS NULL;
SELECT * FROM asignatura LEFT JOIN persona ON persona.id = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT DISTINCT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura WHERE alumno_se_matricula_asignatura.id_asignatura IS NULL;

SELECT COUNT(persona.id) AS total_alumnos FROM persona WHERE tipo LIKE 'alumno';
SELECT COUNT(persona.id) FROM persona WHERE tipo LIKE 'alumno' AND fecha_nacimiento LIKE '%1999%';
SELECT departamento.nombre, COUNT(profesor.id_profesor) AS profesores FROM departamento INNER JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;
SELECT departamento.nombre AS departamento, COUNT(profesor.id_profesor) AS total_profesores FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id;
SELECT grado.nombre, COUNT(asignatura.id) AS total_asignaturas FROM grado LEFT JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id ORDER BY total_asignaturas DESC; 
SELECT grado.nombre, COUNT(asignatura.id) AS total_asignaturas FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id HAVING COUNT(*) > 40;
SELECT grado.nombre, asignatura.tipo, SUM(creditos) AS creditos FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY grado.id, asignatura.tipo;
SELECT curso_escolar.anyo_inicio, COUNT(*) AS total_alumnos FROM alumno_se_matricula_asignatura INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
SELECT persona.apellido1, persona.apellido2, persona.nombre, COUNT(asignatura.id) AS total_asignaturas FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT * FROM persona WHERE persona.fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'alumno'); 
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id INNER JOIN departamento ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id IS NULL;