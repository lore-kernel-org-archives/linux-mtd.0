Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G1iqK-0004Hh-Nx
	for linux-mtd@lists.infradead.org; Sat, 15 Jul 2006 08:02:13 -0400
Subject: Re: Fwd: sharpsl nand driver still broken in current git
From: Richard Purdie <rpurdie@rpsys.net>
To: tglx@linutronix.de, David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1152269513.24611.183.camel@localhost.localdomain>
References: <20060706000925.45150.qmail@web25010.mail.ukl.yahoo.com>
	<1152269513.24611.183.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sat, 15 Jul 2006 13:01:34 +0100
Message-Id: <1152964894.5546.77.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Steven Newbury <s_j_newbury@yahoo.co.uk>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-07-07 at 12:51 +0200, Thomas Gleixner wrote:
> On Thu, 2006-07-06 at 01:09 +0100, Steven Newbury wrote:
> > > Since the NAND subsystem has been updated from the recent ARM merge the
> > > sharpsl
> > > driver no longer detects the NAND device from nand_scan.
> > > ...
> > > Sharp SL series flash device: 800000 at 0
> > > Using static partision definition
> > > Creating 1 MTD partitions on "sharpsl-flash":
> > > 0x00140000-0x007f0000 : "Boot PROM Filesystem"
> > > No NAND device found!!!
> > > ...
> 
> I converted the driver blindly after I changed the core code. Richard
> can you please look into that ?

The conversion was at fault and a patch to fix it will follow this mail.

I'm loathed to create an mtd git tree containing it as last time I spent
time doing this, the pull request was totally ignored and someone else
ended up duplicating the work.

Richard
