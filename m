Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAKRM-0004hV-J3
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 17:37:38 +0000
Received: by mail-wj0-x244.google.com with SMTP id xy5so6363736wjc.1
 for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2016 09:37:16 -0800 (PST)
Subject: Re: [PATCH v5 1/3] spi-nor: Add support for Intel SPI serial flash
 controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
References: <20161114102447.131602-1-mika.westerberg@linux.intel.com>
 <20161114102447.131602-2-mika.westerberg@linux.intel.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Lee Jones <lee.jones@linaro.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <75195621-aeec-3d83-46ed-74ab1660fd5f@gmail.com>
Date: Fri, 25 Nov 2016 18:26:10 +0100
MIME-Version: 1.0
In-Reply-To: <20161114102447.131602-2-mika.westerberg@linux.intel.com>
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

On 11/14/2016 11:24 AM, Mika Westerberg wrote:
> Add support for the SPI serial flash host controller found on many Intel
> CPUs including Baytrail and Braswell. The SPI serial flash controller is
> used to access BIOS and other platform specific information. By default the
> driver exposes a single read-only MTD device but with a module parameter
> "writeable=1" the MTD device can be made read-write which makes it possible
> to upgrade BIOS directly from Linux.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Only minor nits below. Sorry I took so long with the review.

[...]

> +static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
> +{
> +	unsigned long timeout = jiffies + msecs_to_jiffies(INTEL_SPI_TIMEOUT);
> +	u32 hwstat;

Won't some include/linux/iopoll.h macro help here ?

> +	while (!time_after(jiffies, timeout)) {
> +		hwstat = readl(ispi->base + HSFSTS_CTL);
> +		if (!(hwstat & HSFSTS_CTL_SCIP))
> +			return 0;
> +		cond_resched();
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
> +{
> +	unsigned long timeout = jiffies + msecs_to_jiffies(INTEL_SPI_TIMEOUT);
> +	u32 swstat;
> +
> +	while (!time_after(jiffies, timeout)) {

DTTO

> +		swstat = readl(ispi->sregs + SSFSTS_CTL);
> +		if (!(swstat & SSFSTS_CTL_SCIP))
> +			return 0;
> +		cond_resched();
> +	}
> +
> +	return -ETIMEDOUT;
> +}

[...]

> +static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
> +			      u_char *read_buf)
> +{
> +	struct intel_spi *ispi = nor->priv;
> +	size_t block_size, retlen = 0;
> +	u32 val, status;
> +	ssize_t ret;
> +
> +	switch (nor->read_opcode) {
> +	case SPINOR_OP_READ:
> +	case SPINOR_OP_READ_FAST:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	while (len > 0) {
> +		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
> +
> +		writel(from, ispi->base + FADDR);
> +
> +		val = readl(ispi->base + HSFSTS_CTL);
> +		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> +		val &= ~HSFSTS_CTL_FDBC_MASK;
> +		val |= (block_size - 1) << HSFSTS_CTL_FDBC_SHIFT;
> +		val &= ~HSFSTS_CTL_FCYCLE_MASK;
> +		val |= HSFSTS_CTL_FCYCLE_READ;
> +		val |= HSFSTS_CTL_FGO;

Sort those bit clears and bit sets so you first clear and then set bits.

> +		writel(val, ispi->base + HSFSTS_CTL);
> +
> +		ret = intel_spi_wait_hw_busy(ispi);
> +		if (ret)
> +			return ret;
> +
> +		status = readl(ispi->base + HSFSTS_CTL);
> +		if (status & HSFSTS_CTL_FCERR)
> +			ret = -EIO;
> +		else if (status & HSFSTS_CTL_AEL)
> +			ret = -EACCES;
> +
> +		if (ret < 0) {
> +			dev_err(ispi->dev, "read error: %llx: %#x\n", from,
> +				status);
> +			return ret;
> +		}
> +
> +		ret = intel_spi_read_block(ispi, read_buf, block_size);
> +		if (ret)
> +			return ret;
> +
> +		len -= block_size;
> +		from += block_size;
> +		retlen += block_size;
> +		read_buf += block_size;
> +	}
> +
> +	return retlen;
> +}
> +
> +static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
> +			       const u_char *write_buf)
> +{
> +	struct intel_spi *ispi = nor->priv;
> +	size_t block_size, retlen = 0;
> +	u32 val, status;
> +	ssize_t ret;
> +
> +	while (len > 0) {
> +		block_size = min_t(size_t, len, INTEL_SPI_FIFO_SZ);
> +
> +		writel(to, ispi->base + FADDR);
> +
> +		val = readl(ispi->base + HSFSTS_CTL);
> +		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> +		val &= ~HSFSTS_CTL_FDBC_MASK;
> +		val |= (block_size - 1) << HSFSTS_CTL_FDBC_SHIFT;
> +		val &= ~HSFSTS_CTL_FCYCLE_MASK;
> +		val |= HSFSTS_CTL_FCYCLE_WRITE;

DTTO here.

> +		/* Write enable */
> +		if (ispi->preopcodes[1] == SPINOR_OP_WREN)
> +			val |= SSFSTS_CTL_SPOP;
> +		val |= SSFSTS_CTL_ACS;
> +		writel(val, ispi->base + HSFSTS_CTL);
> +
> +		ret = intel_spi_write_block(ispi, write_buf, block_size);
> +		if (ret) {
> +			dev_err(ispi->dev, "failed to write block\n");
> +			return ret;
> +		}
> +
> +		/* Start the write now */
> +		val = readl(ispi->base + HSFSTS_CTL);
> +		writel(val | HSFSTS_CTL_FGO, ispi->base + HSFSTS_CTL);
> +
> +		ret = intel_spi_wait_hw_busy(ispi);
> +		if (ret) {
> +			dev_err(ispi->dev, "timeout\n");
> +			return ret;
> +		}
> +
> +		status = readl(ispi->base + HSFSTS_CTL);
> +		if (status & HSFSTS_CTL_FCERR)
> +			ret = -EIO;
> +		else if (status & HSFSTS_CTL_AEL)
> +			ret = -EACCES;
> +
> +		if (ret < 0) {
> +			dev_err(ispi->dev, "write error: %llx: %#x\n", to,
> +				status);
> +			return ret;
> +		}
> +
> +		len -= block_size;
> +		to += block_size;
> +		retlen += block_size;
> +		write_buf += block_size;
> +	}
> +
> +	return retlen;
> +}

[...]

-- 
Best regards,
Marek Vasut
