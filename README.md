# note-stub-generator

It creates an empty stub for a markdown note.

Usage:

    notegen.sh title_of_note

The newly created note includes in the first line the title of the note in the form of a heading, i.e. `# title_of_note` .

## Template

You can create a note from a template using either `-t` or `-template` optional parameters.

    notegen.sh title_of_note -t template_file_name

or

    notegen.sh title_of_note --template template_file_name
