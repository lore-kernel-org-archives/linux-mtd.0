Received: from cmsout03.mbox.net ([165.212.64.33])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2Emv-0007Pl-0o
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2004 15:59:30 -0400
Message-ID: <082b01c48f94$fe637840$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc>
	<1093894808.25339.57.camel@weaponx.rchland.ibm.com>
	<073f01c48ecc$abd3e600$fd0ba8c0@briantpc>
	<1093899187.16320.25.camel@thomas.tec.linutronix.de>
	<075f01c48ed7$08dbc570$fd0ba8c0@briantpc>
	<1093900751.16320.28.camel@thomas.tec.linutronix.de>
	<07e301c48f6b$0e95fdc0$fd0ba8c0@briantpc>
	<1093966869.6200.34.camel@localhost.localdomain>
	<080401c48f7d$253bda60$fd0ba8c0@briantpc>
	<1093972311.6200.47.camel@localhost.localdomain>
Date: Tue, 31 Aug 2004 14:59:13 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 file corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Putting them up for download is probably better than mailing them to the
> list -- yes.
>
> Make sure that your log includes KERN_DEBUG messages and isn't lossy.
> Remote syslog isn't necessarily good enough -- a serial console
> certainly is.
>
> Let me know the inode number of the test file you created too (ls -i me)
>

I got console logging on, and will run some tests.  I'll send you a priv
email where to get the files from.

With KERN_DEBUG (all options) on, I don't see anything extra in the syslog.
Should there be?

-Brian
