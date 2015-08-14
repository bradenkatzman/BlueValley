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
        <div id="step2" style="display: none;">
            <h3>Step 2 - Renter Information</h3>
            <table>
                <tr>
                    <td><span class="bold">Group Name: </span><span id="groupName2"></span></td>
                    <td><span class="bold">Pick Up Date: </span><span id="pickUpDate2"></span></td>
                </tr>
                <tr>
                    <td><span class="bold">Email Address: </span><span id="emailAddress2"></span></td>
                    <td><span class="bold">Return Date: </span><span id="returnDate2"></span></td>
                </tr>
            </table>
            <form id="form2"></form>
        </div>



    </div> <!-- end main -->

    <script type="text/javascript">

        //these are the global variables that will make up our JSON object
        //to push to Journey
        var numberRenting;
        var groupName;
        var phoneNumber;
        var emailAddress;
        var pickUpDate;
        var returnDate;

        function proceed1() {

            //pull our current form data
            var _numberRenting = document.getElementById("numberRenting").value;
            var _groupName = document.getElementById("groupName").value;
            var _phoneNumber = document.getElementById("phoneNumber").value;
            var _emailAddress = document.getElementById("email").value;
            var _pickUpDate = document.getElementById("pickUpDate").value;
            var _returnDate = document.getElementById("returnDate").value;

            if (_numberRenting == "-") {
                alert("Please enter the number of people in your group.");
                return;
            }
            else if (_groupName == "") {
                alert("Please enter a 'Group Name'");
                return;
            }
            else if (_phoneNumber == "") {
                alert("Please enter a 'Phone Number'");
                return;
            }
            else if (_emailAddress == "") {
                alert("Please enter an 'Email Address'");
                return;
            }
            else if (_pickUpDate == "") {
                alert("Please enter a 'Pick Up Date'");
                return;
            }
            else if (_returnDate == "") {
                alert("Please enter a 'Return Date'");
                return;
            }

            //let's assign the form values to our global variables
            numberRenting = _numberRenting;
            groupName = _groupName;
            phoneNumber = _phoneNumber;
            emailAddress = _emailAddress;
            pickUpDate = _pickUpDate;
            returnDate = _returnDate;

            setupStep2();
        }

        function setupStep2() {
            //fill in step 1 info before displaying div
            document.getElementById("groupName2").innerHTML = groupName;

            //display step 2 form
            document.getElementById("step2").style.display = "";

            //access form to generate dynamic table
            var form = document.getElementById("form2");

            //create new table element to go inside form
            var table = document.createElement("table");
            table.style.width = "100%"; //set the table to full width

            //create table body to append rows
            var tableBody = document.createElement("tbody");

            //loop through number of renters and generate table rows
            for (var i = 1; i <= numberRenting; i++) {
                //we'll separate renter rows with titles
                var trTitle = document.createElement('tr');

                //create 1 <td> for Renter #_
                var tdTitle = document.createElement("td");
                tdTitle.colspan = "7";
                tdTitleText = document.createTextNode("Renter #" + i.toString());
                tdTitle.appendChild(tdTitleText);

                //add tdTitle to row
                trTitle.appendChild(tdTitle);

                //add trTitle to table body
                tableBody.appendChild(trTitle);
            }

            //add the table body to the table
            table.appendChild(tableBody);

            //add table to form
            form.appendChild(table);
        }
    </script>
</body>
</html>