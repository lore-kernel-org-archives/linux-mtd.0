Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2C7g-0006vE-WC
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2004 13:08:46 -0400
Message-ID: <080401c48f7d$253bda60$fd0ba8c0@briantpc>
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
Date: Tue, 31 Aug 2004 12:08:27 -0500
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


>
> Logging via syslog is too lossy to be useful. Please obtain messages
> over a serial console or possibly netconsole if that's reliable enough.
>
> You need even the KERN_DEBUG messages which are absent from your syslog,
> too.
>
> I need to see what it said while it wrote the new file, then what it
> said while remounting the offending file system. If you can take a
> snapshot of the flash after writing the file and turning the machine
> off, but before remounting it, that would be useful too.
>

Ok,

I'll try to get that done tomorrow.  Will take some time to setup remote
syslog, boot, break it, turn off, dump the image, reboot, and dump the
broken image.  Each image will probably be around 10MB compressed.  David, I
can put the files on an FTP server and give you the link if you will have
time to take a peek at them

Let me know what you want me to do.

-Brian
