Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXWXx-0004vK-8x
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 19:21:22 +0000
Date: Thu, 13 Dec 2018 20:20:56 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Pass the parent of pdev to
 dma_request_chan()
Message-ID: <20181213202056.273e9612@bbrezillon>
In-Reply-To: <20181213191944.3585-1-boris.brezillon@bootlin.com>
References: <20181213191944.3585-1-boris.brezillon@bootlin.com>
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

Oops, sorry, wrong prefix. I'll send a v2.

On Thu, 13 Dec 2018 20:19:44 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Commit e1e6255c311b ("mtd: rawnand: omap2: convert driver to
> nand_scan()") moved part of the init code in the ->attach_chip hook
> and at the same time changed the struct device object passed to
> dma_request_chan() (&pdev->dev instead of pdev->dev.parent).
> 
> Fixes: e1e6255c311b ("mtd: rawnand: omap2: convert driver to nand_scan()")
> Reported-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/omap2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index 886d05c391ef..68e8b9f7f372 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -1944,7 +1944,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
>  	case NAND_OMAP_PREFETCH_DMA:
>  		dma_cap_zero(mask);
>  		dma_cap_set(DMA_SLAVE, mask);
> -		info->dma = dma_request_chan(dev, "rxtx");
> +		info->dma = dma_request_chan(dev->parent, "rxtx");
>  
>  		if (IS_ERR(info->dma)) {
>  			dev_err(dev, "DMA engine request failed\n");
