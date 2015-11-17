Received: from mail-bn1on0133.outbound.protection.outlook.com
 ([157.56.110.133] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyoDB-0005yi-5L
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 21:54:49 +0000
Date: Tue, 17 Nov 2015 15:42:30 -0600
From: Han Xu <han.xu@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: fsl-quadspi: possible NULL dereference
Message-ID: <20151117214230.GA26480@chopperman.am.freescale.net>
References: <1447699339-43027-1-git-send-email-computersforpeace@gmail.com>
 <1447699530-50014-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1447699530-50014-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 10:45:30AM -0800, Brian Norris wrote:
> It is theoretically possible to probe this driver without a matching
> device tree, so let's guard against this.
> 
> Also, use the of_device_get_match_data() helper to make this a bit
> simpler.
> 
> Coverity complained about this one.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Han Xu <han.xu@freescale.com>
> ---
> v2:
>  * missed a 'const' warning
>  * s/reference/dereference in $subject
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index cc3a70b9b020..916d6dd5b575 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -269,7 +269,7 @@ struct fsl_qspi {
>  	struct clk *clk, *clk_en;
>  	struct device *dev;
>  	struct completion c;
> -	struct fsl_qspi_devtype_data *devtype_data;
> +	const struct fsl_qspi_devtype_data *devtype_data;
>  	u32 nor_size;
>  	u32 nor_num;
>  	u32 clk_rate;
> @@ -933,8 +933,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
>  	int ret, i = 0;
> -	const struct of_device_id *of_id =
> -			of_match_device(fsl_qspi_dt_ids, &pdev->dev);
>  
>  	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>  	if (!q)
> @@ -945,7 +943,9 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  
>  	q->dev = dev;
> -	q->devtype_data = (struct fsl_qspi_devtype_data *)of_id->data;
> +	q->devtype_data = of_device_get_match_data(dev);
> +	if (!q->devtype_data)
> +		return -ENODEV;
>  	platform_set_drvdata(pdev, q);
>  
>  	/* find the resources */
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
Acked-by: Han xu <han.xu@freescale.com>
-- 
Best Regards,

Han "Allen" Xu
