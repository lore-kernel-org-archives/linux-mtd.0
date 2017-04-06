Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwClB-0007tS-1V
 for linux-mtd@lists.infradead.org; Thu, 06 Apr 2017 19:08:02 +0000
Received: from player688.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 89DA248D6F
 for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2017 21:07:30 +0200 (CEST)
Subject: Re: [PATCH 03/10] mtd: spi-nor: aspeed: add DMA support
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-4-git-send-email-clg@kaod.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <c9542192-6bbf-0778-95fb-2da167884012@wedev4u.fr>
Date: Thu, 6 Apr 2017 21:07:19 +0200
MIME-Version: 1.0
In-Reply-To: <1491497808-25487-4-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cédric,

Le 06/04/2017 à 18:56, Cédric Le Goater a écrit :
> The Aspeed FMC controller can handle transfers to the flash modules
> using DMAs. A couple of registers first need to be programmed with the
> DRAM and flash addresses and the length of the transfer. The transfer
> is then initiated using a DMA control register and an interrupt
> notifies the completion.
> 
> Such transfers can replace the current IO mode in the read/write ops
> when some conditions are met on the size and the alignment. In case of
> failure, a timeout for instance, the operation is restarted using the
> IO mode.
> 
> DMA support does not seem to be that efficient. So we provide some
> sysfs files for tuning and to switch it on and off (default is off)
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 231 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 231 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index a98d454d07ed..7dfa1ea0a787 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -11,6 +11,8 @@
>  
>  #include <linux/bug.h>
>  #include <linux/device.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -40,6 +42,7 @@ struct aspeed_smc_info {
>  	bool hastype;		/* flash type field exists in config reg */
>  	u8 we0;			/* shift for write enable bit for CE0 */
>  	u8 ctl0;		/* offset in regs of ctl for CE0 */
> +	bool has_dma;
>  
>  	void (*set_4b)(struct aspeed_smc_chip *chip);
>  };
> @@ -53,6 +56,7 @@ static const struct aspeed_smc_info fmc_2400_info = {
>  	.hastype = true,
>  	.we0 = 16,
>  	.ctl0 = 0x10,
> +	.has_dma = true,
>  	.set_4b = aspeed_smc_chip_set_4b,
>  };
>  
> @@ -62,6 +66,7 @@ static const struct aspeed_smc_info spi_2400_info = {
>  	.hastype = false,
>  	.we0 = 0,
>  	.ctl0 = 0x04,
> +	.has_dma = false,
>  	.set_4b = aspeed_smc_chip_set_4b_spi_2400,
>  };
>  
> @@ -71,6 +76,7 @@ static const struct aspeed_smc_info fmc_2500_info = {
>  	.hastype = true,
>  	.we0 = 16,
>  	.ctl0 = 0x10,
> +	.has_dma = true,
>  	.set_4b = aspeed_smc_chip_set_4b,
>  };
>  
> @@ -80,6 +86,7 @@ static const struct aspeed_smc_info spi_2500_info = {
>  	.hastype = false,
>  	.we0 = 16,
>  	.ctl0 = 0x10,
> +	.has_dma = false,
>  	.set_4b = aspeed_smc_chip_set_4b,
>  };
>  
> @@ -97,6 +104,7 @@ struct aspeed_smc_chip {
>  	struct aspeed_smc_controller *controller;
>  	void __iomem *ctl;			/* control register */
>  	void __iomem *ahb_base;			/* base of chip window */
> +	unsigned long phys_base;		/* physical address of window */
>  	u32 ctl_val[smc_max];			/* control settings */
>  	enum aspeed_smc_flash_type type;	/* what type of flash */
>  	struct spi_nor nor;
> @@ -110,6 +118,18 @@ struct aspeed_smc_controller {
>  	void __iomem *regs;			/* controller registers */
>  	void __iomem *ahb_base;			/* per-chip windows resource */
>  
> +	/* interrupt handling */
> +	int irq;
> +
> +	/* dma */
> +	bool dma_enabled;
> +	struct completion dma_done;
> +
> +	/* dma logging */
> +	size_t dma_length;
> +	dma_addr_t dma_addr;			/* bus address of buffer */
> +	dma_addr_t flash_addr;			/* flash address */
> +
>  	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
>  };
>  
> @@ -182,6 +202,11 @@ struct aspeed_smc_controller {
>  	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
>  	 CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
>  
> +/* Interrupt Control and Status Register */
> +#define INTERRUPT_STATUS_REG		0x08
> +#define     INTERRUPT_DMA_ENABLE	BIT(3)
> +#define     INTERRUPT_DMA_STATUS	BIT(11)
> +
>  /*
>   * The Segment Register uses a 8MB unit to encode the start address
>   * and the end address of the mapping window of a flash SPI slave :
> @@ -194,6 +219,108 @@ struct aspeed_smc_controller {
>  #define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
>  #define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
>  
> +/* DMA Registers */
> +#define DMA_CONTROL_REG			0x80
> +#define     DMA_ENABLE			BIT(0)
> +#define     DMA_WRITE			BIT(1)
> +
> +#define DMA_FLASH_BASE_REG		0x84
> +#define DMA_DRAM_BASE_REG		0x88
> +#define DMA_LENGTH_REG			0x8c
> +
> +/*
> + * DMAs do not seem to be that fast, so disable by default
> + */
> +static bool use_dma;
> +module_param(use_dma, bool, 0644);
> +
> +static unsigned int min_dma_size = 256;
> +module_param(min_dma_size, uint, 0644);
> +
> +/* with 100ms we had a couple of timeouts */
> +static unsigned int dma_timeout = 200;
> +module_param(dma_timeout, uint, 0644);
> +
> +static void aspeed_smc_dma_done(struct aspeed_smc_controller *controller)
> +{
> +	writel(0, controller->regs + INTERRUPT_STATUS_REG);
> +	writel(0, controller->regs + DMA_CONTROL_REG);
> +}
> +
> +#define DMA_LENGTH(x) (((x) - 4) & ~0xFE000003)
> +#define DMA_ADDR(x) ((x) & ~0x00000003)
> +
> +static inline void aspeed_smc_chip_configure(struct aspeed_smc_chip *chip,
> +					     u32 ctl)
> +{
> +	ctl |= CONTROL_CE_STOP_ACTIVE_CONTROL;
> +	writel(ctl, chip->ctl);
> +
> +	ctl &= ~CONTROL_CE_STOP_ACTIVE_CONTROL;
> +	writel(ctl, chip->ctl);
> +}
> +
> +static int aspeed_smc_dma_start(struct aspeed_smc_chip *chip,
> +				u32 offset, void *buf, size_t length,
> +				int is_write)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	dma_addr_t dma_addr, flash_addr;
> +	int ret = 0;
> +
> +	aspeed_smc_chip_configure(chip, is_write ? chip->ctl_val[smc_write] :
> +		chip->ctl_val[smc_read]);
> +
> +	dev_dbg(chip->nor.dev, "DMA %s to=0x%08x len=0x%08x\n",
> +		is_write ? "write" : "read", offset, length);
> +
> +	dma_addr = dma_map_single(chip->nor.dev, buf, length,
> +				  (is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE));

big mistake! Don't worry, your not the first one to fall into this trap
and I did this mistake too in earlier versions of the Atmel QSPI
controller driver (not mainlined) ;)

So please, let me explain:

You can use dma_map_single() if 'buf' is allocated with kmalloc() for
instance because kmalloc'ed memory pages are guaranteed to be contiguous
in physical space too (not only in virtual space).
Also kmalloc'ed memory can be (un)mapped for DMA usages: when cleaning
and/or invalidating the data cache lines, the cache aliasing issue
should be avoided, hence it's safe.

On the other hand, vmalloc'ed memory pages are not guaranteed to be
contiguous in physical space and often they aren't. So just for this
only reason, you cannot use dma_map_single().


More technical explanations but you can skip the following section if
you want:

####################################################################
Then you could think of using dma_map_sg() instead. This is what the
__spi_map_sg() / spi_map_buf() functions do in the SPI sub-system: in
the case of vmalloc'ed memory, spi_map_buf() first build a
scatter-gather list from the allocated pages before calling dma_map_sg().

However the vmalloc'ed memory area is not safe about the cache alias
issue. Depending on model of the data cache it may be safe or not:

- PIPT (Physically Indexed / Physically Tagged): should be safe in any
case (data cache of ARM Cortex A5 for instance).

- VIPT (Virtually Indexed / Physically Tagged): if the size of the data
cache is "small" enough so the number of (index + offset) bits in the
virtual address is less are equal to the number of offset bits for the
smallest page size in the MMU (likely 12 bits for a 4KB MMU page size),
the cache alias issue should be avoided. Otherwise this issue may occur
so KO.

- VIVT (Virtually Indexed / Virtually Tagged): this is the worst case.
Even the tag part comes from the virtual address so OK (ARM 926 I guess).

e.g. for a 32bit address:

Depending on the cache model, the virtual and/or physical is used to
extract the TAG, INDEX and OFFSET.

31                         Y                   0
+--------------------------+--------+----------+
|           TAG            |  INDEX |   OFFSET |
+--------------------------+--------+----------+

The INDEX part is used the select the right set in the N-way set
associated cache. Then the TAG part is used to find the right cache line
within the selected set.

For a minimum MMU page size of 4096 (== 2^12) bytes, if (Y < 12),
whatever you use the physical of virtual address, the (INDEX + OFFSET)
bits are the same. Then if the TAG comes from the physical address, no
problem: even if a given physical page is mapped twice (or more) in the
virtual address space through the MMU, all those virtual addresses are
cached in the very same cache lines.
So for a VIPT cache model, it depends on the geometry (cache size, cache
line size, number of ways) of your cache.

SPI controller drivers should not rely on this "trick": it may not work
later if the same controller IP is integrated in another SoC using a
different core with a different cache model or different cache geometry.
####################################################################


All that to say, other parts of the kernel, like the ubifs layer,
allocates buffer with vmalloc() instead of kmalloc().
So you may test your code programming a UBI file-system on your SPI
flash memory and your kernel is likely to crash.


> +
> +	if (unlikely(dma_mapping_error(chip->nor.dev, dma_addr))) {
> +		dev_err(chip->nor.dev, "Failed to dma_map_single()\n");
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +	flash_addr = chip->phys_base + offset;
> +
> +	controller->dma_length = length;
> +	controller->dma_addr = dma_addr;
> +	controller->flash_addr = flash_addr;
> +
> +	reinit_completion(&controller->dma_done);
> +
> +	writel(0, controller->regs + DMA_CONTROL_REG);
> +	writel(DMA_ADDR(flash_addr), controller->regs +
> +	       DMA_FLASH_BASE_REG);
> +	writel(DMA_ADDR(dma_addr), controller->regs + DMA_DRAM_BASE_REG);
> +	writel(DMA_LENGTH(length), controller->regs + DMA_LENGTH_REG);
> +
> +	writel(INTERRUPT_DMA_ENABLE,
> +	       controller->regs + INTERRUPT_STATUS_REG);
> +
> +	writel(DMA_ENABLE | (is_write << 1),
> +	       controller->regs + DMA_CONTROL_REG);
> +
> +	if (!wait_for_completion_timeout(&controller->dma_done,
> +					 msecs_to_jiffies(dma_timeout))) {
> +		dev_err(chip->nor.dev,
> +			"DMA timeout addr@%.8x faddr@%.8x size=%x\n",
> +			controller->dma_addr,
> +			controller->flash_addr,
> +			controller->dma_length);
> +		ret = -ETIMEDOUT;
> +		aspeed_smc_dma_done(controller);
> +	}
> +
> +	dma_unmap_single(chip->nor.dev,
> +			 controller->dma_addr, controller->dma_length,
> +			 (is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE));
> +out:
> +	aspeed_smc_chip_configure(chip, chip->ctl_val[smc_read]);
> +	return ret;
> +}
> +
>  /*
>   * In user mode all data bytes read or written to the chip decode address
>   * range are transferred to or from the SPI bus. The range is treated as a
> @@ -366,12 +493,32 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>  	}
>  }
>  
> +/*
> + * Try DMA transfer when size and alignment are correct. In case
> + * of failure, just restart using the IO mode.
> + */
> +static int aspeed_smc_dma_check(struct aspeed_smc_chip *chip, loff_t off,
> +				size_t len)
> +{
> +	return (IS_ALIGNED(off, 4) && IS_ALIGNED(len, 4) &&
> +		len >= min_dma_size && chip->controller->dma_enabled &&
> +		use_dma);
> +}
> +

vmalloc'ed memory or other high memory regions (not DMA capable) can
still pass this check.

Best regards,

Cyrille

>  static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>  				    size_t len, u_char *read_buf)
>  {
>  	struct aspeed_smc_chip *chip = nor->priv;
>  	int i;
>  	u8 dummy = 0xFF;
> +	int ret;
> +
> +	if (aspeed_smc_dma_check(chip, from, len)) {
> +		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
> +		if (!ret)
> +			goto out;
> +		dev_err(chip->nor.dev, "DMA read failed: %d", ret);
> +	}
>  
>  	aspeed_smc_start_user(nor);
>  	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> @@ -380,6 +527,7 @@ static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from,
>  
>  	aspeed_smc_read_from_ahb(read_buf, chip->ahb_base, len);
>  	aspeed_smc_stop_user(nor);
> +out:
>  	return len;
>  }
>  
> @@ -387,11 +535,21 @@ static ssize_t aspeed_smc_write_user(struct spi_nor *nor, loff_t to,
>  				     size_t len, const u_char *write_buf)
>  {
>  	struct aspeed_smc_chip *chip = nor->priv;
> +	int ret;
> +
> +	if (aspeed_smc_dma_check(chip, to, len)) {
> +		ret = aspeed_smc_dma_start(chip, to, (void *)write_buf,
> +					   len, 1);
> +		if (!ret)
> +			goto out;
> +		dev_err(chip->nor.dev, "DMA write failed: %d", ret);
> +	}
>  
>  	aspeed_smc_start_user(nor);
>  	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
>  	aspeed_smc_write_to_ahb(chip->ahb_base, write_buf, len);
>  	aspeed_smc_stop_user(nor);
> +out:
>  	return len;
>  }
>  
> @@ -527,6 +685,8 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>  		return -EINVAL;
>  	}
>  
> +	chip->phys_base = res->start + (chip->ahb_base - controller->ahb_base);
> +
>  	/*
>  	 * Get value of the inherited control register. U-Boot usually
>  	 * does some timing calibration on the FMC chip, so it's good
> @@ -597,6 +757,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>  	}
>  
>  	chip->ctl_val[smc_read] |= cmd |
> +		chip->nor.read_opcode << CONTROL_COMMAND_SHIFT |
>  		CONTROL_IO_DUMMY_SET(chip->nor.read_dummy / 8);
>  
>  	dev_dbg(controller->dev, "base control register: %08x\n",
> @@ -695,6 +856,74 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>  	return ret;
>  }
>  
> +static irqreturn_t aspeed_smc_irq(int irq, void *arg)
> +{
> +	struct aspeed_smc_controller *controller = arg;
> +	struct device *dev = controller->dev;
> +	irqreturn_t ret = IRQ_NONE;
> +	u32 dma_ctl = readl(controller->regs + DMA_CONTROL_REG);
> +	u32 status = readl(controller->regs + INTERRUPT_STATUS_REG);
> +
> +	dev_dbg(dev, "received IRQ. status: %x", status);
> +
> +	if (!(status & INTERRUPT_DMA_ENABLE) || !(dma_ctl & DMA_ENABLE)) {
> +		dev_err(dev, "No DMA. bad IRQ status: %x", status);
> +		goto out;
> +	}
> +
> +	if (!(status & INTERRUPT_DMA_STATUS)) {
> +		dev_err(dev, "DMA still in progress. length %d\n",
> +			readl(controller->regs + DMA_LENGTH_REG));
> +		goto out;
> +	}
> +
> +	ret = IRQ_HANDLED;
> +	aspeed_smc_dma_done(controller);
> +	complete(&controller->dma_done);
> +
> +out:
> +	return ret;
> +}
> +
> +static int aspeed_smc_config_irq(struct aspeed_smc_controller *controller,
> +				 struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int rc;
> +
> +	controller->irq = platform_get_irq(pdev, 0);
> +	if (!controller->irq)
> +		return -ENODEV;
> +
> +	rc = devm_request_irq(dev, controller->irq, aspeed_smc_irq, IRQF_SHARED,
> +			      DEVICE_NAME, controller);
> +	if (rc < 0) {
> +		dev_warn(dev, "Unable to request IRQ %d\n", controller->irq);
> +		controller->irq = 0;
> +		return rc;
> +	}
> +
> +	dev_info(dev, "Using IRQ %d\n", controller->irq);
> +	return 0;
> +}
> +
> +static void aspeed_smc_dma_setup(struct aspeed_smc_controller *controller,
> +				 struct platform_device *pdev)
> +{
> +	const struct aspeed_smc_info *info = controller->info;
> +
> +	init_completion(&controller->dma_done);
> +
> +	controller->dma_enabled = false;
> +	if (info->has_dma)
> +		controller->dma_enabled = !aspeed_smc_config_irq(controller,
> +								 pdev);
> +
> +	if (controller->dma_enabled)
> +		dev_info(controller->dev, "DMA support %s.\n",
> +			 use_dma ? "enabled" : "disabled");
> +}
> +
>  static int aspeed_smc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -730,6 +959,8 @@ static int aspeed_smc_probe(struct platform_device *pdev)
>  	if (IS_ERR(controller->ahb_base))
>  		return PTR_ERR(controller->ahb_base);
>  
> +	aspeed_smc_dma_setup(controller, pdev);
> +
>  	ret = aspeed_smc_setup_flash(controller, np, res);
>  	if (ret)
>  		dev_err(dev, "Aspeed SMC probe failed %d\n", ret);
> 
