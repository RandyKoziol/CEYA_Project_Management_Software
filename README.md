# CEYA PROJECT MANAGEMENT TOOL

## Project Mission:

>Develop a team management system for our HR Collective to create a positive workplace.

## Project Vision:

> Have a developed team management system, which runs functional as our only operating system for our entire HR Collective. .

## Scope Of Project:

>Replace our patchwork of cloud applications, legacy tools, and paper-based processes with one operating system for our entire HR Collective.

# Get Started

If it is your first time cloning this project to your local machine

1. make sure you have node.js installed: in your terminal, check which version you're using : `node -v`

   * If you do not have it installed, here is a tutorial link [node.js](https://nodejs.dev/download/)

2. download all the libraries and dependencies for the front end:
   
   * `cd    /client` get into the client folder
   * when in client folder you'll reliaze that there is no node_module folder add it by running in the terminal `npm install`
   * At this point you should be able to run `npm start` and the project will run on your localhost 3000

3. Get into the server folder and run `npm install` in the terminal to get all the packages and libraries installed.
   
# Database Setup


Get the SQL scripts in the **Scripts** folder

* Run the `/CreateCeyaPmgdb_Final.sql` in your local sql server. I am using [MySql WorkBench](https://dev.mysql.com/downloads/workbench/)
> For a tutorial on how to install it check out this [link](https://www.youtube.com/watch?v=u96rVINbAUI&t=3s)

* For those using other tools like `PHP my admin` it should work too.
  
*  When Creating the DB on your local machines ensure that your database is called : `ceyapmgdb` (it is already written this way in the scripts so no need to change anything)
  
* Since we don't have a version control for our database, we will be updating the script when required. Everyone working on the project will be noticed to update the db on their local machines.


### Databae Image

![This is The Database Image](Scripts\project_management_database-2021-08-26_10-39.png "Database Images")

