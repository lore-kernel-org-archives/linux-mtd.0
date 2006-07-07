Received: from www.tglx.de ([213.239.205.147] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FyntX-0001W4-JF
	for linux-mtd@lists.infradead.org; Fri, 07 Jul 2006 06:49:18 -0400
Subject: Re: Fwd: sharpsl nand driver still broken in current git
From: Thomas Gleixner <tglx@linutronix.de>
To: Steven Newbury <s_j_newbury@yahoo.co.uk>
In-Reply-To: <20060706000925.45150.qmail@web25010.mail.ukl.yahoo.com>
References: <20060706000925.45150.qmail@web25010.mail.ukl.yahoo.com>
Content-Type: text/plain
Date: Fri, 07 Jul 2006 12:51:52 +0200
Message-Id: <1152269513.24611.183.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-07-06 at 01:09 +0100, Steven Newbury wrote:
> > Since the NAND subsystem has been updated from the recent ARM merge the
> > sharpsl
> > driver no longer detects the NAND device from nand_scan.
> > ...
> > Sharp SL series flash device: 800000 at 0
> > Using static partision definition
> > Creating 1 MTD partitions on "sharpsl-flash":
> > 0x00140000-0x007f0000 : "Boot PROM Filesystem"
> > No NAND device found!!!
> > ...

I converted the driver blindly after I changed the core code. Richard
can you please look into that ?

	tglx
