Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bMTPB-0005qV-4Q
 for linux-mtd@lists.infradead.org; Mon, 11 Jul 2016 05:05:17 +0000
Received: by mail-pa0-x241.google.com with SMTP id ib6so12208004pad.3
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jul 2016 22:04:56 -0700 (PDT)
Date: Sun, 10 Jul 2016 22:04:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [V3, 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma
 reads
Message-ID: <20160711050452.GA12083@localhost>
References: <1465507075-9447-1-git-send-email-kdasu.kdev@gmail.com>
 <1465507075-9447-2-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465507075-9447-2-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Looking through Boris's pull request, I noticed an issue:

On Thu, Jun 09, 2016 at 05:17:55PM -0400, Kamal Dasu wrote:
> This change provides a fix for controller bug where nand
> controller could have a possible sticky error after a PIO
> followed by a DMA read. The fix retries a read if we see
> a uncorr_ecc after read to detect such sticky errors.
> The fix applies to only controller version 7.0 and 7.1.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
> V3 changes 
>  none
> V2 Changes 
>  Restrict controller bug workaround to version 7.0 and 7.1
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 7ee9617..1156495 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1602,9 +1602,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>  	struct brcmnand_controller *ctrl = host->ctrl;
>  	u64 err_addr = 0;
>  	int err;
> +	static bool retry = true;

Is this intentionally static? That means your retry will only be
performed exactly once *ever*. Probably not what you expected?

Boris, if this is indeed unintended, would you rather fix this up in the
original patch and send me a new pull request? Or have my apply the
trivial fixup (i.e., s/static//) as a separate patch on top?

Brian

>  
>  	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
>  
> +try_dmaread:
>  	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_COUNT, 0);
>  
>  	if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
> @@ -1626,6 +1628,22 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	if (mtd_is_eccerr(err)) {
>  		/*
> +		 * On controller version and 7.0, 7.1 , DMA read after a
> +		 * prior PIO read that reported uncorrectable error,
> +		 * the DMA engine captures this error following DMA read
> +		 * cleared only on subsequent DMA read, so just retry once
> +		 * to clear a possible false error reported for current DMA
> +		 * read
> +		 */
> +		if ((ctrl->nand_version == 0x0700) ||
> +		    (ctrl->nand_version == 0x0701)) {
> +			if (retry) {
> +				retry = false;
> +				goto try_dmaread;
> +			}
> +		}
> +
> +		/*
>  		 * Controller version 7.2 has hw encoder to detect erased page
>  		 * bitflips, apply sw verification for older controllers only
>  		 */
> -- 
> 1.9.1
> 
