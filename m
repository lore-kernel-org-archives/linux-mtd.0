Received: from bear.ext.ti.com ([198.47.19.11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCgd2-00022Q-14
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 05:11:08 +0000
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
To: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <575F91B2.7010304@ti.com>
Date: Tue, 14 Jun 2016 10:40:10 +0530
MIME-Version: 1.0
In-Reply-To: <1465000774-7762-2-git-send-email-marex@denx.de>
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

Hi,

On Saturday 04 June 2016 06:09 AM, Marek Vasut wrote:
[...]
> +
> +static int cqspi_indirect_read_execute(struct spi_nor *nor,
> +				       u8 *rxbuf, const unsigned n_rx)
> +{
> +	struct cqspi_flash_pdata *f_pdata = nor->priv;
> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> +	void __iomem *reg_base = cqspi->iobase;
> +	void __iomem *ahb_base = cqspi->ahb_base;
> +	unsigned int remaining = n_rx;
> +	unsigned int bytes_to_read = 0;
> +	int ret = 0;
> +
> +	writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
> +
> +	/* Clear all interrupts. */
> +	writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
> +
> +	writel(CQSPI_IRQ_MASK_RD, reg_base + CQSPI_REG_IRQMASK);
> +
> +	reinit_completion(&cqspi->transfer_complete);
> +	writel(CQSPI_REG_INDIRECTRD_START_MASK,
> +	       reg_base + CQSPI_REG_INDIRECTRD);
> +
> +	while (remaining > 0) {
> +		ret = wait_for_completion_timeout(&cqspi->transfer_complete,
> +						  msecs_to_jiffies
> +						  (CQSPI_READ_TIMEOUT_MS));
> +
> +		bytes_to_read = cqspi_get_rd_sram_level(cqspi);
> +
> +		if (!ret && bytes_to_read == 0) {
> +			dev_err(nor->dev, "Indirect read timeout, no bytes\n");
> +			ret = -ETIMEDOUT;
> +			goto failrd;
> +		}
> +
> +		while (bytes_to_read != 0) {
> +			bytes_to_read *= cqspi->fifo_width;
> +			bytes_to_read = bytes_to_read > remaining ?
> +					remaining : bytes_to_read;
> +			readsl(ahb_base, rxbuf, DIV_ROUND_UP(bytes_to_read, 4));
> +			rxbuf += bytes_to_read;
> +			remaining -= bytes_to_read;
> +			bytes_to_read = cqspi_get_rd_sram_level(cqspi);
> +		}
> +
> +		if (remaining > 0)
> +			reinit_completion(&cqspi->transfer_complete);
> +	}
> +
> +	/* Check indirect done status */
> +	ret = cqspi_wait_for_bit(reg_base + CQSPI_REG_INDIRECTRD,
> +				 CQSPI_REG_INDIRECTRD_DONE_MASK, 0);
> +

I was wondering if its better to use direct access mode[1]. With this
mode there is no need to wait for IRQ or monitor sdram level. By setting
up QSPI in direct access mode, this entire function can be replaced by:
memcpy(buf, cqspi->ahb_base + from, n_rx)

IMO, this might give better throughput. Have tested this mode?

[1] https://documentation.altera.com/#/00038604-AA$AA00045811



-- 
Regards
Vignesh
