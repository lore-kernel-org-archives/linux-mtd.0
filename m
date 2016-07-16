Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bODjW-0002Uf-LW
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 00:45:35 +0000
Received: by mail-pf0-x244.google.com with SMTP id g202so7260343pfb.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 17:45:10 -0700 (PDT)
Date: Fri, 15 Jul 2016 17:45:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, marex@denx.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
Message-ID: <20160716004507.GD76613@google.com>
References: <cover.1465830154.git.cyrille.pitchen@atmel.com>
 <4bb63a80dedf92511b2eaa05692afc585cca214b.1465830154.git.cyrille.pitchen@atmel.com>
 <20160714013242.GG54628@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160714013242.GG54628@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

On Wed, Jul 13, 2016 at 06:32:42PM -0700, Brian Norris wrote:
> On Mon, Jun 13, 2016 at 05:10:26PM +0200, Cyrille Pitchen wrote:
> > This driver add support to the new Atmel QSPI controller embedded into
> > sama5d2x SoCs. It expects a NOR memory to be connected to the QSPI
> > controller.
> > 
> > Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> > Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> > ---
> >  drivers/mtd/spi-nor/Kconfig         |   9 +
> >  drivers/mtd/spi-nor/Makefile        |   1 +
> >  drivers/mtd/spi-nor/atmel-quadspi.c | 741 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 751 insertions(+)
> >  create mode 100644 drivers/mtd/spi-nor/atmel-quadspi.c
> > 
> > diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> > index d42c98e1f581..c546efd1357b 100644
> > --- a/drivers/mtd/spi-nor/Kconfig
> > +++ b/drivers/mtd/spi-nor/Kconfig
> > @@ -38,6 +38,15 @@ config SPI_FSL_QUADSPI
> >  	  This controller does not support generic SPI. It only supports
> >  	  SPI NOR.
> >  
> > +config SPI_ATMEL_QUADSPI
> > +	tristate "Atmel Quad SPI Controller"
> > +	depends on ARCH_AT91 || (ARM && COMPILE_TEST)
> > +	depends on OF && HAS_IOMEM
> > +	help
> > +	  This enables support for the Quad SPI controller in master mode.
> > +	  This driver does not support generic SPI. The implementation only
> > +	  supports SPI NOR.
> > +
> >  config SPI_NXP_SPIFI
> >  	tristate "NXP SPI Flash Interface (SPIFI)"
> >  	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> > diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> > index 0bf3a7f81675..1525913698ad 100644
> > --- a/drivers/mtd/spi-nor/Makefile
> > +++ b/drivers/mtd/spi-nor/Makefile
> > @@ -2,3 +2,4 @@ obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
> >  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
> >  obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
> >  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> > +obj-$(CONFIG_SPI_ATMEL_QUADSPI)	+= atmel-quadspi.o
> > diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
> > new file mode 100644
> > index 000000000000..06d1bf276dd0
> > --- /dev/null
> > +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
> > @@ -0,0 +1,741 @@
> 
> [...]
> 
> > +struct atmel_qspi_command {
> > +	union {
> > +		struct {
> > +			u32	instruction:1;
> > +			u32	address:3;
> > +			u32	mode:1;
> > +			u32	dummy:1;
> > +			u32	data:1;
> > +			u32	reserved:25;
> > +		}		bits;
> 
> Are you sure this bitfield is going to do what you want, all the time?
> What about on big-endian architectures? And are you guaranteed it'll
> pack properly, with no padding? IIRC, the answer to the first 2 is "no",
> and I have no idea about the 3rd. Honestly, I've been scared away from
> using bitfields on anything where the ordering mattered, and I thought
> that's because I was hurt by the lack of guarantee once. But I easily
> could be misguided.
> 
> > +		u32	word;
> > +	}	enable;
> > +	u8	instruction;
> > +	u8	mode;
> > +	u8	num_mode_cycles;
> > +	u8	num_dummy_cycles;
> > +	u32	address;
> > +
> > +	size_t		buf_len;
> > +	const void	*tx_buf;
> > +	void		*rx_buf;
> > +};
> > +
> 
> [...]
> 
> > +static int atmel_qspi_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *child, *np = pdev->dev.of_node;
> > +	char modalias[SPI_NAME_SIZE];
> > +	const char *name = NULL;
> > +	struct atmel_qspi *aq;
> > +	struct resource *res;
> > +	struct spi_nor *nor;
> > +	struct mtd_info *mtd;
> > +	int irq, err = 0;
> > +
> > +	if (of_get_child_count(np) != 1)
> > +		return -ENODEV;
> > +	child = of_get_next_child(np, NULL);
> > +
> > +	aq = devm_kzalloc(&pdev->dev, sizeof(*aq), GFP_KERNEL);
> > +	if (!aq) {
> > +		err = -ENOMEM;
> > +		goto exit;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, aq);
> > +	init_completion(&aq->cmd_completion);
> > +	aq->pdev = pdev;
> > +
> > +	/* Map the registers */
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_base");
> > +	aq->regs = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(aq->regs)) {
> > +		dev_err(&pdev->dev, "missing registers\n");
> > +		err = PTR_ERR(aq->regs);
> > +		goto exit;
> > +	}
> > +
> > +	/* Map the AHB memory */
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mmap");
> > +	aq->mem = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(aq->mem)) {
> > +		dev_err(&pdev->dev, "missing AHB memory\n");
> > +		err = PTR_ERR(aq->mem);
> > +		goto exit;
> > +	}
> > +
> > +	/* Get the peripheral clock */
> > +	aq->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(aq->clk)) {
> > +		dev_err(&pdev->dev, "missing peripheral clock\n");
> > +		err = PTR_ERR(aq->clk);
> > +		goto exit;
> > +	}
> > +
> > +	/* Enable the peripheral clock */
> > +	err = clk_prepare_enable(aq->clk);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "failed to enable the peripheral clock\n");
> > +		goto exit;
> > +	}
> > +
> > +	/* Request the IRQ */
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0) {
> > +		dev_err(&pdev->dev, "missing IRQ\n");
> > +		err = irq;
> > +		goto disable_clk;
> > +	}
> > +	err = devm_request_irq(&pdev->dev, irq, atmel_qspi_interrupt,
> > +			       0, dev_name(&pdev->dev), aq);
> > +	if (err)
> > +		goto disable_clk;
> > +
> > +	/* Setup the spi-nor */
> > +	nor = &aq->nor;
> > +	mtd = &nor->mtd;
> > +
> > +	nor->dev = &pdev->dev;
> > +	spi_nor_set_flash_node(nor, child);
> > +	nor->priv = aq;
> > +	mtd->priv = nor;
> > +
> > +	nor->read_reg = atmel_qspi_read_reg;
> > +	nor->write_reg = atmel_qspi_write_reg;
> > +	nor->read = atmel_qspi_read;
> > +	nor->write = atmel_qspi_write;
> > +	nor->erase = atmel_qspi_erase;
> > +
> > +	err = of_modalias_node(child, modalias, sizeof(modalias));
> > +	if (err < 0)
> > +		goto disable_clk;
> > +
> > +	if (strcmp(modalias, "spi-nor"))
> > +		name = modalias;
> 
> What is this modalias handling for? Are you trying to support passing in
> a flash-specific string, like m25p80 does? And you're enforcing that to
> be only the first entry in the 'compatible' list? Seems fragile; m25p80
> is a special case (and it's already fragile) that I'd rather not
> imitate.
> 
> I understand that we discussed extending the use of compatible for
> spi-nor drivers, but I still don't think that issue is resolved. And if
> we are going to extend the use of compatible, then I think we should
> fixup all the spi-nor drivers in the same way.
> 
> > +
> > +	err = of_property_read_u32(child, "spi-max-frequency", &aq->clk_rate);
> > +	if (err < 0)
> > +		goto disable_clk;
> > +
> > +	err = atmel_qspi_init(aq);
> > +	if (err)
> > +		goto disable_clk;
> > +
> > +	err = spi_nor_scan(nor, name, SPI_NOR_QUAD);
> > +	if (err)
> > +		goto disable_clk;
> > +
> > +	err = mtd_device_register(mtd, NULL, 0);
> > +	if (err)
> > +		goto disable_clk;
> > +
> > +	of_node_put(child);
> > +
> > +	return 0;
> > +
> > +disable_clk:
> > +	clk_disable_unprepare(aq->clk);
> > +exit:
> > +	of_node_put(child);
> > +
> > +	return err;
> > +}
> > +
> > +static int atmel_qspi_remove(struct platform_device *pdev)
> > +{
> > +	struct atmel_qspi *aq = platform_get_drvdata(pdev);
> > +
> > +	mtd_device_unregister(&aq->nor.mtd);
> > +	qspi_writel(aq, QSPI_CR, QSPI_CR_QSPIDIS);
> > +	clk_disable_unprepare(aq->clk);
> > +	return 0;
> > +}
> > +
> > +
> > +static const struct of_device_id atmel_qspi_dt_ids[] = {
> > +	{ .compatible = "atmel,sama5d2-qspi" },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, atmel_qspi_dt_ids);
> > +
> > +static struct platform_driver atmel_qspi_driver = {
> > +	.driver = {
> > +		.name	= "atmel_qspi",
> > +		.of_match_table	= atmel_qspi_dt_ids,
> > +	},
> > +	.probe		= atmel_qspi_probe,
> > +	.remove		= atmel_qspi_remove,
> > +};
> > +module_platform_driver(atmel_qspi_driver);
> > +
> > +MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen@atmel.com>");
> > +MODULE_DESCRIPTION("Atmel QSPI Controller driver");
> > +MODULE_LICENSE("GPL v2");
> 
> I'm likely to apply this driver, with the following diff (the bitfield
> issue (if there is one) is less of a maintenance issue), barring any
> major objections.
> 
> diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
> index 06d1bf276dd0..47937d9beec6 100644
> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
> @@ -591,8 +591,6 @@ static irqreturn_t atmel_qspi_interrupt(int irq, void *dev_id)
>  static int atmel_qspi_probe(struct platform_device *pdev)
>  {
>  	struct device_node *child, *np = pdev->dev.of_node;
> -	char modalias[SPI_NAME_SIZE];
> -	const char *name = NULL;
>  	struct atmel_qspi *aq;
>  	struct resource *res;
>  	struct spi_nor *nor;
> @@ -673,13 +671,6 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	nor->write = atmel_qspi_write;
>  	nor->erase = atmel_qspi_erase;
>  
> -	err = of_modalias_node(child, modalias, sizeof(modalias));
> -	if (err < 0)
> -		goto disable_clk;
> -
> -	if (strcmp(modalias, "spi-nor"))
> -		name = modalias;
> -
>  	err = of_property_read_u32(child, "spi-max-frequency", &aq->clk_rate);
>  	if (err < 0)
>  		goto disable_clk;
> @@ -688,7 +679,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	if (err)
>  		goto disable_clk;
>  
> -	err = spi_nor_scan(nor, name, SPI_NOR_QUAD);
> +	err = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>  	if (err)
>  		goto disable_clk;
>  

Applied to l2-mtd.git with that fixup.
