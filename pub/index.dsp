<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payload Vault</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 p-4">
    <header class="flex items-center bg-white shadow-md p-2 rounded-lg w-full max-w-3xl mx-auto">
        <img src="image/harmonigate.png" alt="Harmonigate.com" class="h-10">
        <h1 class="text-xl font-bold text-gray-800 flex-grow text-center">Payload Vault</h1>
    </header>

    <div class="max-w-3xl mx-auto mt-4 p-3 bg-white shadow-md rounded-lg">
        <form id="searchForm" class="grid grid-cols-3 gap-2 text-sm">
            <input type="text" id="source" name="source" placeholder="Enter Source" class="p-2 border rounded">
            <input type="text" id="target" name="target" placeholder="Enter Target" class="p-2 border rounded">
            <input type="text" id="interfaceId" name="interfaceId" placeholder="Enter InterfaceId" class="p-2 border rounded">
            <input type="text" id="interfaceName" name="interfaceName" placeholder="Enter InterfaceName" class="p-2 border rounded">
            <select id="identifierType" name="identifierType" onchange="updateIdentifierField()" class="p-2 border rounded">
                <option value="trackingId" name="trackingId">Tracking ID</option>
                <option value="transactionId" name="transactionId">Transaction ID</option>
            </select>
            <input type="text" id="identifierInput" name="identifierInput" placeholder="Enter Tracking ID" class="p-2 border rounded">
            <input type="date" id="beforedate" name="transactionBefore" class="p-2 border rounded">
            <input type="date" id="afterDate" name="transactionAfter" class="p-2 border rounded">
            <div class="flex space-x-1">
                <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded">Submit</button>
                <button type="button" class="w-full bg-orange-500 text-white p-2 rounded" onclick="clearFormAndSubmit()">Reset</button>
            </div>
        </form>
    </div>

    <div class="max-w-6xl mx-auto mt-4 p-3 bg-white shadow-md rounded-lg">
        <table class="w-full border-collapse border border-gray-300 text-sm">
            <thead>
                <tr class="bg-gray-200">
                    <th class="border p-2">Interface ID</th>
                    <th class="border p-2">Source</th>
                    <th class="border p-2">Target</th>
                    <th class="border p-2">Interface Name</th>
                    <th class="border p-2">Document Type</th>
                    <th class="border p-2">Document Name</th>
                    <th class="border p-2">Inserted Date</th>
                    <th class="border p-2">Tracking ID</th>
                    <th class="border p-2">Payload Count</th>
                </tr>
            </thead>
            %invoke HG_PayloadVault.v1.UI:loadTransaction%
            <tbody id="table-body">
                %loop getTransactionsOutput/results%
                <tr class="hover:bg-gray-100">
                    <td class="border p-2">%value INTERFACE_ID%</td>
                    <td class="border p-2">%value SOURCE%</td>
                    <td class="border p-2">%value TARGET%</td>
                    <td class="border p-2">%value INTERFACE_NAME%</td>
                    <td class="border p-2">%value DOCUMENT_TYPE%</td>
                    <td class="border p-2">%value DOCUMENT_NAME%</td>
                    <td class="border p-2">%value INSERTED_DATE%</td>
                    <td class="border p-2">%value TRACKING_ID%</td>
                    <td class="border p-2"><a href="" class="text-blue-500 capture-row-data">%value DataCount%</a></td>
                </tr>
                %endloop%
            </tbody>
            %onerror%
            <tr>
                <td colspan="9" class="text-red-500 p-2">%value errorMessage%</td>
            </tr>
            %endinvoke%
        </table>
        <div class="flex justify-between mt-2">
            <button id="prevBtn" class="bg-gray-500 text-white p-2 rounded" onclick="prevPage()">Previous</button>
            <button id="nextBtn" class="bg-gray-500 text-white p-2 rounded" onclick="nextPage()">Next</button>
        </div>
    </div>
</body>
<script src="js/script.js"></script>
</html>
