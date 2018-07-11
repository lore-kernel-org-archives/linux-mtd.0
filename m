Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdEnp-0007an-Vs
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 13:05:19 +0000
Date: Wed, 11 Jul 2018 15:04:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Abhishek Sahu <absahu@codeaurora.org>, Archit Taneja
 <architt@codeaurora.org>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nand: ranw: qcom_nand: stop using phys_to_dma()
Message-ID: <20180711150449.4152333c@bbrezillon>
In-Reply-To: <20180711122709.358159-1-arnd@arndb.de>
References: <20180711122709.358159-1-arnd@arndb.de>
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

On Wed, 11 Jul 2018 14:26:58 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> Compile-testing this driver on x86 caused a link error:
> 
> ERROR: "__phys_to_dma" [drivers/mtd/nand/raw/qcom_nandc.ko] undefined!
> 
> The problem here is that the driver attempts to convert the physical
> address into the DMA controller as a dma_addr_t and calls phys_to_dma()
> to do the conversion.
> 
> However, there is no generic way to convert a phys_addr_t into a dma_addr_t
> for anything other than RAM (which should use the dma-mapping API instead).
> The only correct use of phys_to_dma() instead is inside of the dma-mapping
> implementation.

Should we use dma_map_resource() to do the phys_addr_t to dma_addr_t
conversion?

> 
> In all other drivers that deal with DMA FIFO addresses, we just pass the
> physical address directly and have the DMA controller deal with that
> if necessary, so let's do the same thing here.
> 
> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 994f980c6d86..f047e2819041 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -338,7 +338,6 @@ struct nandc_regs {
>   * @dev:			parent device
>   * @base:			MMIO base
>   * @base_phys:			physical base address of controller registers
> - * @base_dma:			dma base address of controller registers
>   * @core_clk:			controller clock
>   * @aon_clk:			another controller clock
>   *
> @@ -372,7 +371,6 @@ struct qcom_nand_controller {
>  
>  	void __iomem *base;
>  	phys_addr_t base_phys;
> -	dma_addr_t base_dma;
>  
>  	struct clk *core_clk;
>  	struct clk *aon_clk;
> @@ -935,11 +933,11 @@ static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
>  	slave_conf.device_fc = flow_control;
>  	if (read) {
>  		slave_conf.src_maxburst = 16;
> -		slave_conf.src_addr = nandc->base_dma + reg_off;
> +		slave_conf.src_addr = (dma_addr_t)nandc->base_phys + reg_off;
>  		slave_conf.slave_id = nandc->data_crci;
>  	} else {
>  		slave_conf.dst_maxburst = 16;
> -		slave_conf.dst_addr = nandc->base_dma + reg_off;
> +		slave_conf.dst_addr = (dma_addr_t)nandc->base_phys + reg_off;
>  		slave_conf.slave_id = nandc->cmd_crci;
>  	}
>  
> @@ -2963,7 +2961,6 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  		return PTR_ERR(nandc->base);
>  
>  	nandc->base_phys = res->start;
> -	nandc->base_dma = phys_to_dma(dev, (phys_addr_t)res->start);
>  
>  	nandc->core_clk = devm_clk_get(dev, "core");
>  	if (IS_ERR(nandc->core_clk))
