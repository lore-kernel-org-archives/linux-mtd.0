Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmKNG-0005c1-Uc
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 11:37:39 +0000
Subject: Re: [PATCH 1/5] mtd: nand: omap2: Support parsing dma channel
 information from DT
To: Franklin S Cooper Jr <fcooper@ti.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <nsekhar@ti.com>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>, <tony@atomide.com>
References: <1444700338-27582-1-git-send-email-fcooper@ti.com>
 <1444700338-27582-2-git-send-email-fcooper@ti.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <561E3E4F.9020302@ti.com>
Date: Wed, 14 Oct 2015 14:36:47 +0300
MIME-Version: 1.0
In-Reply-To: <1444700338-27582-2-git-send-email-fcooper@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/10/15 04:38, Franklin S Cooper Jr wrote:
> Switch from dma_request_channel to allow passing dma channel
> information from DT rather than hardcoding a value.
> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>  drivers/mtd/nand/omap2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index d0f2620..957c32f 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1866,7 +1866,9 @@ static int omap_nand_probe(struct platform_device *pdev)
>  		dma_cap_zero(mask);
>  		dma_cap_set(DMA_SLAVE, mask);
>  		sig = OMAP24XX_DMA_GPMC;
> -		info->dma = dma_request_channel(mask, omap_dma_filter_fn, &sig);
> +		info->dma = dma_request_slave_channel_compat(mask,
> +			omap_dma_filter_fn, &sig, pdev->dev.parent, "rxtx");
> +
>  		if (!info->dma) {
>  			dev_err(&pdev->dev, "DMA engine request failed\n");
>  			err = -ENXIO;
> 

cheers,
-roger
