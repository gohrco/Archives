<link rel="stylesheet" type="text/css" href="templates/orderforms/web20cart/style.css" />
<script type="text/javascript" src="includes/jscript/pwstrength_jwhmcs.js"></script>
<h2>{$LANG.carttitle}</h2>
{literal}
<script language="javascript">
function removeItem(type,num) {
	var response = confirm("{/literal}{$LANG.cartremoveitemconfirm}{literal}");
	if (response) {
		window.location = 'cart.php?a=remove&r='+type+'&i='+num;
	}
}
function emptyCart(type,num) {
	var response = confirm("{/literal}{$LANG.cartemptyconfirm}{literal}");
	if (response) {
		window.location = 'cart.php?a=empty';
	}
}
</script>
{/literal}

{if $errormessage}
<div class="errorbox">{$errormessage}</div>
<br />
{elseif $promotioncode && $rawdiscount eq "0.00"}
<div class="errorbox">{$LANG.promoappliedbutnodiscount}</div>
<br />
{/if}

{if !$loggedin && $currencies}
<form method="post" action="cart.php?a=view">
<p align="right">{$LANG.choosecurrency}: <select name="currency" onchange="submit()">{foreach from=$currencies item=curr}
<option value="{$curr.id}"{if $curr.id eq $currency.id} selected{/if}>{$curr.code}</option>
{/foreach}</select> <input type="submit" value="{$LANG.go}" /></p>
</form>
<br />
{/if}

