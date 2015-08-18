 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlueValleyWebForm.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blue Valley Reservation Form</title>

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
                <td>Pick Up Date: (XX/XX/201X) </td>
                <td><input type="date" id="pickUpDate" name="pickUpDate" required="true" /></td>
            </tr>
            <tr>
                <td>Return Date: (XX/XX/201X) </td>
                <td><input type="date" id="returnDate" name="returnDate" required="true" /></td>
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

    <!-- validation script -->
    <script src="BlueValleyFormValidate.js"></script>
</body>
</html>
<!-- 
    Windows/System32/inetsrv
    appcmd.exe start apppool BlueValley
-->