Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cor3G-0006Ry-1y
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 12:32:16 +0000
Date: Fri, 17 Mar 2017 13:31:42 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, richard@nod.at,
 computersforpeace@gmail.com, thomas.petazzoni@free-electrons.com,
 linux-mtd@lists.infradead.org, peterpansjtu@gmail.com,
 linshunquan1@hisilicon.com
Subject: Re: [PATCH v3 5/8] nand: spi: Add bad block support
Message-ID: <20170317133142.3815f9d0@bbrezillon>
In-Reply-To: <911b755d-87a1-26c1-8b75-84383b7c0076@gmail.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-6-git-send-email-peterpandong@micron.com>
 <911b755d-87a1-26c1-8b75-84383b7c0076@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Mar 2017 13:22:17 +0100
Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:

> On 16/03/2017 07:47, Peter Pan wrote:
> > [...]
> > +
> > +/*
> > + * spinand_scan_bbt - scan BBT in SPI NAND device
> > + * @chip: SPI NAND device structure
> > + */
> > +static int spinand_scan_bbt(struct spinand_device *chip)
> > +{
> > +	struct nand_device *nand = &chip->base;
> > +	int ret;
> > +
> > +	nand->bbt.options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> > +	nand->bbt.td = NULL;
> > +	nand->bbt.md = NULL;
> > +
> > +	ret = spinand_create_badblock_pattern(chip);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return nand_scan_bbt(nand);
> > +}
> > +  
> 
> Boris, Peter,
> 
> I'm not a big fan of NAND_BBT_USE_FLASH for small capacity nand flash 
> (eg. 1Gb with 1024 blocks, where a complete bad block scan on boot is 
> fast enough).
> Do you consider NAND_BBT_USE_FLASH as mandatory, or does a optional 
> "of_get_nand_on_flash_bbt(dn))" device tree configuration is something 
> possible ?

It should be optional indeed.
