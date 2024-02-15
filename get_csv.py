import requests
import csv
import json

# Define the base URL for the Europe PMC API
base_url = "https://www.ebi.ac.uk/europepmc/webservices/rest/search"

# Initialize the cursorMark for pagination
cursor_mark = "*"
has_next_page = True

# Prepare the CSV file
csv_file = "inaturalist_brazil_research.csv"
csv_columns = [
    "doi",
    "pmid",
    "europe_pmc_url",
    "about_brazil",
    "from_brazilians",
    "uses_inaturalist_prominently",
    "title",
    "authorString",
    "authorList",
    "journalInfo",
    "pubYear",
    "pageInfo",
    "abstractText",
    "affiliation",
]

with open(csv_file, mode="w", newline="", encoding="utf-8") as file:
    writer = csv.DictWriter(file, fieldnames=csv_columns)
    writer.writeheader()

    while has_next_page:
        # Define the query parameters for the current page
        query_params = {
            "query": "iNaturalist Brazil",
            "format": "json",
            "resultType": "core",  # Switched to 'core' for detailed metadata
            "pageSize": 100,  # Adjust pageSize as necessary
            "cursorMark": cursor_mark,  # Use the current cursorMark for pagination
        }

        # Perform the search for the current page
        response = requests.get(base_url, params=query_params)
        data = response.json()

        # Parse the response and write data to the CSV
        for article in data.get("resultList", {}).get("result", []):
            # Construct the Europe PMC URL using the PMID
            europe_pmc_url = (
                f"https://europepmc.org/article/MED/{article.get('pmid')}"
                if article.get("pmid")
                else ""
            )

            # Convert nested information to JSON strings
            authorList_json = json.dumps(article.get("authorList", {}))
            journalInfo_json = json.dumps(article.get("journalInfo", {}))

            # Write article data to the CSV, including nested information
            writer.writerow(
                {
                    "doi": article.get("doi", ""),
                    "pmid": article.get("pmid", ""),
                    "europe_pmc_url": europe_pmc_url,
                    "about_brazil": "",  # Placeholder for manual review or further analysis
                    "from_brazilians": "",  # Placeholder for manual review or further analysis
                    "uses_inaturalist_prominently": "",  # Placeholder for manual review or further analysis
                    "title": article.get("title", ""),
                    "authorString": article.get("authorString", ""),
                    "authorList": authorList_json,
                    "journalInfo": journalInfo_json,
                    "pubYear": article.get("pubYear", ""),
                    "pageInfo": article.get("pageInfo", ""),
                    "abstractText": article.get("abstractText", ""),
                    "affiliation": article.get("affiliation", ""),
                }
            )

        # Update cursorMark for the next page, check if there's a next page
        next_cursor_mark = data.get("nextCursorMark")
        if cursor_mark == next_cursor_mark:
            has_next_page = False  # End loop if we've reached the last page
        else:
            cursor_mark = next_cursor_mark  # Update cursorMark for the next iteration

print("CSV file has been created with all paginated results.")
csv_file
