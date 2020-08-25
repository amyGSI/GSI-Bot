# Thanks to github.com/usernein

import os
import pyrogram

with open('Aonly.txt') as f:
    os.environ['CAT_FILE'] = f.read()

rom = os.getenv('ROM')
rom_generic = os.getenv('ROM_GENERIC')
zip = os.getenv('ZIP_NAME')
cat = os.getenv('CAT_FILE')
romlink = os.getenv('ROM_LINK')
da = os.getenv('DOWNLOAD_A')
dab = os.getenv('DOWNLOAD_AB')
wsfa = os.getenv('WET_DOWNLOAD_A')
wsfab = os.getenv('WET_DOWNLOAD_A')
dasf = os.getenv('DLAONLYSF')
dabsf = os.getenv('DLABSF')
read = os.getenv('READ')

with pyrogram.Client('bot', os.getenv('API_ID'), os.getenv('API_HASH'), bot_token=os.getenv('TOKEN')) as client:
    client.send_message(
        text=f"""- <b>{rom_generic} GSI For A-Only • A/B Devices</b>

<b>- Firmware Base:</b> <a href="{romlink}">HERE</a>

<b>- Information:</b>

<code>{cat}</code>

<b>- Download A-Only:</b> <a href="{da}">GoFile</a> | <a href="{wsfa}">Wet</a> | <a href="{dasf}">SourceForge</a> 
<b>- Download A/B:</b> <a href="{dab}">GoFile</a> | <a href="{wsfab}">Wet</a> | <a href="{dabsf}">SourceForge</a>

<b>- Thanks to:</b> <a href="https://github.com/yukosky/ErfanGSIs/graphs/contributors">Contributors List</a>

<b>• amyGSI </b> - Channel: @amyGSI

<b>• READ:</b> {read}

<b>• Ported using ErfanGSIs Tool -</b> <a href="https://github.com/amyGSI/ErfanGSIs">amyGSI Fork</a>""",
        chat_id=os.getenv('CHAT_ID'),
        parse_mode="html",
        disable_web_page_preview=True
    )
