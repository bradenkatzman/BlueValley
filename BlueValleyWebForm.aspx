 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlueValleyWebForm.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blue Valley Customer Enrollment</title>

    <style type="text/css">

    .main {
        text-align: center;
        width: 80%;
        margin-left: auto;
        margin-right: auto;
    }

    .bold {
        font-weight: bold;
    }

    </style>
</head>
<body>
    <div class="main">
        <h1 class="bold">Reservation Form</h1>
        <p>Welcome to our online ski & snowboard rental reservation system.
            <ul>
                <li>Each reservation requires a <span class="bold">$10</span> deposit per person.</li>
                <li>Remaining amout due will be paid at time of pick up.</li>
                <li>Payments are received through <span class="bold">PayPal.com</span>"</li>
            </ul>
        </p>
        <div id="step1">
            <h3>Step 1 - Online Rental Reservations</h3>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <th>Information</th>
                <th>Input Field</th>
            </tr>
            <tr>
                <td>How many people are renting?</td>
                <td>
                    <select id="numberRenting">
                        <option value="-">--</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Group Name: </td>
                <td><input type="text" id="groupName" name="groupName" required="true" /></td>
            </tr>
            <tr>
                <td>Phone Number: </td>
                <td><input type="tel" id="phoneNumber" name="phoneNumber" required="true" /></td>
            </tr>
            <tr>
                <td>Email Address: </td>
                <td><input type="email" id="email" name="email" required="true" /></td>
            </tr>
            <tr>
                <td>Pick Up Date: </td>
                <td><input type="date" id="pickUpDate" name="pickUpDate" required="true" /></td>
            </tr>
            <tr>
                <td>Return Date: </td>
                <td><input type="date" id="returnDate" name="returnDate" required="true" /></td>
            </tr>
        </table>
    </div>
    </form>
            <button type="button" onclick="proceed1();">Next Step --></button>
    </div> <!-- end step 1 -->
        <!-- Add Dynamic Group Name, Email, Pick up, Return, Total Renters -->
        <div id="step2">
            <form id="form2">
                <table>
                    <tr colspan="7">
                        Renter #1
                    </tr>
                    <tr>
                        <td><input type="text" name="renter1Name" value="Name"/></td>
                    </tr>
                </table>
            </form>

        </div>



    </div> <!-- end main -->

    <script type="text/javascript">
        function proceed1() {
            if (document.getElementById("numberRenting").value
                == "-") {
                alert("Please enter the number of people in your group.");
                return;
            }
            else if (document.getElementById("groupName").value
                == "") {
                alert("Please enter a 'Group Name'");
                return;
            }
            else if (document.getElementById("phoneNumber").value
                == "") {
                alert("Please enter a 'Phone Number'");
                return;
            }
            else if (document.getElementById("email").value
                == "") {
                alert("Please enter an 'Email Address'");
                return;
            }
            else if (document.getElementById("pickUpDate").value
                == "") {
                alert("Please enter a 'Pick Up Date'");
                return;
            }
            else if (document.getElementById("returnDate").value
                == "") {
                alert("Please enter a 'Return Date'");
                return;
            }
        }
    </script>
</body>
</html>