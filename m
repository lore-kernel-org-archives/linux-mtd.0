From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060511223948.GG14232@wohnheim.fh-wedel.de>
References: <E1FeJBW-0002Du-BX@pentafluge.infradead.org>
	<20060511223948.GG14232@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2006 00:39:55 +0100
Message-Id: <1147390796.12030.17.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [MTD] Basic NAND driver for AMD/NatSemi CS5535/CS5536 Geode
	companion chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-12 at 00:39 +0200, Jörn Engel wrote:
> On Thu, 11 May 2006 22:59:02 +0100, Linux-MTD Mailing List wrote:
> >
> > +static int cs553x_device_ready(struct mtd_info *mtd)
> > +{
> > +	struct nand_chip *this = mtd->priv;
> > +	void __iomem *mmio_base = this->IO_ADDR_R;
> > +	unsigned char foo = readb(mmio_base + MM_NAND_STS);
> > +
> > +	return (foo & CS_NAND_STS_FLASH_RDY) && !(foo & CS_NAND_CTLR_BUSY); 
> 
> Foo?

Spot the removed debugging printk :)

> Why the cast?
> Extra space.

Inherited from autcpu12.c and then in turn from spia.c I believe. I'll
clean them all up.

-- 
dwmw2