<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0" class="data">
  <tr>
    <th width="55%">{$LANG.orderdesc}</th>
    <th width="45%">{$LANG.orderprice}</th>
  </tr>
  {foreach key=num item=product from=$products}
  <tr class="carttableproduct">
    <td><strong><em>{$product.productinfo.groupname}</em> - {$product.productinfo.name}</strong>{if $product.domain} ({$product.domain}){/if}<br />
      {if $product.configoptions}
      {foreach key=confnum item=configoption from=$product.configoptions}�� {$configoption.name}: {if $configoption.type eq 1 || $configoption.type eq 2}{$configoption.option}{elseif $configoption.type eq 3}{if $configoption.qty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.type eq 4}{$configoption.qty} x {$configoption.option}{/if}<br />
      {/foreach}
      {/if} </td>
    <td align="center"><strong>{$product.pricingtext}{if $product.proratadate}<br />
      ({$LANG.orderprorata} {$product.proratadate}){/if}</strong></td>
  </tr>
  {foreach key=addonnum item=addon from=$product.addons}
  <tr class="carttableproduct">
    <td><strong>{$LANG.orderaddon}</strong> - {$addon.name}</td>
    <td align="center"><strong>{$addon.pricingtext}</strong></td>
  </tr>
  {/foreach}
  <tr class="carttableconfig">
    <td><a href="{$smarty.server.PHP_SELF}?a=confproduct&i={$num}" style="color:#009900;">[{$LANG.carteditproductconfig}]</a> <a href="#" onclick="removeItem('p','{$num}');return false" style="color:#cc0000;">[{$LANG.cartremove}]</a></td>
    <td>&nbsp;</td>
  </tr>
  {/foreach}
  
  {foreach key=num item=addon from=$addons}
  <tr class="carttableproduct">
    <td><strong>{$addon.name}</strong><br />
      {$addon.productname}{if $addon.domainname} - {$addon.domainname}{/if} </td>
    <td align="center"><strong>{$addon.pricingtext}</td>
  </tr>
  <tr class="carttableconfig">
    <td><a href="#" onclick="removeItem('a','{$num}');return false" style="color:#cc0000;">[{$LANG.cartremove}]</a></td>
    <td>&nbsp;</td>
  </tr>
  {/foreach}
  
  {foreach key=num item=domain from=$domains}
  <tr class="carttableproduct">
    <td><strong>{if $domain.type eq "register"}{$LANG.orderdomainregistration}{else}{$LANG.orderdomaintransfer}{/if}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
      {if $domain.dnsmanagement}�� {$LANG.domaindnsmanagement}<br />
      {/if}
      {if $domain.emailforwarding}�� {$LANG.domainemailforwarding}<br />
      {/if}
      {if $domain.idprotection}�� {$LANG.domainidprotection}<br />
      {/if} </td>
    <td align="center"><strong>{$domain.price}</strong></td>
  </tr>
  <tr class="carttableconfig">
    <td><a href="{$smarty.server.PHP_SELF}?a=confdomains" style="color:#009900;">[{$LANG.cartconfigdomainextras}]</a> <a href="#" onclick="removeItem('d','{$num}');return false" style="color:#cc0000;">[{$LANG.cartremove}]</a></td>
    <td>&nbsp;</td>
  </tr>
  {/foreach}

  {foreach key=num item=domain from=$renewals}
  <tr class="carttableproduct">
    <td><strong>{$LANG.domainrenewal}</strong> - {$domain.domain} - {$domain.regperiod} {$LANG.orderyears}<br />
      {if $domain.dnsmanagement}�� {$LANG.domaindnsmanagement}<br />
      {/if}
      {if $domain.emailforwarding}�� {$LANG.domainemailforwarding}<br />
      {/if}
      {if $domain.idprotection}�� {$LANG.domainidprotection}<br />
      {/if} </td>
    <td align="center"><strong>{$domain.price}</strong></td>
  </tr>
  <tr class="carttableconfig">
    <td><a href="#" onclick="removeItem('r','{$num}');return false" style="color:#cc0000;">[{$LANG.cartremove}]</a></td>
    <td>&nbsp;</td>
  </tr>
  {/foreach}
  
  {if $cartitems==0}
  <tr class="clientareatableactive">
    <td colspan="2"><br />
      {$LANG.cartempty} <br />
    <br /></td>
  </tr>
  {/if}
  <tr class="carttablesummary">
    <td align="right">{$LANG.ordersubtotal}: �</td>
    <td align="center">{$subtotal}</td>
  </tr>
  {if $promotioncode}
  <tr class="carttablepromotion">
    <td align="right">{$promotiondescription}: �</td>
    <td align="center">{$discount}</td>
  </tr>
  {/if}
  {if $taxrate}
  <tr class="carttablesummary">
    <td align="right">{$taxname} @ {$taxrate}%: �</td>
    <td align="center">{$taxtotal}</td>
  </tr>
  {/if}
  {if $taxrate2}
  <tr class="carttablesummary">
    <td align="right">{$taxname2} @ {$taxrate2}%: �</td>
    <td align="center">{$taxtotal2}</td>
  </tr>
  {/if}
  <tr class="carttabledue">
    <td align="right">{$LANG.ordertotalduetoday}: �</td>
    <td align="center">{$total}</td>
  </tr>
  {if $totalrecurringmonthly || $totalrecurringquarterly || $totalrecurringsemiannually || $totalrecurringannually || $totalrecurringbiennially || $totalrecurringtriennially}
  <tr class="carttablerecurring">
    <td align="right">{$LANG.ordertotalrecurring}: �</td>
    <td align="center">{if $totalrecurringmonthly}{$totalrecurringmonthly} {$LANG.orderpaymenttermmonthly}<br />
      {/if}
      {if $totalrecurringquarterly}{$totalrecurringquarterly} {$LANG.orderpaymenttermquarterly}<br />
      {/if}
      {if $totalrecurringsemiannually}{$totalrecurringsemiannually} {$LANG.orderpaymenttermsemiannually}<br />
      {/if}
      {if $totalrecurringannually}{$totalrecurringannually} {$LANG.orderpaymenttermannually}<br />
      {/if}
      {if $totalrecurringbiennially}{$totalrecurringbiennially} {$LANG.orderpaymenttermbiennially}<br />
      {/if}
      {if $totalrecurringtriennially}{$totalrecurringtriennially} {$LANG.orderpaymenttermtriennially}<br />
      {/if}</td>
  </tr>
  {/if}
</table>
<br />
{if !$checkout}
<table width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>
    <td width="55%" align="center"><form method="post" action="{$smarty.server.PHP_SELF}?a=view">
        <input type="hidden" name="validatepromo" value="true" />
        <strong>{$LANG.orderpromotioncode}</strong> {if $promotioncode}{$promotioncode} - {$promotiondescription}<br /><a href="{$smarty.server.PHP_SELF}?a=removepromo">{$LANG.orderdontusepromo}</a>{else}
        <input type="text" name="promocode" size="20" /> 
        <input type="submit" value="{$LANG.orderpromovalidatebutton}" class="button" />
        {/if}
      </form></td>
    <td width="45%" align="center"><input type="button" value="{$LANG.emptycart}" onclick="emptyCart();return false" class="buttonwarn" />
      <input type="button" value="{$LANG.continueshopping}" onclick="window.location='cart.php'" class="button" />
    <input type="button" value="{$LANG.checkout}" onclick="window.location='cart.php?a=checkout'"{if $cartitems==0} disabled{/if} class="buttongo" /></td>
  </tr>
