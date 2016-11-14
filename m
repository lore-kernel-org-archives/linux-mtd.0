Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6EEx-000319-5x
 for linux-mtd@lists.infradead.org; Mon, 14 Nov 2016 10:11:52 +0000
Date: Mon, 14 Nov 2016 11:11:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
Subject: Re: [PATCH] mtd: nand: Support controllers with custom page accessors
Message-ID: <20161114111122.27804c4e@bbrezillon>
In-Reply-To: <5829883A.8080307@sigmadesigns.com>
References: <5829883A.8080307@sigmadesigns.com>
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

Hi Marc,

On Mon, 14 Nov 2016 10:47:38 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> If your controller already sends the required NAND commands when
> reading or writing a page, then the framework is not supposed to
> send READ0 and SEQIN/PAGEPROG respectively.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/mtd/nand/nand_base.c  | 31 ++++++++++++++++++++++++++++---
>  drivers/mtd/nand/tango_nand.c | 21 ++++++++++++---------
>  include/linux/mtd/nand.h      | 12 ++++++++++++
>  3 files changed, 52 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 50cdf37cb8e4..b8ea6b397c16 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1970,7 +1970,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  						 __func__, buf);
>  
>  read_retry:
> -			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +			if (nand_default_page_accessors(&chip->ecc))
> +				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>  
>  			/*
>  			 * Now read the page into the buffer.  Absent an error,
> @@ -2658,7 +2659,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	else
>  		subpage = 0;
>  
> -	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +	if (nand_default_page_accessors(&chip->ecc))
> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>  
>  	if (unlikely(raw))
>  		status = chip->ecc.write_page_raw(mtd, chip, buf,
> @@ -2681,7 +2683,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	if (!cached || !NAND_HAS_CACHEPROG(chip)) {
>  
> -		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +		if (nand_default_page_accessors(&chip->ecc))
> +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>  		status = chip->waitfunc(mtd, chip);
>  		/*
>  		 * See if operation failed and additional status checks are
> @@ -4539,6 +4542,25 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
>  	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
>  }
>  
> +static bool invalid_ecc_page_accessors(struct nand_chip *chip)
> +{
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (nand_default_page_accessors(ecc))
> +		return false;
> +
> +	/*
> +	 * NAND_ECC_CUSTOM_PAGE_ACCESS flag is set, make sure the NAND
> +	 * controller driver implements all the page accessors because
> +	 * default helpers are not suitable when the core does not
> +	 * send the READ0/PAGEPROG commands.
> +	 */
> +	return (!ecc->read_page || !ecc->write_page ||
> +		!ecc->read_page_raw || !ecc->write_page_raw ||
> +		(NAND_HAS_SUBPAGE_READ(chip) && !ecc->read_subpage) ||
> +		(NAND_HAS_SUBPAGE_WRITE(chip) && !ecc->write_subpage));
> +}
> +
>  /**
>   * nand_scan_tail - [NAND Interface] Scan for the NAND device
>   * @mtd: MTD device structure
> @@ -4559,6 +4581,9 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		   !(chip->bbt_options & NAND_BBT_USE_FLASH)))
>  		return -EINVAL;
>  
> +	if (WARN_ON(invalid_ecc_page_accessors(chip)))
> +		return -EINVAL;
> +
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
>  		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
>  				+ mtd->oobsize * 3, GFP_KERNEL);
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index fd8cf414cb2b..7ed35348993e 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -343,7 +343,7 @@ static void aux_write(struct nand_chip *chip, const u8 **buf, int len, int *pos)
>   * buf = |      PKT_0      | ... |      PKT_N      |
>   *       +-----------------+-----+-----------------+
>   */
> -static int raw_read(struct nand_chip *chip, u8 *buf, u8 *oob)
> +static void raw_read(struct nand_chip *chip, u8 *buf, u8 *oob)

This change is completely unrelated to the custom page accessors patch.
Please separate the function prototype changes in a separate patch.

