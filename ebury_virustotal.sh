#!/bin/bash

# Check if API key is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <VirusTotal API Key>"
  exit 1
fi

API_KEY=$1

# Find all files matching libkeyutils* excluding /home directory
echo "Searching for libkeyutils* files, excluding /home directory..."
files=$(find / -path /home -prune -o -name "libkeyutils*" -type f -print)

# Check if any files were found
if [ -z "$files" ]; then
  echo "No libkeyutils* files found outside /home directory."
  exit 0
fi

# Function to upload file to VirusTotal
upload_to_virustotal() {
  local file=$1
  echo "Uploading $file to VirusTotal..."
  response=$(curl -s -X POST "https://www.virustotal.com/api/v3/files" \
    -H "x-apikey: $API_KEY" \
    -F "file=@$file")
  
  # Extract analysis id from response
  analysis_id=$(echo "$response" | grep -oP '"id":\s*"\K[^"]+')
  if [ -z "$analysis_id" ]; then
    echo "Failed to upload file: $file"
    echo "Response: $response"
    return
  fi

  echo "File uploaded successfully: $file"
  echo "Analysis ID: $analysis_id"

  # Wait for a short period to allow analysis to complete
  sleep 30

  # Fetch analysis report
  fetch_analysis_report "$analysis_id"
}

# Function to fetch analysis report from VirusTotal
fetch_analysis_report() {
  local analysis_id=$1
  echo "Fetching analysis report for ID: $analysis_id..."
  report=$(curl -s -X GET "https://www.virustotal.com/api/v3/analyses/$analysis_id" \
    -H "x-apikey: $API_KEY")
  
  # Check if the report contains the results
  if echo "$report" | grep -q '"attributes"'; then
    echo "Analysis Report: $report"
    malicious_count=$(echo "$report" | grep -oP '"malicious":\s*\K\d+')
    if [ "$malicious_count" -gt 0 ]; then
      echo "The file $file is detected as malicious by $malicious_count engines."
    else
      echo "The file $file is not detected as malicious."
    fi
  else
    echo "Analysis report not available yet for ID: $analysis_id"
  fi
}

# Process each found file
for file in $files; do
  echo "Found file: $file"
  read -p "Do you want to upload this file to VirusTotal for analysis? (Y/n): " answer
  answer=${answer:-Y}
  if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    upload_to_virustotal "$file"
  else
    echo "Skipping file: $file"
  fi
done

echo "Script completed."
