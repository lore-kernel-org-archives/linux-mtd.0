Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8AZI-0005ya-7w
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2016 18:40:53 +0000
Date: Sat, 19 Nov 2016 19:40:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
Subject: Re: [PATCH v3 1/3] mtd: nand: Support controllers with custom page
Message-ID: <20161119194030.1bab7ac8@bbrezillon>
In-Reply-To: <582ADBC4.3000000@sigmadesigns.com>
References: <5829883A.8080307@sigmadesigns.com>
 <20161114111122.27804c4e@bbrezillon>
 <5829EDE7.1060300@sigmadesigns.com>
 <20161114183444.73074760@bbrezillon>
 <582ADBC4.3000000@sigmadesigns.com>
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

Hi Mark,

On Tue, 15 Nov 2016 10:56:20 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> If your controller already sends the required NAND commands when
> reading or writing a page, then the framework is not supposed to
> send READ0 and SEQIN/PAGEPROG respectively.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Applied the whole series.

Just a small request for your future contributions, can you please
group the patches of a specific version in the same thread instead of
making them answers to my previous reviews?

Thanks,

Boris

> ---
> v3:
> ecc->write_subpage handling
> don't use WARN_ON
> ---
>  drivers/mtd/nand/nand_base.c | 34 +++++++++++++++++++++++++++++++---
>  include/linux/mtd/nand.h     | 12 ++++++++++++
>  2 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 50cdf37cb8e4..e7034f3bcace 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1970,7 +1970,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  						 __func__, buf);
>  
>  read_retry:
> -			chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> +			if (nand_standard_page_accessors(&chip->ecc))
> +				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>  
>  			/*
>  			 * Now read the page into the buffer.  Absent an error,
> @@ -2658,7 +2659,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	else
>  		subpage = 0;
>  
> -	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +	if (nand_standard_page_accessors(&chip->ecc))
> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>  
>  	if (unlikely(raw))
>  		status = chip->ecc.write_page_raw(mtd, chip, buf,
> @@ -2681,7 +2683,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	if (!cached || !NAND_HAS_CACHEPROG(chip)) {
>  
> -		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +		if (nand_standard_page_accessors(&chip->ecc))
> +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>  		status = chip->waitfunc(mtd, chip);
>  		/*
>  		 * See if operation failed and additional status checks are
> @@ -4539,6 +4542,26 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
>  	return corr >= ds_corr && ecc->strength >= chip->ecc_strength_ds;
>  }
>  
> +static bool invalid_ecc_page_accessors(struct nand_chip *chip)
> +{
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (nand_standard_page_accessors(ecc))
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
> +		(NAND_HAS_SUBPAGE_WRITE(chip) && !ecc->write_subpage &&
> +		 ecc->hwctl && ecc->calculate));
> +}
> +
>  /**
>   * nand_scan_tail - [NAND Interface] Scan for the NAND device
>   * @mtd: MTD device structure
> @@ -4559,6 +4582,11 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		   !(chip->bbt_options & NAND_BBT_USE_FLASH)))
>  		return -EINVAL;
>  
> +	if (invalid_ecc_page_accessors(chip)) {
> +		pr_err("Invalid ECC page accessors setup\n");
> +		return -EINVAL;
> +	}
> +
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
>  		nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
>  				+ mtd->oobsize * 3, GFP_KERNEL);
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 06d0c9d740f7..c5f3a012ae62 100644
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
> +#define NAND_HAS_SUBPAGE_WRITE(chip) !((chip)->options & NAND_NO_SUBPAGE_WRITE)
>  
>  /* Non chip related options */
>  /* This option skips the bbt scan during initialization. */
> @@ -568,6 +575,11 @@ struct nand_ecc_ctrl {
>  			int page);
>  };
>  
> +static inline int nand_standard_page_accessors(struct nand_ecc_ctrl *ecc)
> +{
> +	return !(ecc->options & NAND_ECC_CUSTOM_PAGE_ACCESS);
> +}
> +
>  /**
>   * struct nand_buffers - buffer structure for read/write
>   * @ecccalc:	buffer pointer for calculated ECC, size is oobsize.
