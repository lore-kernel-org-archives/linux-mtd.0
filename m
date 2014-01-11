Date: Sat, 11 Jan 2014 15:39:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 3/4] mtd: nand: kill the the
 NAND_MAX_PAGESIZE/NAND_MAX_OOBSIZE for nand_buffers{}
Message-ID: <20140111233937.GF1992@norris-Latitude-E6410>
References: <1387555350-989-1-git-send-email-shijie8@gmail.com>
 <1387555350-989-4-git-send-email-shijie8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387555350-989-4-git-send-email-shijie8@gmail.com>
Cc: s.hauer@pengutronix.de, akinobu.mita@gmail.com, josh@joshtriplett.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 21, 2013 at 12:02:29AM +0800, Huang Shijie wrote:
> The patch converts the arrays to buffer pointers for nand_buffers{}.
> 
> The cafe_nand.c is the only NAND_OWN_BUFFERS user which allocates
> a nand_buffers{} itself.
> 
> This patch disables the DMA for nand_scan_ident, and restore the DMA
> status after we finish the nand_scan_ident. By this way, we can get the
> mtd->writesize and mtd->oobsize, and then allocates the cafe->dmabuf
> with them.
> 
> Since the cafe_nand.c uses the NAND_ECC_HW_SYNDROME ECC mode, we do not
> allocate the buffers for @ecccalc and @ecccode.
> 
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> ---
>  drivers/mtd/nand/cafe_nand.c | 49 ++++++++++++++++++++++++++++++++------------
>  drivers/mtd/nand/nand_base.c | 19 +++++++++++++----
>  include/linux/mtd/nand.h     | 12 +++++------
>  3 files changed, 57 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
> index c34985a..e9186e7 100644
> --- a/drivers/mtd/nand/cafe_nand.c
> +++ b/drivers/mtd/nand/cafe_nand.c
> @@ -627,6 +627,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  	struct cafe_priv *cafe;
>  	uint32_t ctrl;
>  	int err = 0;
> +	int old_dma;
> +	struct nand_buffers *nbuf;
>  
>  	/* Very old versions shared the same PCI ident for all three
>  	   functions on the chip. Verify the class too... */
> @@ -657,13 +659,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
>  		err = -ENOMEM;
>  		goto out_free_mtd;
>  	}
> -	cafe->dmabuf = dma_alloc_coherent(&cafe->pdev->dev, 2112 + sizeof(struct nand_buffers),
> -					  &cafe->dmaaddr, GFP_KERNEL);
> -	if (!cafe->dmabuf) {
> -		err = -ENOMEM;
> -		goto out_ior;
> -	}
> -	cafe->nand.buffers = (void *)cafe->dmabuf + 2112;

When you move this after nand_scan_ident(), you forgot to move all the code
that uses dmabuf and dmabuf:

        /* Set up DMA address */
        cafe_writel(cafe, cafe->dmaaddr & 0xffffffff, NAND_DMA_ADDR0);
        if (sizeof(cafe->dmaaddr) > 4)
                /* Shift in two parts to shut the compiler up */
                cafe_writel(cafe, (cafe->dmaaddr >> 16) >> 16, NAND_DMA_ADDR1);
        else
                cafe_writel(cafe, 0, NAND_DMA_ADDR1);

        cafe_dev_dbg(&cafe->pdev->dev, "Set DMA address to %x (virt %p)\n",
                cafe_readl(cafe, NAND_DMA_ADDR0), cafe->dmabuf);

This code needs to stay after the point where you actually allocate the buffer.

It could also use some testing on real Cafe NAND hardware, since I don't
know what kind of use the !DMA case was getting.

>  
>  	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
>  	if (!cafe->rs) {

Brian
