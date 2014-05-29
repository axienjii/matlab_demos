matlab_demos
============

Dear all, I am running an introductory Matlab course for people who are fairly new to the software (or coding in general), 
or who want to pick up helpful tips. 

There were lots of little things I figured out by trial and error during my phd, which weren't found in introductory textbooks, 
but which would definitely have made me more efficient had I known about them earlier.

 
For the most part, I'm not going to go over topics which are already well-documented in manuals (as that is best done in 
your own time and in front of the terminal). So while you can definitely ask me whatever you like about things like syntax, 
array manipulation, if statements and for-loops, I'm not going to be focusing on those areas.

 
Rather, my aim is to give a practical overview of tools that are available, but pertain more to issues like staying organised, 
being efficient when handling data, increasing productivity, maintaining control over your project and your expanding amounts of 
code and data.

 
Some of these topics may seem a bit advanced, especially if your immediate concern is to learn how to code. 
I wouldn't worry too much about that- even if the implementation is beyond you now, I think that having a qualitative idea 
of what is out there will allow you to identify and pick up what you need when the time comes. This will help turn some of 
the 'unknown unknowns' into 'known unknowns.' :)

 
When I first started learning to use Matlab, I relied heavily on a couple of textbooks from the library- this is a good 
starting point for covering the basics. I've also uploaded PDF documents to this repository, including 
-johnson_Matlab_style_guide.pdf: A 'coding best practices' guide, which  covers style guidelines.
-MATLABWorkshop.pdf: A crash course in Matlab with examples, covering the basics.
-MATLAB_PTB.zip: A series of short chapters covering basic topics and leading up to being able to programme for PsychToolBox.


Below is a list of topics I'll be covering over several weeks.

 

Xing

 
----------------------------------
Topics include: 

 

Best practices
File organisation

 
Write description of function, author, date written at top of code
Keep detailed list of functions and descriptions
Comment code generously


Use meaningful names for variables
Heed conventions to facilitate code sharing & enhance readability
E.g. capitalise first letter of all words after the first; all caps for global variables
Initialise variables

Minimise ‘hard coding’ and use variables instead

 
Keep indentation neat with Ctrl+I 
Open highlighted function Ctrl+D
‘Up’ arrow key to print lines of code that were previously run at the prompt
Type in first letters of commands in command history to locate full command

F5 to continue
F9 to run highlighted code 

 
Make directories and check existence of files and directories within code, instead of creating them manually 
Use of ‘fullfile’ and ‘eval’

Use meaningful folder names

 
Save and load data using the .mat format
Save data to Excel spreadsheets for easy visualisation

 
Use the powerful ‘find’ function to search through code across all files
Use the code comparison tool to view code segments side by side

 
Use cells for data arrays of varying length

 

Use Help function
Create account on Mathworks site to post and answer questions

 
Use Autohotkey to automate repetitive tasks (file management, routine analyses)

 
For overnight runs, use error throwing and catching to process data wherever possible and skip errors that arise 
unexpectedly with parts of dataset 

 
Use parallel toolbox for large datasets and high throughput processing

 
Use a version control system like Git, to keep code organised; facilitate retrieval; find code that was created at 
a similar period; recall code’s purpose; and potentially to share code with collaborators



Other topics include: Handy keyboard shortcuts in Windows.


Depending on demand:
-How to implement commonly used statistics in Matlab: t-tests, correlations, ANOVAs, signed rank/ rank sum, 
circular stats, goodness of fit.

-How to export figures, choose image formats, use transparency, create publication-quality figures, use a standard template 
of image settings, edit in Adobe Illustrator.
