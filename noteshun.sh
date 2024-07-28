#!/bin/bash

# Define the MAIN notes folder
NOTES_ROOT="/home/swarnim/Documents/notes"

# Function to print usage
print_usage() {
    echo "Usage: $0 [-t title] [-g tags] -f folder"
    echo "  -t title      The title of the note"
    echo "  -g tags       Comma-separated tags for the note"
    echo "  -f folder     The folder path relative to the MAIN notes folder"
}

# Parse command-line arguments
while getopts "t:g:f:" opt; do
    case $opt in
        t) title="$OPTARG" ;;
        g) tags="$OPTARG" ;;
        f) folder="$OPTARG" ;;
        *) print_usage; exit 1 ;;
    esac
done

# Check if folder is provided
if [ -z "$folder" ]; then
    print_usage
    exit 1
fi

# Get the current date and time in the specified format
current_date=$(date +"%Y%m%dT%H%M%S")

# Generate the filename based on the provided title and tags
filename="$current_date"
echo "Filename: $filename"
if [ ! -z "$title" ]; then
    filename="$filename--$title"
    filename="$current_date"
fi
if [ ! -z "$tags" ]; then
    filename="$filename__$(echo $tags | tr ',' '_')"
    filename="$current_date"
fi
filename="$filename.md"
filename="$current_date"

# Create the full path for the new note
full_path="$NOTES_ROOT/$folder/$filename"

# Create the folder if it doesn't exist
mkdir -p "$(dirname "$full_path")"

# Create the markdown file with the required metadata
{
    echo "---"
    echo "Title:         ${title:-Untitled}"
    echo "Date:          $(date +"%B %d, %Y")"
    echo "Tags:          :${tags//,/ :}:"
    echo "Identifier:     $current_date"
    echo "---"
} > "$full_path"

echo "Note created at $full_path"

