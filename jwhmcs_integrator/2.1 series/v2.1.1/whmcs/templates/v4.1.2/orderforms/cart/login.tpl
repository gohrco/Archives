<link rel="stylesheet" type="text/css" href="templates/orderforms/cart/style.css" />

<p align="center" class="cartheading">{$LANG.cartexistingclientlogin}</p>

<p>{$LANG.cartexistingclientlogindesc}</p>

<form action="jwhmcs.php?goto=cart&task=ulogin&a=checkout" method="post">

{if $incorrect}<div class="errorbox">{$LANG.loginincorrect}</div><br />{/if}

<table align="center">
<tr><td align="right">{$LANG.loginemail}:</td><td><input type="text" name="username" size="40" value="{$username}" /></td></tr>
<tr><td align="right">{$LANG.loginpassword}:</td><td><input type="password" name="password" size="25" /></td></tr>
</table>
<p align="center"><input type="submit" value="{$LANG.loginbutton}" /></p>

</form>

<p align="center"><strong>{$LANG.loginforgotten}</strong> <a href="pwreset.php">{$LANG.loginforgotteninstructions}</a></p>
<script type="text/javascript">
document.frmlogin.username.focus();
</script>
<br />