# Thanks to github.com/usernein

import os
import pyrogram

with open('Aonly.txt') as f:
    os.environ['CAT_FILE'] = f.read()

rom = os.getenv('ROM')
zip = os.getenv('ZIP_NAME')
cat = os.getenv('CAT_FILE')
romlink = os.getenv('ROM_LINK')
da = os.getenv('DOWNLOAD_A')
dab = os.getenv('DOWNLOAD_AB')

with pyrogram.Client('bot', os.getenv('API_ID'), os.getenv('API_HASH'), bot_token=os.getenv('TOKEN')) as client:
    client.send_message(
        text=f"""- <b>{rom} GSI For A-Only • A/B Devices (AncientOS 3.9 Weeabooify ROM)</b>

<b>- Firmware Base:</b> <a href="{romlink}">HERE</a>

<b>- Information:</b>

<code>{cat}</code>

<b>- Download A-Only:</b> <a href="{da}">HERE</a>
<b>- Download A/B:</b> <a href="{dab}">HERE</a>

<b>- Thanks to:</b> <a href="https://github.com/yukosky/ErfanGSIs/graphs/contributors">Contributors List</a>

<b>• YuMi Projekt </b> - Channel: @yuprojekt
<b>• YuMi Projekt </b> - Group: @yusupport

• <b>Ported using ErfanGSIs Tool - <a href="https://github.com/yukosky/ErfanGSIs">Yuko's Based</a>""",
        chat_id=os.getenv('CHAT_ID'),
        parse_mode="html",
        disable_web_page_preview=True
    )
