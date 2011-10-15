<p class="heading2">{$LANG.clientareanavdomains}</p>

<table width="100%" cellspacing="0" cellpadding="0"><tr><td>{$numproducts} {$LANG.recordsfound},  {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</td><td align="right">{if $prevpage}<a href="clientarea.php?action=domains&amp;page={$prevpage}">{/if}&laquo; {$LANG.previouspage}{if $prevpage}</a>{/if} &nbsp; {if $nextpage}<a href="clientarea.php?action=domains&amp;page={$nextpage}">{/if}{$LANG.nextpage} &raquo;{if $nextpage}</a>{/if}</td></tr></table>

<br />

<table class="clientareatable" cellspacing="1">
<tr class="clientareatableheading"><td>{$LANG.clientareahostingregdate}</td><td>{$LANG.clientareahostingdomain}</td><td>{$LANG.clientareahostingnextduedate}</td><td>{$LANG.orderprice}</td><td width="120"></td></tr>
{foreach key=num item=domain from=$domains}
<tr class="clientareatable{if $domain.status eq "expired"}terminated{else}{$domain.status}{/if}"><td>{$domain.registrationdate}</td><td><a href="http://{$domain.domain}" target="_blank">{$domain.domain}</a></td><td>{$domain.nextduedate}</td><td>{$domain.amount}</td><td><form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails"><input type="hidden" name="id" value="{$domain.id}"><input type="submit" value="{$LANG.clientareaviewdetails}" class="button" style="margin:0" /></form></td></tr>
{foreachelse}
<tr class="clientareatableactive"><td colspan="6">{$LANG.norecordsfound}</td></tr>
{/foreach}
</table>

<br />

<table width="100%" cellspacing="0" cellpadding="0"><tr><td>{$LANG.show}: <a href="clientarea.php?action=domains&itemlimit=10">10</a> <a href="clientarea.php?action=domains&itemlimit=25">25</a> <a href="clientarea.php?action=domains&itemlimit=50">50</a> <a href="clientarea.php?action=domains&itemlimit=100">100</a> <a href="clientarea.php?action=domains&itemlimit=all">{$LANG.all}</a></td><td align="right">{if $prevpage}<a href="clientarea.php?action=domains&amp;page={$prevpage}">{/if}&laquo; {$LANG.previouspage}{if $prevpage}</a>{/if} &nbsp; {if $nextpage}<a href="clientarea.php?action=domains&amp;page={$nextpage}">{/if}{$LANG.nextpage} &raquo;{if $nextpage}</a>{/if}</td></tr></table>

<table align="center">
<tr><td width="10" align="right"><table style="width:10px;height:10px;" cellspacing="1" class="clientareatable"><tr class="clientareatableactive"><td></td></tr></table></td><td>{$LANG.clientareaactive}</td><td width="10" align="right"><table style="width:10px;height:10px;" cellspacing="1" class="clientareatable"><tr class="clientareatablepending"><td></td></tr></table></td><td>{$LANG.clientareapending}</td><td width="10" align="right"><table style="width:10px;height:10px;" cellspacing="1" class="clientareatable"><tr class="clientareatableterminated"><td></td></tr></table></td><td>{$LANG.clientareaexpired}</td></tr></table>