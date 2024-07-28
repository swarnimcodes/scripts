#!/bin/python3

import os
import argparse
from datetime import datetime
from typing import List

NOTES_ROOT = "/home/swarnim/Documents/notes"


def create_new_note(
    title: str | None, tags: List[str] | None, folder: str | None
) -> str:
    current_date: datetime = datetime.now()
    timestamp: str = current_date.strftime("%Y%m%dT%H%M%S")
    filename: str = timestamp

    if title is not None:
        new_title = title.lower()
        new_title = "-".join(new_title.split(" "))
        filename += f"--{new_title}"
    if tags is not None:
        filename += "__" + "_".join(tags)
    filename += ".md"

    if folder is not None:
        full_note_path = os.path.join(NOTES_ROOT, folder, filename)
    else:
        full_note_path = os.path.join(NOTES_ROOT, filename)

    os.makedirs(os.path.dirname(full_note_path), exist_ok=True)

    # Create the markdown file with the required metadata
    with open(full_note_path, "w") as f:
        f.write("---\n")
        f.write(f"Title:          {title or 'Untitled'}\n")
        f.write(f"Date:           {current_date.strftime('%B %d, %Y')}\n")
        if tags:
            f.write(f"Tags:           :{':'.join(tags)}:\n")
        else:
            f.write("Tags:           \n")
        f.write(f"Identifier:     {timestamp}\n")
        f.write("---\n\n")
        f.write(f"# {title}\n\n")

    return full_note_path


def main() -> None:
    parser = argparse.ArgumentParser(
        description="NoteShun: A note taking system to last a 100 years."
    )
    parser.add_argument("-t", "--title", type=str, help="Title for your note")
    parser.add_argument(
        "-g", "--tags", type=str, help="Comma-separated tags for the note"
    )
    parser.add_argument(
        "-f", "--folder", type=str, help="Folder path relative to your notes root path"
    )

    args = parser.parse_args()

    tags = args.tags.split(",") if args.tags else None

    note_file_path: str = create_new_note(args.title, tags, args.folder)

    print(f"New note created: {note_file_path}")


if __name__ == "__main__":
    main()
