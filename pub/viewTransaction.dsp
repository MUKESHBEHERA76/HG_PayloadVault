<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payload Vault</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-6">    
    <div class="mt-6 bg-white p-4 rounded-lg shadow-lg overflow-x-auto">
        <table class="w-full border-collapse border border-gray-300">
            <thead>
                <tr class="bg-blue-100 text-gray-700">
                    <th class="p-3 border">Document Id</th>
                    <th class="p-3 border">Tracking Id</th>
                    <th class="p-3 border">Document Type</th>
                    <th class="p-3 border">Document Name</th>
                    <th class="p-3 border">Inserted Date</th>
                    <th class="p-3 border">Transaction Id</th>
                    <th class="p-3 border">Identifier 1</th>
                    <th class="p-3 border">Identifier 2</th>
                    <th class="p-3 border">Identifier 3</th>
                    <th class="p-3 border">Identifier 4</th>
                    <th class="p-3 border">Payload</th>
                </tr>
            </thead>
            %invoke HG_PayloadVault.v1.UI:getTransactions%
            <tbody>
                %loop viewTransactionsOutput/results%
                <tr class="odd:bg-gray-50 even:bg-white hover:bg-gray-100 border-b">
                    <td class="p-3 border">%value DOCUMENTID%</td>
                    <td class="p-3 border">%value TRACKING_ID%</td>
                    <td class="p-3 border">%value DOCUMENT_TYPE%</td>
                    <td class="p-3 border">%value DOCUMENT_NAME%</td>
                    <td class="p-3 border">%value INSERTED_DATE%</td>
                    <td class="p-3 border">%value TRANSACTION_ID%</td>
                    <td class="p-3 border">%value IDENTIFIER1%</td>
                    <td class="p-3 border">%value IDENTIFIER2%</td>
                    <td class="p-3 border">%value IDENTIFIER3%</td>
                    <td class="p-3 border">%value IDENTIFIER4%</td>
                    <td class="p-3 border text-center">
                        <a href="#" class="text-blue-500 hover:text-blue-700 capture-payload">View</a>
                    </td>
                </tr>
                %endloop%
            </tbody>
            %onerror%
            <tfoot>
                <tr>
                    <td colspan="15" class="text-center text-red-500 p-3">%value errorMessage%</td>
                </tr>
            </tfoot>
            %endinvoke%
        </table>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.querySelectorAll('.capture-payload').forEach(link => {
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    let row = event.target.closest('tr');
                    let url = "viewPayload.dsp?DOCUMENTID=" + row.cells[0].innerText;
                    window.open(url, "_blank");
                });
            });
        });
    </script>
</body>
</html>
