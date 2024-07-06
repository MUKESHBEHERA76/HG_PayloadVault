function updateIdentifierField() {
    var identifierType = document.getElementById('identifierType').value;
    var identifierInput = document.getElementById('identifierInput');
    if (identifierType === 'trackingId') {
        identifierInput.placeholder = 'Enter Tracking ID';
    } else if (identifierType === 'transactionId') {
        identifierInput.placeholder = 'Enter Transaction ID';
    }
}


document.addEventListener('DOMContentLoaded', function () {
    const tableBody = document.getElementById('table-body');
    const rowsPerPage = 10;
    let currentPage = 1;
    const totalRows = tableBody.rows.length;

    function showPage(page) {
        const startIndex = (page - 1) * rowsPerPage;
        const endIndex = startIndex + rowsPerPage;

        for (let i = 0; i < totalRows; i++) {
            if (i >= startIndex && i < endIndex) {
                tableBody.rows[i].style.display = 'table-row';
            } else {
                tableBody.rows[i].style.display = 'none';
            }
        }

        // Enable/disable previous and next buttons
        document.getElementById('prevBtn').disabled = page === 1;
        document.getElementById('nextBtn').disabled = endIndex >= totalRows;
    }

    window.prevPage = function () {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
        }
    }

    window.nextPage = function () {
        if (totalRows > currentPage * rowsPerPage) {
            currentPage++;
            showPage(currentPage);
        }
    }

    // Initial page load
    showPage(currentPage);
});


function clearFormAndSubmit() {
    const form = document.getElementById('searchForm');
    form.reset();
    form.submit();
}

document.addEventListener('DOMContentLoaded', function () {
    // Get all anchor tags with class 'capture-row-data'
    var editLinks = document.querySelectorAll('.capture-row-data');

    // Attach click event listeners to each anchor tag
    editLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent the default behavior of the anchor tag

            // Traverse up the DOM to find the parent 'tr' element (table row)
            var row = event.target.closest('tr');

            var url = "viewTransaction.dsp?INTERFACE_ID=" + row.cells[0].innerText + "&SOURCE=" + row.cells[1].innerText + "&TARGET=" + row.cells[2].innerText + "&INTERFACE_NAME=" + row.cells[3].innerText + "&DOCUMENT_TYPE=" + row.cells[4].innerText + "&DOCUMENT_NAME=" + row.cells[5].innerText + "&INSERTED_DATE=" + row.cells[6].innerText + "&TRACKING_ID="+row.cells[7].innerText;
            console.log(url);
            window.open(url, "_blank");
        });
    });
});