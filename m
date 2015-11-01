Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zt1BZ-00076H-Ml
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2015 22:33:15 +0000
Date: Sun, 1 Nov 2015 23:32:37 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Marek Vasut <marex@denx.de>, Scott
 Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu
 <han.xu@freescale.com>
Subject: Re: [PATCH v2 06/11] mtd: nand: drop unnecessary partition parser data
Message-ID: <20151101233237.21155d9e@bbrezillon>
In-Reply-To: <1446262410-45754-7-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
 <1446262410-45754-7-git-send-email-computersforpeace@gmail.com>
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

On Fri, 30 Oct 2015 20:33:25 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> All of these drivers set up a parser data struct just to communicate DT
> partition data. This field has been deprecated and is instead supported
> by telling nand_scan_ident() about the 'flash_node'.
> 
> This patch:
>  * sets chip->flash_node for those drivers that didn't already (but used
>    OF partitioning)
>  * drops the parser data
>  * switches to the simpler mtd_device_register() where possible, now
>    that we've eliminated one of the auxiliary parameters
> 
> Now that we've assigned chip->flash_node for these drivers, we can
> probably rely on nand_dt_init() to do more of the DT parsing for us, but
> for now, I don't want to fiddle with each of these drivers. The parsing
> is done in duplicate for now on some drivers. I don't think this should
> break things. (Famous last words.)
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> v2: fix compile errors, use new helpers to set the DT node
> 
>  drivers/mtd/nand/atmel_nand.c                 |  7 +++----
>  drivers/mtd/nand/brcmnand/brcmnand.c          |  3 +--
>  drivers/mtd/nand/davinci_nand.c               | 10 +++-------
>  drivers/mtd/nand/fsl_elbc_nand.c              |  5 ++---
>  drivers/mtd/nand/fsl_ifc_nand.c               |  5 ++---
>  drivers/mtd/nand/fsl_upm.c                    |  5 ++---
>  drivers/mtd/nand/fsmc_nand.c                  |  7 +++----
>  drivers/mtd/nand/gpio.c                       |  8 +++-----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c        |  5 ++---
>  drivers/mtd/nand/hisi504_nand.c               |  5 ++---
>  drivers/mtd/nand/lpc32xx_mlc.c                |  7 +++----
>  drivers/mtd/nand/lpc32xx_slc.c                |  7 +++----
>  drivers/mtd/nand/mpc5121_nfc.c                |  5 ++---
>  drivers/mtd/nand/mxc_nand.c                   |  5 ++---
>  drivers/mtd/nand/ndfc.c                       |  5 ++---
>  drivers/mtd/nand/omap2.c                      |  6 ++----
>  drivers/mtd/nand/orion_nand.c                 |  6 ++----
>  drivers/mtd/nand/plat_nand.c                  |  5 ++---
>  drivers/mtd/nand/pxa3xx_nand.c                | 10 +++++-----
>  drivers/mtd/nand/sh_flctl.c                   |  6 ++----
>  drivers/mtd/nand/socrates_nand.c              |  5 ++---
>  drivers/mtd/nand/sunxi_nand.c                 |  4 +---
>  drivers/mtd/nand/vf610_nfc.c                  |  6 +-----
>  drivers/staging/mt29f_spinand/mt29f_spinand.c |  5 ++---
>  24 files changed, 54 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 583cdd9bb971..6ecc1c1ab437 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -2093,7 +2093,6 @@ static int atmel_nand_probe(struct platform_device *pdev)
>  	struct mtd_info *mtd;
>  	struct nand_chip *nand_chip;
>  	struct resource *mem;
> -	struct mtd_part_parser_data ppdata = {};
>  	int res, irq;
>  
>  	/* Allocate memory for the device structure (and zero it) */
> @@ -2117,6 +2116,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
>  	nand_chip = &host->nand_chip;
>  	host->dev = &pdev->dev;
>  	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
> +		nand_set_flash_node(nand_chip, pdev->dev.of_node);
>  		/* Only when CONFIG_OF is enabled of_node can be parsed */
>  		res = atmel_of_init_port(host, pdev->dev.of_node);
>  		if (res)
> @@ -2259,9 +2259,8 @@ static int atmel_nand_probe(struct platform_device *pdev)
>  	}
>  
>  	mtd->name = "atmel_nand";
> -	ppdata.of_node = pdev->dev.of_node;
> -	res = mtd_device_parse_register(mtd, NULL, &ppdata,
> -			host->board.parts, host->board.num_parts);
> +	res = mtd_device_register(mtd, host->board.parts,
> +				  host->board.num_parts);
>  	if (!res)
>  		return res;
>  
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 7bd4102fde42..a37659de025c 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1914,7 +1914,6 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
>  	struct nand_chip *chip;
>  	int ret;
>  	u16 cfg_offs;
> -	struct mtd_part_parser_data ppdata = { .of_node = dn };
>  
>  	ret = of_property_read_u32(dn, "reg", &host->cs);
>  	if (ret) {
> @@ -1993,7 +1992,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
>  	if (nand_scan_tail(mtd))
>  		return -ENXIO;
>  
> -	return mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> +	return mtd_device_register(mtd, NULL, 0);
>  }
>  
>  static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
> index c72313d66cf6..8e351af31e53 100644
> --- a/drivers/mtd/nand/davinci_nand.c
> +++ b/drivers/mtd/nand/davinci_nand.c
> @@ -684,6 +684,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
>  
>  	info->mtd.priv		= &info->chip;
>  	info->mtd.dev.parent	= &pdev->dev;
> +	nand_set_flash_node(&info->chip, pdev->dev.of_node);
>  
>  	info->chip.IO_ADDR_R	= vaddr;
>  	info->chip.IO_ADDR_W	= vaddr;
> @@ -839,13 +840,8 @@ syndrome_done:
>  	if (pdata->parts)
>  		ret = mtd_device_parse_register(&info->mtd, NULL, NULL,
>  					pdata->parts, pdata->nr_parts);
> -	else {
> -		struct mtd_part_parser_data	ppdata;
> -
> -		ppdata.of_node = pdev->dev.of_node;
> -		ret = mtd_device_parse_register(&info->mtd, NULL, &ppdata,
> -						NULL, 0);
> -	}
> +	else
> +		ret = mtd_device_register(&info->mtd, NULL, 0);
>  	if (ret < 0)
>  		goto err;
>  
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> index dcb1f7f4873f..850546dc98c8 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -748,6 +748,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  	/* Fill in fsl_elbc_mtd structure */
>  	priv->mtd.priv = chip;
>  	priv->mtd.dev.parent = priv->dev;
> +	chip->flash_node = priv->dev->of_node;

