Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZJiX-0005AO-TT
 for linux-mtd@lists.infradead.org; Mon, 15 Aug 2016 15:22:22 +0000
Date: Mon, 15 Aug 2016 17:22:00 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>
Cc: <dan.carpenter@oracle.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <fcooper@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: omap2: Don't call dma_release_channel() if
 dma_request_chan() failed
Message-ID: <20160815172200.11b9860c@bbrezillon>
In-Reply-To: <1471247259-27107-1-git-send-email-rogerq@ti.com>
References: <1471247259-27107-1-git-send-email-rogerq@ti.com>
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

On Mon, 15 Aug 2016 10:47:39 +0300
Roger Quadros <rogerq@ti.com> wrote:

> dma_request_chan() can fail returning an error pointer. In this case
> prevent calling dma_release_channel() to prevent a ERR_PTR() dereference.
> 
> As error path can be called even with no DMA configuration, info->dma can
> be NULL so don't call dma_release_channel() for that case either.
> 
> Fixes: de3bfc4a1616: ("mtd: nand: omap2: fix return value check in omap_nand_probe()")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Brian, can you apply this fix directly?

> ---
>  drivers/mtd/nand/omap2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index a59361c..5513bfd9 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -2169,7 +2169,7 @@ scan_tail:
>  	return 0;
>  
>  return_error:
> -	if (info->dma)
> +	if (!IS_ERR_OR_NULL(info->dma))
>  		dma_release_channel(info->dma);
>  	if (nand_chip->ecc.priv) {
>  		nand_bch_free(nand_chip->ecc.priv);
