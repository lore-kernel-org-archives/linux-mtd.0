Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NksM-0002of-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 02:20:58 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C8CB@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: "Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Intel sez: Synchronous Flash and XIP is the future -- thoughts?
Date: Sun, 15 Dec 2002 18:51:26 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Touting the various benefits that XIP advocates generally tout, Intel seems
to be waving the banner that XIP is the future.  Of course, it seems to me
that this is a little self-serving in that they probably charge more for
their more advanced flash parts that are suitable for this.  I know in the
past some fairly strong anti-XIP opinions have been expressed in this
community.  I myself find it far more probable that Intel is pushing this
because it happens to be what Windows CE uses rather than because it's a
clear technical winner.

I believe they claim board space as a win (though, you can't get rid of RAM
entirely, so this is tenuous).  They also claim power savings through less
RAM accesses.  I might buy this one.  It seems to me that XIP would
interfere pretty severly with systems like JFFS2, which must decompress a
block of memory anyway, so to really get the RAM reduction benefits of XIP,
you'd have to not use compression, which means you'd probably need twice as
much flash.  Is that a reasonable conclusion?

Any thoughts and opinions from the Linux experts here?

-Paul
