Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBnY0-000337-BA
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2016 18:54:33 +0000
Received: by mail-wm0-x242.google.com with SMTP id u144so25812520wmu.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 10:54:11 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: lpc32xx_slc: Remove unneeded NULL check on 'rc'
To: Fabio Estevam <fabio.estevam@nxp.com>, boris.brezillon@free-electrons.com
References: <1480433332-2090-1-git-send-email-fabio.estevam@nxp.com>
Cc: cyrille.pitchen@atmel.com, vz@mleia.com, linux-mtd@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1cb0eec2-bd69-b2fb-7a69-80a2cf4a5b6c@gmail.com>
Date: Tue, 29 Nov 2016 18:30:48 +0100
MIME-Version: 1.0
In-Reply-To: <1480433332-2090-1-git-send-email-fabio.estevam@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/29/2016 04:28 PM, Fabio Estevam wrote:
> devm_ioremap_resource() does a NULL check on the 'rc' argument, so
> remove the unneeded manual NULL check.
> 
> While at it, place the 'rc' assignment just before
> devm_ioremap_resource() to improve readability.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/mtd/nand/lpc32xx_slc.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
> index 53bafe2..a0669a3 100644
> --- a/drivers/mtd/nand/lpc32xx_slc.c
> +++ b/drivers/mtd/nand/lpc32xx_slc.c
> @@ -797,22 +797,17 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
>  	struct resource *rc;
>  	int res;
>  
> -	rc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (rc == NULL) {
> -		dev_err(&pdev->dev, "No memory resource found for device\n");
> -		return -EBUSY;
> -	}

I can understand the original code where you avoid calling the malloc()
in case of failure, but that looks like microoptimization to me.

Acked-by: Marek Vasut <marek.vasut@gmail.com>

>  	/* Allocate memory for the device structure (and zero it) */
>  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
>  	if (!host)
>  		return -ENOMEM;
> -	host->io_base_dma = rc->start;
>  
> +	rc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	host->io_base = devm_ioremap_resource(&pdev->dev, rc);
>  	if (IS_ERR(host->io_base))
>  		return PTR_ERR(host->io_base);
>  
> +	host->io_base_dma = rc->start;
>  	if (pdev->dev.of_node)
>  		host->ncfg = lpc32xx_parse_dt(&pdev->dev);
>  	if (!host->ncfg) {
> 


-- 
Best regards,
Marek Vasut
