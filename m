Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffWfj-0006Fa-J4
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 20:34:13 +0000
Date: Tue, 17 Jul 2018 22:33:59 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Abhishek Sahu <absahu@codeaurora.org>, Archit Taneja
 <architt@codeaurora.org>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nand: ranw: qcom_nand: stop using phys_to_dma()
Message-ID: <20180717223359.43dc5dfb@bbrezillon>
In-Reply-To: <20180717202759.2288076-1-arnd@arndb.de>
References: <20180717202759.2288076-1-arnd@arndb.de>
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

On Tue, 17 Jul 2018 22:27:42 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> Compile-testing this driver on x86 caused a link error:
> 
> ERROR: "__phys_to_dma" [drivers/mtd/nand/raw/qcom_nandc.ko] undefined!
> 
> The problem here is that the driver attempts to convert the physical
> address into the DMA controller as a dma_addr_t and calls phys_to_dma()
> to do the conversion.
> 
> The correct way to do the conversion is using the dma mapping interfaces.
> 
> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

Miquel, can you fix the subject prefix when applying?

Thanks,

Boris

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 994f980c6d86..645630953f38 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -2957,14 +2957,6 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  
>  	nandc->props = dev_data;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nandc->base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(nandc->base))
> -		return PTR_ERR(nandc->base);
> -
> -	nandc->base_phys = res->start;
> -	nandc->base_dma = phys_to_dma(dev, (phys_addr_t)res->start);
> -
>  	nandc->core_clk = devm_clk_get(dev, "core");
>  	if (IS_ERR(nandc->core_clk))
>  		return PTR_ERR(nandc->core_clk);
> @@ -2977,9 +2969,21 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nandc->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(nandc->base))
> +		return PTR_ERR(nandc->base);
> +
> +	nandc->base_phys = res->start;
> +	nandc->base_dma = dma_map_resource(dev, res->start,
> +					   resource_size(res),
> +					   DMA_BIDIRECTIONAL, 0);
> +	if (!nandc->base_dma)
> +		return -ENXIO;
> +
>  	ret = qcom_nandc_alloc(nandc);
>  	if (ret)
> -		goto err_core_clk;
> +		goto err_nandc_alloc;
>  
>  	ret = clk_prepare_enable(nandc->core_clk);
>  	if (ret)
> @@ -3005,6 +3009,9 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(nandc->core_clk);
>  err_core_clk:
>  	qcom_nandc_unalloc(nandc);
> +err_nandc_alloc:
> +	dma_unmap_resource(dev, res->start, resource_size(res),
> +			   DMA_BIDIRECTIONAL, 0);
>  
>  	return ret;
>  }
> @@ -3012,16 +3019,21 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  static int qcom_nandc_remove(struct platform_device *pdev)
>  {
>  	struct qcom_nand_controller *nandc = platform_get_drvdata(pdev);
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	struct qcom_nand_host *host;
>  
>  	list_for_each_entry(host, &nandc->host_list, node)
>  		nand_release(nand_to_mtd(&host->chip));
>  
> +
>  	qcom_nandc_unalloc(nandc);
>  
>  	clk_disable_unprepare(nandc->aon_clk);
>  	clk_disable_unprepare(nandc->core_clk);
>  
> +	dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
> +			   DMA_BIDIRECTIONAL, 0);
> +
>  	return 0;
>  }
>  
