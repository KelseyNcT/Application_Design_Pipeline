<?php
// Database connection
$host = 'localhost';          // Database host
$dbname = 'kelsey';  // Replace with your database name
$username = 'root';           // Default username for localhost
$password = '';               // Default password for localhost

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);



$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submissions
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['submit_user'])) {
        // Handle user data submission with prepared statement
        $name = $conn->real_escape_string($_POST['name']);
        $email = $conn->real_escape_string($_POST['email']);
        $age = intval($_POST['age']);

        $sql = "INSERT INTO users (name, email, age) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        
        if ($stmt) {
            $stmt->bind_param("ssi", $name, $email, $age);
            if ($stmt->execute()) {
                echo "<p style='color: green;'>Sign up complete your data is definitely safe with us!</p>";
            } else {
                echo "<p style='color: red;'>Error: " . $stmt->error . "</p>";
            }
            $stmt->close();
        } else {
            echo "<p style='color: red;'>Error preparing statement: " . $conn->error . "</p>";
        }
    }
    elseif (isset($_POST['submit_contact'])) {
        // Handle contact form submission
        $name = htmlspecialchars($_POST['name']);
        $email = htmlspecialchars($_POST['email']);
        $message = htmlspecialchars($_POST['message']);

        echo "<div style='border: 1px solid #ccc; padding: 10px; margin: 10px 0;'>";
        echo "<p>Thank you, $name! your message is definitely begin taken seriously.</p>";
        echo "<p>We will get back to you at $email soon.</p>";
        echo "<p>Your message: $message</p>";
        echo "</div>";
    }
}

