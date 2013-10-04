Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSBNX-0005vA-Ba
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 19:49:36 +0000
Date: Fri, 4 Oct 2013 16:49:24 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 05/21] mtd: nand: pxa3xx: Add driver-specific ECC BCH
 support
Message-ID: <20131004194923.GC20476@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1379606505-2529-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131003002440.GY23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131003002440.GY23337@ld-irv-0074.broadcom.com>
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

On Wed, Oct 02, 2013 at 05:24:40PM -0700, Brian Norris wrote:
> On Thu, Sep 19, 2013 at 01:01:29PM -0300, Ezequiel Garcia wrote:
> > This commit adds the BCH ECC support available in NFCv2 controller.
> > Depending on the detected required strength the respective ECC layout
> > is selected.
> > 
> > This commit adds an empty ECC layout, since support to access large
> > pages is first required. Once that support is added, a proper ECC
> > layout will be added as well.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 53 ++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 46 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > index a0dabe6..86c343e 100644
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> 
> ...
> 
> > @@ -1117,10 +1133,6 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> >  	pxa3xx_flash_ids[1].name = NULL;
> >  	def = pxa3xx_flash_ids;
> >  KEEP_CONFIG:
> > -	chip->ecc.mode = NAND_ECC_HW;
> > -	chip->ecc.size = host->page_size;
> > -	chip->ecc.strength = 1;
> > -
> >  	if (info->reg_ndcr & NDCR_DWIDTH_M)
> >  		chip->options |= NAND_BUSWIDTH_16;
> >  
> > @@ -1130,8 +1142,35 @@ KEEP_CONFIG:
> >  		chip->bbt_options |= NAND_BBT_USE_FLASH;
> >  	}
> >  
> > +	/* Device detection must be done with ECC disabled */
> > +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
> > +		nand_writel(info, NDECCCTRL, 0x0);
> > +
> >  	if (nand_scan_ident(mtd, 1, def))
> >  		return -ENODEV;
> > +
> > +	/* 1-step ECC over the entire detected page size */
> > +	chip->ecc.mode = NAND_ECC_HW;
> > +	chip->ecc.size = mtd->writesize;
> 
> Does the ECC really only work in one step? IOW, do you only correct
> 1-bit for the entire page? That is under-spec'd for most NAND (they need
> 1-bit/512-byte, or 4-bit/512-byte). This ecc.size should actually
> reflect the correction region (typically 512B or 1024B), and even if
> your buffer layout makes a step every 2KB (or 4KB or whatever), the ECC
> step size *should* be smaller than that.
> 
> Or maybe I'm wrong, and you're actually using a weak 4-bit correction
> over 2048 bytes.
> 

I must admit I'm a bit confused by this ECC step concept. Having
described the ECC engine in the cover-letter, what do you think
the right choice should be?

IMO, given the ECC engine works on the entire FIFO (actually it works
on the transfered chunk) it's a 1-step ECC.

On the other side, a multiple step ECC, i.e. chip->ecc.size != mtd->writesize
makes the NAND base calls the subpage() function and the driver crashes
horribly when using UBIFS.

I'm not sure why subpage should be called in that case, given we don't
support that.

> > +
> > +	/*
> > +	 * Armada370 variant supports BCH, which provides 4-bit strength
> > +	 * and needs to be supported in a special way.
> > +	 */
> > +	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370 &&
> 
> Might there be other variants eventually that support BCH? Perhaps you
> want to separate the property of "can use BCH" from "will use BCH"?
> 

Yeah, probably. And maybe setting the BCH from the DT? The problem here
is that because of the ECC choice being intimately related to the OOB
location, this means the ECC choice is intimately related to the bad
block markers.

IOW, the user can't really choose among ECC.

I guess this means the ECC choice is some sort of a hardware description
and rightfully belongs to the DT. Right?

> > +	    chip->ecc_strength_ds == 4) {
> 
> Do you use BCH-4 only for chips that require exactly 4-bit correction?
> Is there ever a need to "overclock" the ECC, and choose BCH-4 for chips
> that only require 1-bit correction? Can the bootloader ever make a
> choice different from yours here?
> 
> What about NAND that don't support the ecc_strength_ds field yet?
> Remember, this is only filled for ONFI NAND and a few NAND that are in
> the full-ID table.
> 
> > +	        chip->ecc.layout = &ecc_layout_4KB_bch4bit;
> 
> This seems to have an implicit page size assumption. In your case, it
> seems like this layout should be chosen based on the page size + OOB
> size, at least.
> 
> > +		chip->ecc.strength = chip->ecc_strength_ds;
> > +		info->ecc_bch = 1;
> > +	} else if (mtd->writesize <= 2048) {
> > +		/*
> > +		 * This is the default ECC Hamming 1-bit strength case,
> > +		 * which works for page sizes of 512 and 2048 bytes.
> > +		 * The ECC layout will be automatically configured.
> > +		 */
> > +		chip->ecc.strength = 1;
> > +	}
> 
> What about the 'else' case? What happens with >2KB page NAND on
> non-Armada370 systems? What happens if a NAND needs >4-bit correction?
> Perhaps you could include a warning/error? I don't know the flexibility
> of NAND types you'll find on an Armada board; maybe they're all
> ONFI-compliant?
> 

Yeah, this 'ifs' could be fixed to better support other cases.

I'll try to rework that.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
