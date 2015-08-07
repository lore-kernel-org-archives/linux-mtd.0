Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNqbu-0003VY-OO
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 22:59:35 +0000
Received: by pabyb7 with SMTP id yb7so64684796pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 15:59:14 -0700 (PDT)
Date: Fri, 7 Aug 2015 15:59:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Zhiqiang Hou <B48286@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	b21284@freescale.com
Subject: Re: [PATCH] mtd: m25p80: Add Power Management support
Message-ID: <20150807225911.GD60523@google.com>
References: <1437473933-11983-1-git-send-email-B48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437473933-11983-1-git-send-email-B48286@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2015 at 06:18:53PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <B48286@freescale.com>
> 
> Add the rescanning and initialization of SPI flash, to make the SPI
> flash in the correct state. Because if the Power Management system
> truns off power supply for SPI flash when system suspending, the SPI
> flash will return to the reset state after system resume.
> 
> Signed-off-by: Hou Zhiqiang <B48286@freescale.com>
> ---
>  drivers/mtd/devices/m25p80.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index d313f948b..f9d2b2e 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -248,6 +248,39 @@ static int m25p_remove(struct spi_device *spi)
>  	return mtd_device_unregister(&flash->mtd);
>  }
>  
> +#ifdef CONFIG_PM_SLEEP
> +static int m25p_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int m25p_resume(struct device *dev)
> +{
> +	struct m25p *flash = dev_get_drvdata(dev);
> +	struct spi_device *spi = flash->spi;
> +	struct spi_nor *nor = &flash->spi_nor;
> +	enum read_mode mode = SPI_NOR_NORMAL;
> +	struct flash_platform_data *data;
> +	char *flash_name = NULL;
> +
> +	if (spi->mode & SPI_RX_QUAD)
> +		mode = SPI_NOR_QUAD;
> +	else if (spi->mode & SPI_RX_DUAL)
> +		mode = SPI_NOR_DUAL;
> +
> +	data = dev_get_platdata(&spi->dev);
> +	if (data && data->type)
> +		flash_name = data->type;
> +	else if (!strcmp(spi->modalias, "spi-nor"))
> +		flash_name = NULL; /* auto-detect */
> +	else
> +		flash_name = spi->modalias;
> +
> +	return spi_nor_scan(nor, flash_name, mode);

No, this is not good. You need to be much more targeted than just
rerunning practically the entire driver init. Please introduce a
spi_nor_suspend() and spi_nor_resume() function, and have them do only
the steps that are necessary. e.g., re-set any flash modes, like 4-byte
addressing, etc. Then you can call them from the appropriate drivers,
like m25p80.c.

> +}
> +#endif /* CONFIG_PM_SLEEP */
> +
> +static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
>  /*
>   * Do NOT add to this array without reading the following:
>   *
> @@ -302,6 +335,7 @@ static struct spi_driver m25p80_driver = {
>  	.driver = {
>  		.name	= "m25p80",
>  		.owner	= THIS_MODULE,
> +		.pm	= &m25p_pm_ops,
>  	},
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,

Brian
