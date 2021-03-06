/**
 * Avatar Module
 * 
 * @package      Avatar
 * @author       Joerg Napp, Frank Schummertz, Carsten Volmer, Carsten Volmer
 * @link         http://code.zikula.org/avatar
 * @copyright    Copyright (C) 2004-2010
 * @license      http://www.gnu.org/copyleft/gpl.html GNU General Public License
 */
 
***** Avatar 2.3.0 *****

0. What is this?
----------------
Avatar 2.3.0 is a Zikula 1.3.0 (or perhaps 2.0.0, as this is being written, no 
one knows) module that allows users to define and upload 
their avatar. The images can be limited to a certain filesize and/or 
dimension. As an option it resizes uploaded images to the maximum width and
height you defined.

1. Installation
---------------
Install it like any other module. Now you see an option "Avatar" in your 
personal account panel.
Make sure that the folder you choose for storing the images is writable 
for the webserver (chmod 777) and protect it with an htaccess file like in 
the pnTemp folder.

Copy /modules/Dizkus/pnimages/gravatar.gif to /images/avatar/ if the file
doesn't exist in this directory.

2. Configuration
----------------
The configuration of the module should be quite self explanatory, there are
hints added to the options

3. Avatar maintenance
---------------------
This version allows the admin to change a users avatar and delete images if
this is necessary. You can also see which users use a certain avatar. 
Deleting is possible only if the images is not in use any longer.

4. Permissions
--------------
The images get names like pers_<uid>.gif with uid = the user id of the owner.
You can allow other to use "foreign" avatars with

somegroup | Avatar:: | pers:<uid>: | ACCESS_COMMENT

for pers_123 eg.

Users | Avatar:: | pers:123: | ACCESS_COMMENT

All flavours of permissions apply, eg.

ForumMods | Avatar:: | pers:(123,234,345): | ACCESS_COMMENT

Depending on your permission rules it is possible that all users already have
the generic permission to use all avatars. You can turn this off with

Users | Avatar:: | pers:.*: | ACCESS_NONE

at the correct place in your permission list. This ensures that the user
can use his avatar image only.

5. Plans for the future
-----------------------
* Let the admin define other prefixes than pers for more powerful permissions
* Group avatars if possible (not in Zikula 1.0.0, maybe for 2.0.0)
