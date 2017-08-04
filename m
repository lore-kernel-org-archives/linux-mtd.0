Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddY1y-0004Oo-OT
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 08:32:27 +0000
Date: Fri, 4 Aug 2017 10:31:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: Fix various memory leaks in core
Message-ID: <20170804103153.2a0f7fd2@bbrezillon>
In-Reply-To: <1496398704-3559-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1496398704-3559-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Fri,  2 Jun 2017 12:18:24 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> The nand_scan_ident() function is not expected to allocate resources,
> and people are usually not calling nand_cleanup() if something fails
> between nand_scan_ident() and nand_scan_tail().
> 
> Move all functions that may allocate resource to the nand_scan_tail()
> path to prevent such resource leaks.

Applied.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 110 +++++++++++++++++++------------------------
>  1 file changed, 48 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d2332266b76c..fb5070c69060 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4026,7 +4026,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	const struct nand_manufacturer *manufacturer;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	int busw;
> -	int i, ret;
> +	int i;
>  	u8 *id_data = chip->id.data;
>  	u8 maf_id, dev_id;
>  
> @@ -4167,10 +4167,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
>  		chip->cmdfunc = nand_command_lp;
>  
> -	ret = nand_manufacturer_init(chip);
> -	if (ret)
> -		return ret;
> -
>  	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
>  		maf_id, dev_id);
>  
> @@ -4378,23 +4374,6 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  		return ret;
>  	}
>  
> -	/* Initialize the ->data_interface field. */
> -	ret = nand_init_data_interface(chip);
> -	if (ret)
> -		goto err_nand_init;
> -
> -	/*
> -	 * Setup the data interface correctly on the chip and controller side.
> -	 * This explicit call to nand_setup_data_interface() is only required
> -	 * for the first die, because nand_reset() has been called before
> -	 * ->data_interface and ->default_onfi_timing_mode were set.
> -	 * For the other dies, nand_reset() will automatically switch to the
> -	 * best mode for us.
> -	 */
> -	ret = nand_setup_data_interface(chip, 0);
> -	if (ret)
> -		goto err_nand_init;
> -
>  	nand_maf_id = chip->id.data[0];
>  	nand_dev_id = chip->id.data[1];
>  
> @@ -4424,12 +4403,6 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  	mtd->size = i * chip->chipsize;
>  
>  	return 0;
> -
> -err_nand_init:
> -	/* Free manufacturer priv data. */
> -	nand_manufacturer_cleanup(chip);
> -
> -	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_ident);
>  
> @@ -4596,55 +4569,52 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	struct nand_buffers *nbuf = NULL;
> -	int ret;
> +	int ret, i;
>  
>  	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
>  	if (WARN_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
>  		   !(chip->bbt_options & NAND_BBT_USE_FLASH))) {
> -		ret = -EINVAL;
> -		goto err_ident;
> +		return -EINVAL;
>  	}
>  
>  	if (invalid_ecc_page_accessors(chip)) {
>  		pr_err("Invalid ECC page accessors setup\n");
> -		ret = -EINVAL;
> -		goto err_ident;
> +		return -EINVAL;
>  	}
>  
>  	if (!(chip->options & NAND_OWN_BUFFERS)) {
>  		nbuf = kzalloc(sizeof(*nbuf), GFP_KERNEL);
> -		if (!nbuf) {
> -			ret = -ENOMEM;
> -			goto err_ident;
> -		}
> +		if (!nbuf)
> +			return -ENOMEM;
>  
>  		nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
>  		if (!nbuf->ecccalc) {
>  			ret = -ENOMEM;
> -			goto err_free;
> +			goto err_free_nbuf;
>  		}
>  
>  		nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
>  		if (!nbuf->ecccode) {
>  			ret = -ENOMEM;
> -			goto err_free;
> +			goto err_free_nbuf;
>  		}
>  
>  		nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize,
>  					GFP_KERNEL);
>  		if (!nbuf->databuf) {
>  			ret = -ENOMEM;
> -			goto err_free;
> +			goto err_free_nbuf;
>  		}
>  
>  		chip->buffers = nbuf;
> -	} else {
> -		if (!chip->buffers) {
> -			ret = -ENOMEM;
> -			goto err_ident;
> -		}
> +	} else if (!chip->buffers) {
> +		return -ENOMEM;
>  	}
>  
> +	ret = nand_manufacturer_init(chip);
> +	if (ret)
> +		goto err_free_nbuf;
> +
>  	/* Set the internal oob buffer location, just after the page data */
>  	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
>  
> @@ -4666,7 +4636,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			WARN(1, "No oob scheme defined for oobsize %d\n",
>  				mtd->oobsize);
>  			ret = -EINVAL;
> -			goto err_free;
> +			goto err_nand_manuf_cleanup;
>  		}
>  	}
>  
> @@ -4681,7 +4651,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		if (!ecc->calculate || !ecc->correct || !ecc->hwctl) {
>  			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
>  			ret = -EINVAL;
> -			goto err_free;
> +			goto err_nand_manuf_cleanup;
>  		}
>  		if (!ecc->read_page)
>  			ecc->read_page = nand_read_page_hwecc_oob_first;
> @@ -4713,7 +4683,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		     ecc->write_page == nand_write_page_hwecc)) {
>  			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
>  			ret = -EINVAL;
> -			goto err_free;
> +			goto err_nand_manuf_cleanup;
>  		}
>  		/* Use standard syndrome read/write page function? */
>  		if (!ecc->read_page)
> @@ -4733,7 +4703,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  			if (!ecc->strength) {
>  				WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
>  				ret = -EINVAL;
> -				goto err_free;
> +				goto err_nand_manuf_cleanup;
>  			}
>  			break;
>  		}
> @@ -4746,7 +4716,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		ret = nand_set_ecc_soft_ops(mtd);
>  		if (ret) {
>  			ret = -EINVAL;
> -			goto err_free;
> +			goto err_nand_manuf_cleanup;
>  		}
>  		break;
>  
> @@ -4754,7 +4724,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		if (!ecc->read_page || !ecc->write_page) {
>  			WARN(1, "No ECC functions supplied; on-die ECC not possible\n");
>  			ret = -EINVAL;
> -			goto err_free;
> +			goto err_nand_manuf_cleanup;
>  		}
>  		if (!ecc->read_oob)
>  			ecc->read_oob = nand_read_oob_std;
> @@ -4778,7 +4748,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	default:
>  		WARN(1, "Invalid NAND_ECC_MODE %d\n", ecc->mode);
>  		ret = -EINVAL;
> -		goto err_free;
> +		goto err_nand_manuf_cleanup;
>  	}
>  
>  	/* For many systems, the standard OOB write also works for raw */
> @@ -4799,13 +4769,13 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	if (ecc->steps * ecc->size != mtd->writesize) {
>  		WARN(1, "Invalid ECC parameters\n");
>  		ret = -EINVAL;
> -		goto err_free;
> +		goto err_nand_manuf_cleanup;
>  	}
>  	ecc->total = ecc->steps * ecc->bytes;
>  	if (ecc->total > mtd->oobsize) {
>  		WARN(1, "Total number of ECC bytes exceeded oobsize\n");
>  		ret = -EINVAL;
> -		goto err_free;
> +		goto err_nand_manuf_cleanup;
>  	}
>  
>  	/*
> @@ -4887,6 +4857,21 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	if (!mtd->bitflip_threshold)
>  		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
>  
> +	/* Initialize the ->data_interface field. */
> +	ret = nand_init_data_interface(chip);
> +	if (ret)
> +		goto err_nand_manuf_cleanup;
> +
> +	/* Enter fastest possible mode on all dies. */
> +	for (i = 0; i < chip->numchips; i++) {
> +		chip->select_chip(mtd, i);
> +		ret = nand_setup_data_interface(chip, i);
> +		chip->select_chip(mtd, -1);
> +
> +		if (ret)
> +			goto err_nand_data_iface_cleanup;
> +	}
> +
>  	/* Check, if we should skip the bad block table scan */
>  	if (chip->options & NAND_SKIP_BBTSCAN)
>  		return 0;
> @@ -4894,10 +4879,17 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/* Build bad block table */
>  	ret = chip->scan_bbt(mtd);
>  	if (ret)
> -		goto err_free;
> +		goto err_nand_data_iface_cleanup;
> +
>  	return 0;
>  
> -err_free:
> +err_nand_data_iface_cleanup:
> +	nand_release_data_interface(chip);
> +
> +err_nand_manuf_cleanup:
> +	nand_manufacturer_cleanup(chip);
> +
> +err_free_nbuf:
>  	if (nbuf) {
>  		kfree(nbuf->databuf);
>  		kfree(nbuf->ecccode);
> @@ -4905,12 +4897,6 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		kfree(nbuf);
>  	}
>  
> -err_ident:
> -	/* Clean up nand_scan_ident(). */
> -
> -	/* Free manufacturer priv data. */
> -	nand_manufacturer_cleanup(chip);
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_tail);
