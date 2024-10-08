'''
A python script to update the discord theme system24

Why?
@import url(...) themes causes a lot of lag on discord
because it has to fetch the theme before displaying text messages

This leads to a blocking of the text messages until the discord
fetches the theme

What does this script do?
Expands the import url(...) theme
'''
import requests

def getThemeStr(url):
    return requests.get(url).text

theme_top_str = """
/**
 * @name raw_system24_nofetch
 * @description A tui-style discord theme.
 * @author refact0r
 * @version 1.0.0
 * @invite nz87hXyvcy
 * @website https://github.com/refact0r/system24
 * @source https://github.com/refact0r/system24/blob/master/system24.theme.css
 * @authorId 508863359777505290
 * @authorLink https://www.refact0r.dev
*/
"""

theme_mid_str = getThemeStr("https://refact0r.github.io/system24/src/main.css")

theme_bottom_str = """
/* customize things here */
:root {
	--font: 'JetBrains Mono'; /* UI font name. it must be installed on your system. */
	letter-spacing: -0.12ch; /* decreases letter spacing for better readability. */
	font-weight: 400; /* UI font weight. */
	--label-font-weight: 500; /* font weight for panel labels. */
	--corner-text: 'system24'; /* custom text to display in the corner. only works on windows. */
	--pad: 10px; /* padding between panels. */
	--txt-pad: 5px; /* padding inside panels to prevent labels from clipping */
	--panel-roundness: 0px; /* corner roundness of panels. ONLY WORKS IF unrounding.css IS REMOVED (see above). */

	/* background colors */
	--bg-0: oklch(19% 0 0); /* main background color. */
	--bg-1: oklch(25% 0 0); /* background color for secondary elements like code blocks, embeds, etc. */
	--bg-2: oklch(27% 0 0); /* color of neutral buttons. */
	--bg-3: oklch(31% 0 0); /* color of neutral buttons when hovered. */

	/* state modifiers */
	--hover: oklch(54% 0 0 / 0.1); /* color of hovered elements. */
	--active: oklch(54% 0 0 / 0.2); /* color of elements when clicked. */
	--selected: var(--active); /* color of selected elements. */

	/* text colors */
	--txt-dark: var(--bg-0); /* color of dark text on colored backgrounds. */
	--txt-link: var(--vesper-green); /* color of links. */
	--txt-0: oklch(90% 0 0); /* color of bright/white text. */
	--txt-1: oklch(85% 0 0); /* main text color. */
	--txt-2: oklch(65% 0 0); /* color of secondary text like channel list. */
	--txt-3: oklch(45% 0 0); /* color of muted text. */

	/* accent colors */
	--acc-0: var(--vesper-yellow); /* main accent color. */
	--acc-1: var(--vesper-yellow-1); /* color of accent buttons when hovered. */
	--acc-2: var(--vesper-yellow-2); /* color of accent buttons when clicked. */

	/* borders */
	--border-width: 2px; /* panel border thickness. */
	--border-color: var(--bg-3); /* panel border color. */
	--border-hover-color: var(--acc-0); /* panel border color when hovered. */
	--border-transition: 0.2s ease; /* panel border transition. */

	/* status dot colors */
	--online-dot: var(--green); /* color of online dot. */
	--dnd-dot: var(--pink); /* color of do not disturb dot. */
	--idle-dot: var(--yellow); /* color of idle dot. */
	--streaming-dot: var(--purple); /* color of streaming dot. */

	/* mention/ping and message colors */
	--mention-txt: var(--acc-0); /* color of mention text. */
	--mention-bg: color-mix(in oklch, var(--acc-0), transparent 90%); /* background highlight of mention text. */
	--mention-overlay: color-mix(in oklch, var(--acc-0), transparent 90%); /* overlay color of messages that mention you. */
	--mention-hover-overlay: color-mix(in oklch, var(--acc-0), transparent 95%); /* overlay color of messages that mention you when hovered. */
	--reply-overlay: var(--active); /* overlay color of message you are replying to. */
	--reply-hover-overlay: var(--hover); /* overlay color of message you are replying to when hovered. */

	/* color shades */
	--pink: oklch(73% 0.12 0);
	--pink-1: oklch(63% 0.12 0);
	--pink-2: oklch(53% 0.12 0);
	--purple: oklch(73% 0.12 300);
	--purple-1: oklch(63% 0.12 300);
	--purple-2: oklch(53% 0.12 300);
	--cyan: oklch(73% 0.12 200);
	--yellow: oklch(78% 0.12 80);
	--green: oklch(73% 0.12 160);
	--green-1: oklch(63% 0.12 160);
	--green-2: oklch(53% 0.12 160);

	/* vesper colors */
	--vesper-yellow: oklch(86.89% 0.0877463272562663 60.67946389413653);
	--vesper-yellow-1: oklch(76.89% 0.0877463272562663 60.67946389413653);
	--vesper-yellow-2: oklch(66.89% 0.0877463272562663 60.67946389413653);
	--vesper-green: oklch(93% 0.103 175.07);
}
"""

with open("raw_system24.theme.css", "w") as f:
    f.write(theme_top_str)
    f.write(theme_mid_str)
    f.write(theme_bottom_str)
    f.close()


