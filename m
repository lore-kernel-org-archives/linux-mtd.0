Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Iu3-0000un-6F
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 08:50:31 +0000
Date: Mon, 30 May 2016 10:50:05 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma
 reads
Message-ID: <20160530105005.62faa711@bbrezillon>
In-Reply-To: <1461961285-24159-2-git-send-email-kdasu.kdev@gmail.com>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
 <1461961285-24159-2-git-send-email-kdasu.kdev@gmail.com>
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

On Fri, 29 Apr 2016 16:21:25 -0400
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> This change provides a fix for controller bug where nand
> controller could have a possible sticky error after a PIO
> followed by a DMA read. The fix retries a read if we see
> a uncorr_ecc after read to detect such sticky errors.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 29a9abd..13c7784 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1555,9 +1555,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>  	struct brcmnand_controller *ctrl = host->ctrl;
>  	u64 err_addr = 0;
>  	int err;
> +	bool retry = true;
>  
>  	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
>  
> +try_dmaread:
>  	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_COUNT, 0);
>  
>  	if (has_flash_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
> @@ -1579,7 +1581,18 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	if (mtd_is_eccerr(err)) {
>  		int ret;
> -
> +		/*
> +		 * On controller version >=7.0 if we are doing a DMA read
> +		 * after a prior PIO read that reported uncorrectable error,
> +		 * the DMA engine captures this error following DMA read
> +		 * cleared only on subsequent DMA read, so just retry once
> +		 * to clear a possible false error reported for current DMA
> +		 * read
> +		 */

Hm, shouldn't this BRCMNAND_UNCORR_COUNT bit be cleared just after
doing the PIO/DMA read instead of doing it before executing a new read?
This would solve your problem without the need for this extra retry, or
am I missing something?

> +		if ((ctrl->nand_version >= 0x0700) && retry) {
> +			retry = false;
> +			goto try_dmaread;
> +		}
>  		ret = brcmstb_nand_verify_erased_page(mtd, chip, buf, addr);
>  		if (ret < 0) {
>  			dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
