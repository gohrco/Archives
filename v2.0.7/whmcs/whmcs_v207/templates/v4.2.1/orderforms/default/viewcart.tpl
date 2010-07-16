<link rel="stylesheet" type="text/css" href="templates/orderforms/default/style.css" />
<script type="text/javascript" src="includes/jscript/pwstrength_jwhmcs.js"></script>

<table width="100%"><tr><td width="160" valign="top">

<div class="stepsboxinactive">
<b class="stepsboxinactivertop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<b>{$LANG.step} 1</b><br />{$LANG.orderchooseapackage}
<b class="stepsboxinactiverbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>

<div class="stepsboxinactive">
<b class="stepsboxinactivertop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<b>{$LANG.step} 2</b><br />{$LANG.orderdomainoptions}
<b class="stepsboxinactiverbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>

<div class="stepsboxinactive">
<b class="stepsboxinactivertop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<b>{$LANG.step} 3</b><br />{$LANG.orderconfigure}
<b class="stepsboxinactiverbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>

{if $checkout}
<div class="stepsboxinactive">
<b class="stepsboxinactivertop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<b>{$LANG.step} 4</b><br />{$LANG.orderconfirmorder}
<b class="stepsboxinactiverbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>

<div class="stepsboxactive">
<b class="stepsboxactivertop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<b>{$LANG.step} 5</b><br />{$LANG.ordercheckout}
<b class="stepsboxactiverbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>
{else}
<div class="stepsboxactive">
<b class="stepsboxactivertop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<b>{$LANG.step} 4</b><br />{$LANG.orderconfirmorder}
<b class="stepsboxactiverbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>

<div class="stepsboxinactive">
<b class="stepsboxinactivertop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<b>{$LANG.step} 5</b><br />{$LANG.ordercheckout}
<b class="stepsboxinactiverbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>
{/if}

</td><td valign="top">

{if $errormessage}<div class="errorbox">{$errormessage|replace:'<li>':'  #  '}  #  </div><br />{elseif $promotioncode && $rawdiscount eq "0.00"}<div class="errorbox">{$LANG.promoappliedbutnodiscount}</div><br />{/if}

{if !$checkout}

