From: David Woodhouse <dwmw2@infradead.org>
To: Brian T <btuch@usa.net>
In-Reply-To: <07e301c48f6b$0e95fdc0$fd0ba8c0@briantpc>
References: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc>
	<1093894808.25339.57.camel@weaponx.rchland.ibm.com>
	<073f01c48ecc$abd3e600$fd0ba8c0@briantpc>
	<1093899187.16320.25.camel@thomas.tec.linutronix.de>
	<075f01c48ed7$08dbc570$fd0ba8c0@briantpc>
	<1093900751.16320.28.camel@thomas.tec.linutronix.de>
	<07e301c48f6b$0e95fdc0$fd0ba8c0@briantpc>
Content-Type: text/plain
Date: Tue, 31 Aug 2004 16:41:09 +0100
Message-Id: <1093966869.6200.34.camel@localhost.localdomain>
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

On Tue, 2004-08-31 at 09:59 -0500, Brian T wrote:
> Attached is my zipped syslog. From bootup, I touched a file, and then
> echo'd some chars into it.  Everthing looks fine, even the file.

Logging via syslog is too lossy to be useful. Please obtain messages
over a serial console or possibly netconsole if that's reliable enough. 

You need even the KERN_DEBUG messages which are absent from your syslog,
too.

I need to see what it said while it wrote the new file, then what it
said while remounting the offending file system. If you can take a
snapshot of the flash after writing the file and turning the machine
off, but before remounting it, that would be useful too.

-- 
dwmw2
