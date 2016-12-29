Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMeRu-0006JX-1M
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2016 17:25:06 +0000
Date: Thu, 29 Dec 2016 18:24:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1] mtd : nand : denali :- No need of devm functions
Message-ID: <20161229182443.2bdb37a7@bbrezillon>
In-Reply-To: <1481123711-7205-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1481123711-7205-1-git-send-email-arvind.yadav.cs@gmail.com>
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

On Wed,  7 Dec 2016 20:45:11 +0530
Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> In function denali_init, the memory allocated for denali->buf.buf
> is live within the function only. After the allocation it is
> immediately freed with devm_kfree. There is no need to allocate
> memory for denali->buf.buf with devm function so replace
> devm_kzalloc with kzalloc and devm_kfree with kfree.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/mtd/nand/denali.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Not sure it's any better than the previous logic (see the diffstat). The
devm_kzalloc() approach has the benefit of simplifying the different
error paths.

> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 0476ae8..ce3c31f 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1476,8 +1476,7 @@ int denali_init(struct denali_nand_info *denali)
>  	}
>  
>  	/* allocate a temporary buffer for nand_scan_ident() */
> -	denali->buf.buf = devm_kzalloc(denali->dev, PAGE_SIZE,
> -					GFP_DMA | GFP_KERNEL);
> +	denali->buf.buf = kzalloc(PAGE_SIZE, GFP_DMA | GFP_KERNEL);
>  	if (!denali->buf.buf)
>  		return -ENOMEM;
>  
> @@ -1492,6 +1491,7 @@ int denali_init(struct denali_nand_info *denali)
>  	if (request_irq(denali->irq, denali_isr, IRQF_SHARED,
>  			DENALI_NAND_NAME, denali)) {
>  		pr_err("Spectra: Unable to allocate IRQ\n");
> +		kfree(denali->buf.buf);
>  		return -ENODEV;
>  	}
>  
> @@ -1512,11 +1512,12 @@ int denali_init(struct denali_nand_info *denali)
>  	 */
>  	if (nand_scan_ident(mtd, denali->max_banks, NULL)) {
>  		ret = -ENXIO;
> +		kfree(denali->buf.buf);
>  		goto failed_req_irq;
>  	}
>  
>  	/* allocate the right size buffer now */
> -	devm_kfree(denali->dev, denali->buf.buf);
> +	kfree(denali->buf.buf);
>  	denali->buf.buf = devm_kzalloc(denali->dev,
>  			     mtd->writesize + mtd->oobsize,
>  			     GFP_KERNEL);
