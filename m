Received: from av4-2-sn3.vrr.skanova.net ([81.228.9.112])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Csf6s-0006vt-77
	for linux-mtd@lists.infradead.org; Sun, 23 Jan 2005 05:36:47 -0500
Received: from smtp1-2-sn3.vrr.skanova.net (smtp1-2-sn3.vrr.skanova.net
	[81.228.9.178])
	by av4-2-sn3.vrr.skanova.net (Postfix) with ESMTP id E868237E43
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Jan 2005 11:36:42 +0100 (CET)
Received: from tobbe (h19n2fls32o945.telia.com [217.208.77.19])
	by smtp1-2-sn3.vrr.skanova.net (Postfix) with ESMTP id 944BF38003
	for <linux-mtd@lists.infradead.org>;
	Sun, 23 Jan 2005 11:36:42 +0100 (CET)
From: =?iso-8859-1?Q?Torbj=F6rn_Jansson?= <torbjorn.jansson@mbox200.swipnet.se>
To: <linux-mtd@lists.infradead.org>
Date: Sun, 23 Jan 2005 11:37:15 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <20050123103642.944BF38003@smtp1-2-sn3.vrr.skanova.net>
Subject: A few questions about diskonchip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been trying to figure out how the old doc2001plus module works, i was
hoping i woud be able to make the new diskonchip module work with my
millenium plus 32mb.
If i have understood this correctly the millenium plus 16 is supported by
diskonchip.c module and that one is prety close to the 32 mb version.

I can get the old doc2001plus module to load and detect the chip (2
modifications requierd), but when i cat from /dev/mtdblock0 the resulting
data doesn't match a dump of the rom i have on file.
For example, one string in /dev/mtdblock reads "Cyrht" but it shoud be
"Copyright" so it looks like the module is reading 32bits and throwing away
16 or something like that.
That woud also explain why the media header is BND instead of BNAND
I haven't figured out how that can happend, maybe the old module is just
broken.

Another thing i haven't figured out yet is this chip/floor thing.
What counts as a floor? Is that for the 64Mb version of the millenium plus,
so it has 2 floors with one chip on each?
And the 32mb version have one floor and one chip?

I can see in the other init functions there is some chip counting going on,
but not in doc2001plus_init() maybe that is only needed for the 64 mb
version?

The 32mb version have some kind of interleaving, right? And that's the main
difference between the 16 and 32 mb version?
But how is it done?
Maybe it have something to do with the comment above DoC_GetDataOffset() in
doc2001plus.c ?


I don't know if i'm able to fix this, i have only the docs that i can
download from the web, my guess is that there is more technical docs that
describe all this.