Shouldn't we use the nand_set_flash_node() helper here? Here is a diff replacing
all 'chip->flash_node =' occurrences by nand_set_flash_node():

---->8----

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 850546d..bd6d493 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -748,7 +748,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	/* Fill in fsl_elbc_mtd structure */
 	priv->mtd.priv = chip;
 	priv->mtd.dev.parent = priv->dev;
-	chip->flash_node = priv->dev->of_node;
+	nand_set_flash_node(chip, priv->dev->of_node);
 
 	/* set timeout to maximum */
 	priv->fmr = 15 << FMR_CWTO_SHIFT;
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 8ae2a23..f260831 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -883,7 +883,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	/* Fill in fsl_ifc_mtd structure */
 	priv->mtd.priv = chip;
 	priv->mtd.dev.parent = priv->dev;
-	chip->flash_node = priv->dev->of_node;
+	nand_set_flash_node(chip, priv->dev->of_node);
 
 	/* fill in nand_chip structure */
 	/* set up function call table */
diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index ffe416c..b3f4a01 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -181,7 +181,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (!flash_np)
 		return -ENODEV;
 
-	fun->chip.flash_node = flash_np;
+	nand_set_flash_node(&fun->chip, flash_np);
 	fun->mtd.name = kasprintf(GFP_KERNEL, "0x%llx.%s", (u64)io_res->start,
 				  flash_np->name);
 	if (!fun->mtd.name) {
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 289a48c..d57a07a 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -267,7 +267,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		chip->dev_ready = gpio_nand_devready;
 	}
 
-	chip->flash_node	= pdev->dev.of_node;
+	nand_set_flash_node(chip, pdev->dev.of_node);
 	chip->IO_ADDR_W		= chip->IO_ADDR_R;
 	chip->ecc.mode		= NAND_ECC_SOFT;
 	chip->options		= gpiomtd->plat.options;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 90e49cc..5a9b696 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1900,7 +1900,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 
 	/* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
 	chip->priv		= this;
-	chip->flash_node	= this->pdev->dev.of_node;
+	nand_set_flash_node(chip, this->pdev->dev.of_node);
 	chip->select_chip	= gpmi_select_chip;
 	chip->cmd_ctrl		= gpmi_cmd_ctrl;
 	chip->dev_ready		= gpmi_dev_ready;
diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 3ccad8c..57c4b71 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -681,7 +681,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	host->pdata = dev_get_platdata(&pdev->dev);
 
 	nand_chip->priv = host;		/* link the private data structures */
