Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB27v-0000cY-Hp
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 16:16:29 +0000
Date: Sun, 27 Nov 2016 17:16:06 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 21/39] mtd: nand: denali: support 64bit capable DMA engine
Message-ID: <20161127171606.3acd2c54@bbrezillon>
In-Reply-To: <1480183585-592-22-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-22-git-send-email-yamada.masahiro@socionext.com>
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

On Sun, 27 Nov 2016 03:06:07 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The current driver only supports the DMA engine up to 32 bit
> physical address, but there also exists 64 bit capable DMA engine
> for this IP.
> 
> The data DMA setup sequence is completely different, so I added the
> 64 bit DMA code as a new function denali_setup_dma64().  The 32 bit
> one has been renamed to denali_setup_dma32().
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/mtd/nand/denali.c | 39 +++++++++++++++++++++++++++++++++++----
>  drivers/mtd/nand/denali.h |  1 +
>  2 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index ae44c01..752ad98 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -995,8 +995,30 @@ static void denali_enable_dma(struct denali_nand_info *denali, bool en)
>  	ioread32(denali->flash_reg + DMA_ENABLE);
>  }
>  
> -/* setups the HW to perform the data DMA */
> -static void denali_setup_dma(struct denali_nand_info *denali, int op)
> +static void denali_setup_dma64(struct denali_nand_info *denali, int op)
> +{
> +	u32 mode;
> +	const int page_count = 1;
> +	u64 addr = denali->buf.dma_buf;
> +
> +	mode = MODE_10 | BANK(denali->flash_bank) | denali->page;
> +
> +	/* DMA is a three step process */
> +
> +	/*
> +	 * 1. setup transfer type, interrupt when complete,
> +	 *    burst len = 64 bytes, the number of pages
> +	 */
> +	index_addr(denali, mode, 0x01002000 | (64 << 16) | op | page_count);
> +
> +	/* 2. set memory low address */
> +	index_addr(denali, mode, addr);
> +
> +	/* 3. set memory high address */
> +	index_addr(denali, mode, addr >> 32);
> +}
> +
> +static void denali_setup_dma32(struct denali_nand_info *denali, int op)
>  {
>  	u32 mode;
>  	const int page_count = 1;
> @@ -1019,6 +1041,14 @@ static void denali_setup_dma(struct denali_nand_info *denali, int op)
>  	index_addr(denali, mode | 0x14000, 0x2400);
>  }
>  
> +static void denali_setup_dma(struct denali_nand_info *denali, int op)
> +{
> +	if (denali->caps & DENALI_CAPS_DMA_64BIT)
> +		denali_setup_dma64(denali, op);
> +	else
> +		denali_setup_dma32(denali, op);
> +}
> +

If you follow my suggestions of definition function pointers, you'll
just have to add a function pointer to the denali_caps struct:

	void (*setup_dma)(struct denali_nand_info *denali, int op);


>  /*
>   * writes a page. user specifies type, and this function handles the
>   * configuration details.
> @@ -1495,8 +1525,9 @@ int denali_init(struct denali_nand_info *denali)
>  		goto failed_req_irq;
>  	}
>  
> -	/* Is 32-bit DMA supported? */
> -	ret = dma_set_mask(denali->dev, DMA_BIT_MASK(32));
> +	ret = dma_set_mask(denali->dev,
> +			   DMA_BIT_MASK(denali->caps & DENALI_CAPS_DMA_64BIT ?
> +					64 : 32));
>  	if (ret) {
>  		dev_err(denali->dev, "no usable DMA configuration\n");
>  		goto failed_req_irq;
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index beadc8a..9bdf037 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -435,6 +435,7 @@ struct denali_nand_info {
>  	u32 max_banks;
>  	unsigned int caps;
>  #define DENALI_CAPS_HW_ECC_FIXUP		BIT(0)
> +#define DENALI_CAPS_DMA_64BIT			BIT(1)
>  };
>  
>  extern int denali_init(struct denali_nand_info *denali);
