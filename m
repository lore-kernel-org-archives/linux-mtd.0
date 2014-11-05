Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm9bs-0002sv-8F
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 23:03:28 +0000
Received: by mail-pd0-f169.google.com with SMTP id y10so1677190pdj.0
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 15:03:07 -0800 (PST)
Date: Wed, 5 Nov 2014 15:03:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] atmel_nand: replace memcpy32_toio/memcpy32_fromio with
 memcpy
Message-ID: <20141105230303.GA23619@ld-irv-0074>
References: <1413970524-18716-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413970524-18716-1-git-send-email-josh.wu@atmel.com>
Cc: vinod.koul@intel.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, voice.shen@atmel.com, herve.codina@celad.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 22, 2014 at 05:35:24PM +0800, Josh Wu wrote:
> There is no need to use memcpy32_toio/memcpy32_fromio to transfer data
> between memory and NFC sram. As the NFC sram is a also a memery space
> not a io space.
> So just use memcpy is enough.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
>  drivers/mtd/nand/atmel_nand.c | 32 ++++++--------------------------
>  1 file changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 5c1423a..28d452e 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -105,7 +105,7 @@ struct atmel_nfc {
>  	struct completion	comp_xfer_done;
>  
>  	/* Point to the sram bank which include readed data via NFC */
> -	void __iomem		*data_in_sram;
> +	void 			*data_in_sram;

If you're going to do this, you should also modify sram_bank0 and drop
the __iomem annotation on 'sram' in nfc_sram_write_page().

Also, checkpatch complains here:

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#26: FILE: drivers/mtd/nand/atmel_nand.c:108:
+^Ivoid ^I^I^I*data_in_sram;$

With those fixed:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>

>  	bool			will_write_sram;
>  };
>  static struct atmel_nfc	nand_nfc;
> @@ -257,26 +257,6 @@ static int atmel_nand_set_enable_ready_pins(struct mtd_info *mtd)
>  	return res;
>  }
>  
> -static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
> -{
> -	int i;
> -	u32 *t = trg;
> -	const __iomem u32 *s = src;
> -
> -	for (i = 0; i < (size >> 2); i++)
> -		*t++ = readl_relaxed(s++);
> -}
> -
> -static void memcpy32_toio(void __iomem *trg, const void *src, int size)
> -{
> -	int i;
> -	u32 __iomem *t = trg;
> -	const u32 *s = src;
> -
> -	for (i = 0; i < (size >> 2); i++)
> -		writel_relaxed(*s++, t++);
> -}
> -
>  /*
>   * Minimal-overhead PIO for data access.
>   */
> @@ -286,7 +266,7 @@ static void atmel_read_buf8(struct mtd_info *mtd, u8 *buf, int len)
>  	struct atmel_nand_host *host = nand_chip->priv;
>  
>  	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
> -		memcpy32_fromio(buf, host->nfc->data_in_sram, len);
> +		memcpy(buf, host->nfc->data_in_sram, len);
>  		host->nfc->data_in_sram += len;
>  	} else {
>  		__raw_readsb(nand_chip->IO_ADDR_R, buf, len);
> @@ -299,7 +279,7 @@ static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
>  	struct atmel_nand_host *host = nand_chip->priv;
>  
>  	if (host->nfc && host->nfc->use_nfc_sram && host->nfc->data_in_sram) {
> -		memcpy32_fromio(buf, host->nfc->data_in_sram, len);
> +		memcpy(buf, host->nfc->data_in_sram, len);
>  		host->nfc->data_in_sram += len;
>  	} else {
>  		__raw_readsw(nand_chip->IO_ADDR_R, buf, len / 2);
> @@ -1983,14 +1963,14 @@ static int nfc_sram_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (use_dma) {
>  		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) != 0)
>  			/* Fall back to use cpu copy */
> -			memcpy32_toio(sram, buf, len);
> +			memcpy(sram, buf, len);
>  	} else {
> -		memcpy32_toio(sram, buf, len);
> +		memcpy(sram, buf, len);
>  	}
>  
>  	cfg = nfc_readl(host->nfc->hsmc_regs, CFG);
>  	if (unlikely(raw) && oob_required) {
> -		memcpy32_toio(sram + len, chip->oob_poi, mtd->oobsize);
> +		memcpy(sram + len, chip->oob_poi, mtd->oobsize);
>  		len += mtd->oobsize;
>  		nfc_writel(host->nfc->hsmc_regs, CFG, cfg | NFC_CFG_WSPARE);
>  	} else {

Brian
