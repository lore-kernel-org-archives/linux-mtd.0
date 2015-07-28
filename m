Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK9Ib-00036C-Hl
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 18:08:22 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V6 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Tue, 28 Jul 2015 20:07:56 +0200
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Vikas MANOCHA <vikas.manocha@st.com>, linux-kernel@vger.kernel.org,
 Alan Tull <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>
References: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
 <1438105083-19738-2-git-send-email-grmoore@opensource.altera.com>
In-Reply-To: <1438105083-19738-2-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507282007.56506.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 07:38:03 PM, Graham Moore wrote:

DTTO here.

Thanks a lot for working on the driver though -- would you like me to continue 
reviewing or just take over please ?

> Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
> ---
> V2: use NULL instead of modalias in spi_nor_scan call
> V3: Use existing property is-decoded-cs instead of creating duplicate.
> V4: Support Micron quad mode by snooping command stream for EVCR command
> and subsequently configuring Cadence controller for quad mode.
> V5: Clean up sparse and smatch complaints.  Remove snooping of Micron
> quad mode.  Add comment on XIP mode bit and dummy clock cycles.  Set
> up SRAM partition at 1:1 during init.
> V6: Remove dts patch that was included by mistake.  Incorporate Vikas's
> comments regarding fifo width, SRAM partition setting, and trigger
> address.  Trigger address was added as an unsigned int, as it is not
> an IO resource per se, and does not need to be mapped. Also add
> Marek Vasut's workaround for picking up OF properties on subnodes.

I don't think that's the correct thing to do with the OF nodes btw ;-)

[...]

> +#define CQSPI_REG_IS_IDLE(base)						\
> +		((readl(base + CQSPI_REG_CONFIG) >>		\
> +			CQSPI_REG_CONFIG_IDLE_LSB) & 0x1)

This should be a function (if needed).

> +#define CQSPI_GET_RD_SRAM_LEVEL(reg_base)				\
> +		(((readl(reg_base + CQSPI_REG_SDRAMLEVEL)) >>	\
> +		CQSPI_REG_SDRAMLEVEL_RD_LSB) & CQSPI_REG_SDRAMLEVEL_RD_MASK)

DTTO.

> +static unsigned int cqspi_init_timeout(unsigned long timeout_in_ms)
> +{
> +	return jiffies + msecs_to_jiffies(timeout_in_ms);
> +}

This in turn might better be wrapped into the code.

> +static unsigned int cqspi_check_timeout(unsigned long timeout)
> +{
> +	return time_before(jiffies, timeout);
> +}

DTTO.

[...]

> +static int cqspi_indirect_read_setup(struct spi_nor *nor,
> +				     unsigned int from_addr)
> +{
> +	unsigned int reg;
> +	unsigned int dummy_clk = 0;
> +	struct cqspi_st *cqspi = nor->priv;
> +	void __iomem *reg_base = cqspi->iobase;
> +
> +	writel(cqspi->trigger_address,
> +	       reg_base + CQSPI_REG_INDIRECTTRIGGER);
> +	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
> +
> +	reg = nor->read_opcode << CQSPI_REG_RD_INSTR_OPCODE_LSB;
> +	reg |= cqspi_calc_rdreg(nor, nor->read_opcode);
> +
> +	/* Setup dummy clock cycles */
> +#define CQSPI_SUPPORT_XIP_CHIPS

What's this supposed to do ? Should this be compile-time config or
should this be in DT ?

> +#ifdef CQSPI_SUPPORT_XIP_CHIPS
> +	/*
> +	 * Set mode bits high to ensure chip doesn't enter XIP.
> +	 * This results in an extra 8 dummy clocks so
> +	 * we must account for them.
> +	 */
> +	writel(0xFF, reg_base + CQSPI_REG_MODE_BIT);
> +	reg |= (1 << CQSPI_REG_RD_INSTR_MODE_EN_LSB);
> +	if (nor->read_dummy >= 8)
> +		dummy_clk = nor->read_dummy - 8;
> +	else
> +		dummy_clk = 0;
> +#else
> +	dummy_clk = nor->read_dummy;
> +#endif
> +	reg |= (dummy_clk & CQSPI_REG_RD_INSTR_DUMMY_MASK)
> +	    << CQSPI_REG_RD_INSTR_DUMMY_LSB;
> +
> +	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +
> +	/* Set address width */
> +	reg = readl(reg_base + CQSPI_REG_SIZE);
> +	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
> +	reg |= (nor->addr_width - 1);
> +	writel(reg, reg_base + CQSPI_REG_SIZE);
> +	return 0;
> +}

[...]

