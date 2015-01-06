Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8Nxk-0006jK-HG
 for linux-mtd@lists.infradead.org; Tue, 06 Jan 2015 06:49:57 +0000
Received: by mail-pd0-f174.google.com with SMTP id fp1so29789885pdb.33
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2015 22:49:35 -0800 (PST)
Date: Mon, 5 Jan 2015 22:49:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150106064931.GB13447@norris-Latitude-E6410>
References: <1417814086-30512-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417814086-30512-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Frank.Li@freescale.com,
 shijie8@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Dec 05, 2014 at 07:14:46PM -0200, Fabio Estevam wrote:
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
> The reason for this is due to the wrong mtd index used in
> mtd_device_unregister() in the remove function.
> 
> We need to keep the mtd index aligned with the one used in the probe function,
> which means we need to take into account the 'has_second_chip' property.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
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

Huh? Why was this property even needed in the first place? It seems
oddly specific, without actually being very explanatory/descriptive.

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

Why do you need to "skip" anything here? It doesn't really look like
you're skpping anything functionally, as this indexing is purely
artificial. So you're just jumping through hoops for no reason.

Can this just be more straightforward by dropping 'has_second_chip' and
indexing straightforwardly? e.g. this patch:

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 39763b94f67d..9b11c92ce927 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -782,8 +782,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
-	int ret, i = 0;
-	bool has_second_chip = false;
+	int ret, i;
 	const struct of_device_id *of_id =
 			of_match_device(fsl_qspi_dt_ids, &pdev->dev);
 
@@ -791,8 +790,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q)
 		return -ENOMEM;
 
-	q->nor_num = of_get_child_count(dev->of_node);
-	if (!q->nor_num || q->nor_num > FSL_QSPI_MAX_CHIP)
+	ret = of_get_child_count(dev->of_node);
+	if (!ret || ret > FSL_QSPI_MAX_CHIP)
 		return -ENODEV;
 
 	/* find the resources */
@@ -859,19 +858,12 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto irq_failed;
 
-	if (of_get_property(np, "fsl,qspi-has-second-chip", NULL))
-		has_second_chip = true;
-
 	/* iterate the subnodes. */
 	for_each_available_child_of_node(dev->of_node, np) {
 		char modalias[40];
 
-		/* skip the holes */
-		if (!has_second_chip)
-			i *= 2;
-
-		nor = &q->nor[i];
-		mtd = &q->mtd[i];
+		nor = &q->nor[q->nor_num];
+		mtd = &q->mtd[q->nor_num];
 
 		nor->mtd = mtd;
 		nor->dev = dev;
@@ -929,7 +921,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		if (nor->page_size > q->devtype_data->txfifo)
 			nor->page_size = q->devtype_data->txfifo;
 
-		i++;
+		q->nor_num++;
 	}
 
 	/* finish the rest init. */

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

This error path was already broken, and it still is after your patch.
It's a little less broken after my patch, but you might want to look at
how you unwind from the for_each_available_child_of_node() loop. Also,
note the different between children and available children.

> -
> +	}
>  irq_failed:
>  	clk_disable_unprepare(q->clk);
>  clk_failed:
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
