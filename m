Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB22A-0003ty-0U
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 16:10:31 +0000
Date: Sun, 27 Nov 2016 17:10:08 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 18/39] mtd: nand: denali: move denali_read_page_raw()
 above denali_read_page()
Message-ID: <20161127171008.39f883b8@bbrezillon>
In-Reply-To: <1480183585-592-19-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-19-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:06:04 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This will be needed in the next commit to call denali_read_page_raw()
> from denali_read_page().

Please squash this change into patch 19. It's clearly useless to
dissociate them.

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 76 +++++++++++++++++++++++------------------------
>  1 file changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index c101e7f..f035dac 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1118,6 +1118,44 @@ static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>  	return 0;
>  }
>  
> +static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +				u8 *buf, int oob_required, int page)
> +{
> +	struct denali_nand_info *denali = mtd_to_denali(mtd);
> +	dma_addr_t addr = denali->buf.dma_buf;
> +	size_t size = mtd->writesize + mtd->oobsize;
> +	u32 irq_mask = INTR_STATUS__DMA_CMD_COMP;
> +
> +	if (page != denali->page) {
> +		dev_err(denali->dev,
> +			"IN %s: page %d is not equal to denali->page %d",
> +			__func__, page, denali->page);
> +		BUG();
> +	}
> +
> +	setup_ecc_for_xfer(denali, false, oob_required ? true : false);
> +	denali_enable_dma(denali, true);
> +
> +	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
> +
> +	clear_interrupts(denali);
> +	denali_setup_dma(denali, DENALI_READ);
> +
> +	/* wait for operation to complete */
> +	wait_for_irq(denali, irq_mask);
> +
> +	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
> +
> +	denali_enable_dma(denali, false);
> +
> +	memcpy(buf, denali->buf.buf, mtd->writesize);
> +	if (oob_required)
> +		memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize,
> +		       mtd->oobsize);
> +
> +	return 0;
> +}
> +
>  static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			    u8 *buf, int oob_required, int page)
>  {
> @@ -1182,44 +1220,6 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	return max_bitflips;
>  }
>  
> -static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> -				u8 *buf, int oob_required, int page)
> -{
> -	struct denali_nand_info *denali = mtd_to_denali(mtd);
> -	dma_addr_t addr = denali->buf.dma_buf;
> -	size_t size = mtd->writesize + mtd->oobsize;
> -	u32 irq_mask = INTR_STATUS__DMA_CMD_COMP;
> -
> -	if (page != denali->page) {
> -		dev_err(denali->dev,
> -			"IN %s: page %d is not equal to denali->page %d",
> -			__func__, page, denali->page);
> -		BUG();
> -	}
> -
> -	setup_ecc_for_xfer(denali, false, oob_required ? true : false);
> -	denali_enable_dma(denali, true);
> -
> -	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
> -
> -	clear_interrupts(denali);
> -	denali_setup_dma(denali, DENALI_READ);
> -
> -	/* wait for operation to complete */
> -	wait_for_irq(denali, irq_mask);
> -
> -	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
> -
> -	denali_enable_dma(denali, false);
> -
> -	memcpy(buf, denali->buf.buf, mtd->writesize);
> -	if (oob_required)
> -		memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize,
> -		       mtd->oobsize);
> -
> -	return 0;
> -}
> -
>  static u8 denali_read_byte(struct mtd_info *mtd)
>  {
>  	struct denali_nand_info *denali = mtd_to_denali(mtd);
