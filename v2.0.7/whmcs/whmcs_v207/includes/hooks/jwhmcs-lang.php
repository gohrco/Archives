<?php

define( 'JWHMCSLANGVERS', '2.0.3' );

/**
 * @package		J!WHMCS Integrator
 * @copyright	Copyright (C) 2009-2010 Go Higher Information Services
 * @license		GNU General Public License version 2, or later
 * @version		$Id$
 * @since		2.0.3
 */


/* ------------------------------------------------------------ *\
 * Language Array
 * 		Modify the values here to match your configuration.  The
 * 		first column ('Arabic', 'Danish', etc) contains the name
 * 		of the language file in WHMCS.  The second column contains
 * 		the JoomFish short tag being used in Joomla!  If your
 * 		language file isn't in this list, the default is English.
\* ------------------------------------------------------------ */
$langarray = array(	'Arabic'		=> 'ar',
					'Danish'		=> 'da',
					'Dutch'			=> 'nl',
					'English'		=> 'en',
					'French'		=> 'fr',
					'German'		=> 'de',
					'Italian'		=> 'it',
					'Norwegian'		=> 'nb',
					'Portuguese-br'	=> 'pt',
					'Portuguese-pt'	=> 'pt',
					'Spanish'		=> 'es',
					'Swedish'		=> 'sv',
					'Turkish'		=> 'tr'
				);

				
add_hook("ClientAreaPage",19,"hook_ClientAreaPageLanguageBefore","");				
add_hook("ClientAreaPage",21,"hook_ClientAreaPageLanguageAfter","");


/* ------------------------------------------------------------ *\
 * Function:	hook_ClientAreaPageLanguageBefore
 * Purpose:		Hook called prior to main clientarea hook file
 * As of:		version 2.0.3 (March 2010)
\* ------------------------------------------------------------ */
function hook_ClientAreaPageLanguageBefore() {
	global $smarty, $langarray;
	
	$smarty->assign('langarray', $langarray);
	$smarty->_tpl_vars['LANG']['loginemail'] = 'Username';
}

/* ------------------------------------------------------------ *\
 * Function:	hook_ClientAreaPageLanguageAfter
 * Purpose:		Run following retrieval of site
 * As of:		version 2.0.3 (March 2010)
\* ------------------------------------------------------------ */
function hook_ClientAreaPageLanguageAfter() {
	global $smarty, $errormessage;
	
	$langarrayrev		= array_flip($smarty->_tpl_vars['langarray']);
	
	// Modify the form action from dologin to jwhmcs
	if ($faxn = $smarty->_tpl_vars['formaction']):
		$tmp	= explode('?', $faxn);
		if (substr($tmp[0], -11) == 'dologin.php') $tmp[0] = substr_replace($tmp[0], 'jwhmcs.php', -11);
		$smarty->_tpl_vars['formaction'] = $tmp[0].'?'.$tmp[1].'&task=jlogin';
	endif;
		
	$curUrl = trim($smarty->_tpl_vars['systemurl'], "/").$GLOBALS['requesturl'];
	$uri = parse_url($curUrl);
	parse_str($uri['query'], $qry);
		
	$regex[0] = '`(href=")(.*?<!-- LANGUAGE=)(.{2}).*?(")`';
	$regex[1] = '`<!-- LANGUAGE=(.{2}) -->`';
	
	$body	= array('htmlheader' => $smarty->_tpl_vars['htmlheader'], 'htmlfooter' => $smarty->_tpl_vars['htmlfooter'] );
	
	foreach($body as $key => $value) {
		
		preg_match_all( $regex[0], $value, $matches, PREG_SET_ORDER);
		if( count( $matches ) > 0 ) {
			foreach($matches as $match) {
				$qry['language'] = $langarrayrev[$match[3]];
				$uri['query'] = buildQuery($qry);
				$value = preg_replace('`'.$match[0].'`', $match[1].queryToString($uri).$match[4], $value );
			}
		}
		
		preg_match_all( $regex[1], $value, $matches, PREG_SET_ORDER);
		if( count( $matches ) > 0 ) {
			foreach( $matches as $match ) {
				$qry['language'] = $langarrayrev[$match[1]];
				$uri['query'] = buildQuery($qry);
				$value = preg_replace( '`'.$match[0].'`', queryToString($uri), $value );
			}
		}
		$smarty->assign( $key, $value );
	}
}
?>