{foreach key=num item=product from=$products}
<div class="orderbox">
<b class="orderboxrtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<div class="orderboxpadding">
<strong><em>{$product.productinfo.groupname}</em> - {$product.productinfo.name}</strong>{if $product.domain} ({$product.domain}){/if}<br />
{if $product.configoptions}
{foreach key=confnum item=configoption from=$product.configoptions} » {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />{/foreach}
{/if}
<a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" class="cartedit">[{$LANG.carteditproductconfig}]</a><br />
<strong>{$product.pricingtext}{if $product.proratadate}<br />({$LANG.orderprorata} {$product.proratadate}){/if}</strong>
</div>
<b class="orderboxrbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>

{foreach key=addonnum item=addon from=$product.addons}
<div class="orderbox">
<b class="orderboxrtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<div class="orderboxpadding">
<strong>{$LANG.orderaddon}</strong> - {$addon.name}<br />
<strong>{$addon.pricingtext}</strong>
</div>
<b class="orderboxrbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>
{/foreach}

{/foreach}

{foreach key=num item=addon from=$addons}
<div class="orderbox">
<b class="orderboxrtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<div class="orderboxpadding">
<strong>{$addon.name}</strong><br />
{$addon.productname}{if $addon.domainname} - {$addon.domainname}<br />{/if}
<strong>{$addon.pricingtext}</strong>
</div>
<b class="orderboxrbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>
{/foreach}

{foreach key=num item=domain from=$domains}
<div class="orderbox">
<b class="orderboxrtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<div class="orderboxpadding">
<strong>{if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
{if $domain.dnsmanagement} » {$LANG.domaindnsmanagement}<br />{/if}
{if $domain.emailforwarding} » {$LANG.domainemailforwarding}<br />{/if}
{if $domain.idprotection} » {$LANG.domainidprotection}<br />{/if}
<a href="{$smarty.server.PHP_SELF}?a=confdomains" class="cartedit">[{$LANG.cartconfigdomainextras}]</a><br />
<strong>{$domain.price}</strong>
</div>
<b class="orderboxrbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>
{/foreach}

{foreach key=num item=domain from=$renewals}
<div class="orderbox">
<b class="orderboxrtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
<div class="orderboxpadding">
<strong>{$LANG.domainrenewal}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
{if $domain.dnsmanagement} » {$LANG.domaindnsmanagement}<br />{/if}
{if $domain.emailforwarding} » {$LANG.domainemailforwarding}<br />{/if}
{if $domain.idprotection} » {$LANG.domainidprotection}<br />{/if}
<strong>{$domain.price}</strong>
</div>
<b class="orderboxrbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div>
{/foreach}

<form method="post" action="{$smarty.server.PHP_SELF}?a=view">
<input type="hidden" name="validatepromo" value="true" />
<p align="center"><strong>{$LANG.orderpromotioncode}:</strong> {if $promotioncode}{$promotioncode} - {$promotiondescription}<br /><a href="{$smarty.server.PHP_SELF}?a=removepromo">{$LANG.orderdontusepromo}</a>{else}<input type="text" name="promocode" size="20" /> <input type="submit" value="{$LANG.orderpromovalidatebutton}" class="button" />{/if}
</form>

<p align="center">
{$LANG.ordersubtotal}: <b>{$subtotal}</b><br />
{if $promotioncode}{$promotiondescription}: <b>{$discount}</b><br />{/if}
{if $taxrate}{$taxname} @ {$taxrate}%: <b>{$taxtotal}</b><br />{/if}
{if $taxrate2}{$taxname2} @ {$taxrate2}%: <b>{$taxtotal2}</b><br />{/if}
{$LANG.ordertotalduetoday}: <b>{$total}</b><br />
{if $totalrecurringmonthly || $totalrecurringquarterly || $totalrecurringsemiannually || $totalrecurringannually || $totalrecurringbiennially || $totalrecurringtriennially}
{$LANG.ordertotalrecurring}: <b>{if $totalrecurringmonthly}{$totalrecurringmonthly} {$LANG.orderpaymenttermmonthly}<br />{/if}
{if $totalrecurringquarterly}{$totalrecurringquarterly} {$LANG.orderpaymenttermquarterly}<br />{/if}
{if $totalrecurringsemiannually}{$totalrecurringsemiannually} {$LANG.orderpaymenttermsemiannually}<br />{/if}
{if $totalrecurringannually}{$totalrecurringannually} {$LANG.orderpaymenttermannually}<br />{/if}
{if $totalrecurringbiennially}{$totalrecurringbiennially} {$LANG.orderpaymenttermbiennially}<br />{/if}
{if $totalrecurringtriennially}{$totalrecurringtriennially} {$LANG.orderpaymenttermtriennially}<br />{/if}</b>
{/if}
</p>


<p align="center"><input type="button" value="&laquo; {$LANG.orderstartover}" onclick="window.location='cart.php?a=startover'" class="buttonwarn" /> <input type="button" value="{$LANG.checkout} &raquo;" onclick="window.location='cart.php?a=checkout'"{if $cartitems==0} disabled{/if} class="buttongo" /></p>

{else}

<form method="post" action="{$smarty.server.PHP_SELF}?a=checkout">
<input type="hidden" name="submit" value="true" />

<p><b>{$LANG.yourdetails}</b></p>
{if !$loggedin}<p align="center"><b>{$LANG.alreadyregistered} <a href="{$smarty.server.PHP_SELF}?a=login">{$LANG.clickheretologin}</a></b></p>{/if}

<table cellspacing="1" cellpadding="0" class="frame"><tr><td width="50%" valign="top">

<table width="100%" cellpadding="2">
<tr><td width="100" class="fieldarea">{$LANG.clientareafirstname}</td><td>{if $loggedin}{$clientsdetails.firstname}{else}<input type="text" name="firstname" style="width:80%;" value="{$clientsdetails.firstname}" />{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientarealastname}</td><td>{if $loggedin}{$clientsdetails.lastname}{else}<input type="text" name="lastname" style="width:80%;" value="{$clientsdetails.lastname}" />{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareacompanyname}</td><td>{if $loggedin}{$clientsdetails.companyname}{else}<input type="text" name="companyname" style="width:80%;" value="{$clientsdetails.companyname}" />{/if}</td></tr>
<tr><td class="fieldarea"{if !$loggedin} style="height:21px;"{/if}><br /></td><td></td></tr>
<tr><td class="fieldarea">{$LANG.clientareaemail}</td><td>{if $loggedin}{$clientsdetails.email}{else}<input type="text" name="email" style="width:90%;" value="{$clientsdetails.email}" />{/if}</td></tr>
{if $loggedin}
<tr><td class="fieldarea"><br /></td><td></td></tr>
<tr><td class="fieldarea"><br /></td><td></td></tr>
{else}
<tr><td class="fieldarea">{$LANG.clientareapassword}</td><td><input type="password" name="password" id="newpw" size="20" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareaconfirmpassword}</td><td><input type="password" name="password2" size="20" /></td></tr>
{/if}
</table>

</td><td width="50%" valign="top">

<table width="100%" cellpadding="2">
<tr><td width="100" class="fieldarea">{$LANG.clientareaaddress1}</td><td>{if $loggedin}{$clientsdetails.address1}{else}<input type="text" name="address1" style="width:80%;" value="{$clientsdetails.address1}" />{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareaaddress2}</td><td>{if $loggedin}{$clientsdetails.address2}{else}<input type="text" name="address2" style="width:80%;" value="{$clientsdetails.address2}" />{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareacity}</td><td>{if $loggedin}{$clientsdetails.city}{else}<input type="text" name="city" style="width:80%;" value="{$clientsdetails.city}" />{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareastate}</td><td>{if $loggedin}{$clientsdetails.state}{else}<input type="text" name="state" style="width:80%;" value="{$clientsdetails.state}" />{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareapostcode}</td><td>{if $loggedin}{$clientsdetails.postcode}{else}<input type="text" name="postcode" size="15" value="{$clientsdetails.postcode}" />{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareacountry}</td><td>{if $loggedin}{$clientsdetails.country}{else}{$clientcountrydropdown}{/if}</td></tr>
<tr><td class="fieldarea">{$LANG.clientareaphonenumber}</td><td>{if $loggedin}{$clientsdetails.phonenumber}{else}<input type="text" name="phonenumber" size="20" value="{$clientsdetails.phonenumber}" />{/if}</td></tr>
</table>

</td></tr></table>

{if !$loggedin}<p align="center"><script language="javascript">showStrengthBar();</script></p>{/if}

{if $customfields || $securityquestions}
<table cellspacing="1" cellpadding="0" class="frame"><tr><td>
<table width="100%" cellpadding="2">
{if $securityquestions && !$loggedin}
<tr><td width="200" class="fieldarea">{$LANG.clientareasecurityquestion}</td><td><select name="securityqid">
{foreach key=num item=question from=$securityquestions}
	<option value={$question.id}>{$question.question}</option>
{/foreach}
</select></td></tr>
<tr><td class="fieldarea">{$LANG.clientareasecurityanswer}</td><td><input type="password" name="securityqans" size="30"></td></tr>
{/if}
{foreach key=num item=customfield from=$customfields}
<tr><td width="200" class="fieldarea">{$customfield.name}</td><td>{$customfield.input} {$customfield.description}</td></tr>
{/foreach}
</table>
</td></tr></table>
{/if}

{if $domainsinorder}
<p><b>{$LANG.domainregistrantinfo}</b></p>
{if $addcontact}
<input type="hidden" name="contact" value="addingnew" />
<table cellspacing="1" cellpadding="0" class="frame"><tr><td width="50%" valign="top">
<table width="100%" cellpadding="2">
<tr><td width="100" class="fieldarea">{$LANG.clientareafirstname}</td><td><input type="text" name="domaincontactfirstname" style="width:80%;" value="{$domaincontact.firstname}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientarealastname}</td><td><input type="text" name="domaincontactlastname" style="width:80%;" value="{$domaincontact.lastname}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareacompanyname}</td><td><input type="text" name="domaincontactcompanyname" style="width:80%;" value="{$domaincontact.companyname}" /></td></tr>
<tr><td class="fieldarea" style="height:21px;"><br /></td><td></td></tr>
<tr><td class="fieldarea">{$LANG.clientareaemail}</td><td><input type="text" name="domaincontactemail" style="width:90%;" value="{$domaincontact.email}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareaphonenumber}</td><td><input type="text" name="domaincontactphonenumber" size="20" value="{$domaincontact.phonenumber}" /></td></tr>
</table>
</td><td width="50%" valign="top">
<table width="100%" cellpadding="2">
<tr><td width="100" class="fieldarea">{$LANG.clientareaaddress1}</td><td><input type="text" name="domaincontactaddress1" style="width:80%;" value="{$domaincontact.address1}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareaaddress2}</td><td><input type="text" name="domaincontactaddress2" style="width:80%;" value="{$domaincontact.address2}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareacity}</td><td><input type="text" name="domaincontactcity" style="width:80%;" value="{$domaincontact.city}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareastate}</td><td><input type="text" name="domaincontactstate" style="width:80%;" value="{$domaincontact.state}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareapostcode}</td><td><input type="text" name="domaincontactpostcode" size="15" value="{$domaincontact.postcode}" /></td></tr>
<tr><td class="fieldarea">{$LANG.clientareacountry}</td><td>{$domaincontactcountrydropdown}</td></tr>
</table>
</td></tr></table>
{else}
<p>{$LANG.domainregistrantchoose}: <select name="contact">
<option value="">{$LANG.usedefaultcontact}</option>
{foreach key=num item=domaincontact from=$domaincontacts}
<option value="{$domaincontact.id}">{$domaincontact.name}</option>
{/foreach}
<option value="new">{$LANG.clientareanavaddcontact}...</option>
</select><br /></p>
{/if}
{/if}