-	nand_chip->flash_node = pdev->dev.of_node;
+	nand_set_flash_node(nand_chip, pdev->dev.of_node);
 	mtd->priv = nand_chip;
 	mtd->dev.parent = &pdev->dev;
 
diff --git a/drivers/mtd/nand/lpc32xx_slc.c b/drivers/mtd/nand/lpc32xx_slc.c
index 9cb8206..277626e 100644
--- a/drivers/mtd/nand/lpc32xx_slc.c
+++ b/drivers/mtd/nand/lpc32xx_slc.c
@@ -802,7 +802,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	mtd = &host->mtd;
 	chip = &host->nand_chip;
 	chip->priv = host;
-	chip->flash_node = pdev->dev.of_node;
+	nand_set_flash_node(chip, pdev->dev.of_node);
 	mtd->priv = chip;
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &pdev->dev;
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 0fc4f3a..7922d31 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1524,7 +1524,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this->chip_delay = 5;
 
 	this->priv = host;
-	this->flash_node = pdev->dev.of_node,
+	nand_set_flash_node(this, pdev->dev.of_node),
 	this->dev_ready = mxc_nand_dev_ready;
 	this->cmdfunc = mxc_nand_command;
 	this->read_byte = mxc_nand_read_byte;
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 33718dc..e307576 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1687,7 +1687,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	mtd->dev.parent		= &pdev->dev;
 	nand_chip		= &info->nand;
 	nand_chip->ecc.priv	= NULL;
-	nand_chip->flash_node	= pdata->of_node;
+	nand_set_flash_node(nand_chip, pdata->of_node);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nand_chip->IO_ADDR_R = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 0728ddc..5c21416 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -126,7 +126,7 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	nc->priv = board;
-	nc->flash_node = pdev->dev.of_node;
+	nand_set_flash_node(nc, pdev->dev.of_node);
 	nc->IO_ADDR_R = nc->IO_ADDR_W = io_base;
 	nc->cmd_ctrl = orion_nand_cmd_ctrl;
 	nc->read_buf = orion_nand_read_buf;
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 034becc..06ac6c6 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -57,7 +57,7 @@ static int plat_nand_probe(struct platform_device *pdev)
 		return PTR_ERR(data->io_base);
 
 	data->chip.priv = &data;
-	data->chip.flash_node = pdev->dev.of_node;
+	nand_set_flash_node(&data->chip, pdev->dev.of_node);
 	data->mtd.priv = &data->chip;
 	data->mtd.dev.parent = &pdev->dev;
 
diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index ec2ade9..57dc525 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1122,7 +1122,7 @@ static int flctl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, flctl);
 	flctl_mtd = &flctl->mtd;
 	nand = &flctl->chip;
-	nand->flash_node = pdev->dev.of_node;
+	nand_set_flash_node(nand, pdev->dev.of_node);
 	flctl_mtd->priv = nand;
 	flctl_mtd->dev.parent = &pdev->dev;
 	flctl->pdev = pdev;
diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index f935985..bde4043 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -164,7 +164,7 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	host->dev = &ofdev->dev;
 
 	nand_chip->priv = host;		/* link the private data structures */
-	nand_chip->flash_node = ofdev->dev.of_node;
+	nand_set_flash_node(nand_chip, ofdev->dev.of_node);
 	mtd->priv = nand_chip;
 	mtd->name = "socrates_nand";
 	mtd->dev.parent = &ofdev->dev;
diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index bd9b5b0..49807de 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -896,7 +896,7 @@ static int spinand_probe(struct spi_device *spi_nand)
 		pr_info("%s: disable ecc failed!\n", __func__);
 #endif
 
-	chip->flash_node = spi_nand->dev.of_node;
+	nand_set_flash_node(chip, spi_nand->dev.of_node);
 	chip->priv	= info;
 	chip->read_buf	= spinand_read_buf;
 	chip->write_buf	= spinand_write_buf;