</table>
{else}
<form method="post" action="{$smarty.server.PHP_SELF}?a=checkout">
  <input type="hidden" name="submit" value="true" />
  <h3>{$LANG.yourdetails}</h3>
  <p>{if !$loggedin}<strong>{$LANG.alreadyregistered}</strong> <a href="{$smarty.server.PHP_SELF}?a=login">{$LANG.clickheretologin}</a>{/if}</p>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="frame">
    <tr>
      <td width="50%" valign="top"><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="100" class="fieldarea">{$LANG.clientareafirstname}</td>
            <td>{if $loggedin}{$clientsdetails.firstname}{else}
              <input type="text" name="firstname" style="width:80%;" value="{$clientsdetails.firstname}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientarealastname}</td>
            <td>{if $loggedin}{$clientsdetails.lastname}{else}
              <input type="text" name="lastname" style="width:80%;" value="{$clientsdetails.lastname}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacompanyname}</td>
            <td>{if $loggedin}{$clientsdetails.companyname}{else}
              <input type="text" name="companyname" style="width:80%;" value="{$clientsdetails.companyname}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea"{if !$loggedin} style="height:21px;"{/if}>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaemail}</td>
            <td>{if $loggedin}{$clientsdetails.email}{else}
              <input type="text" name="email" style="width:90%;" value="{$clientsdetails.email}" />
              {/if}</td>
          </tr>
          {if $loggedin}
          <tr>
            <td class="fieldarea">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="fieldarea">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          {else}
          <tr>
            <td class="fieldarea">{$LANG.clientareapassword}</td>
            <td><input type="password" name="password" size="20" id="newpw" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaconfirmpassword}</td>
            <td><input type="password" name="password2" size="20" /></td>
          </tr>
          {/if}
      </table></td>
      <td width="50%" valign="top"><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="100" class="fieldarea">{$LANG.clientareaaddress1}</td>
            <td>{if $loggedin}{$clientsdetails.address1}{else}
              <input type="text" name="address1" style="width:80%;" value="{$clientsdetails.address1}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaaddress2}</td>
            <td>{if $loggedin}{$clientsdetails.address2}{else}
              <input type="text" name="address2" style="width:80%;" value="{$clientsdetails.address2}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacity}</td>
            <td>{if $loggedin}{$clientsdetails.city}{else}
              <input type="text" name="city" style="width:80%;" value="{$clientsdetails.city}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareastate}</td>
            <td>{if $loggedin}{$clientsdetails.state}{else}
              <input type="text" name="state" style="width:80%;" value="{$clientsdetails.state}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareapostcode}</td>
            <td>{if $loggedin}{$clientsdetails.postcode}{else}
              <input type="text" name="postcode" size="15" value="{$clientsdetails.postcode}" />
              {/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacountry}</td>
            <td>{if $loggedin}{$clientsdetails.country}{else}{$clientcountrydropdown}{/if}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaphonenumber}</td>
            <td>{if $loggedin}{$clientsdetails.phonenumber}{else}
              <input type="text" name="phonenumber" size="20" value="{$clientsdetails.phonenumber}" />
              {/if}</td>
          </tr>
      </table></td>
    </tr>
  </table>
  {if !$loggedin}<script language="javascript">showStrengthBar();</script>{/if}
  {if $customfields || $securityquestions} <br />
  <table width="100%" cellspacing="1" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" cellpadding="2">
      {if $securityquestions && !$loggedin}
        <tr><td width="200" class="fieldarea">{$LANG.clientareasecurityquestion}</td><td><select name="securityqid">
          {foreach key=num item=question from=$securityquestions}
	        <option value={$question.id}>{$question.question}</option>
          {/foreach}
        </select></td></tr>
        <tr>
          <td class="fieldarea">{$LANG.clientareasecurityanswer}</td><td><input type="password" name="securityqans" size="30"></td>
        </tr>
      {/if}
      {foreach key=num item=customfield from=$customfields}
        <tr><td width="200" class="fieldarea">{$customfield.name}</td><td>{$customfield.input} {$customfield.description}</td></tr>
      {/foreach}
      </table></td>
    </tr>
  </table>
  {/if}

  {if $taxenabled && !$loggedin}
  <p align="center">{$LANG.carttaxupdateselections}
    <input type="submit" value="{$LANG.carttaxupdateselectionsupdate}" name="updateonly" />
  </p>
  {/if}
  
  {if $domainsinorder}
  <h3>{$LANG.domainregistrantinfo}</h3>
  {if $addcontact}
  <input type="hidden" name="contact" value="addingnew" />
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td width="50%" valign="top"><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="100" class="fieldarea">{$LANG.clientareafirstname}</td>
            <td><input type="text" name="domaincontactfirstname" style="width:80%;" value="{$domaincontact.firstname}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientarealastname}</td>
            <td><input type="text" name="domaincontactlastname" style="width:80%;" value="{$domaincontact.lastname}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacompanyname}</td>
            <td><input type="text" name="domaincontactcompanyname" style="width:80%;" value="{$domaincontact.companyname}" /></td>
          </tr>
          <tr>
            <td class="fieldarea" style="height:21px;"><br /></td>
            <td></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaemail}</td>
            <td><input type="text" name="domaincontactemail" style="width:90%;" value="{$domaincontact.email}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaphonenumber}</td>
            <td><input type="text" name="domaincontactphonenumber" size="20" value="{$domaincontact.phonenumber}" /></td>
          </tr>
      </table></td>
      <td width="50%" valign="top"><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="100" class="fieldarea">{$LANG.clientareaaddress1}</td>
            <td><input type="text" name="domaincontactaddress1" style="width:80%;" value="{$domaincontact.address1}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaaddress2}</td>
            <td><input type="text" name="domaincontactaddress2" style="width:80%;" value="{$domaincontact.address2}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacity}</td>
            <td><input type="text" name="domaincontactcity" style="width:80%;" value="{$domaincontact.city}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareastate}</td>
            <td><input type="text" name="domaincontactstate" style="width:80%;" value="{$domaincontact.state}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareapostcode}</td>
            <td><input type="text" name="domaincontactpostcode" size="15" value="{$domaincontact.postcode}" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacountry}</td>
            <td>{$domaincontactcountrydropdown}</td>
          </tr>
      </table></td>
    </tr>
  </table>
  {else}
  <p>{$LANG.domainregistrantchoose}:
    <select name="contact">
      <option value="">{$LANG.usedefaultcontact}</option>
      