<p><b>{$LANG.orderpaymentmethod}</b></p>
<p align="center">{foreach key=num item=gateway from=$gateways}<input type="radio" name="paymentmethod" value="{$gateway.sysname}" id="pgbtn{$num}"{if $selectedgateway eq $gateway.sysname} checked{/if} /><label for="pgbtn{$num}">{$gateway.name}</label> {/foreach}</p>

{if $shownotesfield}
<p><b>{$LANG.ordernotes}</b></p>
<p align="center"><textarea name="notes" rows="4" style="width:75%" onFocus="if(this.value=='{$LANG.ordernotesdescription}'){ldelim}this.value='';{rdelim}" onBlur="if (this.value==''){ldelim}this.value='{$LANG.ordernotesdescription}';{rdelim}">{$notes}</textarea></p>
{/if}

{if $accepttos}
<p align="center"><input type="checkbox" name="accepttos" id="accepttos" /> <label for="accepttos">{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></label><p>
{/if}

<p align="center"><input type="submit" value="{$LANG.completeorder}"{if $cartitems==0} disabled{/if} onclick="this.value='{$LANG.pleasewait}'" class="buttongo" /></p>

<p><img align="left" src="images/padlock.gif" border="0" vspace="5" alt="Secure Transaction" style="padding-right: 10px;" /> {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}</p>

</form>

{/if}

</td></tr></table>