// Determine which page to display
$page = isset($_GET['page']) ? $_GET['page'] : 'home';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cloud Therapy</title>
    <style>
    /* General Styles */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #E5E0F5;
        color: #333;
        line-height: 1.6;
    }

    h1 {
        color: #9374EE;
        font-size: 2.5rem;
        margin-bottom: 20px;
        text-align: center;
    }

    p {
        font-size: 1.1rem;
        margin-bottom: 20px;
        text-align: center;
    }

    a {
        color: #6930c3;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    /* Navigation Bar */
    nav {
        background-color: #51427f;
        padding: 15px 20px;
        text-align: center;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    nav a {
        color: #ecf0f1;
        margin: 0 15px;
        font-size: 1.1rem;
        font-weight: bold;
    }

    nav a:hover {
        color: #E7C6FF;
        text-decoration: none;
    }

    /* Forms */
    form {
        max-width: 500px;
        margin: 20px auto;
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #2c3e50;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"],
    textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 1rem;
        box-sizing: border-box;
    }

    textarea {
        resize: vertical;
        height: 120px;
    }

    button {
        display: block;
        width: 100%;
        padding: 12px;
        background-color: #51427f;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #E7C6FF;
    }

    /* Tables */
    table {
        width: 100%;
        max-width: 800px;
        margin: 20px auto;
        border-collapse: collapse;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #51427f;
        color: #ecf0f1;
        font-weight: bold;
    }

    tr:hover {
        background-color: #f9f9f9;
    }

    /* Messages */
    .success {
        color: #27ae60;
        background-color: #e8f6ef;
        padding: 10px;
        border-radius: 4px;
        text-align: center;
        margin: 20px auto;
        max-width: 500px;
    }

    .error {
        color: #e74c3c;
        background-color: #fdedec;
        padding: 10px;
        border-radius: 4px;
        text-align: center;
        margin: 20px auto;
        max-width: 500px;
    }

    /* Footer */
    footer {
        text-align: center;
        padding: 20px;
        background-color: #2c3e50;
        color: #ecf0f1;
        margin-top: 40px;
    }

    footer a {
        color: #3498db;
    }

    footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <nav>
        <a href="index1.php?page=home">Home</a> |
        <a href="index1.php?page=contact">Talk to us</a> |
		<a href="index1.php?page=about">About</a> |
        <a href="index1.php?page=retrieve">View Data</a>
    </nav>

    <?php
    switch ($page) {
        case 'home':
            ?>
            <h1>Sign up Now!!!</h1>
            <form action="index1.php?page=home" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required><br><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required><br><br>

                <button type="submit" name="submit_user">Submit</button>
            </form>
            <?php
            break;

        case 'about':
            ?>
            <div class="about-section" style="max-width: 800px; margin: 0 auto; padding: 20px;">
            <h1 style="color: #2c3e50; text-align: center; font-size: 1.5rem;">
                ☁️ Welcome to Cloud Therapy! <span style="font-size: 1rem;">(Actual clouds not included but support is 100% real)</span>
            </h1>
            
            <div style="background: white; border-radius: 15px; padding: 25px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                <p style="font-size: 1.2em; text-align: center;">
                    Life's messy. One minute, you're thriving; the next, you're questioning that third taco 🌮<br>
                    We're your digital safe space—zero judgment, 100% free, unlimited virtual cookies 🍪 
                    <span style="font-style: italic; color: #666;">(gluten-free available)</span>
                </p>

                <h2 style="color: #2c3e50; border-bottom: 2px solid #e74c3c; padding-bottom: 10px;">Why We Exist</h2>
                <ul style="list-style: none; padding-left: 0;">
                    <li style="margin-bottom: 15px; padding: 10px; background: #f8f9fa; border-radius: 8px;">
                        🚀 <strong>No couch required</strong> <span style="color: #666;">(PJs encouraged)</span>
                    </li>
                    <li style="margin-bottom: 15px; padding: 10px; background: #f8f9fa; border-radius: 8px;">
                        😂 <strong>Therapists who laugh at your "I'm fine" jokes</strong>
                    </li>
                    <li style="margin-bottom: 15px; padding: 10px; background: #f8f9fa; border-radius: 8px;">
                        💸 <strong>Free sessions</strong>—because sanity shouldn't cost a fortune
                    </li>
                    <li style="margin-bottom: 15px; padding: 10px; background: #f8f9fa; border-radius: 8px;">
                        🚫 <strong>Zero pressure</strong> <span style="color: #666;">(except gentle reminders to hydrate)</span>
                    </li>
                </ul>

                <h2 style="color: #2c3e50; border-bottom: 2px solid #e74c3c; padding-bottom: 10px;">Meet the Squad</h2>
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">
                    <div style="text-align: center; padding: 15px; background: #f8f9fa; border-radius: 10px;">
                        <div style="font-size: 2em;">🐱</div>
                        <h3 style="margin: 10px 0;">Dr. Whiskers</h3>
                        <p style="color: #666;">Anxiety relief via cat memes</p>
                    </div>
                    <div style="text-align: center; padding: 15px; background: #f8f9fa; border-radius: 10px;">
                        <div style="font-size: 2em;">🧘♂️</div>
                        <h3 style="margin: 10px 0;">Guru Greg</h3>
                        <p style="color: #666;">Mindfulness & surviving family group chats</p>
                    </div>
                    <div style="text-align: center; padding: 15px; background: #f8f9fa; border-radius: 10px;">
                        <div style="font-size: 2em;">🌪️</div>
                        <h3 style="margin: 10px 0;">Captain Chaos</h3>
                        <p style="color: #666;">Helps you adult without spiraling</p>
                    </div>
                    <div style="text-align: center; padding: 15px; background: #f8f9fa; border-radius: 10px;">
                        <div style="font-size: 2em;">⭐</div>
                        <h3 style="margin: 10px 0;">You</h3>
                        <p style="color: #666;">The real MVP</p>
                    </div>
                </div>

                <div style="margin-top: 30px; padding: 20px; background: #ffe6e6; border-radius: 10px; text-align: center;">
                    <p style="margin: 0;">
                        Whether you're stressed, sad, or furious about a canceled Netflix show, we got you.<br>
                        Come for the therapy, stay for the accidental life advice.
                    </p>
                    <p style="margin: 15px 0 0; font-style: italic; color: #666;">
                        P.S. We don't judge. (Except pineapple on pizza. 🍍🔥)
                    </p>
                </div>
            </div>
        </div>

            <?php
            break;

        case 'contact':
            ?>
            <h1>Free therapy!! write your thoughts here!!</h1>
            <form action="index1.php?page=contact" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required><br><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>

                <label for="message">Message:</label><br>
                <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>

                <button type="submit" name="submit_contact">Send Message</button>
            </form>
            <?php
            break;

        case 'retrieve':
            ?>
            <h1>Your data we definitely don't need</h1>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Appointment made at</th>
                </tr>
                <?php
                $sql = "SELECT * FROM users";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>{$row['id']}</td>
                                <td>{$row['name']}</td>
                                <td>{$row['email']}</td>
                                <td>{$row['age']}</td>
                                <td>{$row['created_at']}</td>
                              </tr>";
                    }
                } else {
                    echo "<tr><td colspan='5'>No data found</td></tr>";
                }
                ?>
            </table>
            <?php
            break;

        default:
            echo "<h1>Welcome to the Homepage</h1>";
            break;
    }
    ?>
</body>
</html>

<?php
$conn->close();
?>
