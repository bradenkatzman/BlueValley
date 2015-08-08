<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlueValleyWebForm.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blue Valley Customer Enrollment</title>

    <style type="text/css">


    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <th>Information</th>
                <th>Input Field</th>
            </tr>
            <tr>
                <td>First Name: </td>
                <td><input type="text" name="customerFirstName" required="true" /></td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td><input type="text" name="customerLastName" required="true" /></td>
            </tr>
            <tr>
                <td>Phone Number: </td>
                <td><input type="tel" name="phoneNumber" required="true" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
