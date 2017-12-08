Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eNQ6w-0007FT-BP
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 21:23:12 +0000
Date: Fri, 8 Dec 2017 22:22:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: onenand: samsung: use devm_ function to
 simplify code and fix some leaks
Message-ID: <20171208222238.4b778805@bbrezillon>
In-Reply-To: <6cde66a56d0228d3933cf0d92fdc725ccb880b4a.1512765898.git.christophe.jaillet@wanadoo.fr>
References: <cover.1512765898.git.christophe.jaillet@wanadoo.fr>
 <6cde66a56d0228d3933cf0d92fdc725ccb880b4a.1512765898.git.christophe.jaillet@wanadoo.fr>
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

On Fri,  8 Dec 2017 22:11:04 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Convert all error handling code in 's3c_onenand_probe()' to
> resource-managed alternatives in order to simplify code.
> 
> This fixes a resource leak if 'platform_get_resource()' fails at line 872.
> 
> The 'request_irq()' at line 971 was also un-balanced. It is now
> resource-managed
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only
> ---
>  drivers/mtd/onenand/samsung.c | 141 +++++++++++++-----------------------------
>  1 file changed, 43 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
> index af0ac1a7bf8f..04039b967d59 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -851,15 +851,14 @@ static int s3c_onenand_probe(struct platform_device *pdev)
>  	/* No need to check pdata. the platform data is optional */
>  
>  	size = sizeof(struct mtd_info) + sizeof(struct onenand_chip);
> -	mtd = kzalloc(size, GFP_KERNEL);
> +	mtd = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
>  	if (!mtd)
>  		return -ENOMEM;
>  
> -	onenand = kzalloc(sizeof(struct s3c_onenand), GFP_KERNEL);
> -	if (!onenand) {
> -		err = -ENOMEM;
> -		goto onenand_fail;
> -	}
> +	onenand = devm_kzalloc(&pdev->dev, sizeof(struct s3c_onenand),
> +			       GFP_KERNEL);
> +	if (!onenand)
> +		return -ENOMEM;
>  
>  	this = (struct onenand_chip *) &mtd[1];
>  	mtd->priv = this;
> @@ -873,22 +872,20 @@ static int s3c_onenand_probe(struct platform_device *pdev)
>  	if (!r) {
>  		dev_err(&pdev->dev, "no memory resource defined\n");
>  		return -ENOENT;
> -		goto ahb_resource_failed;
>  	}
>  
> -	onenand->base_res = request_mem_region(r->start, resource_size(r),
> -					       pdev->name);
> +	onenand->base_res = devm_request_mem_region(&pdev->dev, r->start,
> +						    resource_size(r),
> +						    pdev->name);
>  	if (!onenand->base_res) {
>  		dev_err(&pdev->dev, "failed to request memory resource\n");
> -		err = -EBUSY;
> -		goto resource_failed;
> +		return -EBUSY;
>  	}
>  
> -	onenand->base = ioremap(r->start, resource_size(r));
> +	onenand->base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
>  	if (!onenand->base) {
>  		dev_err(&pdev->dev, "failed to map memory resource\n");
> -		err = -EFAULT;
> -		goto ioremap_failed;
> +		return -EFAULT;
>  	}

Can still be simplified with the following pattern:

	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	onenand->base = devm_ioremap_resource(&pdev->dev, r);
	if (IS_ERR(onenand->base))
		return PTR_ERR(onenand->base);

No need to keep the error messages, since devm_ioremap_resource()
already takes care of that.
