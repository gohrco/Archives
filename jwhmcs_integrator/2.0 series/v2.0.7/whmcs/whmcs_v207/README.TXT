---------------------------------------
J!WHMCS Integrator v2.0
Installation - WHMCS Archive
---------------------------------------

Contents
* Note
* Version Support
* Installation Requirements
* Notes on Security
* What's Included in This Archive
* Installing the WHMCS Items
* Common Problems

---------------------------------------
*** Note 
---------------------------------------
If you have already completed the Automatic installation done in Joomla, then
these procedures are not required.  This archive is provided for completing a
manual installation or a failed automatic install. 

---------------------------------------
*** Version Support
---------------------------------------
This software is designed and supported for Joomla version 1.5 and WHMCS
version 4.0.0.  Minor revisions of either of these software packages may
be supported as well, however major revisions and backwards compatability
are not supported.

If you are using Joomla 1.0 or versions of WHMCS prior to 4.0.0, this
software will not work for your site.


---------------------------------------
*** Installation Requirements
---------------------------------------

1)  J!WHMCS Integrator requires access to both your Joomla and your WHMCS databases
	simultaneously, therefore one of the major requirements is that either:
	a)  Your Joomla site and your WHMCS site are located on the same server, and
		their databases are accessible through the localhost
	b)  Your Joomla site and your WHMCS site are not located on the same server but
		the Joomla databases is accessible to the server your WHMCS install is
		located on.  This is an advanced configuration, and not a very common
		solution.
2)  J!WHMCS Integrator requires the following versions of software:
	* Joomla 1.5
	* Licensed version of WHMCS v4 (licensed through WHMCS or your service provider)
	* Licensed version of J!WHMCS Integrator

If using SSL, you will need to have a valid certificate for BOTH your Joomla site 
URL and your WHMCS site URL to avoid problems pulling non-encrypted data on the 
encrypted pages.  If your Joomla and WHMCS use the same path (WHMCS is installed 
as a subfolder rather than a subdomain) then if you have one certificate you should 
be fine.


---------------------------------------
*** Notes on Security
---------------------------------------
This software requires access to two sensitive areas of information, your Joomla 
database username and password as well as the WHMCS API username and password you 
designate in your WHMCS backend.  The database username and password is acquired 
by including the configuration file from your Joomla install.

It is recommended for security purposes by the Joomla team that you follow the 
proceedures on the Joomla forums for moving your configuration.php file to another 
secure location and replacing it with a dummy configuration file that includes 
a call to that file.  If you have done this, this software will function just fine 
by pointing to the dummy configuration.php file in your root Joomla site.

J!WHMCS uses the WHMCS API interface at times and other times uses a direct call 
of the files (for example logout.php to log the user out).  Follow proceedures 
from WHMCS on setting an appropriate username and password for API access, and 
verify that you have configured your site's IP address to have access to the API.  
If your Joomla site and WHMCS are on different IP addresses, you will need to 
include the Joomla site AND the WHMCS site IP Addresses.

---------------------------------------
*** What's Included in This Archive
---------------------------------------

This archive (whmcs_vxxx.zip) includes the following files and folders:

/jconfig.php				- Configuration file
/jwhmcs.php					- "Root" file
/images/					- css and images for form redirection
/includes/hooks/jwhmcs.php	- "Hook" file
/templates/jwhmcs-default/	- modified default template directory
/templates/jwhmcs-portal/	- modified portal template directory
/templates/orderforms_v4.0/	- orderform template directory for WHMCS v4.0
/templates/orderforms_v4.1/	- orderform template directory for WHMCS v4.1

---------------------------------------
*** Installing the WHMCS Items
---------------------------------------

---------------------------------------
A. Installing the root "/jwhmcs.php" and "/jconfig.php" files
---------------------------------------
*** NOTE ***
This section refers only to the two files located in the root of this archive.
The other files located in folders are not affected.

1)  Prior to installing the jwhmcs.php and jconfig.php file to your server, you
	need to set one configuration variable at the top of the jconfig.php file.
	You will need to know the path to the root of your Joomla site (for example, 
	"/home/username/public_html").
	a.  Open the "/jconfig.php" file 
	b.  Find the line (at line 17) that says:
			define( 'JPATH_CONFIG', '/home/username/public_html' );
	c.  Change the path to point to your Joomla site; do not include a 
		trailing slash!

2)  To install these files, simply open an FTP connection to your WHMCS site and 
	move the file over to the root directory of WHMCS.  For example, if your 
	WHMCS is installed in a folder called "whmcs" and has a path of 
	"/home/username/public_html/whmcs" you would move the jwhmcs.php file to that 
	directory.

3)  Verify the file has access to the information needed by visiting the file in 
	a browser as follows:
	http://urltowhmcssite/jwhmcs.php?task=checkinstall
	You should see a screen that has the path you entered in #1 above and two 
	boxes below confirming the file exists and the file is readable.  Also there
	are boxes regarding the API username and path, and if J!WHMCS was able to
	connect to the API interface of WHMCS.
	
	If all is green, you can proceed.  If not, check the settings in your Joomla
	component configuration.  If the Joomla configuration file is not found,
	check the path you entered in step #1 above	and if it is incorrect then fix
	it and try again.  If this is the correct path, and the file does exist but
	isn't readable, you may need to adjust the permission or ownership given to
	the configuration.php file in your root directory... however do not blindly
	give the file a permission of 777!  Check the forum.joomla.org for the
	recommended	file permissions to set for your configuration file.
	
---------------------------------------
B.  Installing the template and image directories
---------------------------------------
FTP the two folders "/templates/jwhmcs-default" and "/templates/jwhmcs-portal" to
your WHMCS templates directory (located at /path/to/whmcs/templates).

There are also two "orderform" directories.  Select the proper directory based on
your install of WHMCS (for versions prior to version 4.1, use "orderforms_v4.0").
You can select the subdirectories there and just copy them straight into the 
orderforms template directory located at /path/to/whmcs/templates/orderforms.

FTP the images folder to your WHMCS root directory, the files in it should then
be moved into that folder.

---------------------------------------
C.  Installing the "/includes/hooks/jwhmcs.php" file
---------------------------------------
The hook file locate in the /includes/hooks directory should be copied over to your
hooks directory located at /path/to/whmcs/includes/hooks.

Be sure all other configurations are complete prior to moving 
this file over, as your WHMCS site will insist on running these functions in this 
file each time a user is added, or updated, etc.  This should be the last file to
move over and will be run each time a user makes a call through WHMCS.  

*** Important Note ***

If you experience any problems, remove (don't rename) the hook file from the
includes/hooks directory if your WHMCS site is live.  WHMCS will endeavor to
execute any file located in that directory.