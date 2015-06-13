{gt text="View avatars" assign=templatetitle}
{include file="Avatar_user_header.tpl"}

<div class="av_list">
    <h3>{gt text="Please choose your prefered avatar"}</h3>
    <form id="perpageform" class="z-form z-linear av_box" method="post" action="{modurl modname="Avatar" type="user" func="main"}">
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

    <!--raw-->
    {include file="Avatar_user_select_display.tpl"}
    <!--/raw-->
    {pager rowcount=$allavatarscount limit=$perpage posvar="page" display="page"}
</div>

<div class="z-form">
    <div class="av_gravatar z-fieldset">
        <h3>{gt text="Gravatar"}</h3>
        <p>{gt text='This site also supports <a href="http://www.gravatar.com">gravatars</a>. If you have a gravatar then select the gravatar logo as your avatar.'}</p>
        <a href="{modurl modname="Avatar" type="user" func="setavatar" user_avatar=gravatar.gif}"><img class="avatarchoosen" src="http://www.gravatar.com/avatar/{$gravatar_hash}" alt="{gt text="Use your gravatar"}" /></a>
        <p>{gt text='Click your Gravatar to use it on this site.'}</p>
    </div>

    <div class="av_deactivate z-fieldset">
        <h3>{gt text="Deactivate your avatar"}</h3>
        {modurl modname="Avatar" type="user" func="setavatar" user_avatar=blank.gif assign=setblankurl}
        <p>{gt text='If you don\'t want that an avatar is displayed for you, then please click <a href="%1$s">here</a> to clear your avatar.' tag1=$setblankurl|htmlspecialchars}</p>
    </div>
</div>

{include file="Avatar_user_footer.tpl"}
