<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PayloadVault</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            /* Changed to align items at the top */
            height: 100vh;
            background-color: #f0f0f0;
            margin: 0;
            padding-top: 20px;
            /* Added padding to create space at the top */
        }

        .container {
            position: relative;
            width: 80%;
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        #content {
            white-space: pre-wrap;
            word-wrap: break-word;
            max-height: 400px;
            overflow-y: auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            /* Light background for the content area */
            margin-top: 10px;
            font-family: 'Courier New', Courier, monospace;
            font-size: 14px;
        }

        #copyButton {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        #copyButton:hover {
            background-color: #0056b3;
        }

        .xml .tag {
            color: #22863a;
        }

        .xml .attribute {
            color: #6f42c1;
        }

        .xml .value {
            color: #e36209;
        }

        .xml .comment {
            color: #6a737d;
        }

        .json .key {
            color: #d73a49;
        }

        .json .string {
            color: #032f62;
        }

        .json .number {
            color: #005cc5;
        }

        .json .boolean {
            color: #d73a49;
        }

        .json .null {
            color: #6a737d;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/styles/default.min.css">
</head>

<body>
    <div class="container">
        %invoke HG_PayloadVault.v1.UI:viewPayload%
        <pre id="content">%value payload%</pre>
        %endinvoke%
        <button id="copyButton">Copy to Clipboard</button>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/highlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/languages/json.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/languages/xml.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const contentElement = document.getElementById("content");
            const copyButton = document.getElementById("copyButton");
            let data = contentElement.innerText.trim();

            const formatXml = (xml) => {
                const PADDING = ' '.repeat(2); // set desired indent size here
                const reg = /(>)(<)(\/*)/g;
                let pad = 0;

                xml = xml.replace(reg, '$1\r\n$2$3');
                return xml.split('\r\n').map((node, index) => {
                    let indent = 0;
                    if (node.match(/.+<\/\w[^>]*>$/)) {
                        indent = 0;
                    } else if (node.match(/^<\/\w/)) {
                        if (pad != 0) {
                            pad -= 1;
                        }
                    } else if (node.match(/^<\w[^>]*[^\/]>.*$/)) {
                        indent = 1;
                    } else {
                        indent = 0;
                    }

                    pad += indent;
                    return PADDING.repeat(pad - indent) + node;
                }).join('\r\n');
            };

            try {
                // Try to parse the data as JSON
                const jsonObject = JSON.parse(data);
                data = JSON.stringify(jsonObject, null, 2);
                contentElement.className = 'json';
            } catch (e) {
                // If it fails, assume it is XML and format accordingly
                data = formatXml(data);
                contentElement.className = 'xml';
            }

            contentElement.textContent = data;
            hljs.highlightElement(contentElement);

            copyButton.addEventListener("click", () => {
                navigator.clipboard.writeText(contentElement.textContent)
                    .then(() => {
                        alert("Content copied to clipboard!");
                    })
                    .catch(err => {
                        console.error("Failed to copy content: ", err);
                    });
            });
        });
    </script>
</body>

</html>