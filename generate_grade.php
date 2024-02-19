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
    background-color: linear-gradient(#747474, #614ad3);
}

.container {
    max-width: 600px;
    height: auto;
    margin: 200px auto;
    padding: 0 15px;
    display: flex;
    justify-content: center;
    align-items:center;
    flex-direction: column;
}

h2 {
    color: #6c757d;
    margin-bottom: 20px;
}

p {
    color: #343a40;
}

.table {
    border-collapse: collapse;
    width: 100%;
    border-radius: 4px;
}

.table th, .table td {
    /* background-color: rgb(0,0,0,0.1); */
    color: #343a40;
    border: 1px solid #ddd;
    padding: 8px;
}

.table tr:nth-child(even){background-color: #f2f2f2;}

.table th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}

@media (max-width: 600px) {
    .container {
        width: 100%;
        padding: 0;
    }
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

        echo "<table class='table table-striped'>";
        echo "<thead><tr><th>Course Code</th><th>Grade</th><th>Points</th></tr></thead>";
        echo "<tbody>";

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

            echo "<tr><td>{$row['Course_code']}</td><td>{$row['Grade']}</td><td>$points</td></tr>";
        }

            echo "</tbody></table>";
            $gpa = ($totalPoints / $totalCredits);
            echo "<b><p style='color: blue; font-size: 18px;'>Your Total Credits: $totalCredits</b></p>";
            echo"<b><p style='color: green; font-size: 20px;'>Your CGPA: " . number_format($gpa, 2) . "</p></b>";
        }
        else 
        {
            echo "<p style='color: red; font-size: 16px;'>Invalid Roll No.</p>";
        }
        ?>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>