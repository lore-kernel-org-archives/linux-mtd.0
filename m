Received: from cmsout03.mbox.net ([165.212.64.33])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2X4B-0003Si-Lz
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2004 11:30:33 -0400
Message-ID: <024801c49038$969f09f0$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc><1093894808.25339.57.camel@weaponx.rchland.ibm.com><073f01c48ecc$abd3e600$fd0ba8c0@briantpc><1093899187.16320.25.camel@thomas.tec.linutronix.de><075f01c48ed7$08dbc570$fd0ba8c0@briantpc><1093900751.16320.28.camel@thomas.tec.linutronix.de><07e301c48f6b$0e95fdc0$fd0ba8c0@briantpc><1093966869.6200.34.camel@localhost.localdomain><080401c48f7d$253bda60$fd0ba8c0@briantpc><1093972311.6200.47.camel@localhost.localdomain><082b01c48f94$fe637840$fd0ba8c0@briantpc>
	<1093982409.6200.54.camel@localhost.localdomain>
Date: Wed, 1 Sep 2004 10:30:14 -0500
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


> > With KERN_DEBUG (all options) on, I don't see anything extra in the
syslog.
> > Should there be?
>
> man syslogd.conf
>
> syslog doesn't log messages at KERN_DEBUG by default. But syslog is too
> lossy anyway. Use a serial console.
>
> Use CONFIG_JFFS2_FS_DEBUG=1. More than that is overkill.
>

David, I sent you 2 log files.  I have an image untainted (before bootup).
I flashed the unit to allow it to boot so I could then pull the image off
through the bootloader, but it failed to start init and completely come up
this time.  I have the console log.  Do you want a link to an image that has
booted successfully, or  *this* image that failed? Or both?

-Brian