{foreach key=num item=domaincontact from=$domaincontacts}

      <option value="{$domaincontact.id}">{$domaincontact.name}</option>
      
{/foreach}

      <option value="new">{$LANG.clientareanavaddcontact}...</option>
    </select>
    <br />
  </p>
  {/if}
  {/if}
  <h3>{$LANG.orderpaymentmethod}</h3>
  <p align="center">{foreach key=num item=gateway from=$gateways}
    <input type="radio" name="paymentmethod" value="{$gateway.sysname}" id="pgbtn{$num}"{if $selectedgateway eq $gateway.sysname} checked{/if} />
    <label for="pgbtn{$num}">{$gateway.name}</label>
    {/foreach}</p>
  {if $shownotesfield}
  <h3>{$LANG.ordernotes}</h3>
  <p align="center">
    <textarea name="notes" rows="4" cols="100" onFocus="if(this.value=='{$LANG.ordernotesdescription}'){ldelim}this.value='';{rdelim}" onBlur="if (this.value==''){ldelim}this.value='{$LANG.ordernotesdescription}';{rdelim}">{$notes}</textarea>
  </p>
  {/if}
  
  {if $accepttos}
  <p align="center">
    <input type="checkbox" name="accepttos" id="accepttos" />
    <label for="accepttos">{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a></label>
  <p> {/if}
  <p align="center">
    <input type="submit" value="{$LANG.completeorder}"{if $cartitems==0} disabled{/if} onclick="this.value='{$LANG.pleasewait}'" class="buttongo" />
  </p>
  <p><img src="images/padlock.gif" border="0" class="imgfloat" alt="Secure Transaction" /> {$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}</p>
</form>
{/if}<br />
