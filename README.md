# ebury-virustotal
This script searches for `libkeyutils*` files outside the `/home` directory and uploads them to VirusTotal for malware analysis, specifically for detecting Ebury malware.

## Prerequisites

- A VirusTotal API key. Sign up at [VirusTotal](https://www.virustotal.com/gui/join-us) to get one.

## Usage

1. **How to start:**

   ```bash
   git clone https://github.com/deianmotov/ebury-virustotal.git
   cd ebury-virustotal
   chmod +x ebury_virustotal.sh
   ./ebury_virustotal.sh YOUR_VIRUSTOTAL_API_KEY



2. **How It Works**
   Searches for libkeyutils* files outside /home.
   Prompts you to upload each found file to VirusTotal.
   Uploads the file and fetches the analysis report.
   Displays whether the file is detected as malicious.


3. **Sampple output**
   Output:
   
   Searching for libkeyutils* files, excluding /home directory...
   
   Found file: /usr/lib/libkeyutils.so.1
   
   Do you want to upload this file to VirusTotal for analysis? (Y/n): Y
   
   Uploading /usr/lib/libkeyutils.so.1 to VirusTotal...
   
   File uploaded successfully: /usr/lib/libkeyutils.so.1
   
   Analysis ID: MjhjYzk2OWE4MzUxYjEzYjY0YjJlMGIxMzhkYjE4NDA6MTcxNjE4NTczNQ==
   
   Fetching analysis report for ID: MjhjYzk2OWE4MzUxYjEzYjY0YjJlMGIxMzhkYjE4NDA6MTcxNjE4NTczNQ==

   
   Analysis Report:  {


    "data": {
   
        "id": "MjhjYzk2OWE4MzUxYjEzYjY0YjJlMGIxMzhkYjE4NDA6MTcxNjE4NTczNQ==",
   
        "type": "analysis",
   
        "links": {
   
            "self": "https://www.virustotal.com/api/v3/analyses/MjhjYzk2OWE4MzUxYjEzYjY0YjJlMGIxMzhkYjE4NDA6MTcxNjE4NTczNQ==",
   
            "item": "https://www.virustotal.com/api/v3/files/5c4fb435e7cdfeb4b471fbabf3a8c53b29ba6a208febdc729bc75ec949900bb0"
   
        },
   
        "attributes": {
   
            "stats": {
   
                "malicious": 29,
   
                "suspicious": 0,
   
                "undetected": 36,
   
                "harmless": 0,
   
                "timeout": 0,
   
                "confirmed-timeout": 0,
   
                "failure": 2,
   
                "type-unsupported": 10
   
            },
   ...
