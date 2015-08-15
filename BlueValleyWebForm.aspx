 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlueValleyWebForm.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blue Valley Customer Enrollment</title>

    <style type="text/css">

    body {
        background-color: #B2E0FF;
    }

    .main {
        width: 80%;
        margin-left: auto;
        margin-right: auto;
        background-color: #FFFFFF;
        border: 2px solid black;
        box-shadow: 4px 4px 4px black;
    }

    .center {
        text-align: center;
    }

    .bold {
        font-weight: bold;
    }

    #policy {
        width: 100%;
        position: relative;
        bottom: 0;
        margin-top: 25px;
        border: 1px solid black;
    }

    </style>
</head>
<body>
    <div class="main center">
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
                <td>Pick Up Date: (XX/XX/XXXX) </td>
                <td><input type="text" id="pickUpDate" name="pickUpDate" required="true" /></td>
            </tr>
            <tr>
                <td>Return Date: (XX/XX/XXXX) </td>
                <td><input type="text" id="returnDate" name="returnDate" required="true" /></td>
            </tr>
        </table>
    </div>
    </form>
            <button type="button" onclick="proceed1();">Next Step --></button>
    </div> <!-- end step 1 -->
        <div class="center" id="step2" style="display: none;">
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

            <button type="button" onclick="proceed2();">Next Step --></button>
        </div>

        <div class="center" id="step3" style="display: none;">
            <h3>Step 3 - Rental Confirmation</h3>
            <p>If the information below is all correct, click the "<span class="bold">Confirm and Pay</span>" button at the bottom.</p>
            <p>If something is incorrect, click "<span class="bold">Reset</span>" to clear the form.</p>

             <table>
                <tr>
                    <td><span class="bold">Group Name: </span><span id="groupName3"></span></td>
                    <td><span class="bold">Pick Up Date: </span><span id="pickUpDate3"></span></td>
                </tr>
                <tr>
                    <td><span class="bold">Email Address: </span><span id="emailAddress3"></span></td>
                    <td><span class="bold">Return Date: </span><span id="returnDate3"></span></td>
                </tr>
                 <tr>
                     <td><span class="bold">Phone Number: </span><span id="phoneNumber3"></span></td>
                     <td><span class="bold">Total Renters: </span><span id="totalRenters3"></span></td>
                 </tr>
            </table>

            <form id="form3"></form>

            <p><span class="bold">Reservation Deposit TOTAL = </span><span id="depositTotal"></span></p>

            <button type="button" onclick="confirm();">Confirm and Pay >></button>
            <button type="button" onclick="reset();">Reset Form</button>
        </div>

        <!-- policy div fixed at bottom of page -->
        <div id="policy">
            <p><span class="bold">NOTE:</span> For groups of 10 or more please call for availability (970) 468-0400</p>
            <p><span class="bold">Cancelation Policy:</span> We have a 72 hour cancelation policy. IF you are unable to
                fulfill your reservation commitment, please let us know at least 72 hours before you are due to arrive
                 and we will refund your online reservation deposit</p>
            <p><span class="bold">When You Arrive:</span> When you are ready to get fitted and pick up your gear you can
                 stop by after 3PM the dat before your reservation starts and you will not be charged. This is actually
                 preferable because you will be all set to catch the first chair in the morning and enjoy a full day on
                 the hill. When returning your gear, please do so by our closing time the last day of your reservation.
            </p>
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
        var renterInfo = []; //we'll fill this with object literals of renter info

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

            //check the dates to make sure they are valid
            if(isNaN(parseInt(_pickUpDate.substring(0,2))) == true ||
               isNaN(parseInt(_pickUpDate.substring(3,5))) == true ||
               isNaN(parseInt(_pickUpDate.substring(6))) == true ||
                _pickUpDate.substring(2,3) != "/" ||
                _pickUpDate.substring(5, 6) != "/") {
                alert("Please enter a date in the format XX/XX/XXXX");
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
            document.getElementById("pickUpDate2").innerHTML = pickUpDate;
            document.getElementById("emailAddress2").innerHTML = emailAddress;
            document.getElementById("returnDate2").innerHTML = returnDate;

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
                var trTitle = document.createElement("tr");

                //create 1 <td> for Renter #_
                var tdTitle = document.createElement("td");
                tdTitle.colspan = "7";
                var tdTitleText = document.createTextNode("Renter #" + i.toString());
                tdTitle.appendChild(tdTitleText);

                //add tdTitle to row
                trTitle.appendChild(tdTitle);

                //add trTitle to table body
                tableBody.appendChild(trTitle);

                //now we'll add the input information
                var tr = document.createElement("tr");
                var td1 = document.createElement("td");
                var td2 = document.createElement("td");
                var td3 = document.createElement("td");
                var td4 = document.createElement("td");
                var td5 = document.createElement("td");
                var td6 = document.createElement("td");
                var td7 = document.createElement("td");
                
                //set up input fields
                var _name = document.createElement("input");
                _name.type = "text";
                _name.id = "name" + i.toString();
                _name.value = "Name";

                var _age = document.createElement("input");
                _age.type = "text";
                _age.id = "age" + i.toString();
                _age.value = "Age";

                var _height = document.createElement("select");
                _height.id = "height" + i.toString();
                
                //create height options
                var defaultH = document.createElement("option");
                defaultH.value = "defaultH";
                defaultH.innerHTML = "Height";

                var h0 = document.createElement("option");
                h0.value = "0";
                h0.innerHTML = "< 4' 10\"";

                var h1 = document.createElement("option");
                h1.value = "1";
                h1.innerHTML = "4' 11\" - 5' 1\"";

                var h2 = document.createElement("option");
                h2.value = "2";
                h2.innerHTML = "5' 2\" - 5' 5\"";

                var h3 = document.createElement("option");
                h3.value = "3";
                h3.innerHTML = "5'6\" - 5' 10\"";

                var h4 = document.createElement("option");
                h4.value = "4";
                h4.innerHTML = "5'11\" - 6' 4\"";

                var h5 = document.createElement("option");
                h5.value = "4";
                h5.innerHTML = "> 6' 5\"";

                //add height options to the <select>
                _height.appendChild(defaultH);
                _height.appendChild(h0);
                _height.appendChild(h1);
                _height.appendChild(h2);
                _height.appendChild(h3);
                _height.appendChild(h4);
                _height.appendChild(h5);

                var _weight = document.createElement("input");
                _weight.type = "text";
                _weight.id = "weight" + i.toString();
                _weight.value = "Weight";

                var _shoe = document.createElement("input");
                _shoe.type = "text";
                _shoe.id = "shoe" + i.toString();
                _shoe.value = "Shoe Size";

                var _skierType = document.createElement("select");
                _skierType.id = "skierType" + i.toString();

                //create skier options
                var defaultT = document.createElement("option");
                defaultT.value = "defaultT";
                defaultT.innerHTML = "Skier Type";

                var type1 = document.createElement("option");
                type1.value = "type1";
                type1.innerHTML = "Type 1";

                var type2 = document.createElement("option");
                type2.value = "type2";
                type2.innerHTML = "Type 2";

                var type3 = document.createElement("option");
                type3.value = "type3";
                type3.innerHTML = "Type 3";

                //add skier options to <select>
                _skierType.appendChild(defaultT);
                _skierType.appendChild(type1);
                _skierType.appendChild(type2);
                _skierType.appendChild(type3);

                var _packageType = document.createElement("select");
                _packageType.id = "packageType" + i.toString();

                //create package options
                var defaultP = document.createElement("option");
                defaultP.value = "defaultP";
                defaultP.innerHTML = "Package Type";

                var package0 = document.createElement("option");
                package0.value = "0";
                package0.innerHTML = "Regular Sport Ski Package";

                var package1 = document.createElement("option");
                package1.value = "1";
                package1.innerHTML = "Sport Ski Package";

                var package2 = document.createElement("option");
                package2.value = "2";
                package2.innerHTML = "Demo Ski Package";

                var package3 = document.createElement("option");
                package3.value = "3";
                package3.innerHTML = "Children's Ski Package";

                var package4 = document.createElement("option");
                package4.value = "4";
                package4.innerHTML = "Snowboard Package";

                var package5 = document.createElement("option");
                package5.value = "5";
                package5.innerHTML = "Children's Snowboard Package";

                var package6 = document.createElement("option");
                package6.value = "6";
                package6.innerHTML = "Demo Snowboard Package";

                var package7 = document.createElement("option");
                package7.value = "7";
                package7.innerHTML = "Snowblades with Boots";

                var package8 = document.createElement("option");
                package8.value = "8";
                package8.innerHTML = "Snowshoes";

                //add the package options to <select>
                _packageType.appendChild(defaultP);
                _packageType.appendChild(package0);
                _packageType.appendChild(package1);
                _packageType.appendChild(package2);
                _packageType.appendChild(package3);
                _packageType.appendChild(package4);
                _packageType.appendChild(package5);
                _packageType.appendChild(package6);
                _packageType.appendChild(package7);
                _packageType.appendChild(package8);

                //add the inputs to the <td>s
                td1.appendChild(_name);
                td2.appendChild(_age);
                td3.appendChild(_height);
                td4.appendChild(_weight);
                td5.appendChild(_shoe);
                td6.appendChild(_skierType);
                td7.appendChild(_packageType);

                //add the <td>s to the <tr>
                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
                tr.appendChild(td4);
                tr.appendChild(td5);
                tr.appendChild(td6);
                tr.appendChild(td7);

                //add the row to the table
                tableBody.appendChild(tr);
            }

            //add the table body to the table
            table.appendChild(tableBody);

            //add table to form
            form.appendChild(table);

            //display step 2 form
            document.getElementById("step2").style.display = "";
        }

        function proceed2() {
            //first we'll validate the form data
            for (var i = 1; i <= numberRenting; i++) {
                //check renter name
                var name_ = document.getElementById("name" + i.toString()).value;
                if(name_ == "Name" || name_ == "") {
                    alert("Please enter a name for Renter #" + i.toString());
                    return;
                }

                var age_ = document.getElementById("age" + i.toString()).value;
                if (isNaN(parseInt(age_)) == true) {
                    alert("Please enter a NUMBER age for Renter #" + i.toString());
                    return;
                }

                //retrieve selected option text
                var selectedIndexH = document.getElementById("height" + i.toString()).selectedIndex;
                var optionsH = document.getElementById("height" + i.toString()).options;
                var height_ = optionsH[selectedIndexH].text;
                if (height_ == "Height") {
                    alert("Please select a height for Renter #" + i.toString());
                    return;
                }

                var weight_ = document.getElementById("weight" + i.toString()).value;
                if (isNaN(parseInt(weight_)) == true) {
                    alert("Please enter a NUMBER weight for Renter #" + i.toString()).value;
                    return;
                }

                var shoeSize_ = document.getElementById("shoe" + i.toString()).value;
                if (isNaN(parseInt(shoeSize_)) == true) {
                    alert("Please enter a NUMBER shoe size for Renter #" + i.toString());
                    return;
                }

                var selectedIndexST = document.getElementById("skierType" + i.toString()).selectedIndex;
                var optionsST = document.getElementById("skierType" + i.toString()).options;
                var skierType_ = optionsST[selectedIndexST].text;
                if (skierType_ == "Skier Type") {
                    alert("Please select a Skier Type for Renter #" + i.toString());
                    return;
                }

                //retrieve selected option text
                var selectedIndexH = document.getElementById("height" + i.toString()).selectedIndex;
                var optionsH = document.getElementById("height" + i.toString()).options;
                var height_ = optionsH[selectedIndexH].text;
                if (height_ == "Height") {
                    alert("Please select a height for Renter #" + i.toString());
                    return;
                }

                var selectedIndexPT = document.getElementById("packageType" + i.toString()).selectedIndex;
                var optionsPT = document.getElementById("packageType" + i.toString()).options;
                var packageType_ = optionsPT[selectedIndexPT].text;
                if (packageType_ == "Package Type") {
                    alert("Please select a Package Type for Renter #" + i.toString());
                    return;
                }

                //if this is reached, all information has been validated

                //construct object literal to pass to renterInfo array
                var renter = {
                    "name": name_,
                    "age": age_,
                    "height": height_,
                    "weight": weight_,
                    "shoeSize": shoeSize_,
                    "skierType": skierType_,
                    "packageType": packageType_
                };

                //add renter to renterInfo array
                renterInfo[i - 1] = renter;
            }

            setupStep3();
        }

        function setupStep3() {
            //fill in step 1 info before displaying div
            document.getElementById("groupName3").innerHTML = groupName;
            document.getElementById("pickUpDate3").innerHTML = pickUpDate;
            document.getElementById("emailAddress3").innerHTML = emailAddress;
            document.getElementById("returnDate3").innerHTML = returnDate;
            document.getElementById("phoneNumber3").innerHTML = phoneNumber;
            document.getElementById("totalRenters3").innerHTML = numberRenting;

            //access form to generate dynamic table
            var form = document.getElementById("form3");

            //create new table element to go inside form
            var table = document.createElement("table");
            table.style.width = "100%"; //set the table to full width

            //create table body to append rows
            var tableBody = document.createElement("tbody");

            for (var i = 0; i < renterInfo.length; i++) {
                //create <tr>
                var tr = document.createElement("tr");

                //create <td>'s
                var td1 = document.createElement("td");
                var td1Text = document.createTextNode(renterInfo[i].name);
                
                var td2 = document.createElement("td");
                var td2Text = document.createTextNode(renterInfo[i].packageType);

                var td3 = document.createElement("td");
                var td3Text = document.createTextNode("Deposit: $10");

                //append text to <td>'s
                td1.appendChild(td1Text);
                td2.appendChild(td2Text);
                td3.appendChild(td3Text);

                //append <td>'s to <tr>
                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);

                //append <tr> to table body
                tableBody.appendChild(tr);
            }

            //append table body to table
            table.appendChild(tableBody);

            //append table to form
            form.appendChild(table);

            //set deposit total
            document.getElementById("depositTotal").innerHTML = "$" + (parseInt(numberRenting) * 10).toString() + ".00"

            //make step3 visible
            document.getElementById("step3").style.display = "";
        }

        function reset() {
            alert("reset");
        }
    </script>
</body>
</html>

<!-- 
    Windows/System32/inetsrv
    appcmd.exe start apppool BlueValley
-->