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


    <table>
        <form id="searchForm">
            <tr>
                <td><input type="text" id="source" name="source" placeholder="Enter Source"></td>
                <td><input type="text" id="target" name="target" placeholder="Enter Target"></td>
                <td> <input type="text" id="interfaceId" name="interfaceId" placeholder="Enter InterfaceId"></td>
            </tr>
            <tr>
                <td><input type="text" id="interfaceName" name="interfaceName" placeholder="Enter InterfaceName"></td>
                <td>
                    <select id="identifierType" name="identifierType" onchange="updateIdentifierField()">
                        <option value="trackingId" name="trackingId">Tracking ID</option>
                        <option value="transactionId" name="transactionId">Transaction ID</option>
                    </select>
                </td>
                <td>
                    <input type="text" id="identifierInput" name="identifierInput" placeholder="Enter Tracking ID">
                </td>
            </tr>
            <tr>
                <td>
                    <label>Before Date</label>
                    <input type="date" id="beforedate" name="transactionBefore">
                </td>
                <td>
                    <label>After Date</label>
                    <input type="date" id="afterDate" name="transactionAfter">
                </td>
                <td>
                    <button type="submit" class="full-width">Submit</button>
                    <button type="button" class="full-width" onclick="clearFormAndSubmit()"
                        style="background-color: rgb(246, 107, 32);">Reset</button>
                </td>
            </tr>
        </form>
    </table>



    <div class="table-container">
        <table id="myTable">
            <thead>
                <tr>
                    <th>Interface ID</th>
                    <th>Source</th>
                    <th>Target</th>
                    <th>Interface Name</th>
                    <th>Document Type</th>
                    <th>Document Name</th>
                    <th>Inserted Date</th>
                    <th>Tracking ID</th>
                    <th>Payload Count</th>
                </tr>
            </thead>
            %invoke HG_PayloadVault.v1.UI:loadTransaction%
            <tbody id="table-body">
                %loop getTransactionsOutput/results%
                <tr>
                    <td>%value INTERFACE_ID%</td>
                    <td>%value SOURCE%</td>
                    <td>%value TARGET%</td>
                    <td>%value INTERFACE_NAME%</td>
                    <td>%value DOCUMENT_TYPE%</td>
                    <td>%value DOCUMENT_NAME%</td>
                    <td>%value INSERTED_DATE%</td>
                    <td>%value TRACKING_ID%</td>
                    <td><a href="" class="capture-row-data">%value DataCount%</a></td>
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
        <div class="pagination">
            <button id="prevBtn" onclick="prevPage()">Previous</button>
            <button id="nextBtn" onclick="nextPage()">Next</button>
        </div>
    </div>
</body>
<script src="js\script.js"></script>
</html>