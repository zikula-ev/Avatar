{include file="Avatar_admin_menu.tpl"}
{pageaddvar name="javascript" value="prototype"}
{pageaddvar name="javascript" value="modules/Avatar/javascript/Avatar.js"}

<h2>{gt text="Search user"}</h2>

<div id="liveusersearch" class="z-hide">
    {gt text="Enter user name"}&nbsp;<input size="25" maxlength="40" type="text" name="username" id="username" value="" />
    <a id="listuser" href="javascript:void(0);">{img modname='core' set='icons/extrasmall' src="search.png" __alt="Edit" }</a>
    {img id="ajax_indicator" style="display: none;" modname='core' set='ajax' src="indicator_circle.gif" alt=""}

    <div id="username_choices" class="autocomplete_user"></div>
</div>

{if $username ne ""}
<dl class="av_result">
    {if $avatar ne ""}
    <dt><strong>{gt text="The current avatar of '%s' is:" tag1=$username|safetext}</strong></dt>
    <dd><img class="avatarchoosen" src="{getbaseurl}{$avatarpath|safetext}/{$avatar|safetext}" alt="Avatar" /></dd>
    {else}
    <dd>{gt text="The user has no avatar selected."}</dd>
    {/if}
</dl>

<h3>{gt text="Select new avatar"}</h3>

<form id="perpageform" class="z-form z-linear av_box" method="post" action="{modurl modname="Avatar" type="admin" func="searchusers" username=$username}">
    <fieldset>
        <input type="hidden" name="page" value="1" />
        <label for="perpage">{gt text="Select the number of avatars to be displayed per page"}:</label>&nbsp;
        <select id="perpage" name="perpage">
            <option value="10"  {if $perpage eq 10}selected="selected"{/if}>10</option>
            <option value="20"  {if $perpage eq 20}selected="selected"{/if}>20</option>
            <option value="50"  {if $perpage eq 50}selected="selected"{/if}>50</option>
            <option value="100" {if $perpage eq 100}selected="selected"{/if}>100</option>
            <option value="-1"  {if $perpage eq -1}selected="selected"{/if}>{gt text="All"}</option>
        </select>
        &nbsp;<input type="submit" name="submit" value="{gt text="Submit"}" />
    </fieldset>
</form>

<div class="z-clearfix">
    {foreach from=$avatars item="avatar"}
    <div class="avatarbox">
        <a href="{modurl modname="Avatar" type="admin" func="setavatar" uavatar=$avatar|safetext uid=$userid}">
            <strong class="avatarpic" style="width:{$coredata.Avatar.maxheight+20}px; height:{$coredata.Avatar.maxwidth+20}px; background:url({getbaseurl}{$avatarpath|safetext}/{$avatar|safetext}) no-repeat scroll center; ">&nbsp;</strong>
        </a>
        <span class="z-sub">{$avatar|safetext|truncate:15}</span>
    </div>
    {/foreach}
</div>

{pager rowcount=$allavatarscount limit=$perpage posvar="page" display="page" perpage=$perpage}
{/if}
{include file="Avatar_admin_footer.tpl"}
