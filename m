Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4rI9-0002WN-VL
 for linux-mtd@lists.infradead.org; Thu, 10 Nov 2016 15:29:32 +0000
Date: Thu, 10 Nov 2016 16:29:12 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
Subject: Re: [RFC v2] Special handling for NAND_CMD_PAGEPROG and NAND_CMD_READ0
Message-ID: <20161110162912.19c7022d@bbrezillon>
In-Reply-To: <58248886.9080906@sigmadesigns.com>
References: <58236370.1050105@sigmadesigns.com>
 <20161109194903.1c4ee5a3@bbrezillon>
 <58248886.9080906@sigmadesigns.com>
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

On Thu, 10 Nov 2016 15:47:34 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> Sample code to generate some discussion around having the framework
> *not* send I/O commands for read_page and write_page, when it is
> dealing with "high-level" NFCs that already send the commands
> themselves.
> ---
> diff from v1 to v2:
> - handle NAND_CMD_SEQIN as well
> - implement check_page_access_callbacks
> 
> If this RFC is an acceptable state, we can pick an appropriate
> name for the option, and I'll make a formal submission.
> ---
>  drivers/mtd/nand/nand_base.c  | 27 ++++++++++++++++++++++++---
>  drivers/mtd/nand/tango_nand.c |  7 ++++++-
>  include/linux/mtd/nand.h      |  8 ++++++++
>  3 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 50cdf37cb8e4..f42f79d8d0c4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1970,7 +1970,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  						 __func__, buf);
>  
>  read_retry:
> -			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +			if (!(chip->options & NAND_FOO))
> +				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>  
>  			/*
>  			 * Now read the page into the buffer.  Absent an error,
> @@ -2658,7 +2659,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	else
>  		subpage = 0;
>  
> -	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +	if (!(chip->options & NAND_FOO))
> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>  
>  	if (unlikely(raw))
>  		status = chip->ecc.write_page_raw(mtd, chip, buf,
> @@ -2681,7 +2683,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	if (!cached || !NAND_HAS_CACHEPROG(chip)) {
>  
> -		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +		if (!(chip->options & NAND_FOO))
> +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>  		status = chip->waitfunc(mtd, chip);
>  		/*
>  		 * See if operation failed and additional status checks are
> @@ -4539,6 +4542,21 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
>  	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
>  }
>  
> +static int check_page_access_callbacks(struct nand_chip *chip)

check_*ecc*_page_accessors() ?

> +{
> +	int err = 0;
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (chip->options & NAND_FOO) {
> +		err |= !ecc->read_page || !ecc->write_page;
> +		err |= !ecc->read_page_raw || !ecc->write_page_raw;
> +		err |= !ecc->read_subpage && NAND_HAS_SUBPAGE_READ(chip);
> +		err |= !ecc->write_subpage && NAND_HAS_SUBPAGE_WRITE(chip);
> +	}

Please return a real error code:

	if (err)
		return -EINVAL;

	return 0;

I think I'd prefer something more straightforward (but slightly longer):

	if (!(chip->options & NAND_FOO))
		return 0;

	/*
	 * NAND_FOO flag is set, make sure the NAND controller
	 * driver implements all the page accessors because
	 * default helpers are not suitable when the core does
	 * not send the READ0/PAGEPROG commands.
	 */
	if (!ecc->read_page || !ecc->write_page ||
	    !ecc->read_page_raw || !ecc->write_page_raw ||
	    (NAND_HAS_SUBPAGE_READ(chip) && !ecc->read_subpage) ||
	    (NAND_HAS_SUBPAGE_WRITE(chip) && !ecc->write_subpage))
		return -EINVAL;

	return 0;

> +	return err;
> +}
> +
>  /**
>   * nand_scan_tail - [NAND Interface] Scan for the NAND device
>   * @mtd: MTD device structure
> @@ -4559,6 +4577,9 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		   !(chip->bbt_options & NAND_BBT_USE_FLASH)))
>  		return -EINVAL;
>  
> +	if (WARN_ON(check_page_access_callbacks(chip)))
> +		return -EINVAL;
> +
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
>  		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
>  				+ mtd->oobsize * 3, GFP_KERNEL);
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index 74e39a92771c..2c9c0cac8f49 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -401,13 +401,17 @@ static int raw_write(struct nand_chip *chip, const u8 *buf, const u8 *oob)
>  static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  		uint8_t *buf, int oob_required, int page)
>  {
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
>  	return raw_read(chip, buf, chip->oob_poi);
>  }
>  
>  static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  		const uint8_t *buf, int oob_required, int page)
>  {
> -	return raw_write(chip, buf, chip->oob_poi);
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
> +	raw_write(chip, buf, chip->oob_poi);
> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	return 0;
>  }
>  
>  static int tango_read_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
> @@ -527,6 +531,7 @@ static int chip_init(struct device *dev, struct device_node *np)
>  	chip->setup_data_interface = tango_set_timings;
>  	chip->options = NAND_USE_BOUNCE_BUFFER
>  		| NAND_NO_SUBPAGE_WRITE
> +		| NAND_FOO

This is an ECC engine related flag, as such it should be set in
ecc->options and defined next to NAND_ECC_GENERIC_ERASED_CHECK and
NAND_ECC_MAXIMIZE.

>  		| NAND_WAIT_TCCS;
>  	chip->controller = &nfc->hw;
>  	tchip->base = nfc->pbus_base + (cs * 256);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 06d0c9d740f7..6999196d04f3 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -186,6 +186,7 @@ enum nand_ecc_algo {
>  /* Macros to identify the above */
>  #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
>  #define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
> +#define NAND_HAS_SUBPAGE_WRITE(chip) (~chip->options & NAND_NO_SUBPAGE_WRITE)
>  
>  /* Non chip related options */
>  /* This option skips the bbt scan during initialization. */
> @@ -220,6 +221,13 @@ enum nand_ecc_algo {
>   */
>  #define NAND_WAIT_TCCS		0x00200000
>  
> +/*
> + * Controller sends NAND_CMD_PAGEPROG (write_page) and NAND_CMD_READ0 (read_page)
> + * therefore the framework should not send these commands.
> + * TODO: find a real name. Write a better description.
> + */
> +#define NAND_FOO		0x00400000
> +

Okay, we need to find a real name for this flag, otherwise, it looks
good to me.

Regarding the name, I have the following suggestions:

NAND_ECC_SKIP_READ_PROG_CMDS
NAND_ECC_DELEGATE_READ_PROG_CMDS
NAND_ECC_DELEGATE_PAGE_ACCESS
NAND_ECC_CUSTOM_PAGE_ACCESS


>  /* Options set by nand scan */
>  /* Nand scan has allocated controller struct */
>  #define NAND_CONTROLLER_ALLOC	0x80000000
