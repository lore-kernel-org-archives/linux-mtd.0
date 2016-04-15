Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqyVq-0005Ad-Rj
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 07:50:00 +0000
Date: Fri, 15 Apr 2016 09:49:34 +0200
From: Markus Pargmann <mpa@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Stefan Christ <s.christ@phytec.de>, han.xu@nxp.com,
 eliedebrauwer@gmail.com, linux-mtd@lists.infradead.org, shijie8@gmail.com
Subject: Re: [PATCH] mtd: gpmi: Deal with bitflips in erased regions
Message-ID: <20160415074934.GA26302@pengutronix.de>
References: <1458030937-4245-1-git-send-email-s.christ@phytec.de>
 <20160411135446.1f8401e1@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160411135446.1f8401e1@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Apr 11, 2016 at 01:54:46PM +0200, Boris Brezillon wrote:
> Hi Stefan,
> 
> Sorry for the late reply.
> 
> On Tue, 15 Mar 2016 09:35:37 +0100
> Stefan Christ <s.christ@phytec.de> wrote:
> 
> > From: Elie De Brauwer <eliedebrauwer@gmail.com>
> > 
> > The BCH block typically used with a GPMI block on an i.MX28/i.MX6 is only
> > able to correct bitflips on data actually streamed through the block.
> > When erasing a block the data does not stream through the BCH block
> > and therefore no ECC data is written to the NAND chip. This causes
> > gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
> > found in an erased page. Typically causing problems at higher levels
> > (ubifs corrupted empty space warnings). This problem was also observed
> > when using SLC NAND devices.
> > 
> > This patch configures the BCH block to mark a block as 'erased' if
> > not too much bitflips are found (by setting the erase threshold). A
> > consequence of this is that whenever an erased page is read, the
> > number of bitflips will be counted and corrected in software,
> > allowing the upper layers to take proper actions.
> > 
> > Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>
> > Acked-by: Peter Korsgaard <peter@korsgaard.com>
> > Acked-by: Huang Shijie <b32955@freescale.com>
> > ---
> > Hi,
> > 
> > I'm reposting this patch, because it's still not in the mainline kernel tree.
> > It was taken from
> > 
> >     http://lists.infradead.org/pipermail/linux-mtd/2014-January/051357.html
> >     [PATCH v7] mtd: gpmi: Deal with bitflips in erased regions
> > 
> > The patch fixes the UBI corrupted empty space problem:
> > 
> >     UBIFS error (pid 74): ubifs_scan: corrupt empty space at LEB 3059:72260
> >     UBIFS error (pid 74): ubifs_scanned_corruption: corruption at LEB 3059:72260
> >     UBIFS error (pid 74): ubifs_scanned_corruption: first 8192 bytes from LEB 3059:72260
> >     UBIFS error (pid 74): ubifs_scan: LEB 3059 scanning failed
> > 
> > which occurs in real systems sometimes.
> > 
> > I've tested the patch.  You can add my
> > 
> >     Tested-by: Stefan Christ <s.christ@phytec.de>
> > 
> > Mit freundlichen Grüßen / Kind regards,
> >         Stefan Christ
> > 
> > ---
> >  drivers/mtd/nand/gpmi-nand/bch-regs.h  |  1 +
> >  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  9 +++++++
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 43 +++++++++++++++++++++++++++++++---
> >  3 files changed, 50 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> > index 05bb91f..88cc89d 100644
> > --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> > +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> > @@ -31,6 +31,7 @@
> >  
> >  #define HW_BCH_STATUS0				0x00000010
> >  #define HW_BCH_MODE				0x00000020
> > +#define BM_BCH_MODE_ERASE_THRESHOLD_MASK	0xff
> >  #define HW_BCH_ENCODEPTR			0x00000030
> >  #define HW_BCH_DATAPTR				0x00000040
> >  #define HW_BCH_METAPTR				0x00000050
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > index 0f68a99..a724dcb 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> > @@ -256,6 +256,7 @@ int bch_set_geometry(struct gpmi_nand_data *this)
> >  	unsigned int ecc_strength;
> >  	unsigned int page_size;
> >  	unsigned int gf_len;
> > +	unsigned int erase_threshold;
> >  	int ret;
> >  
> >  	if (common_nfc_set_geometry(this))
> > @@ -298,6 +299,14 @@ int bch_set_geometry(struct gpmi_nand_data *this)
> >  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
> >  			r->bch_regs + HW_BCH_FLASH0LAYOUT1);
> >  
> > +	/* Set the tolerance for bitflips when reading erased blocks. */
> > +	erase_threshold = gf_len / 2;
> > +	if (erase_threshold > bch_geo->ecc_strength)
> > +		erase_threshold = bch_geo->ecc_strength;
> 
> Can we make it consistent with other drivers and always use ecc_strength
> instead of gf_len / 2?
> 
> > +
> > +	writel(erase_threshold & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
> > +		r->bch_regs + HW_BCH_MODE);
> > +
> >  	/* Set *all* chip selects to use layout 0. */
> >  	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
> >  
> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > index 235ddcb..ba852e8 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -991,6 +991,30 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
> >  	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
> >  }
> >  
> > +/*
> > + * Count the number of 0 bits in a supposed to be
> > + * erased region and correct them. Return the number
> > + * of bitflips or zero when the region was correct.
> > + */
> > +static unsigned int erased_sector_bitflips(unsigned char *data,
> > +					unsigned int chunk,
> > +					struct bch_geometry *geo)
> > +{
> > +	unsigned int flip_bits = 0;
> > +	int i;
> > +	int base = geo->ecc_chunk_size * chunk;
> > +
> > +	/* Count bitflips */
> > +	for (i = 0; i < geo->ecc_chunk_size; i++)
> > +		flip_bits += hweight8(~data[base + i]);
> 
> Hm, the number of bitflips in this case is not always correct: you're
> only counting bitflips in the data section and are completely ignoring
> ECC bytes.
> 
> If you don't have direct access to ECC bytes, you should read them and
> count the number of bitflips in there too.

This is the same approach I mentioned in my patch
"[PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages".

But there were some comments about the performance hit with reading
erased pages.

Best Regards,

Markus

> 
> > +
> > +	/* Correct bitflips by 0xFF'ing this chunk. */
> > +	if (flip_bits)
> > +		memset(&data[base], 0xFF, geo->ecc_chunk_size);
> > +
> > +	return flip_bits;
> > +}
> > +
> 
> Best Regards,
> 
> Boris
> 
> -- 
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
