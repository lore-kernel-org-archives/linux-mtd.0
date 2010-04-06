Received: from copper.chdir.org ([88.191.97.87])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nz3gI-0002p9-Qb
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2010 07:58:43 +0000
From: arno@natisbad.org (Arnaud Ebalard)
To: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
Subject: Re: [PATCH] mtd: OneNAND: OMAP3: unmap correct DMA buffer
References: <1269351224-10637-1-git-send-email-ext-mika.1.westerberg@nokia.com>
Date: Tue, 06 Apr 2010 09:58:57 +0200
Message-ID: <874ojpdnb2.fsf@small.ssi.corp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dwmw2@infradead.org, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Mika Westerberg <ext-mika.1.westerberg@nokia.com> writes:

> Function omap3_onenand_write_bufferram() maps the write buffer and stores the
> returned handle in dma_src. However, when it does the DMA unmap, it uses wrong
> DMA handle (dma_dst).
>
> This patch fixes it to use the correct DMA handle.
>
> Signed-off-by: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
> ---
>  drivers/mtd/onenand/omap2.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index 75f38b9..2d81a3a 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -402,7 +402,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
>  
>  	dma_src = dma_map_single(&c->pdev->dev, buf, count, DMA_TO_DEVICE);
>  	dma_dst = c->phys_base + bram_offset;
> -	if (dma_mapping_error(&c->pdev->dev, dma_dst)) {
> +	if (dma_mapping_error(&c->pdev->dev, dma_src)) {
>  		dev_err(&c->pdev->dev,
>  			"Couldn't DMA map a %d byte buffer\n",
>  			count);
> @@ -425,7 +425,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
>  		if (*done)
>  			break;
>  
> -	dma_unmap_single(&c->pdev->dev, dma_dst, count, DMA_TO_DEVICE);
> +	dma_unmap_single(&c->pdev->dev, dma_src, count, DMA_TO_DEVICE);
>  
>  	if (!*done) {
>  		dev_err(&c->pdev->dev, "timeout waiting for DMA\n");

That patch removes the kernel panic I get when booting current l-o
kernel on my N900.

Tested-by: Arnaud Ebalard <arno@natisbad.org>

Cheers,

a+
