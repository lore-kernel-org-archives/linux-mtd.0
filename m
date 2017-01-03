Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOMlC-0003u9-Qg
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 10:56:07 +0000
Date: Tue, 3 Jan 2017 11:55:35 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: <marek.vasut@gmail.com>, <cyrille.pitchen@atmel.com>, <vz@mleia.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: lpc32xx_slc: Remove unneeded NULL check on 'rc'
Message-ID: <20170103115535.0d295f19@bbrezillon>
In-Reply-To: <1480433332-2090-1-git-send-email-fabio.estevam@nxp.com>
References: <1480433332-2090-1-git-send-email-fabio.estevam@nxp.com>
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

On Tue, 29 Nov 2016 13:28:52 -0200
Fabio Estevam <fabio.estevam@nxp.com> wrote:

> devm_ioremap_resource() does a NULL check on the 'rc' argument, so
> remove the unneeded manual NULL check.
> 
> While at it, place the 'rc' assignment just before
> devm_ioremap_resource() to improve readability.
> 

Applied.

Thanks,

Boris

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
> -
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
