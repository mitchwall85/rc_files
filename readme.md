After cloning this repo, the rc files must be hard linked to the actual files in the home directory. 
1) Copy file from the rc repo to the home directory
2) Eelete the original file in the rc_files repo.
3) From the home directory, with the new copy of the file, `ln <filename> rc_files/<filename>` to create the hard link.
