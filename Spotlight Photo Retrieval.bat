@echo off
'Set location to user's pictures folder
cd %UserProfile%\Pictures\
'makes a directory name Spotlight_photos does nothing if the folder already exists
mkdir Spotlight_Photos
'Copies the files from where windows stores them. Excludes any files less than 100kb
Robocopy %UserProfile%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets "%UserProfile%\Pictures\Spotlight_Photos" /xf /MIN:10000
C:
cd %UserProfile%\Pictures\Spotlight_Photos
'Appends the .jpg extension to the files so that they show up as pictures
Ren *.* *.jpg

'If the script runs twice with the same files in it, it won't convert the new ones to pictures since the name is already in use.
'Windows uses two dimensions of the same photo 1080x1920 and 1920x1080.
