Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAy81-0002ZS-J3
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 12:32:39 +0000
Date: Wed, 17 May 2017 14:32:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: [PATCH] fsl_ifc_nand: fix handing of bit flips in erased nand
Message-ID: <20170517143211.205ff5de@bbrezillon>
In-Reply-To: <20170517122224.GB583@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd> <20170421105107.GA7259@amd>
 <20170517122224.GB583@amd>
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

On Wed, 17 May 2017 14:22:24 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> If we see unrecoverable ECC error, we need to count number of bitflips
> from all-ones and report correctable/uncorrectable according to
> that. Otherwise we report ECC failed on erased flash with single bit error.
> 
> Signed-off-by: Pavel Machek <pavel@denx.de>
> 
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
> index d1570f5..1c66696 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -171,34 +171,6 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
>  		ifc_nand_ctrl->index += mtd->writesize;
>  }
>  
> -static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
> -{
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
> -	u8 __iomem *addr = priv->vbase + bufnum * (mtd->writesize * 2);
> -	u32 __iomem *mainarea = (u32 __iomem *)addr;
> -	u8 __iomem *oob = addr + mtd->writesize;
> -	struct mtd_oob_region oobregion = { };
> -	int i, section = 0;
> -
> -	for (i = 0; i < mtd->writesize / 4; i++) {
> -		if (__raw_readl(&mainarea[i]) != 0xffffffff)
> -			return 0;
> -	}
> -
> -	mtd_ooblayout_ecc(mtd, section++, &oobregion);
> -	while (oobregion.length) {
> -		for (i = 0; i < oobregion.length; i++) {
> -			if (__raw_readb(&oob[oobregion.offset + i]) != 0xff)
> -				return 0;
> -		}
> -
> -		mtd_ooblayout_ecc(mtd, section++, &oobregion);
> -	}
> -
> -	return 1;
> -}
> -
>  /* returns nonzero if entire page is blank */
>  static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
>  			  u32 *eccstat, unsigned int bufnum)
> @@ -274,16 +246,13 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
>  			if (errors == 15) {
>  				/*
>  				 * Uncorrectable error.
> -				 * OK only if the whole page is blank.
> +				 * We'll check for blank pages later.
>  				 *
>  				 * We disable ECCER reporting due to...
>  				 * erratum IFC-A002770 -- so report it now if we
>  				 * see an uncorrectable error in ECCSTAT.
>  				 */
> -				if (!is_blank(mtd, bufnum))
> -					ctrl->nand_stat |=
> -						IFC_NAND_EVTER_STAT_ECCER;
> -				break;
> +				ctrl->nand_stat |= IFC_NAND_EVTER_STAT_ECCER;
>  			}
>  
>  			mtd->ecc_stats.corrected += errors;
> @@ -678,6 +648,41 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct nand_chip *chip)
>  	return nand_fsr | NAND_STATUS_WP;
>  }
>  
> +/*
> + * The controller does not check for bitflips in erased pages,
> + * therefore software must check instead.
> + */
> +static int check_erased_page(struct nand_chip *chip, u8 *buf)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	u8 *ecc = chip->oob_poi;
> +	const int ecc_size = chip->ecc.bytes;
> +	const int pkt_size = chip->ecc.size;
> +	int i, res, bitflips = 0;
> +	struct mtd_oob_region oobregion = { };
> +
> +	mtd_ooblayout_ecc(mtd, 0, &oobregion);
> +	ecc += oobregion.offset;
> +
> +	for (i = 0; i < chip->ecc.steps; ++i) {
> +		res = nand_check_erased_ecc_chunk(buf, pkt_size, ecc, ecc_size,
> +						  NULL, 0,
> +						  chip->ecc.strength);
> +		if (res < 0)
> +			mtd->ecc_stats.failed++;
> +		else
> +			mtd->ecc_stats.corrected += res;
> +
> +		bitflips = max(res, bitflips);
> +		buf += pkt_size;
> +		ecc += ecc_size;
> +	}
> +
> +	mtd_ooblayout_ecc(mtd, 1, &oobregion);

Why is this needed?

> +
> +	return bitflips;
> +}
> +
>  static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			     uint8_t *buf, int oob_required, int page)
>  {
> @@ -689,11 +695,19 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (oob_required)
>  		fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
>  
> -	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER)
> -		dev_err(priv->dev, "NAND Flash ECC Uncorrectable Error\n");
> -
>  	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC)
>  		mtd->ecc_stats.failed++;
> +
> +	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
> +		int res;
> +
> +		if (!oob_required)
> +			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +
> +		res = check_erased_page(chip, buf);
> +		return res;
> +	}
> +
>  
>  	return nctrl->max_bitflips;
>  }
> @@ -904,6 +922,21 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>  		chip->ecc.algo = NAND_ECC_HAMMING;
>  	}
>  
> +	{
> +		struct mtd_oob_region oobregion = { };
> +
> +		mtd_ooblayout_ecc(mtd, 0, &oobregion);
> +		if (!oobregion.length) {
> +			dev_err(priv->dev, "No ECC in oobregion?\n");
> +			return -EINVAL;
> +		}
> +		mtd_ooblayout_ecc(mtd, 1, &oobregion);
> +		if (oobregion.length) {
> +			dev_err(priv->dev, "Extra data in oobregion?\n");
> +			return -EINVAL;
> +		}
> +	}

This clearly doesn't belong in this patch. And if you really want to
check that, please create a separate function instead of defining a
non-conditional code block inside fsl_ifc_chip_init().

> +
>  	if (ctrl->version == FSL_IFC_VERSION_1_1_0)
>  		fsl_ifc_sram_init(priv);
>  
> 
> 
> 
