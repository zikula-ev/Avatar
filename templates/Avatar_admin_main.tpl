{include file="Avatar_admin_menu.tpl"}
<h2>{gt text="Maintain avatars"}</h2>

<form id="perpageform" class="z-form z-linear av_box" method="post" action="{modurl modname="Avatar" type="admin" func="main"}">
    <div>
        <input type="hidden" name="page" value="1" />
        <fieldset>
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
    </div>
</form>

<div class="z-clearfix">
    {foreach from=$avatars item="avatar"}
    <div class="avatarbox">
        <strong class="avatarpic" style="width:{$coredata.Avatar.maxheight+20}px; height:{$coredata.Avatar.maxwidth+20}px; background:url({getbaseurl}{$avatarpath|safetext}/{$avatar|safetext}) no-repeat scroll center; ">&nbsp;</strong>
        <span class="z-sub">{$avatar|safetext|truncate:15}</span>
        <br />
        <a href="{modurl modname="Avatar" type="admin" func="listusers" avatar=$avatar|safetext}"  title="{gt text="List users that use this avatar"}">{img modname='core' set='icons/extrasmall' src="windowlist.png" __title="View" __alt="View"}</a>
        <a href="{modurl modname="Avatar" type="admin" func="delete" avatar=$avatar|safetext}" title="{gt text="Delete avatar"}">{img modname='core' set='icons/extrasmall' src="14_layer_deletelayer.png" __title="Delete" __alt="Delete"}</a>
    </div>
    {/foreach}
</div>

{pager rowcount=$allavatarscount limit=$perpage posvar="page" display="page" perpage=$perpage}
{include file="Avatar_admin_footer.tpl"}
