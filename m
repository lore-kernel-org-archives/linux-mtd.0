Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d1YwQ-0007Hq-CJ
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 13:49:44 +0000
Date: Fri, 21 Apr 2017 15:49:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Dipen.Dudhat@freescale.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170421154903.2782cd06@bbrezillon>
In-Reply-To: <20170421133721.GA15332@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
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

On Fri, 21 Apr 2017 15:37:21 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > (Added driver author to the cc list, maybe he can help).  
> 
> > > > UBIFS complains:
> > > > 
> > > > UBIFS error (pid 931): ubifs_scan: corrupt empty space at LEB 282:252630
> > > > UBIFS error (pid 931): ubifs_scanned_corruption: corruption at LEB 282:252630
> > > > UBIFS error (pid 931): ubifs_scanned_corruption: first 1322 bytes from LEB 282:252630
> > > > UBIFS error (pid 931): ubifs_scan: LEB 282 scanning failed  
> ...
> > > > is_blank() checks for all 0xff's, so single-bit 0xfe in the data will
> > > > result in_blank() == 0 and uncorrectable error being signaled.
> > > > 
> > > > Should the driver be modified somehow?  
> > > 
> > > Yep, nand_check_erased_ecc_chunk() [1] is here to help you check this
> > > case, unfortunately, it's not directly applicable here, because this  
> 
> Maybe I figured it out. Unfortunately, it is only compile tested. Does
> it look approximately right?

Yep that's definitely better. Just one thing missing (see below),
otherwise it looks good.

> 
> Thanks,
> 								Pavel
> 
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -171,32 +171,6 @@ static void set_addr(struct mtd_info *mtd, int column, int page_addr, int oob)
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
> -	i = nand_check_erased_buf(&mainarea[i], mtd->writesize, 0);
> -	if (i)
> -		return 0;
> -
> -	mtd_ooblayout_ecc(mtd, section++, &oobregion);
> -	while (oobregion.length) {
> -		i = nand_check_erased_buf(&oob[oobregion.offset], oobregion.length, 0);
> -		if (i)
> -			return 0;
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
> @@ -272,16 +246,14 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
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
> +				printk("NAND flash read: error but continuing.\n");
>  			}
>  
>  			mtd->ecc_stats.corrected += errors;
> @@ -676,6 +648,40 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct nand_chip *chip)
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

		else
			mtd->ecc_stats.corrected += res;


> +
> +		bitflips = max(res, bitflips);
> +		buf += pkt_size;
> +		ecc += ecc_size;
> +	}
> +
> +	mtd_ooblayout_ecc(mtd, 1, &oobregion);
> +	BUG_ON(oobregion.length);

Probably something you should check at registration time only.

> +
> +	return bitflips;
> +}
> +
>  static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			     uint8_t *buf, int oob_required, int page)
>  {
> @@ -687,11 +693,23 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
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
> +		printk("NAND flash: have error (%d)\n", nctrl->max_bitflips);
> +		res = check_erased_page(chip, buf);
> +		printk("NAND flash: but erased page says %d\n", res);
> +
> +		dev_err(priv->dev, "NAND Flash ECC Uncorrectable Error or erased page\n");
> +		return res;
> +	}
> +
>  
>  	return nctrl->max_bitflips;
>  }
> 
