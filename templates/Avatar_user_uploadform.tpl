{gt text="Upload avatar" assign=templatetitle}
{include file="Avatar_user_header.tpl"}

<div class="av_upload">
    <h3>{$templatetitle}</h3>
    <p>{gt text="If no available avatar represents you, you can upload a personalised avatar."}</p>
    <form id="uploadform" class="z-form" action="{modurl modname="Avatar" type="user" func="upload"}" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>{gt text="Upload file"}</legend>
            <input type="hidden" name="csrftoken" value="{insert name='csrftoken'}" />
            <input type="hidden" name="MAX_FILE_SIZE" value="" />
            <div class="z-formbuttons">
                <input type="file" size="40" name="filelocale" />
            </div>
            <div class="z-formbuttons">
                <input type="submit" name="submit" value="{gt text="Upload"}" />
                <input type="reset" name="reset" value="{gt text="Clear"}" />
            </div>
            <div class="z-formrow">
                <label>{gt text="Possible extensions"}:</label>
                <span>{$coredata.Avatar.allowed_extensions|safetext}</span>
            </div>
            <div class="z-formrow">
                <label>{gt text="Avatar max. file size"}:</label>
                <span>{$coredata.Avatar.maxsize} {gt text="Bytes"}</span>
            </div>
            <div class="z-formrow">
                <label>{gt text="Maximal avatar dimensions"}:</label>
                <span>{$coredata.Avatar.maxheight}x{$coredata.Avatar.maxwidth} {gt text="pixels"}</span>
                {if $coredata.Avatar.allow_resize}<em class="z-sub z-formnote">({gt text="Larger images will be resized automatically."})</em>{/if}
            </div>
        </fieldset>
    </form>
</div>

{include file="Avatar_user_footer.tpl"}