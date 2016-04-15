Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arC4A-0008Lg-Oo
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 22:18:19 +0000
Message-ID: <5711687B.5030209@denx.de>
Date: Sat, 16 Apr 2016 00:17:31 +0200
From: Marek Vasut <marex@denx.de>
MIME-Version: 1.0
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
CC: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 8/8] mtd: atmel-quadspi: add driver for Atmel QSPI
 controller
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
 <be9fcd1c8dd7a6ae076b700ff6a54f028021295a.1460567256.git.cyrille.pitchen@atmel.com>
In-Reply-To: <be9fcd1c8dd7a6ae076b700ff6a54f028021295a.1460567256.git.cyrille.pitchen@atmel.com>
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

On 04/13/2016 07:23 PM, Cyrille Pitchen wrote:
> This driver add support to the new Atmel QSPI controller embedded into
> sama5d2x SoCs. It expects a NOR memory to be connected to the QSPI
> controller.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

[...]

> +static int atmel_qspi_run_transfer(struct atmel_qspi *aq,
> +				   const struct atmel_qspi_command *cmd)
> +{
> +	void __iomem *ahb_mem;
> +
> +	/* Then fallback to a PIO transfer (memcpy() DOES NOT work!) */

My first reaction when reading this comment was "HUH?" . Can you explain
the problem a bit better please ?

> +	ahb_mem = aq->mem;
> +	if (cmd->enable.bits.address)
> +		ahb_mem += cmd->address;
> +	if (cmd->tx_buf)
> +		_memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
> +	else
> +		_memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);

Why the leading underscore ?

> +	return 0;
> +}

[...]

> +static int atmel_qspi_probe(struct platform_device *pdev)
> +{
> +	struct device_node *child, *np = pdev->dev.of_node;
> +	struct spi_nor_modes modes = {
> +		.id_modes = (SNOR_MODE_1_1_1 |
> +			     SNOR_MODE_2_2_2 |
> +			     SNOR_MODE_4_4_4),
> +		.rd_modes = (SNOR_MODE_SLOW |
> +			     SNOR_MODE_1_1_1 |
> +			     SNOR_MODE_1_1_2 |
> +			     SNOR_MODE_1_2_2 |
> +			     SNOR_MODE_2_2_2 |
> +			     SNOR_MODE_1_1_4 |
> +			     SNOR_MODE_1_4_4 |
> +			     SNOR_MODE_4_4_4),
> +		.wr_modes = (SNOR_MODE_1_1_1 |
> +			     SNOR_MODE_1_1_2 |
> +			     SNOR_MODE_1_2_2 |
> +			     SNOR_MODE_2_2_2 |
> +			     SNOR_MODE_1_1_4 |
> +			     SNOR_MODE_1_4_4 |
> +			     SNOR_MODE_4_4_4),
> +	};
> +	char modalias[SPI_NAME_SIZE];
> +	const char *name = NULL;
> +	struct atmel_qspi *aq;
> +	struct resource *res;
> +	struct spi_nor *nor;
> +	struct mtd_info *mtd;
> +	int irq, err = 0;
> +
> +	if (of_get_child_count(np) != 1)
> +		return -ENODEV;
> +	child = of_get_next_child(np, NULL);
> +
> +	aq = devm_kzalloc(&pdev->dev, sizeof(*aq), GFP_KERNEL);
> +	if (!aq) {
> +		err = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	platform_set_drvdata(pdev, aq);
> +	init_completion(&aq->cmd_completion);
> +	aq->pdev = pdev;
> +
> +	/* Map the registers */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_base");
> +	aq->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(aq->regs)) {
> +		dev_err(&pdev->dev, "missing registers\n");
> +		err = PTR_ERR(aq->regs);
> +		goto exit;
> +	}
> +
> +	/* Map the AHB memory */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qspi_mmap");
> +	aq->mem = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(aq->mem)) {
> +		dev_err(&pdev->dev, "missing AHB memory\n");
> +		err = PTR_ERR(aq->mem);
> +		goto exit;
> +	}
> +
> +	/* Get the peripheral clock */
> +	aq->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(aq->clk)) {
> +		dev_err(&pdev->dev, "missing peripheral clock\n");
> +		err = PTR_ERR(aq->clk);
> +		goto exit;
> +	}
> +
> +	/* Enable the peripheral clock */
> +	err = clk_prepare_enable(aq->clk);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to enable the peripheral clock\n");
> +		goto exit;
> +	}
> +
> +	/* Request the IRQ */
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "missing IRQ\n");
> +		err = irq;
> +		goto disable_clk;
> +	}
> +	err = devm_request_irq(&pdev->dev, irq, atmel_qspi_interrupt,
> +			       0, dev_name(&pdev->dev), aq);
> +	if (err)
> +		goto disable_clk;
> +
> +	/* Setup the spi-nor */

