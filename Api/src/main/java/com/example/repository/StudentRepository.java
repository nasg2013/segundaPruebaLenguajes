package com.example.repository;

        import com.example.lab.Student;
        import org.springframework.data.jpa.repository.JpaRepository;
        import org.springframework.data.jpa.repository.Query;
        import org.springframework.data.repository.query.Param;

        import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Integer> {

       @Query(value="SelectStudent", nativeQuery = true)
        List<Student> getAllStudents();

        @Query(value = "{ call SelectStudentById(:Student_id)}", nativeQuery = true)
        Student getStudentById(@Param("Student_id") Integer studentId);
}
