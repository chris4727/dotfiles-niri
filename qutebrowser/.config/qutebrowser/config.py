# == QUTEBROWSER CONFIG ==========================
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html
#   https://qutebrowser.org/doc/help/settings.html

# --- GENERAL ------------------------------------

config.load_autoconfig(False)
c.fonts.default_family = "FiraCodeNerdFont"
c.fonts.default_size = "10.5pt"
c.auto_save.session = True # save tabs on quit/restart
c.url.start_pages = "https://start.duckduckgo.com/" # When starting qutebrowser
c.url.default_page = "https://start.duckduckgo.com/" # When opening a new tab without a URL
c.editor.command = ['kitty', '-e', 'vim', '{file}']

# -- TABS ----------------------------------------

c.tabs.show = "always" # When to show tabs:always, multiple, switching, never
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.width = '15%' # Size of vertical tab bar
c.tabs.position = "top" # "top" "bottom" "left" "right" TODO Auto switch to "top" above a certain number of open tabs

# --- PRIVACY ------------------------------------

c.content.javascript.enabled = True # TODO set False by default, toggle with keybind
c.content.autoplay = False
c.content.cookies.accept = "no-3rdparty"
c.content.cookies.store = True
c.content.geolocation = False
c.content.notifications.enabled = False

# --- KEYBINDS ---------------------------------

# Tab navigation
config.bind('J', 'tab-next')
config.bind('K', 'tab-prev')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('tH', 'config-cycle tabs.show multiple never')
# Close tabs
config.unbind('d', mode='normal') # Unbind default bindings
config.bind('dd', 'tab-close') 
# External video player
config.unbind('v', mode='normal') # Unbind default bindings
config.bind('v', 'hint links spawn --detach mpv {hint-url} ') # Pressing "v" will spawn link hints. The chosen link will open in mpv
#config.bind('<ctrl-y>', 'spawn --userscript ytdla') # TODO Run ytdla on url
config.bind('cc', 'config-source')
# Open external editor
config.bind( 'e', 'edit-url')
config.bind = [ '--mode', 'insert', '<Ctrl-e>', 'edit-text' ]

# --- SEARCH -------------------------------------

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        '!eb': 'https://www.ebay.com/sch/i.html?_nkw={}&_sacat=0&_from=R40&_trksid=p2540003.m570.l1313',
        '!lib': 'https://tacoma.bibliocommons.com/v2/search?query={}&searchType=smart',
        '!poke': 'https://bulbapedia.bulbagarden.net/w/index.php?title=Special:Search&search={}&fulltext=1&profile=default',
        '!skyrim': 'https://en.uesp.net/w/index.php?title=Special%3ASearch&search={}&button=',
        '!t1': 'https://1337x.to/search/{}/1/',
        '!t2': 'https://thepiratebay.org/search.php?q={}&all=on&search=Pirate+Search&page=0&orderby=',
        #'': '',
        }

# == THEME =======================================
# Rosepine theme palette
palette = {
            "bg0": "#191724",
            "bg1": "#1f1d2e",
            "bg2": "#26233a",
            "fg2": "#6e6a86",
            "fg1": "#908caa",
            "fg0": "#e0def4",
            "red": "#eb6f92",
            "yel": "#f6c177",
            "grn": "#b6daa9",
            "cyn": "#9ccfd9",
            "blu": "#31748f",
            "prp": "#c4a7e7",
            "pin": "#ebbcba",
            "tst": "#FF0000",
}
# --- DARK MODE ----------------------------------
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.bg = palette["bg0"]
c.colors.webpage.darkmode.policy.images = 'never'
# --- STATUSBAR ----------------------------------
c.colors.statusbar.normal.bg = palette["bg0"]
c.colors.statusbar.normal.fg = palette["fg2"]
c.colors.statusbar.command.bg = palette["bg0"]
c.colors.statusbar.command.fg = palette["yel"]
c.colors.statusbar.insert.bg = palette["bg0"]
c.colors.statusbar.insert.fg = palette["grn"]
c.colors.statusbar.private.bg = palette["prp"]
c.colors.statusbar.private.fg = palette["bg0"]
c.colors.statusbar.command.private.bg = palette["prp"]
c.colors.statusbar.command.private.fg = palette["bg0"]
c.colors.statusbar.url.fg = palette["fg2"]
c.colors.statusbar.url.success.https.fg = palette["grn"]
c.colors.statusbar.url.success.http.fg = palette["yel"]
c.colors.statusbar.url.error.fg = palette["red"]
c.colors.statusbar.url.hover.fg = palette["prp"]
c.colors.statusbar.url.warn.fg = palette["yel"]
c.colors.statusbar.progress.bg = palette["prp"]
# --- TABS ----------------------------------
c.tabs.title.format = "{audio}{index} {current_title}"
c.colors.tabs.even.bg = palette["bg0"]
c.colors.tabs.even.fg = palette["fg0"]
c.colors.tabs.odd.bg = palette["bg0"]
c.colors.tabs.odd.fg = palette["fg0"]
c.colors.tabs.bar.bg = palette["bg0"]
c.colors.tabs.selected.even.bg = palette["prp"]
c.colors.tabs.selected.odd.bg = palette["prp"]
c.colors.tabs.selected.even.fg = palette["bg0"]
c.colors.tabs.selected.odd.fg = palette["bg0"]

