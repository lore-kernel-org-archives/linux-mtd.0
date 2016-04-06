Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anqkl-0003i6-4U
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 16:56:27 +0000
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
To: Marek Vasut <marex@denx.de>, <linux-mtd@lists.infradead.org>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <1452486886-8049-2-git-send-email-marex@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, <devicetree@vger.kernel.org>
From: "R, Vignesh" <vigneshr@ti.com>
Message-ID: <57053F81.70204@ti.com>
Date: Wed, 6 Apr 2016 22:25:29 +0530
MIME-Version: 1.0
In-Reply-To: <1452486886-8049-2-git-send-email-marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

I encountered a issue with this driver while testing.

On 1/11/2016 10:04 AM, Marek Vasut wrote:
> From: Graham Moore <grmoore@opensource.altera.com>
> 
> Add support for the Cadence QSPI controller. This controller is
> present in the Altera SoCFPGA SoCs and this driver has been tested
> on the Cyclone V SoC.


> +static void cqspi_switch_cs(struct spi_nor *nor)
> +{
> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> +	void __iomem *iobase = cqspi->iobase;
> +	unsigned int reg;
> +
> +	cqspi_controller_enable(cqspi, 0);
> +
> +	/* configure page size and block size. */
> +	reg = readl(iobase + CQSPI_REG_SIZE);
> +	reg &= ~(CQSPI_REG_SIZE_PAGE_MASK << CQSPI_REG_SIZE_PAGE_LSB);
> +	reg &= ~(CQSPI_REG_SIZE_BLOCK_MASK << CQSPI_REG_SIZE_BLOCK_LSB);
> +	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
> +	reg |= (nor->page_size << CQSPI_REG_SIZE_PAGE_LSB);
> +	reg |= (ilog2(nor->mtd.erasesize) << CQSPI_REG_SIZE_BLOCK_LSB);
> +	reg |= (nor->addr_width - 1);
> +	writel(reg, iobase + CQSPI_REG_SIZE);
> +

Page size and block size are configured here...

> +	/* configure the chip select */
> +	cqspi_chipselect(nor);
> +
> +	cqspi_controller_enable(cqspi, 1);
> +}
> +
> +static int cqspi_prep(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> +	const unsigned int sclk = f_pdata->clk_rate;
> +
> +	/* Switch chip select. */
> +	if (cqspi->current_cs != f_pdata->cs) {
> +		cqspi->current_cs = f_pdata->cs;
> +		cqspi_switch_cs(nor);

cqspi_switch_cs(nor) is called from cqspi_prep(). And is called only
once for a given slave (assuming only one slave on the QSPI bus)

> +	}
> +
> +	/* Setup baudrate divisor and delays */
> +	if (cqspi->sclk != sclk) {
> +		cqspi->sclk = sclk;
> +		cqspi_controller_enable(cqspi, 0);
> +		cqspi_config_baudrate_div(cqspi, sclk);
> +		cqspi_delay(nor, sclk);
> +		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
> +		cqspi_controller_enable(cqspi, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cqspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
> +{
> +	int ret;
> +
> +	ret = cqspi_set_protocol(nor, nor->reg_proto);
> +	if (ret)
> +		return ret;
> +
> +	cqspi_prep(nor, SPI_NOR_OPS_READ);

cqspi_read_reg() is first called to read JEDEC ID, this calls
cqspi_prep() for first time. But nor->page_size, nor->mtd.erasesize are
not yet populated. Therefore cqspi_switch_cs() will not populate
CQSPI_REG_SIZE with correct values.
I think its better to configure this register each time during
read/write ops.

Regards
Vignesh
