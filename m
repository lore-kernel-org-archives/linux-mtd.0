Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDK0f-0002yR-8W
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 20:32:50 +0000
Received: by mail-ie0-f181.google.com with SMTP id to1so4966962ieb.12
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 12:32:28 -0800 (PST)
Date: Tue, 11 Feb 2014 12:32:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 4/5] mtd: nand: parse out the JEDEC compliant nand
Message-ID: <20140211203224.GJ18440@ld-irv-0074>
References: <1391839441-21006-1-git-send-email-b32955@freescale.com>
 <1391839441-21006-5-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1391839441-21006-5-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

Looks good, but I have a few comments, now that I've given the spec a
closer read.

On Sat, Feb 08, 2014 at 02:04:00PM +0800, Huang Shijie wrote:
> This patch adds the parsing code for the JEDEC compliant nand.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   86 ++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 86 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 47fdf17..eb9fb49 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3163,6 +3163,88 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  }
>  
>  /*
> + * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 otherwise.
> + */
> +static int nand_flash_detect_jedec(struct mtd_info *mtd, struct nand_chip *chip,
> +					int *busw)
> +{
> +	struct nand_jedec_params *p = &chip->jedec_params;
> +	struct jedec_ecc_info *ecc;
> +	int val;
> +	int i, j;
> +
> +	/* Try JEDEC for unknown chip or LP */
> +	chip->cmdfunc(mtd, NAND_CMD_READID, 0x40, -1);

Where did you get this READID column address? I may be misreading
something, but I don't even find this in the JESD230A spec.

> +	if (chip->read_byte(mtd) != 'J' || chip->read_byte(mtd) != 'E' ||
> +		chip->read_byte(mtd) != 'D' || chip->read_byte(mtd) != 'E' ||
> +		chip->read_byte(mtd) != 'C')
> +		return 0;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);

Same here. I don't actually find this column address in the spec. I
really hope this is specified somewhere.

Also, now that we may have non-zero address to NAND_CMD_PARAM, do we
need to make this adjustment so it can be used on x16 buswidth? Perhaps this diff?

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 84cca611c2fd..1b1ad3d25336 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -921,7 +921,7 @@ static inline bool nand_is_slc(struct nand_chip *chip)
  */
 static inline int nand_opcode_8bits(unsigned int command)
 {
-	return command == NAND_CMD_READID;
+	return command == NAND_CMD_READID || command == NAND_CMD_PARAM;
 }
 
 /* return the supported JEDEC features. */

> +	for (i = 0; i < 3; i++) {
> +		for (j = 0; j < sizeof(*p); j++)
> +			((uint8_t *)p)[j] = chip->read_byte(mtd);
> +
> +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) ==
> +				le16_to_cpu(p->crc))
> +			break;
> +	}
> +
> +	if (i == 3) {
> +		pr_err("Could not find valid JEDEC parameter page; aborting\n");
> +		return 0;
> +	}
> +
> +	/* Check version */
> +	val = le16_to_cpu(p->revision);
> +	if (val & (1 << 2))
> +		chip->jedec_version = 10;
> +	else if (val & (1 << 1))
> +		chip->jedec_version = 1; /* vendor specific version */

How did you determine that bit[1] means version 1 (or v0.1)? It's
unclear to me how to interpret the revision bitfield here, but it
appears that bit[1] is not really useful to us yet, unless we're using
vendor specific parameter page.

What do we do if we see bit[1] (vendor specific parameter page) but not
bit[2] (parameter page revision 1.0 / standard revision 1.0)? I'm
thinking that we should just ignore bit[1] entirely for now, and if the
flash is missing bit[2], then we can't support it.

> +
> +	if (!chip->jedec_version) {
> +		pr_info("unsupported JEDEC version: %d\n", val);
> +		return 0;
> +	}
> +
> +	sanitize_string(p->manufacturer, sizeof(p->manufacturer));
> +	sanitize_string(p->model, sizeof(p->model));
> +	if (!mtd->name)
> +		mtd->name = p->model;
> +
> +	mtd->writesize = le32_to_cpu(p->byte_per_page);
> +
> +	/* Please reference to the comment for nand_flash_detect_onfi. */
> +	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> +	mtd->erasesize *= mtd->writesize;
> +
> +	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> +
> +	/* Please reference to the comment for nand_flash_detect_onfi. */
> +	chip->chipsize = 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> +	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
> +	chip->bits_per_cell = p->bits_per_cell;
> +
> +	if (jedec_feature(chip) & JEDEC_FEATURE_16_BIT_BUS)
> +		*busw = NAND_BUSWIDTH_16;
> +	else
> +		*busw = 0;
> +
> +	/* ECC info */
> +	ecc = p->ecc_info;

ecc_info is an array, and we're only looking at the first entry. This
might be more clear:

	ecc = &p->ecc_info[0];

> +
> +	if (ecc->codeword_size) {

"The minimum value that shall be reported is 512 bytes (a value of 9)."

So how about this?

	if (ecc->codeword_size >= 9)

> +		chip->ecc_strength_ds = ecc->ecc_bits;
> +		chip->ecc_step_ds = 1 << ecc->codeword_size;
> +	} else {
> +		pr_debug("Invalid codeword size\n");
> +		return 0;

Do we really want to fail detection if we can't get the ECC parameters?
That's not what we do for ONFI, and we certainly don't do that for
extended ID decoding. Right now, ECC specifications are an optional
feature for autodetection, so I think this should be at most a
pr_warn(), but return successfully still. See the ONFI detection routine
for reference.

> +	}
> +
> +	return 1;
> +}
> +
> +/*
>   * nand_id_has_period - Check if an ID string has a given wraparound period
>   * @id_data: the ID string
>   * @arrlen: the length of the @id_data array
> @@ -3527,6 +3609,10 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  		/* Check is chip is ONFI compliant */
>  		if (nand_flash_detect_onfi(mtd, chip, &busw))
>  			goto ident_done;
> +
> +		/* Check if the chip is JEDEC compliant */
> +		if (nand_flash_detect_jedec(mtd, chip, &busw))
> +			goto ident_done;
>  	}
>  
>  	if (!type->name)

Brian
