<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payload Vault</title>
    <link rel="stylesheet" href="css\stylesheet.css">
</head>
<body>
    <header>
        <img src="image\harmonigate.png" alt="Harmonigate.com">
        <h1>Payload Vault</h1>
    </header>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Document Id</th>
                    <th>Interface Id</th>
                    <th>Source</th>
                    <th>Target</th>
                    <th>Interface Name</th>
                    <th>Tracking Id</th>
                    <th>Document Type</th>
                    <th>Document Name</th>
                    <th>Inserted date</th>
                    <th>Transaction Id</th>
                    <th>Identifier 1</th>
                    <th>Identifier 2</th>
                    <th>Identifier 3</th>
                    <th>Identifier 4</th>
                    <th>Payload</th>
                </tr>
            </thead>
            %invoke HG_PayloadVault.v1.UI:getTransactions%
            <tbody>
                %loop viewTransactionsOutput/results%
                <tr>
                    <td>%value DOCUMENTID%</td>
                    <td>%value INTERFACE_ID%</td>
                    <td>%value SOURCE%</td>
                    <td>%value TARGET%</td>
                    <td>%value INTERFACE_NAME%</td>
                    <td>%value TRACKING_ID%</td>
                    <td>%value DOCUMENT_TYPE%</td>
                    <td>%value DOCUMENT_NAME%</td>
                    <td>%value INSERTED_DATE%</td>
                    <td>%value TRANSACTION_ID%</td>
                    <td>%value IDENTIFIER1%</td>
                    <td>%value IDENTIFIER2%</td>
                    <td>%value IDENTIFIER3%</td>
                    <td>%value IDENTIFIER4%</td>
                    <td><a href="" class="capture-payload">View</a></td>
                </tr>
                %endloop%
                <!-- Add more rows as needed -->
            </tbody>
            %onerror%
                <HR>
                <P>
                    <FONT COLOR="#FF0000">%value errorMessage%</FONT>
                </P>
            %endinvoke%
        </table>
    </div>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
    // Get all anchor tags with class 'capture-row-data'
    var editLinks = document.querySelectorAll('.capture-payload');

    // Attach click event listeners to each anchor tag
    editLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent the default behavior of the anchor tag

            // Traverse up the DOM to find the parent 'tr' element (table row)
            var row = event.target.closest('tr');

            var url = "viewPayload.dsp?DOCUMENTID=" + row.cells[0].innerText;
            console.log(url);
            window.open(url, "_blank");
        });
    });
});
</script>
</html>