Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byuwH-0008SG-0z
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 06:10:23 +0000
Date: Tue, 25 Oct 2016 08:09:55 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: Re: [PATCH] mtd: nand: Fix data interface configuration logic
Message-ID: <20161025060955.4kn76hgilglhvehd@pengutronix.de>
References: <1477320380-11062-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477320380-11062-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 24, 2016 at 04:46:20PM +0200, Boris Brezillon wrote:
> When changing from one data interface setting to another, one has to
> ensure a specific sequence which is described in the ONFI spec.
> 
> One of these constraints is that the CE line has go high after a reset
> before a command can be sent with the new data interface setting, which
> is not guaranteed by the current implementation.
> 
> Rework the nand_reset() function and all the call sites to make sure the
> CE line is asserted and released when required.
> 
> Also make sure to actually apply the new data interface setting on the
> first die.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: d8e725dd8311 ("mtd: nand: automate NAND timings selection")

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sasha

> ---
>  drivers/mtd/nand/nand_base.c | 60 +++++++++++++++++++++++++++++++-------------
>  include/linux/mtd/nand.h     |  2 +-
>  2 files changed, 43 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index e5718e5ecf92..3bde96a3f7bf 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1095,10 +1095,11 @@ static void nand_release_data_interface(struct nand_chip *chip)
>  /**
>   * nand_reset - Reset and initialize a NAND device
>   * @chip: The NAND chip
> + * @chipnr: Internal die id
>   *
>   * Returns 0 for success or negative error code otherwise
>   */
> -int nand_reset(struct nand_chip *chip)
> +int nand_reset(struct nand_chip *chip, int chipnr)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	int ret;
> @@ -1107,9 +1108,17 @@ int nand_reset(struct nand_chip *chip)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * The CS line has to be released before we can apply the new NAND
> +	 * interface settings, hence this weird ->select_chip() dance.
> +	 */
> +	chip->select_chip(mtd, chipnr);
>  	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +	chip->select_chip(mtd, -1);
>  
> +	chip->select_chip(mtd, chipnr);
>  	ret = nand_setup_data_interface(chip);
> +	chip->select_chip(mtd, -1);
>  	if (ret)
>  		return ret;
>  
> @@ -1185,8 +1194,6 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	/* Shift to get chip number */
>  	chipnr = ofs >> chip->chip_shift;
>  
> -	chip->select_chip(mtd, chipnr);
> -
>  	/*
>  	 * Reset the chip.
>  	 * If we want to check the WP through READ STATUS and check the bit 7
> @@ -1194,7 +1201,9 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	 * some operation can also clear the bit 7 of status register
>  	 * eg. erase/program a locked block
>  	 */
> -	nand_reset(chip);
> +	nand_reset(chip, chipnr);
> +
> +	chip->select_chip(mtd, chipnr);
>  
>  	/* Check, if it is write protected */
>  	if (nand_check_wp(mtd)) {
> @@ -1244,8 +1253,6 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	/* Shift to get chip number */
>  	chipnr = ofs >> chip->chip_shift;
>  
> -	chip->select_chip(mtd, chipnr);
> -
>  	/*
>  	 * Reset the chip.
>  	 * If we want to check the WP through READ STATUS and check the bit 7
> @@ -1253,7 +1260,9 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	 * some operation can also clear the bit 7 of status register
>  	 * eg. erase/program a locked block
>  	 */
> -	nand_reset(chip);
> +	nand_reset(chip, chipnr);
> +
> +	chip->select_chip(mtd, chipnr);
>  
>  	/* Check, if it is write protected */
>  	if (nand_check_wp(mtd)) {
> @@ -2940,10 +2949,6 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
>  	}
>  
>  	chipnr = (int)(to >> chip->chip_shift);
> -	chip->select_chip(mtd, chipnr);
> -
> -	/* Shift to get page */
> -	page = (int)(to >> chip->page_shift);
>  
>  	/*
>  	 * Reset the chip. Some chips (like the Toshiba TC5832DC found in one
> @@ -2951,7 +2956,12 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
>  	 * if we don't do this. I have no clue why, but I seem to have 'fixed'
>  	 * it in the doc2000 driver in August 1999.  dwmw2.
>  	 */
> -	nand_reset(chip);
> +	nand_reset(chip, chipnr);
> +
> +	chip->select_chip(mtd, chipnr);
> +
> +	/* Shift to get page */
> +	page = (int)(to >> chip->page_shift);
>  
>  	/* Check, if it is write protected */
>  	if (nand_check_wp(mtd)) {
> @@ -3984,14 +3994,14 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  	int i, maf_idx;
>  	u8 id_data[8];
>  
> -	/* Select the device */
> -	chip->select_chip(mtd, 0);
> -
>  	/*
>  	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
>  	 * after power-up.
>  	 */
> -	nand_reset(chip);
> +	nand_reset(chip, 0);
> +
> +	/* Select the device */
> +	chip->select_chip(mtd, 0);
>  
>  	/* Send the command for reading device ID */
>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> @@ -4329,17 +4339,31 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  		return PTR_ERR(type);
>  	}
>  
> +	/* Initialize the ->data_interface field. */
>  	ret = nand_init_data_interface(chip);
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Setup the data interface correctly on the chip and controller side.
> +	 * This explicit call to nand_setup_data_interface() is only required
> +	 * for the first die, because nand_reset() has been called before
> +	 * ->data_interface and ->default_onfi_timing_mode were set.
> +	 * For the other dies, nand_reset() will automatically switch to the
> +	 * best mode for us.
> +	 */
> +	ret = nand_setup_data_interface(chip);
> +	if (ret)
> +		return ret;
> +
>  	chip->select_chip(mtd, -1);
>  
>  	/* Check for a chip array */
>  	for (i = 1; i < maxchips; i++) {
> -		chip->select_chip(mtd, i);
>  		/* See comment in nand_get_flash_type for reset */
> -		nand_reset(chip);
> +		nand_reset(chip, i);
> +
> +		chip->select_chip(mtd, i);
>  		/* Send the command for reading device ID */
>  		chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
>  		/* Read manufacturer and device IDs */
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index c5d3d5024fc8..d8905a229f34 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -1184,7 +1184,7 @@ int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
>  			   int page);
>  
>  /* Reset and initialize a NAND device */
> -int nand_reset(struct nand_chip *chip);
> +int nand_reset(struct nand_chip *chip, int chipnr);
>  
>  /* Free resources held by the NAND device */
>  void nand_cleanup(struct nand_chip *chip);
> -- 
> 2.7.4
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
