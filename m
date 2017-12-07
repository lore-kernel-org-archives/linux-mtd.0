Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eN2dL-0003Tb-7B
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 20:19:05 +0000
Date: Thu, 7 Dec 2017 21:18:18 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 1/3] mtd: nand: cafe: remove use of NAND_OWN_BUFFERS
Message-ID: <20171207211818.0125d499@bbrezillon>
In-Reply-To: <1512463636-28934-1-git-send-email-yamada.masahiro@socionext.com>
References: <1512463636-28934-1-git-send-email-yamada.masahiro@socionext.com>
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

On Tue,  5 Dec 2017 17:47:14 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This driver is the last/only user of NAND_OWN_BUFFERS.  Boris suggested
> to remove this flag.
> 
> Taking a closer look at this driver, it calls dma_alloc_coherent() for
> the concatenated area for the DMA bounce buffer + struct nand_buffers,
> but the latter does not need to be DMA-coherent; cafe_{write,read}_buf
> simply do memcpy() between buffers when usedma==1.
> 
> Let's do dma_alloc_coherent() for the DMA bounce buffer in the front,
> and leave the nand_buffers allocation to nand_scan_tail(), then rip off
> NAND_OWN_BUFFERS.
> 
> The magic number, 2112, is still mysterious (hard-coded writesize +
> oobsize ?), but this is not our main interest.  I am keeping it.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied the whole series.

Thanks,

Boris

> ---
> 
> Changes in v2:
>   - Newly added
> 
>  drivers/mtd/nand/cafe_nand.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
> index bc558c4..add4613 100644
> --- a/drivers/mtd/nand/cafe_nand.c
> +++ b/drivers/mtd/nand/cafe_nand.c
> @@ -613,7 +613,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  	uint32_t ctrl;
>  	int err = 0;
>  	int old_dma;
> -	struct nand_buffers *nbuf;
>  
>  	/* Very old versions shared the same PCI ident for all three
>  	   functions on the chip. Verify the class too... */
> @@ -661,7 +660,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  
>  	/* Enable the following for a flash based bad block table */
>  	cafe->nand.bbt_options = NAND_BBT_USE_FLASH;
> -	cafe->nand.options = NAND_OWN_BUFFERS;
>  
>  	if (skipbbt) {
>  		cafe->nand.options |= NAND_SKIP_BBTSCAN;
> @@ -731,15 +729,12 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  	if (err)
>  		goto out_irq;
>  
> -	cafe->dmabuf = dma_alloc_coherent(&cafe->pdev->dev,
> -				2112 + sizeof(struct nand_buffers) +
> -				mtd->writesize + mtd->oobsize,
> -				&cafe->dmaaddr, GFP_KERNEL);
> +	cafe->dmabuf = dma_alloc_coherent(&cafe->pdev->dev, 2112,
> +					  &cafe->dmaaddr, GFP_KERNEL);
>  	if (!cafe->dmabuf) {
>  		err = -ENOMEM;
>  		goto out_irq;
>  	}
> -	cafe->nand.buffers = nbuf = (void *)cafe->dmabuf + 2112;
>  
>  	/* Set up DMA address */
>  	cafe_writel(cafe, cafe->dmaaddr & 0xffffffff, NAND_DMA_ADDR0);
> @@ -752,11 +747,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  	cafe_dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
>  		cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);
>  
> -	/* this driver does not need the @ecccalc and @ecccode */
> -	nbuf->ecccalc = NULL;
> -	nbuf->ecccode = NULL;
> -	nbuf->databuf = (uint8_t *)(nbuf + 1);
> -
>  	/* Restore the DMA flag */
>  	usedma = old_dma;
>  
> @@ -801,10 +791,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  	goto out;
>  
>   out_free_dma:
> -	dma_free_coherent(&cafe->pdev->dev,
> -			2112 + sizeof(struct nand_buffers) +
> -			mtd->writesize + mtd->oobsize,
> -			cafe->dmabuf, cafe->dmaaddr);
> +	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
>   out_irq:
>  	/* Disable NAND IRQ in global IRQ mask register */
>  	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
> @@ -829,10 +816,7 @@ static void cafe_nand_remove(struct pci_dev *pdev)
>  	nand_release(mtd);
>  	free_rs(cafe->rs);
>  	pci_iounmap(pdev, cafe->mmio);
> -	dma_free_coherent(&cafe->pdev->dev,
> -			2112 + sizeof(struct nand_buffers) +
> -			mtd->writesize + mtd->oobsize,
> -			cafe->dmabuf, cafe->dmaaddr);
> +	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
>  	kfree(cafe);
>  }
>  
