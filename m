Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSFid-0002QF-4a
 for linux-mtd@lists.infradead.org; Sat, 05 Oct 2013 00:27:40 +0000
Received: by mail-ie0-f178.google.com with SMTP id to1so11159537ieb.9
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2013 17:27:17 -0700 (PDT)
Date: Fri, 4 Oct 2013 17:27:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 05/21] mtd: nand: pxa3xx: Add driver-specific ECC BCH
 support
Message-ID: <20131005002713.GA23337@ld-irv-0074.broadcom.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1379606505-2529-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131003002440.GY23337@ld-irv-0074.broadcom.com>
 <20131004194923.GC20476@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131004194923.GC20476@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 04, 2013 at 04:49:24PM -0300, Ezequiel Garcia wrote:
> On Wed, Oct 02, 2013 at 05:24:40PM -0700, Brian Norris wrote:
> > On Thu, Sep 19, 2013 at 01:01:29PM -0300, Ezequiel Garcia wrote:
> > > This commit adds the BCH ECC support available in NFCv2 controller.
> > > Depending on the detected required strength the respective ECC layout
> > > is selected.
> > > 
> > > This commit adds an empty ECC layout, since support to access large
> > > pages is first required. Once that support is added, a proper ECC
> > > layout will be added as well.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > ---
> > >  drivers/mtd/nand/pxa3xx_nand.c | 53 ++++++++++++++++++++++++++++++++++++------
> > >  1 file changed, 46 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > > index a0dabe6..86c343e 100644
> > > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > 
> > ...
> > 
> > > @@ -1117,10 +1133,6 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> > >  	pxa3xx_flash_ids[1].name = NULL;
> > >  	def = pxa3xx_flash_ids;
> > >  KEEP_CONFIG:
> > > -	chip->ecc.mode = NAND_ECC_HW;
> > > -	chip->ecc.size = host->page_size;
> > > -	chip->ecc.strength = 1;
> > > -
> > >  	if (info->reg_ndcr & NDCR_DWIDTH_M)
> > >  		chip->options |= NAND_BUSWIDTH_16;
> > >  
> > > @@ -1130,8 +1142,35 @@ KEEP_CONFIG:
> > >  		chip->bbt_options |= NAND_BBT_USE_FLASH;
> > >  	}
> > >  
> > > +	/* Device detection must be done with ECC disabled */
> > > +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> > > +		nand_writel(info, NDECCCTRL, 0x0);
> > > +
> > >  	if (nand_scan_ident(mtd, 1, def))
> > >  		return -ENODEV;
> > > +
> > > +	/* 1-step ECC over the entire detected page size */
> > > +	chip->ecc.mode = NAND_ECC_HW;
> > > +	chip->ecc.size = mtd->writesize;
> > 
> > Does the ECC really only work in one step? IOW, do you only correct
> > 1-bit for the entire page? That is under-spec'd for most NAND (they need
> > 1-bit/512-byte, or 4-bit/512-byte). This ecc.size should actually
> > reflect the correction region (typically 512B or 1024B), and even if
> > your buffer layout makes a step every 2KB (or 4KB or whatever), the ECC
> > step size *should* be smaller than that.
> > 
> > Or maybe I'm wrong, and you're actually using a weak 4-bit correction
> > over 2048 bytes.
> > 
> 
> I must admit I'm a bit confused by this ECC step concept. Having
> described the ECC engine in the cover-letter, what do you think
> the right choice should be?

I'm still not sure. But I'll defer that discussion to the cover-letter.

> IMO, given the ECC engine works on the entire FIFO (actually it works
> on the transfered chunk) it's a 1-step ECC.

That doesn't necessarily mean it's 1-step ECC. The step refers more to
the correction region than to the mechanics of transfer sizes.

> On the other side, a multiple step ECC, i.e. chip->ecc.size != mtd->writesize
> makes the NAND base calls the subpage() function and the driver crashes
> horribly when using UBIFS.

Which function? Read or write? AFAICT, neither relies on chip->ecc.size.

> I'm not sure why subpage should be called in that case, given we don't
> support that.

If you don't support writes, you can flag:
    chip->options |= NAND_NO_SUBPAGE_WRITE

And subpage reads are currently only enabled on soft-ECC with page size
larger than 512.

> > > +
> > > +	/*
> > > +	 * Armada370 variant supports BCH, which provides 4-bit strength
> > > +	 * and needs to be supported in a special way.
> > > +	 */
> > > +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370 &&
> > 
> > Might there be other variants eventually that support BCH? Perhaps you
> > want to separate the property of "can use BCH" from "will use BCH"?
> > 
> 
> Yeah, probably. And maybe setting the BCH from the DT? The problem here
> is that because of the ECC choice being intimately related to the OOB
> location, this means the ECC choice is intimately related to the bad
> block markers.

Speaking of that: how do you deal with bad block markers, if your data
is actually placed in what is traditionally the "spare area"?

> IOW, the user can't really choose among ECC.

This means the choice of ECC must remain consistent across all users of
the NAND, but it doesn't mean there is no initial choice. A user could
choose to enable a higher ECC strength than what is technically required
by the flash.

> I guess this means the ECC choice is some sort of a hardware description
> and rightfully belongs to the DT. Right?

Yes, I think some description of ECC can be placed in DT. We're working
through a DT binding for Pekon's OMAP driver right now.

Brian
