Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDfcA-0000ao-AE
 for linux-mtd@lists.infradead.org; Tue, 20 Jan 2015 20:41:31 +0000
Received: by mail-pd0-f169.google.com with SMTP id g10so12102511pdj.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2015 12:41:08 -0800 (PST)
Date: Tue, 20 Jan 2015 12:41:04 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RESEND] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150120204104.GP9759@ld-irv-0074>
References: <1421187255-20618-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421187255-20618-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Frank.Li@freescale.com,
 shijie8@gmail.com, han.xu@freescale.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2015 at 08:14:15PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> When removing the fsl-quadspi module and running 'cat /proc/mtd' afterwards,
> we see garbage data like:
> 
> $ rmmod  fsl-quadspi
> $ cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"
> mtd0: 00000000 00000000 "(null)"
> ...
> mtd0: a22296c6c756e28 00000000 "(null)"
> mtd0: a22296c6c756e28 3064746d "(null)"
> 
> If we continue doing multiple module load/unload operations, then it will also 
> lead to a kernel crash.
> 
> The reason for this is due to the wrong mtd index used in
> mtd_device_unregister() in the remove function.
> 
> We need to keep the mtd unregister index aligned with the one used in the probe
> function, which means we need to take into account the 'has_second_chip'
> property. By doing so we can guarantee that the mtd index is the same in the
> registration and unregistration functions.
> 
> With this patch applied we can load/unload the fsl-quadspi driver several times
> and it will result in no crash.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

OK, pushed to l2-mtd.git.

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 39763b9..4b468a9 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -227,6 +227,7 @@ struct fsl_qspi {
>  	u32 nor_num;
>  	u32 clk_rate;
>  	unsigned int chip_base_addr; /* We may support two chips. */
> +	bool has_second_chip;
>  };
>  
>  static inline int is_vybrid_qspi(struct fsl_qspi *q)
> @@ -783,7 +784,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
>  	int ret, i = 0;
> -	bool has_second_chip = false;
>  	const struct of_device_id *of_id =
>  			of_match_device(fsl_qspi_dt_ids, &pdev->dev);
>  
> @@ -860,14 +860,14 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		goto irq_failed;
>  
>  	if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
> -		has_second_chip = true;
> +		q->has_second_chip = true;
>  
>  	/* iterate the subnodes. */
>  	for_each_available_child_of_node(dev->of_node, np) {
>  		char modalias[40];
>  
>  		/* skip the holes */
> -		if (!has_second_chip)
> +		if (!q->has_second_chip)
>  			i *= 2;
>  
>  		nor = &q->nor[i];
> @@ -943,9 +943,12 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	return 0;
>  
>  last_init_failed:
> -	for (i = 0; i < q->nor_num; i++)
> +	for (i = 0; i < q->nor_num; i++) {
> +		/* skip the holes */
> +		if (!q->has_second_chip)
> +			i *= 2;
>  		mtd_device_unregister(&q->mtd[i]);
> -
> +	}
>  irq_failed:
>  	clk_disable_unprepare(q->clk);
>  clk_failed:

FYI, the error handling here is still not correct. At least, it's not
exhaustive. If one of the child nodes failed to probe, you don't
actually release any resources or unregister any MTDs.

> @@ -960,8 +963,12 @@ static int fsl_qspi_remove(struct platform_device *pdev)
>  	struct fsl_qspi *q = platform_get_drvdata(pdev);
>  	int i;
>  
> -	for (i = 0; i < q->nor_num; i++)
> +	for (i = 0; i < q->nor_num; i++) {
> +		/* skip the holes */
> +		if (!q->has_second_chip)
> +			i *= 2;
>  		mtd_device_unregister(&q->mtd[i]);
> +	}
>  
>  	/* disable the hardware */
>  	writel(QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);

Brian
