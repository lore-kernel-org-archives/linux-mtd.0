Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1ConQb-0006Rh-RQ
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:41:11 -0500
Date: Wed, 12 Jan 2005 19:40:59 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20050112184059.GL25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<1105554479.17853.287.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105554479.17853.287.camel@tglx.tec.linutronix.de>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 19:27:59 +0100, Thomas Gleixner wrote:
> 
> Missing error
> 
> There is another type of error, which came up lately with AND FLASH. If
                                                           ^^
You mean NAND, right?

> you leave a block untouched in a range of blocks and erase/program the
> surrounding blocks, then the untouched block is likely to have bitflips.
> GC likeliness to GC clean blocks from time to time will cover this, but
> if you have a big number of clean blocks you might get into trouble.
> 
> A strong argument for using seperate partitions for static and dynamic
> data.

Wouldn't that also require a DMZ of some size between static and
dynamic data?  For example, 4MB static, 1MB unused, rest dynamic?

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
