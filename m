Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FB9sO-00073F-O9
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 07:10:55 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
In-Reply-To: <43F9AE68.4040206@intel.com>
References: <1140433245.2480.699.camel@localhost.localdomain>
	<43F9AE68.4040206@intel.com>
Content-Type: text/plain
Date: Mon, 20 Feb 2006 13:11:43 +0100
Message-Id: <1140437503.2480.711.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fixup in NAND bad block management + fix of
	misspring.(nand_base.c)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-02-20 at 14:56 +0300, Alexey, Korolev wrote:
> Thomas,
> 
> > I still do not get why you need all this magic instead of fixing up
> > this->badblockpos in the first place.
> >
> Fixing this->badblockpos in low level driver will not help because, 
> according to the code this->badblockpos updates in nand_base.c 
> unconditionally.

Did I say low level driver ?

> Moreover it's rather hard to define the conditions, because by default 
> structure "this" is filled by zeroes. (We can't distinguish advisedly 
> setting of badblockpos from the default value).

And you believe that your patch is the only way to solve that trivial
problem ?

Without thinking too much about the problem, there _are_ at least two
sane places to fix that.

1. nand_scan() can handle this based on chip id and/or manufacturer id
2. nand_scan_bbt() can do the fixup as well

When the ST chips have the bad block pos at offset 0 in general then we
want a generic solution which fixes up the nand_scan_bbt code as well
instead of requiring a seperate board driver supplied badblock_pattern.

Your patch is bogus anyway, as the else path will _NEVER_ be executed.
this->badblock_pattern is never NULL.

	tglx
