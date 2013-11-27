Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vla1F-00036o-Rb
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 07:58:46 +0000
Received: by mail-pd0-f169.google.com with SMTP id v10so9447463pde.14
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2013 23:58:24 -0800 (PST)
Date: Tue, 26 Nov 2013 23:58:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Use info->use_dma to release DMA
 resources
Message-ID: <20131127075819.GC13929@norris.computersforpeace.net>
References: <1385470344-2542-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385470344-2542-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 26, 2013 at 09:52:24AM -0300, Ezequiel Garcia wrote:
> After the driver allocates all DMA resources, it sets "info->use_dma".
> Therefore, we need to check that variable to decide which resources
> needs to be freed, instead of the global use_dma variable.
> 
> Without this change, when the device probe fails, the driver will try
> to release unallocated DMA resources, with nasty results.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
> This is minor fix, but a fix anyway, so it should be queued for stable.
> 
>  drivers/mtd/nand/pxa3xx_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 97c3eb5..8f2104c 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1288,7 +1288,7 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
>  static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
>  {
>  	struct platform_device *pdev = info->pdev;
> -	if (use_dma) {
> +	if (info->use_dma) {

With this change, then the 'else' case will be executed and will kfree()
the data buffer that we didn't allocate?

  kfree(info->data_buff);

Fortunately kfree()'ing a NULL is a no-op.

But this highlights some of the strangeness of the error handling in
this driver. It has an atypical style, in which the probe routine calls
the remove routine if it fails. Normally, the probe routine has teardown
carefully planned in stages, whereas the remove routine just does it all
in one go (since it can assume the device was fully initialized). (And
of course, the devm_* functions can help with simplifying some of
this...)

But I suppose this patch is correct as-is, and this issue could be
revisited later.

For my reference, have you actually seen this bug in practice? I'm not
sure how well this fits in the -stable rules, if it hasn't been observed
and tested appropriately.

>  		pxa_free_dma(info->data_dma_ch);
>  		dma_free_coherent(&pdev->dev, info->buf_size,
>  				  info->data_buff, info->data_buff_phys);

Brian
