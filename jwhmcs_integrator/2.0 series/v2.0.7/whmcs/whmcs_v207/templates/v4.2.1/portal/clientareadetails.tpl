<div class="contentbox"><strong>{$LANG.clientareanavdetails}</strong> | <a href="{$smarty.server.PHP_SELF}?action=contacts">{$LANG.clientareanavcontacts}</a> | <a href="{$smarty.server.PHP_SELF}?action=addcontact">{$LANG.clientareanavaddcontact}</a>{if $ccenabled} | <a href="{$smarty.server.PHP_SELF}?action=creditcard">{$LANG.clientareanavchangecc}</a>{/if} | <a href="{$smarty.server.PHP_SELF}?action=changepw">{$LANG.clientareanavchangepw}</a> | <a href="{$smarty.server.PHP_SELF}?action=changesq">{$LANG.clientareanavsecurityquestions}</a></div>
<h2 class="heading2">{$LANG.clientareanavdetails}</h2>
{if $successful}
<div class="successbox">{$LANG.changessavedsuccessfully}</div>
<br />
{/if}
{if $errormessage}
<div class="errorbox">{$errormessage}</div>
<br />
{/if}
<form method="post" action="{$smarty.server.PHP_SELF}?action=details">
  <input type="hidden" name="save" value="true" />
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" class="fieldarea">{$LANG.clientareafirstname}</td>
            <td><input type="text" name="firstname" value="{$clientfirstname}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientarealastname}</td>
            <td><input type="text" name="lastname" value="{$clientlastname}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacompanyname}</td>
            <td><input type="text" name="companyname" value="{$clientcompanyname}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaemail}</td>
            <td><input type="text" name="email" value="{$clientemail}" size="50" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaaddress1}</td>
            <td><input type="text" name="address1" value="{$clientaddress1}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaaddress2}</td>
            <td><input type="text" name="address2" value="{$clientaddress2}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacity}</td>
            <td><input type="text" name="city" value="{$clientcity}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareastate}</td>
            <td><input type="text" name="state" value="{$clientstate}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareapostcode}</td>
            <td><input type="text" name="postcode" value="{$clientpostcode}" size="25" /></td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareacountry}</td>
            <td>{$clientcountriesdropdown}</td>
          </tr>
          <tr>
            <td class="fieldarea">{$LANG.clientareaphonenumber}</td>
            <td><input type="text" name="phonenumber" value="{$clientphonenumber}" size="25" /></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <br />
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" class="fieldarea">{$LANG.defaultbillingcontact}</td>
            <td><select name="billingcid">
                <option value="0">{$LANG.usedefaultcontact}</option>
                
{foreach key=num item=contact from=$contacts}

                <option value="{$contact.id}"{if $contact.id eq $billingcid} selected="selected"{/if}>{$contact.name}</option>
                
{/foreach}

              </select></td>
          </tr>
      </table></td>
    </tr>
  </table>
  {if $customfields} <br />
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          {foreach key=num item=customfield from=$customfields}
          <tr>
            <td width="150" class="fieldarea">{$customfield.name}</td>
            <td>{$customfield.input} {$customfield.required}</td>
          </tr>
          {/foreach}
      </table></td>
    </tr>
  </table>
  {/if}
  <p align="center">
    <input type="submit" value="{$LANG.clientareasavechanges}" class="button" />
    <input type="reset" value="{$LANG.clientareacancel}" class="button" />
  </p>
</form>