-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name` AS `Nome`,  `students`.`surname` AS `Cognome`,`degrees`.`name` AS `Corso`
FROM `students` 
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia'

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT `degrees`.`name` AS `Corsi`, `departments`.`name` AS `Dipartimento`
FROM `degrees`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze'

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers`.`name` AS `Nome`, `teachers`.`surname` AS `Cognome`, `courses`.`name` AS `Corso`
FROM `course_teacher`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teacher_id`= 44

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT
`students`.`surname` AS `Cognome`,
`students`.`name` AS `Nome`,
`degrees`.`name` AS `Corso`,
`departments`.`name` AS `Dipartimento`,
`degrees`.`level` AS `Tipo`,
`degrees`.`address` AS `Indirizzo`,
`degrees`.`email` AS `Email`,
`degrees`.`website` AS `Sito internet`
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `Cognome` ASC, `Nome` ASC

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT
`degrees`.`name` AS `Corso di Laurea`,
`courses`.`name` AS `Materie`,
`teachers`.`name` AS `Nome`,
`teachers`.`surname` AS `Cognome`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
ORDER BY `Corso di Laurea` ASC


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT
`teachers`.`surname` AS `Cognome`,
`teachers`.`name` AS `Nome`,
`departments`.`name` AS `Dipartimento`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`id` = 5
ORDER BY `Cognome` ASC, `Nome` ASC

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

SELECT
`students`.`name` AS `Nome`,
`students`.`surname` AS `Cognome`,
`exam_student`.`vote` AS `Voto`,
`courses`.`name` AS `Esame`
FROM `students`
JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
ORDER BY `Cognome`,`Nome`