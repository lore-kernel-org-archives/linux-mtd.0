Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Conz4-00084q-3b
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 14:16:47 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112184059.GL25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<1105554479.17853.287.camel@tglx.tec.linutronix.de>
	<20050112184059.GL25638@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 12 Jan 2005 20:16:41 +0100
Message-Id: <1105557401.17853.293.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 19:40 +0100, Jörn Engel wrote:
> On Wed, 12 January 2005 19:27:59 +0100, Thomas Gleixner wrote:
> > 
> > Missing error
> > 
> > There is another type of error, which came up lately with AND FLASH. If
>                                                            ^^
> You mean NAND, right?

No, I mean AND. And is similar to NAND, it has the same interface, but a
different cell technology.

http://www.renesas.com/fmwk.jsp?
cnt=ag_and_flash_memory_root.jsp&fp=/products/memory/ag_and_flash_memory/

> > you leave a block untouched in a range of blocks and erase/program the
> > surrounding blocks, then the untouched block is likely to have bitflips.
> > GC likeliness to GC clean blocks from time to time will cover this, but
> > if you have a big number of clean blocks you might get into trouble.
> > 
> > A strong argument for using seperate partitions for static and dynamic
> > data.
> 
> Wouldn't that also require a DMZ of some size between static and
> dynamic data?  For example, 4MB static, 1MB unused, rest dynamic?

No it does not propagate over blocks of blocks. e.g. inside of 0-255,
256-511, ... you have the trouble, but not between those regions.

tglx
