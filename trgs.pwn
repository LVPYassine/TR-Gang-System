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
  // MySQL Configurations
  #define MySQL_Host ""
  #define MySQL_User ""
  #define MySQL_Pass ""
  #define MySQL_DB   ""
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

public OnFilterScriptInit()
{
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
