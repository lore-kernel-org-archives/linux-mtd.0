Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1ConDu-00066x-ED
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:28:05 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112181006.GI25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 12 Jan 2005 19:27:59 +0100
Message-Id: <1105554479.17853.287.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
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

On Wed, 2005-01-12 at 19:10 +0100, Jörn Engel wrote:

> Ok, let me distinguish between the different problems:
>   Soft errors
>
> In other words, one out of 1000 flashes will have a non-recoverable
> error sometime during it's life cycle.  Doesn't exactly make me happy,
> but it's not horrible either.  In cases where little data is written
> to flash or other components (cpu, power regulators) die before the
> flash does, this is even less of an issue.
>
> What does that mean for this discussion?  On Toshiba's NAND flashes,
> according to their claims, jffs2 checksums won't catch any errors that
> wouldn't already be caught either by ECC or during write/erase.
> 
> Am I wrong?

No, using Reed-Solomon codes with an hardware decoder/encoder can
improve this significantly (3 - 12 bits depending on the
implementation), so your error propabilty is going near 0.
Hardware encoders/decoders are easy to build into FPGA/CPLD. There are
public VHDL sources available. The speed advantage over sofwtare ECC is
significant.

Missing error

There is another type of error, which came up lately with AND FLASH. If
you leave a block untouched in a range of blocks and erase/program the
surrounding blocks, then the untouched block is likely to have bitflips.
GC likeliness to GC clean blocks from time to time will cover this, but
if you have a big number of clean blocks you might get into trouble.

A strong argument for using seperate partitions for static and dynamic
data.

tglx
