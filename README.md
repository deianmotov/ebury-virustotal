# ebury-virustotal
This script searches for `libkeyutils*` files outside the `/home` directory and uploads them to VirusTotal for malware analysis, specifically for detecting Ebury malware.

## Prerequisites

- A VirusTotal API key. Sign up at [VirusTotal](https://www.virustotal.com/gui/join-us) to get one.

## Usage

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/ebury-virustotal-scanner.git
   cd ebury-virustotal-scanner
Make the script executable:

bash
Copy code
chmod +x ebury_virustotal.sh
Run the script with your VirusTotal API key:

bash
Copy code
./ebury_virustotal.sh YOUR_VIRUSTOTAL_API_KEY
How It Works
Searches for libkeyutils* files outside /home.
Prompts you to upload each found file to VirusTotal.
Uploads the file and fetches the analysis report.
Displays whether the file is detected as malicious.
Example
bash
Copy code
./ebury_virustotal.sh YOUR_VIRUSTOTAL_API_KEY
Output:

vbnet
Copy code
Searching for libkeyutils* files, excluding /home directory...
Found file: /usr/lib/libkeyutils.so.1
Do you want to upload this file to VirusTotal for analysis? (Y/n): Y
Uploading /usr/lib/libkeyutils.so.1 to VirusTotal...
File uploaded successfully: /usr/lib/libkeyutils.so.1
Analysis ID: MjhjYzk2OWE4MzUxYjEzYjY0YjJlMGIxMzhkYjE4NDA6MTcxNjE4NTczNQ==
Fetching analysis report for ID: MjhjYzk2OWE4MzUxYjEzYjY0YjJlMGIxMzhkYjE4NDA6MTcxNjE4NTczNQ==
The file /usr/lib/libkeyutils.so.1 is not detected as malicious.
