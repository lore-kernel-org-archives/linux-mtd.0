Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqJl0-0001oP-FR
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 09:37:35 +0000
Received: by mail-wg0-f51.google.com with SMTP id b13so4677483wgh.30
 for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2013 01:37:11 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v1] mtd: gpmi: Deal with bitflips in erased regions regions
References: <1386619091-23992-1-git-send-email-eliedebrauwer@gmail.com>
 <1386619091-23992-2-git-send-email-eliedebrauwer@gmail.com>
Date: Tue, 10 Dec 2013 10:37:08 +0100
In-Reply-To: <1386619091-23992-2-git-send-email-eliedebrauwer@gmail.com> (Elie
 De Brauwer's message of "Mon, 9 Dec 2013 20:58:11 +0100")
Message-ID: <87y53t59ob.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: b32955@freescale.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Elie" == Elie De Brauwer <eliedebrauwer@gmail.com> writes:

 > The BCH block typically used with a i.MX28 and GPMI block is only
 > able to correct bitflips on data actually streamed through the block.
 > When erasing a block the data does not stream through the BCH block
 > and therefore not ECC data is written to the NAND chip. This causes

s/not/no/

 > gpmi_ecc_read_page to return failure as soon as a single non-1-bit is
 > found in an erased page. Typically causing problems at higher levels
 > (ubifs corrupted empty space warnings).

 > This patch configures the BCH block to mark a block as 'erased' if
 > no more than ecc_strength bitflips are found. The result is that
 > erased blocks are doublechecked by software for bitflips and that
 > bitflips are corrected and reported, allowing the upper layers to
 > take proper actions.

 > Signed-off-by: Elie De Brauwer <eliedebrauwer@gmail.com>

Looks good otherwise.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

 > ---
 >  drivers/mtd/nand/gpmi-nand/bch-regs.h  |    1 +
 >  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |    7 ++++++
 >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   40 +++++++++++++++++++++++++++++---
 >  3 files changed, 45 insertions(+), 3 deletions(-)

 > diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpmi-nand/bch-regs.h
 > index 588f537..b2104de 100644
 > --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
 > +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
 > @@ -31,6 +31,7 @@
 
 >  #define HW_BCH_STATUS0				0x00000010
 >  #define HW_BCH_MODE				0x00000020
 > +#define BM_BCH_MODE_ERASE_THRESHOLD_MASK	0xff
 >  #define HW_BCH_ENCODEPTR			0x00000030
 >  #define HW_BCH_DATAPTR				0x00000040
 >  #define HW_BCH_METAPTR				0x00000050
 > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
 > index aaced29..4236739 100644
 > --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
 > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
 > @@ -286,6 +286,13 @@ int bch_set_geometry(struct gpmi_nand_data *this)
 >  			| BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(block_size, this),
 r-> bch_regs + HW_BCH_FLASH0LAYOUT1);
 
 > +	/*
 > +	 * Set the tolerance for bitflips when reading erased blocks
 > +	 * equal to the ecc_strength.
 > +	 */
 > +	writel(bch_geo->ecc_strength & BM_BCH_MODE_ERASE_THRESHOLD_MASK,
 > +		r->bch_regs + HW_BCH_MODE);
 > +
 >  	/* Set *all* chip selects to use layout 0. */
 >  	writel(0, r->bch_regs + HW_BCH_LAYOUTSELECT);
 
 > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
 > index dabbc14..766261f 100644
 > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
 > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
 > @@ -1012,6 +1012,30 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 >  	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
 >  }
 
 > +/*
 > + * Count the number of 0 bits in a supposed to be
 > + * erased region and correct them. Return the number
 > + * of bitflips or zero when the region was correct.
 > + */
 > +static unsigned int erased_sector_bitflips(unsigned char *data,
 > +					unsigned int chunk,
 > +					struct bch_geometry *geo)
 > +{
 > +	unsigned int flip_bits = 0;
 > +	int i;
 > +	int base = geo->ecc_chunk_size * chunk;
 > +
 > +	/* Count bitflips */
 > +	for (i = 0; i < geo->ecc_chunk_size; i++)
 > +		flip_bits += hweight8(~data[base + i]);
 > +
 > +	/* Correct bitflips by 0xFF'ing this chunk. */
 > +	if (flip_bits)
 > +		memset(&data[base], 0xFF, geo->ecc_chunk_size);
 > +
 > +	return flip_bits;
 > +}
 > +
 >  static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 >  				uint8_t *buf, int oob_required, int page)
 >  {
 > @@ -1023,6 +1047,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 >  	dma_addr_t    auxiliary_phys;
 >  	unsigned int  i;
 >  	unsigned char *status;
 > +	unsigned int  flips;
 >  	unsigned int  max_bitflips = 0;
 >  	int           ret;
 
 > @@ -1057,15 +1082,24 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 >  	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
 
 >  	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
 > -		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
 > +		if (*status == STATUS_GOOD)
 >  			continue;
 
 >  		if (*status == STATUS_UNCORRECTABLE) {
 mtd-> ecc_stats.failed++;
 >  			continue;
 >  		}
 > -		mtd->ecc_stats.corrected += *status;
 > -		max_bitflips = max_t(unsigned int, max_bitflips, *status);
 > +
 > +		if (*status == STATUS_ERASED)
 > +			/* Erased block, check/correct bitflips manually. */
 > +			flips = erased_sector_bitflips(payload_virt, i,
 > +							nfc_geo);
 > +		else
 > +			/* BCH block corrected some errors for us. */
 > +			flips = *status;
 > +
 > +		mtd->ecc_stats.corrected += flips;
 > +		max_bitflips = max_t(unsigned int, max_bitflips, flips);
 >  	}
 
 >  	if (oob_required) {
 > -- 
 > 1.7.10.4


 > ______________________________________________________
 > Linux MTD discussion mailing list
 > http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Bye, Peter Korsgaard
