<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Somgester : Grade Sheet</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>

<style>
    body {
    background-color: #f8f9fa;
}

.container {
    max-width: 600px;
    margin: auto;
}

h2 {
    color: #6c757d;
    margin-bottom: 20px;
}

p {
    color: #343a40;
}
</style>
<body>
    <div class="container">
        <?php
        include("connection.php");

        $rollNumber = $_POST['rollNumber'];


        $sql = "SELECT Courses.Course_code, Courses.Credits, Grades.Grade
                FROM Students
                JOIN Grades ON Students.RN = Grades.RN
                JOIN Courses ON Grades.Course_code = Courses.Course_code
                WHERE Students.RN = '$rollNumber'";
        $result = $con->query($sql);

        if ($result->num_rows > 0) {
            echo "<h2>Grade Sheet for $rollNumber</h2>";
            $totalCredits = 0;
            $totalPoints = 0;


            while ($row = $result->fetch_assoc()) {
                $credits = $row['Credits'];
                $grade = $row['Grade'];
            
                switch ($grade) {
                    case 'A':
                        $points = 10;
                        break;
                    case 'B':
                        $points = 8;
                        break;
                    case 'C':
                        $points = 6;
                        break;
                    case 'D':
                        $points = 4;
                        break;
                    default:
                        $points = 0; 
                }

                $totalPoints += ($points * $credits);
                $totalCredits += $credits;

                echo "<p>{$row['Course_code']}: {$row['Grade']} (Points: $points)</p>";
            }

            $gpa = ($totalPoints / $totalCredits);
            echo "<p>Your Credits: $totalCredits</p>";
            echo "<p>Your CGPA: " . number_format($gpa, 2) . "</p>";
        } else {
            echo "<p>Invalid Roll No.</p>";
        }
        ?>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>