SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND SUBSTRING(nif, 8, 1) = 'K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nom_departament FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre AS nom_assignatura, ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN asignatura a ON am.id_asignatura = a.id JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE p.nif = '26902806M';
SELECT persona.nombre, persona.apellido1, persona.apellido2  FROM profesor LEFT JOIN persona ON profesor.id_profesor = persona.id WHERE profesor.id_departamento IS NULL;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_profesor IS NULL;
SELECT profesor.nombre, profesor.apellido1, profesor.apellido2 FROM profesor LEFT JOIN asignatura_profesor ON profesor.id_profesor = asignatura_profesor.id_profesor WHERE asignatura_profesor.id_asignatura IS NULL;
SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS alumnos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre AS nom_departament, COUNT(p.id_profesor) AS num_professors FROM departamento d JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY num_professors DESC;
SELECT d.nombre AS nom_departament, COUNT(p.id_profesor) AS num_professors FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY nom_departament;
SELECT g.nombre AS nom_grau, COUNT(a.id) AS num_assignatures FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY num_assignatures DESC;
SELECT g.nombre AS nom_grau, COUNT(a.id) AS num_assignatures FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING num_assignatures > 40 ORDER BY num_assignatures DESC;
SELECT g.nombre AS nom_grau, a.tipo, SUM(a.creditos) AS suma_credits FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS alumnes_matriculats FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT p.* FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_departamento IS NOT NULL AND a.id IS NULL;




