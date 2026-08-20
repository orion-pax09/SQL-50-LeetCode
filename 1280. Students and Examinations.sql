SELECT 
    s.student_id,              -- Get the student's ID
    s.student_name,             -- Get the student's name
    sub.subject_name,           -- Get the subject name (from the CROSS JOIN, so every subject shows up)
    COUNT(e.subject_name)       -- Count how many exam records matched for this student+subject combo
        AS attended_exams       -- Rename that count column to "attended_exams"
FROM Students AS s              -- Start from the Students table, alias it "s"
CROSS JOIN Subjects AS sub      -- Combine every student with every subject (all possible combinations)
LEFT JOIN Examinations AS e     -- Now try to match exam records, but keep all student-subject rows even if no match
    ON s.student_id = e.student_id          -- Match exam record to the same student
    AND e.subject_name = sub.subject_name   -- AND match exam record to the same subject
GROUP BY 
    s.student_id,                -- Group results per student (by ID)
    s.student_name,               -- ...and by name (needed since it's in SELECT)
    sub.subject_name              -- ...and by subject, so we get one row per student-subject pair
ORDER BY 
    s.student_id;                 -- Sort final results by student ID
