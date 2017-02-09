Received: from mail-wr0-f195.google.com ([209.85.128.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbkUf-00088D-Gs
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 08:54:23 +0000
Received: by mail-wr0-f195.google.com with SMTP id o16so11202014wra.2
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 00:54:00 -0800 (PST)
Subject: Re: [PATCH -next] mtd: aspeed: remove redundant dev_err call in
 aspeed_smc_probe()
To: Wei Yongjun <weiyj.lk@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
References: <20170208162310.6048-1-weiyj.lk@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6c10cdf0-5b91-000c-a8c3-78f41d47bac3@gmail.com>
Date: Thu, 9 Feb 2017 09:50:23 +0100
MIME-Version: 1.0
In-Reply-To: <20170208162310.6048-1-weiyj.lk@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/08/2017 05:23 PM, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 7c86099..56051d3 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -723,17 +723,13 @@ static int aspeed_smc_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	controller->regs = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(controller->regs)) {
> -		dev_err(dev, "Cannot remap controller address.\n");
> +	if (IS_ERR(controller->regs))
>  		return PTR_ERR(controller->regs);
> -	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	controller->ahb_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(controller->ahb_base)) {
> -		dev_err(dev, "Cannot remap controller address.\n");
> +	if (IS_ERR(controller->ahb_base))
>  		return PTR_ERR(controller->ahb_base);
> -	}
>  
>  	ret = aspeed_smc_setup_flash(controller, np, res);
>  	if (ret)
> 
> 
> 


-- 
Best regards,
Marek Vasut