Can you extract this into a separate function? I think this "setup spi
nor" part is starting to turn into a nice boilerplate code :) It'd be
nice to have it readily isolated and prepared for factoring out once
the time comes.

Does this controller support multiple SPI NORs ?

> +	nor = &aq->nor;
> +	mtd = &nor->mtd;
> +
> +	nor->dev = &pdev->dev;
> +	spi_nor_set_flash_node(nor, child);
> +	nor->priv = aq;
> +	mtd->priv = nor;
> +
> +	nor->read_reg = atmel_qspi_read_reg;
> +	nor->write_reg = atmel_qspi_write_reg;
> +	nor->read = atmel_qspi_read;
> +	nor->write = atmel_qspi_write;
> +	nor->erase = atmel_qspi_erase;
> +
> +	err = of_modalias_node(child, modalias, sizeof(modalias));
> +	if (err < 0)
> +		goto disable_clk;
> +
> +	if (strcmp(modalias, "spi-nor"))
> +		name = modalias;
> +
> +	err = of_property_read_u32(child, "spi-max-frequency", &aq->clk_rate);
> +	if (err < 0)
> +		goto disable_clk;
> +
> +	err = atmel_qspi_init(aq);
> +	if (err)
> +		goto disable_clk;
> +
> +	err = spi_nor_scan(nor, name, &modes);
> +	if (err)
> +		goto disable_clk;
> +
> +	err = mtd_device_register(mtd, NULL, 0);
> +	if (err)
> +		goto disable_clk;
> +
> +	of_node_put(child);
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(aq->clk);
> +exit:
> +	of_node_put(child);
> +
> +	return err;
> +}
> +
> +static int atmel_qspi_remove(struct platform_device *pdev)
> +{
> +	struct atmel_qspi *aq = platform_get_drvdata(pdev);
> +
> +	mtd_device_unregister(&aq->nor.mtd);
> +	qspi_writel(aq, QSPI_CR, QSPI_CR_QSPIDIS);
> +	clk_disable_unprepare(aq->clk);
> +	return 0;
> +}
> +
> +
> +static const struct of_device_id atmel_qspi_dt_ids[] = {
> +	{ .compatible = "atmel,sama5d2-qspi" },

Oh neat :)

> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, atmel_qspi_dt_ids);
> +
> +static struct platform_driver atmel_qspi_driver = {
> +	.driver = {
> +		.name	= "atmel_qspi",
> +		.of_match_table	= atmel_qspi_dt_ids,
> +	},
> +	.probe		= atmel_qspi_probe,
> +	.remove		= atmel_qspi_remove,
> +};
> +module_platform_driver(atmel_qspi_driver);
> +
> +MODULE_AUTHOR("Cyrille Pitchen <cyrille.pitchen@atmel.com>");
> +MODULE_DESCRIPTION("Atmel QSPI Controller driver");
> +MODULE_LICENSE("GPL v2");
> 


-- 
Best regards,
Marek Vasut