c.colors.tabs.pinned.even.bg = palette["bg1"]
c.colors.tabs.pinned.even.fg = palette["fg0"]
c.colors.tabs.pinned.odd.bg = palette["bg1"]
c.colors.tabs.pinned.odd.fg = palette["fg0"]
c.colors.tabs.pinned.selected.even.bg = palette["prp"]
c.colors.tabs.pinned.selected.odd.bg = palette["prp"]
c.colors.tabs.pinned.selected.even.fg = palette["bg0"]
c.colors.tabs.pinned.selected.odd.fg = palette["bg0"]
# --- HINTS --------------------------------------
# When pressing "f" or "F"
c.colors.hints.bg = palette["bg0"]
c.colors.hints.fg = palette["fg0"]
c.colors.hints.match.fg = palette["pin"]
c.hints.border = "1px solid" + palette["fg2"]
c.hints.padding = {'top': 3, 'bottom': 3, 'left': 5, 'right': 5}
c.hints.radius = 5
# --- TAB INDICATOR  -----------------------------
# The vertical bar on left of tabs
c.tabs.indicator.width = 13 # 0 = no tab indicator
c.colors.tabs.indicator.start = palette["tst"]
c.colors.tabs.indicator.stop = palette["cyn"]
# --- COMPLETION WIDGET  -------------------------
# When typing commands
c.colors.completion.match.fg = palette["pin"]
c.colors.completion.odd.bg = palette["bg0"]
c.colors.completion.even.bg = palette["bg0"]
c.colors.completion.fg = palette["fg0"]
c.colors.completion.category.bg = palette["bg0"]
c.colors.completion.category.fg = palette["fg0"]
c.colors.completion.item.selected.bg = palette["bg2"]
c.colors.completion.item.selected.fg = palette["fg0"]
c.colors.completion.item.selected.match.fg = palette["cyn"]
c.colors.completion.item.selected.border.top = palette["bg0"]
c.colors.completion.item.selected.border.bottom = palette["bg0"]
# --- MESSAGES -----------------------------------
c.messages.timeout = 10000
c.colors.messages.info.bg = palette["bg0"]
c.colors.messages.info.fg = palette["fg0"]
c.colors.messages.info.border = palette["bg0"]
c.colors.messages.error.bg = palette["bg0"]
c.colors.messages.error.fg = palette["red"]
c.colors.messages.error.border = palette["bg0"]
c.colors.messages.warning.bg = palette["bg0"]
c.colors.messages.warning.fg = palette["yel"]
c.colors.messages.warning.border = palette["bg0"]
# --- DOWNLOADS ----------------------------------
c.colors.downloads.bar.bg = palette["bg0"]
c.colors.downloads.start.bg = palette["bg0"]
c.colors.downloads.stop.bg = palette["bg0"]
c.colors.downloads.start.fg = palette["fg0"]
c.colors.downloads.stop.fg = palette["fg0"]
c.colors.downloads.error.bg = palette["bg0"]
c.colors.downloads.error.fg = palette["red"]
# --- PROMPTS ------------------------------------
c.colors.prompts.bg = palette["bg2"]
c.colors.prompts.fg = palette["fg0"]
c.colors.prompts.selected.bg = palette["prp"]
c.colors.prompts.selected.fg = palette["bg0"]
c.colors.prompts.border = palette["tst"]

c.colors.tooltip.bg = palette["bg0"]

# --- ADBLOCK ------------------------------------

# Adblocking info -->
# For yt ads: place the greasemonkey script yt-ads.js in your greasemonkey folder (~/.config/qutebrowser/greasemonkey).
# The script skips through the entire ad, so all you have to do is click the skip button.
# Yeah it's not ublock origin, but if you want a minimal browser, this is a solution for the tradeoff.
# You can also watch yt vids directly in mpv, see qutebrowser FAQ for how to do that.
# If you want additional blocklists, you can get the python-adblock package, or you can uncomment the ublock lists here.
c.content.blocking.enabled = True
# c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
        "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2025.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]