>  {
>  	u8 *oob_orig = oob;
>  	const int page_size = chip->mtd.writesize;
> @@ -367,11 +367,9 @@ static int raw_read(struct nand_chip *chip, u8 *buf, u8 *oob)
>  	aux_read(chip, &oob_orig, BBM_SIZE, &pos);
>  	aux_read(chip, &buf, pkt_size - rem, &pos);
>  	aux_read(chip, &oob, ecc_size, &pos);
> -
> -	return 0;
>  }
>  
> -static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
> +static void raw_write(struct nand_chip *chip, const u8 *buf, const u8 *
>  {
>  	const u8 *oob_orig = oob;
>  	const int page_size = chip->mtd.writesize;
> @@ -395,27 +393,31 @@ static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
>  	aux_write(chip, &oob_orig, BBM_SIZE, &pos);
>  	aux_write(chip, &buf, pkt_size - rem, &pos);
>  	aux_write(chip, &oob, ecc_size, &pos);
> -
> -	return 0;
>  }
>  
>  static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  			       u8 *buf, int oob_required, int page)
>  {
> -	return raw_read(chip, buf, chip->oob_poi);
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +	raw_read(chip, buf, chip->oob_poi);
> +	return 0;
>  }
>  
>  static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  				const u8 *buf, int oob_required, int page)
>  {
> -	return raw_write(chip, buf, chip->oob_poi);
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
> +	raw_write(chip, buf, chip->oob_poi);
> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	return 0;
>  }
>  
>  static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>  			  int page)
>  {
>  	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> -	return raw_read(chip, NULL, chip->oob_poi);
> +	raw_read(chip, NULL, chip->oob_poi);
> +	return 0;
>  }
>  
>  static int tango_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
> @@ -553,6 +555,7 @@ static int chip_init(struct device *dev, struct device_node *np)
>  	ecc->write_page = tango_write_page;
>  	ecc->read_oob = tango_read_oob;
>  	ecc->write_oob = tango_write_oob;
> +	ecc->options = NAND_ECC_CUSTOM_PAGE_ACCESS;
>  
>  	err = nand_scan_tail(mtd);
>  	if (err)
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 06d0c9d740f7..a95a27a30005 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -142,6 +142,12 @@ enum nand_ecc_algo {
>   */
>  #define NAND_ECC_GENERIC_ERASED_CHECK	BIT(0)
>  #define NAND_ECC_MAXIMIZE		BIT(1)
> +/*
> + * If your controller already sends the required NAND commands when
> + * reading or writing a page, then the framework is not supposed to
> + * send READ0 and SEQIN/PAGEPROG respectively.
> + */
> +#define NAND_ECC_CUSTOM_PAGE_ACCESS	BIT(2)
>  
>  /* Bit mask for flags passed to do_nand_read_ecc */
>  #define NAND_GET_DEVICE		0x80
> @@ -186,6 +192,7 @@ enum nand_ecc_algo {
>  /* Macros to identify the above */
>  #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
>  #define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
> +#define NAND_HAS_SUBPAGE_WRITE(chip) !(chip->options & NAND_NO_SUBPAGE_WRITE)

					  (chip)->options

Just in case the chip parameter is something like that &x->chip.

>  
>  /* Non chip related options */
>  /* This option skips the bbt scan during initialization. */
> @@ -568,6 +575,11 @@ struct nand_ecc_ctrl {
>  			int page);
>  };
>  
> +static inline int nand_default_page_accessors(struct nand_ecc_ctrl *ecc)

Not sure the term default is correct here: some drivers implement
their own ->read/write_page() methods, but expect the core to send the
READ/PROG commands.
How about renaming it nand_standard_page_accessors()?

> +{
> +	return !(ecc->options & NAND_ECC_CUSTOM_PAGE_ACCESS);
> +}
> +
>  /**
>   * struct nand_buffers - buffer structure for read/write
>   * @ecccalc:	buffer pointer for calculated ECC, size is oobsize.
