Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YISKC-0007PB-UJ
 for linux-mtd@lists.infradead.org; Tue, 03 Feb 2015 01:30:46 +0000
Received: by mail-pa0-f49.google.com with SMTP id fa1so89501818pad.8
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 17:30:23 -0800 (PST)
Date: Mon, 2 Feb 2015 17:30:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <heiner.kallweit@web.de>
Subject: Re: [PATCH 2/2] m25p80: if supported put chip to deep power down if
 not used
Message-ID: <20150203013019.GF3992@ld-irv-0074>
References: <54CE6006.3080107@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54CE6006.3080107@web.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 01, 2015 at 06:19:02PM +0100, Heiner Kallweit wrote:
> Depending on the chip type the difference in power consumption between
> standby and deep power down might be relevant for embedded devices.
> 
> This patch implements deep power down for few chip types. Most likely
> more support this feature.
> 
> It was successfully tested on a i.mx6 based mini-pc with m25px16.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 112 ++++++++++++++++++++++++++++++++++++++++++-

First of all, this kind of feature does not belong in m25p80.c any more.
It belongs in spi-nor.c.

>  1 file changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 85e3546..c1e1841 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -19,6 +19,7 @@
>  #include <linux/errno.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> +#include <linux/delay.h>
>  
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> @@ -33,8 +34,22 @@ struct m25p {
>  	struct spi_nor		spi_nor;
>  	struct mtd_info		mtd;
>  	u8			command[MAX_CMD_SIZE];
> +	int			pm_list_index;
>  };
>  
> +struct m25p_pm {
> +	const char *name;
> +	int (*resume)(struct spi_nor *nor, enum spi_nor_ops ops);
> +	void (*suspend)(struct spi_nor *nor, enum spi_nor_ops ops);
> +};
> +
> +#define PM_ENTRY(_n, _r, _s)		\
> +	{				\
> +		.name = (_n),		\
> +		.resume = (_r),		\
> +		.suspend = (_s),	\
> +	}
> +
>  static int m25p80_read_reg(struct spi_nor *nor, u8 code, u8 *val, int len)
>  {
>  	struct m25p *flash = nor->priv;
> @@ -170,6 +185,70 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
>  	return 0;
>  }
>  
> +static inline int m25p_gen_resume(struct spi_nor *nor, unsigned long udelay)
> +{
> +	int ret;
> +
> +	ret = m25p80_write_reg(nor, 0xAB, NULL, 0, 0);

Please no magic numbers (0xAB). Add these opcodes to
include/linux/mtd/spi-nor.h.

> +	if (ret)
> +		return ret;
> +
> +	if (udelay < 10)
> +		udelay(udelay);
> +	else
> +		usleep_range(udelay, udelay + 10);
> +
> +	return 0;
> +}
> +
> +static void m25p_gen_suspend(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	m25p80_write_reg(nor, 0xB9, NULL, 0, 0);

Same here. No magic numbers please.

> +}
> +
> +static int m25p_m25px16_resume(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	return m25p_gen_resume(nor, 30);
> +}
> +
> +static int m25p_en25q64_resume(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	return m25p_gen_resume(nor, 3);
> +}
> +
> +static int m25p_s25fl129p1_resume(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	return m25p_gen_resume(nor, 30);
> +}

Is it actually important that these resume times be this precise? It
would make code maintenance much easier if there is a "good enough"
value for all flash that support this.

But if you do need a different value for each, it would be much better
to store the resume time in a struct somewhere and then reuse the same
function for all flash chips.

Also, if the timing is that sensitive, it's likely we'll want a clean
way for platforms to disable this mode. Perhaps a device tree property
is in order.

> +
> +static const struct m25p_pm m25p_pm_list[] = {
> +	PM_ENTRY("m25px16",	m25p_m25px16_resume,	m25p_gen_suspend),
> +	PM_ENTRY("en25q64",	m25p_en25q64_resume,	m25p_gen_suspend),
> +	PM_ENTRY("s25fl129p1",	m25p_s25fl129p1_resume,	m25p_gen_suspend),
> +};

OK, this is pretty ugly. We don't want to do string comparison to enable
flash-specific features. All flash-specific features should be moved to
spi-nor.c anyway. So we'd just want a new options flag for the
spi_nor_ids[] array, e.g. SPI_NOR_DEEP_PD.

