Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0eKU-0008ES-9v
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 06:23:52 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0IBW0090KFFB9Z@mmp2.samsung.com>
References: <0IBW0090KFFB9Z@mmp2.samsung.com>
Content-Type: text/plain
Date: Mon, 14 Feb 2005 12:23:47 +0100
Message-Id: <1108380228.16612.300.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Subject: RE: [RFC] adding support for OneNAND flash memory
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 20:18 +0900, kyungmin park wrote:
> [snip]
> > May be it makes sense to put it to drivers/mtd/nand/onenand if some
> > parts of the existing code (like BBT, etc) may be reused? Possibly,
> > you'll need to split the existing code on what is NAND-specific and what
> > is OK for both OneNAND and NAND.
> > 
> > => As I said before, it's difficult to modify/extend current nand
> directory
> > to support OneNAND. That's why I suggested to add onenand directory.
> 
> > It's not hard to extend. Just add onenand.c to it, if thats all what is
> > needed. The question is whether the bad block table code can be shared
> > or not. I agree that nand_base.c can not be tweaked for OneNAND.
> 
> Although OneNAND uses NAND core internally, the interface is very different
> from NAND. The viewpoint of the hardware it seems to be connected with NOR.
> Also OneNAND supports synchronous burst read as NOR does
> I wonder the different interface of flash putting together is accptable?
> 
> Currently, I don't apply bad block table code to onenand. But I think
> there's no problem to use current bbt code.

Ok, so I guess it makes sense to put it into drivers/mtd/onenand. If you
want to use the bbt code from nand it's no problem, just a tweak in
KConfig.

tglx
