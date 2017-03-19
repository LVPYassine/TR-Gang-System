/**
 * Copyright (c) 2015-2016 TR Gang System
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
 * even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program.
 * If not, see <http://www.gnu.org/licenses/>.
*/

#include <a_samp>
#include <a_mysql>
#include <zcmd>
#include <sscanf2>

#undef MAX_PLAYERS 
  #define MAX_PLAYERS 100 // max slots of your server

#define MYSQL  true // if you gonna use MySQL set this to true, and set SQLite to false
#define SQLITE false // if you gonna use SQLite set this to true, and set MYSQL to false

#if defined MYSQL == true
	#define MySQL_Host     "localhost" // hostname of your mysql server if you are using xampp use "localhost"
	#define MySQL_User     "root" // username for your mysql database
	#define MySQL_Database "test" // database that server will connect to it
	#define MySQL_Password "" // password of the database (user) that server will connect to it
#endif

#if defined SQLITE == true
// SQLite Configurations
#define SQLite_DB ""
#endif

// Script Checker & Errors Part 
#if !defined SQLITE
  #error Please check if SQLITE Const defined at top of your script
#endif

#if !defined MYSQL
  #error Please check if MYSQL Const defined at top of your script
#endif

#if defined MYSQL == true && SQLITE == true
  #error Please choose one saving mode not 2
#endif 

#if defined MYSQL == false && SQLITE == false
  #error Please choose one saving mode not 2
#endif 

// Variables
#if defined MYSQL == true
static MySQL:handle;
#endif


//script
public OnFilterScriptInit()
{
	if(MYSQL == true)
	{
		handle = mysql_connect(MySQL_Host, MySQL_User, MySQL_Password, MySQL_Database);
	    mysql_log(ALL);
	    if(mysql_errno() != 0)
	    {
	    	print("  [TR Gang System]: Failed to load the moneybag system.");
	    	print("  [TR Gang System]: MySQL Connection Failed.	 ");
	    	print("     TR Gang System By TitanX & RyderX © 2017	");
	    	return 1;
	    }
	    else
	    {
	    	print("  [TR Gang System]: MySQL connection success.");

	    	mysql_query(handle, "CREATE TABLE IF NOT EXISTS `Gangs` (`GangID` INT(5), `GangName` VARCHAR(24), `MaxRanks` INT(12), `Color` INT(12), `Skin` INT(3),\
	    	 `FounderName` VARCHAR(24), `Cash` INT(12), `Kills` INT(5))");

	    	mysql_query(handle, "CREATE TABLE IF NOT EXISTS `Members` (`MemberName` VARCHAR(24), `GangID` INT(5), `GangName` VARCHAR(24), `GangColor` INT(1))")
	    	print("  [TR Gang System]: Tables created.");

	    	#if defined WEAPONS_BOUNS

	    	print("  [TR Gang System]: Loading Zones....");
	    	LoadZones();

	    	print("  *---------------------------------*");
	   		print("  | TR Gang System has been loaded  |");
	    	print("  |---------------------------------|");
	    	print("  |    Authors: RyderX & TitanX     |");
	    	print("  |---------------------------------|");
	    	print("  |    Version: 1.0 |   Build: 1    |");
	    	print("  *---------------------------------*");
	    	return 1;
	    }
	}
	else if(SQLITE == true)
	{

	}
	return 1;
}

public OnFilterScriptExit()
{
}

public OnPlayerConnect(playerid)
{
}

public OnPlayerDisconnect(playerid, reason)
{
}