> +
> +static int m25p80_resume(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct m25p *flash = nor->priv;
> +	int idx = flash->pm_list_index;
> +
> +	if (idx == -1)
> +		return 0;
> +
> +	return m25p_pm_list[idx].resume(nor, ops);
> +}
> +
> +static void m25p80_suspend(struct spi_nor *nor, enum spi_nor_ops ops)
> +{
> +	struct m25p *flash = nor->priv;
> +	int idx = flash->pm_list_index;
> +
> +	if (idx == -1)
> +		return;
> +
> +	m25p_pm_list[idx].suspend(nor, ops);
> +}
> +
>  /*
>   * board specific setup should have ensured the SPI clock used here
>   * matches what the READ command supports, at least until this driver
> @@ -183,7 +262,7 @@ static int m25p_probe(struct spi_device *spi)
>  	struct spi_nor *nor;
>  	enum read_mode mode = SPI_NOR_NORMAL;
>  	char *flash_name = NULL;
> -	int ret;
> +	int i, ret;
>  
>  	data = dev_get_platdata(&spi->dev);
>  
> @@ -199,6 +278,8 @@ static int m25p_probe(struct spi_device *spi)
>  	nor->erase = m25p80_erase;
>  	nor->write_reg = m25p80_write_reg;
>  	nor->read_reg = m25p80_read_reg;
> +	nor->prepare = m25p80_resume;
> +	nor->unprepare = m25p80_suspend;

When you move this to spi-nor.c, you can't override the
prepare/unprepare hooks. These are designed to be driver-specific (not
flash-specific) hooks. See fsl-quadspi.c for a valid use case, where we
need to prepare a few clocks before using the interface.

Instead, this probably should be part of spi_nor_lock_and_prep() and
spi_nor_unlock_and_unprep().

>  
>  	nor->dev = &spi->dev;
>  	nor->mtd = &flash->mtd;
> @@ -207,6 +288,7 @@ static int m25p_probe(struct spi_device *spi)
>  	spi_set_drvdata(spi, flash);
>  	flash->mtd.priv = nor;
>  	flash->spi = spi;
> +	flash->pm_list_index = -1;
>  
>  	if (spi->mode & SPI_RX_QUAD)
>  		mode = SPI_NOR_QUAD;
> @@ -230,6 +312,18 @@ static int m25p_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  
> +	/* look for power management hooks */
> +	for (i = 0; i < ARRAY_SIZE(m25p_pm_list); i++) {
> +		if (!strcmp(nor->chip_name, m25p_pm_list[i].name)) {
> +			flash->pm_list_index = i;
> +			break;
> +		}
> +	}
> +	/* if supported go to deep power down
> +	 * until somebody needs to access the flash
> +	 */
> +	m25p80_suspend(nor, SPI_NOR_OPS_READ);
> +
>  	ppdata.of_node = spi->dev.of_node;
>  
>  	return mtd_device_parse_register(&flash->mtd, NULL, &ppdata,
> @@ -241,11 +335,26 @@ static int m25p_probe(struct spi_device *spi)
>  static int m25p_remove(struct spi_device *spi)
>  {
>  	struct m25p	*flash = spi_get_drvdata(spi);
> +	struct spi_nor  *nor = &flash->spi_nor;
> +
> +	m25p80_resume(nor, SPI_NOR_OPS_READ);

Why resume when we detach the driver? Wouldn't it be better if the flash
is in the lowest possible power state when no longer in use?

>  
>  	/* Clean up MTD stuff. */
>  	return mtd_device_unregister(&flash->mtd);
>  }
>  
> +/* wake up SPI NOR from deep power down
> + * else in case of reboot the boot loader might not be able
> + * to access the SPI NOR

That means your bootloader is broken. How can you guarantee there won't
be any unexpected (and unhandled) resets? If this is really a problem,
then you can't safely support this suspend mode at all. We've gone over
the same turf here with 4-byte addressing in SPI NOR; some bootloaders
can't boot if we shut down while in 4-byte addressing mode, but that
doesn't mean we add hacks to support the bootloader. Instead, the system
designer needs to arrange to reset the flash properly on all resets. For
instance, one could do this by hooking the RESET# pin to your chip reset
output.

> + */
> +static void m25p_shutdown(struct spi_device *spi)
> +{
> +	struct m25p     *flash = spi_get_drvdata(spi);
> +	struct spi_nor  *nor = &flash->spi_nor;
> +
> +	m25p80_resume(nor, SPI_NOR_OPS_READ);
> +}
> +
>  /*
>   * XXX This needs to be kept in sync with spi_nor_ids.  We can't share
>   * it with spi-nor, because if this is built as a module then modpost
> @@ -303,6 +412,7 @@ static struct spi_driver m25p80_driver = {
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,
>  	.remove	= m25p_remove,
> +	.shutdown = m25p_shutdown,
>  
>  	/* REVISIT: many of these chips have deep power-down modes, which
>  	 * should clearly be entered on suspend() to minimize power use.

Brian
