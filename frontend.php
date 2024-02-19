<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="styles.css"> -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <title>Somgester: Grade-Sheet</title>
</head>
<style>
    body {
        background-image: linear-gradient(#747474, #614ad3);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px 0px white;
        width: 90vw;
        max-width: 600px;
    }

    .container h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .container form {
        display: flex;
        flex-direction: column;
    }

    .container form input {
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 4px;
        border: 1px solid #ddd;
    }

    .container form button {
        padding: 10px;
        border-radius: 4px;
        border: none;
        background-color: #614ad3;
        color: white;
        cursor: pointer;
    }

    .container form button:hover {
        background-color: transparent;
        border: 1px solid #614ad3;
        color: black;
    }

    @media (min-width: 768px) {
        .container {
            width: 70vw;
        }
    }

    @media (min-width: 1024px) {
        .container {
            width: 30vw;
        }
    }

    @media screen and (max-width: 600px){
        .container {
            width: 90vw;
        }
    }

    @media screen and (max-width: 400px){
        .container {
            width: 80vw;
        }
    }

    @media screen and (max-width: 300px){
        .container {
            width: 70vw;
        }
    }

    @media (max-width: 768px) {
        .container {
            width: 80vw;
        }
    }

</style>

<body>
    <div class="container">
        <h2>Result</h2>
        <form action="generate_grade.php" method="post">
            <label for="rollNumber"><i>RollNumber:</i></label>
            <input type="text" name="rollNumber" id="rollNumber" required placeholder = "Enter Your Roll Number">
            <button type="submit">Check Your Grade</button>
        </form>
    </div>
</body>
</html>