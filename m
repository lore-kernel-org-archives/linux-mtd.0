From: David Woodhouse <dwmw2@infradead.org>
To: Brian T <btuch@usa.net>
In-Reply-To: <082b01c48f94$fe637840$fd0ba8c0@briantpc>
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
	<082b01c48f94$fe637840$fd0ba8c0@briantpc>
Content-Type: text/plain
Date: Tue, 31 Aug 2004 21:00:09 +0100
Message-Id: <1093982409.6200.54.camel@localhost.localdomain>
Mime-Version: 1.0
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

On Tue, 2004-08-31 at 14:59 -0500, Brian T wrote:
> > Putting them up for download is probably better than mailing them to the
> > list -- yes.
> >
> > Make sure that your log includes KERN_DEBUG messages and isn't lossy.
> > Remote syslog isn't necessarily good enough -- a serial console
> > certainly is.
> >
> > Let me know the inode number of the test file you created too (ls -i me)
> >
> 
> I got console logging on, and will run some tests.  I'll send you a priv
> email where to get the files from.
> 
> With KERN_DEBUG (all options) on, I don't see anything extra in the syslog.
> Should there be?

man syslogd.conf 

syslog doesn't log messages at KERN_DEBUG by default. But syslog is too
lossy anyway. Use a serial console.

Use CONFIG_JFFS2_FS_DEBUG=1. More than that is overkill.

-- 
dwmw2
