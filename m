Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPj3-0006rH-Jm
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:23:26 +0000
Received: by mail-pa0-f52.google.com with SMTP id bj1so30576pad.25
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:23:02 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:22:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: NFC: fix mtd_nandbiterrs.ko test fail
 when using sram write
Message-ID: <20140804212259.GA3711@ld-irv-0074>
References: <1406021138-5545-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406021138-5545-1-git-send-email-josh.wu@atmel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 22, 2014 at 05:25:38PM +0800, Josh Wu wrote:
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 33826a0..012d687 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1913,15 +1913,13 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (offset || (data_len < mtd->writesize))
>  		return -EINVAL;
>  
> -	cfg = nfc_readl(host->nfc->hsmc_regs, CFG);
> -	len = mtd->writesize;
> -
> -	if (unlikely(raw)) {
> -		len += mtd->oobsize;
> -		nfc_writel(host->nfc->hsmc_regs, CFG, cfg | NFC_CFG_WSPARE);
> -	} else
> -		nfc_writel(host->nfc->hsmc_regs, CFG, cfg & ~NFC_CFG_WSPARE);
> +	if (data_len > mtd->writesize) {
> +		dev_err(host->dev, "data_len: %d should not bigger than mtd->writesize: %d!\n",

"should not be"

> +				data_len, mtd->writesize);
> +		return -EINVAL;
> +	}

The NAND layer guarantees that 'write_page' will never have to write
more than 1 page (mtd->writesize), so the above block seems unnecessary.
Drop it?

>  
> +	len = mtd->writesize;
>  	/* Copy page data to sram that will write to nand via NFC */
>  	if (use_dma) {
>  		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) != 0)
> @@ -1931,6 +1929,15 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  		memcpy32_toio(sram, buf, len);
>  	}
>  
> +	cfg = nfc_readl(host->nfc->hsmc_regs, CFG);
> +	if (unlikely(raw) && oob_required) {
> +		memcpy32_toio(sram + len, chip->oob_poi, mtd->oobsize);
> +		len += mtd->oobsize;
> +		nfc_writel(host->nfc->hsmc_regs, CFG, cfg | NFC_CFG_WSPARE);
> +	} else {
> +		nfc_writel(host->nfc->hsmc_regs, CFG, cfg & ~NFC_CFG_WSPARE);
> +	}
> +
>  	if (chip->ecc.mode == NAND_ECC_HW && host->has_pmecc)
>  		/*
>  		 * When use NFC sram, need set up PMECC before send

Brian
