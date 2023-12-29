Korsece 1.0.0 - This program will automate movie files to being posted and embedded onto your website. This will require video files to be available in your Videos directory. Whenever new movies are downloaded and available, you will run the quickmove script to bring these files over to this system.

Only .mp4 and .mkv files are supported at this time, as .mkv files are ultimately converted to mp4 before being posted. 

Quick move script: 

1. Movies will be copied from Windows share to Linux folder
2. Converter will run to convert any mkv files to mp4
3. Movies with .mp4 file type will be moved into apache root directory 
4. Mkv files will be removed
5. Delimiter will run to remove any spaces or special characters, this will effect the next step
6. Unique html pages will be created for each movie with an embedded video
7. Each html page will added to the index to be automatically available for viewing

Prerequisites:

Apache server: Your apache server must be installed and enabled. You will need to set your document root correctly as well as connect it to your domain name. You can set it to be password enabled (recommended), as well as setting a certificate to enable secure browsing.

Movie Converter: This program uses ffmpeg, this will be utilized during the conversion step converting mkv to mp4 files. 

Movie Directory: This network must be mounted in fstab with your Windows credentials, this will be used to pull all new movies from your Videos file. 