> +static void cqspi_switch_cs(struct cqspi_st *cqspi, unsigned int cs)
> +{
> +	unsigned int reg;
> +	struct cqspi_flash_pdata *f_pdata = &cqspi->f_pdata[cs];
> +	void __iomem *iobase = cqspi->iobase;
> +	struct spi_nor *nor = &f_pdata->nor;
> +
> +	cqspi_controller_disable(cqspi);
> +
> +	/* configure page size and block size. */
> +	reg = readl(iobase + CQSPI_REG_SIZE);
> +	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
> +	reg &= ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOCK_LSB);
> +	reg |= (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
> +	reg |= (ilog2(nor->mtd->erasesize) << CQSPI_REG_SIZE_BLOCK_LSB);
> +	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
> +	reg |= (nor->addr_width - 1);

This could use some reordering -- probably clear bits first, set second.

> +	writel(reg, iobase + CQSPI_REG_SIZE);
> +
> +	/* configure the chip select */
> +	cqspi_chipselect(cqspi, cs, cqspi->is_decoded_cs);
> +
> +	cqspi_controller_enable(cqspi);
> +}

[...]

> +static int cqspi_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct mtd_part_parser_data ppdata;
> +	struct device *dev = &pdev->dev;
> +	struct cqspi_st *cqspi;
> +	struct spi_nor *nor;
> +	struct mtd_info *mtd;
> +	struct resource *res;
> +	struct resource *res_ahb;
> +	int ret;
> +	int irq;
> +
> +	cqspi = devm_kzalloc(dev, sizeof(*cqspi), GFP_KERNEL);
> +	if (!cqspi)
> +		return -ENOMEM;
> +
> +	cqspi->pdev = pdev;
> +	platform_set_drvdata(pdev, cqspi);
> +
> +	ret = cqspi_of_get_pdata(pdev);
> +	if (ret) {
> +		dev_err(dev, "Get platform data failed.\n");
> +		return -ENODEV;
> +	}
> +
> +	cqspi->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(cqspi->clk)) {
> +		dev_err(dev, "cannot get qspi clk\n");
> +		ret = PTR_ERR(cqspi->clk);
> +		goto probe_failed;
> +	}
> +	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	cqspi->iobase = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(cqspi->iobase)) {
> +		dev_err(dev, "devm_ioremap_resource res 0 failed\n");
> +		ret = PTR_ERR(cqspi->iobase);
> +		goto probe_failed;
> +	}
> +
> +	res_ahb = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	cqspi->ahb_phy_addr = res_ahb->start;
> +	cqspi->ahb_base = devm_ioremap_resource(dev, res_ahb);
> +	if (IS_ERR(cqspi->ahb_base)) {
> +		dev_err(dev, "devm_ioremap_resource res 1 failed\n");
> +		ret = PTR_ERR(cqspi->ahb_base);
> +		goto probe_failed;
> +	}
> +
> +	init_completion(&cqspi->transfer_complete);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "platform_get_irq failed\n");
> +		ret = -ENXIO;
> +		goto probe_failed;
> +	}
> +	ret = devm_request_irq(dev, irq,
> +			       cqspi_irq_handler, 0, pdev->name, cqspi);
> +	if (ret) {
> +		dev_err(dev, "devm_request_irq failed\n");
> +		goto probe_failed;
> +	}
> +
> +	cqspi_wait_idle(cqspi);
> +	cqspi_controller_init(cqspi);
> +	cqspi->current_cs = -1;
> +	cqspi->sclk = 0;
> +
> +	/* Get flash device data */
> +	for_each_available_child_of_node(dev->of_node, np) {
> +		unsigned int cs;
> +		struct cqspi_flash_pdata *f_pdata;
> +
> +		if (of_property_read_u32(np, "reg", &cs)) {
> +			dev_err(dev, "couldn't determine chip select\n");
> +			return -ENXIO;
> +		}
> +		if (cs >= CQSPI_MAX_CHIPSELECT) {
> +			dev_err(dev, "chip select %d out of range\n", cs);
> +			return -ENXIO;
> +		}
> +		f_pdata = &cqspi->f_pdata[cs];
> +
> +		ret = cqspi_of_get_flash_pdata(pdev, f_pdata, np);
> +		if (ret)
> +			goto probe_failed;
> +
> +		nor = &f_pdata->nor;
> +		mtd = &f_pdata->mtd;
> +
> +		nor->mtd = mtd;
> +		nor->dev = dev;
> +		nor->priv = cqspi;
> +		mtd->priv = nor;
> +
> +		nor->read_reg = cqspi_read_reg;
> +		nor->write_reg = cqspi_write_reg;
> +		nor->read = cqspi_read;
> +		nor->write = cqspi_write;
> +		nor->erase = cqspi_erase;
> +
> +		nor->prepare = cqspi_prep;
> +
> +		/*
> +		 * Here is a 'nasty hack' from Marek Vasut to pick
> +		 * up OF properties from flash device subnode.
> +		 */
> +		nor->dev->of_node = np;

WARNING: HERE IS A HACK! This is true indeed, can someone please give
                         feedback on how to do this right ?

> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		if (ret)
> +			goto probe_failed;
> +
> +		if (nor->read_dummy > CQSPI_DUMMY_CLKS_MAX)
> +			nor->read_dummy = CQSPI_DUMMY_CLKS_MAX;
> +
> +		ppdata.of_node = np;
> +		ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> +		if (ret)
> +			goto probe_failed;
> +	}

[...]
