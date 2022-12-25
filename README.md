# bengali-language-learning-software-for-non-bengali-speakers
This is an experimental Bangla language learning app specially targeted for non-Bengali speakers. We mainly focused on implementing a practice session in this app to increase effectiveness of learning.

## To open the final app with user interface
Go to GUI_files/v1.14/MAIN_NOTEBOOK.ipynb

## To get an overview of the project and to view final reports
Check out "A Bengali Learning App for Foreigners.pptx" and "report v1.pdf"

## Others
* The matlab_training_livescripts contain the MATLAB live scripts used for training the speech recognition model. 
* You may find several .mat files in the GUI_files/v1.14 directory. These are the trained speech recognizer models obtained from matlab. These .mat files are called within python to do the speech recognition task. 
* There are two speech recognition engines here. One is the offline version, which requires you to run MATLAB within python. It may be troublesome, as well as full of errors. So for trying it out, we also used the Google speech recognition engine to perform online speech recognition from within the app without any hastle, as well as with high accuracy.  
* the database_new folder included all the audio samples we used to train our speech recognizer. It includes audio files from various sources from the web (no copyright infringment intended). Also it includes audio samples recorded by us, the project team members. The final accuracy of our own prediction model is mediocre, which can be improved by including more and more sample data for training. 
