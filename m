Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqe6y-0004rA-Ur
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 11:07:31 +0000
Received: by mail-wr0-x243.google.com with SMTP id u108so26240013wrb.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 04:07:12 -0700 (PDT)
Subject: Re: [PATCH v3, 2/4] mtd: spi-nor: Add Octal SPI support to Cadence
 QSPI driver.
To: Artur Jedrysek <jartur@cadence.com>, linux-mtd@lists.infradead.org
References: <1490008935-28900-1-git-send-email-jartur@cadence.com>
 <1490009147-2032-1-git-send-email-jartur@cadence.com>
Cc: linux-kernel@vger.kernel.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <74ae6b9a-932e-4ef6-2fd6-19ff92616071@gmail.com>
Date: Wed, 22 Mar 2017 11:07:06 +0100
MIME-Version: 1.0
In-Reply-To: <1490009147-2032-1-git-send-email-jartur@cadence.com>
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

On 03/20/2017 12:25 PM, Artur Jedrysek wrote:
> Recent versions of Cadence QSPI controller support Octal SPI transfers
> as well. This patch updates existing driver to support such feature.
> 
> It is not possible to determine whether or not octal mode is supported
> just by looking at revision register alone. To solve that, an additional
> compatible in Device Tree is added to indicate such capability.
> Both (revision and compatible) are used to determine, which mode to
> pass to spi_nor_scan() call.
> 
> Signed-off-by: Artur Jedrysek <jartur@cadence.com>
> ---
> Changelog:
> v2: Use new compatible in DT, instead of boolean property, to indicate
> Octal SPI support.
> Extracted Kconfig update to seperate patch.
> ---
> v3: Fixed handling revision register.
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 56 ++++++++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 9f8102d..a1561d0 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -76,6 +76,7 @@ struct cqspi_st {
>  	u32			fifo_depth;
>  	u32			fifo_width;
>  	u32			trigger_address;
> +	u32			caps;

Please rename it to flags to be consistent with CQSPI_FLAG_ ...

>  	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
>  };
>  
> @@ -87,6 +88,9 @@ struct cqspi_st {
>  #define CQSPI_INST_TYPE_SINGLE			0
>  #define CQSPI_INST_TYPE_DUAL			1
>  #define CQSPI_INST_TYPE_QUAD			2
> +#define CQSPI_INST_TYPE_OCTAL			3
> +
> +#define CQSPI_FLAG_SUPPORTS_OCTAL		BIT(0)
>  
>  #define CQSPI_DUMMY_CLKS_PER_BYTE		8
>  #define CQSPI_DUMMY_BYTES_MAX			4
> @@ -204,6 +208,14 @@ struct cqspi_st {
>  #define CQSPI_REG_CMDWRITEDATALOWER		0xA8
>  #define CQSPI_REG_CMDWRITEDATAUPPER		0xAC
>  
> +#define CQSPI_REG_MODULEID			0xFC
> +#define CQSPI_REG_MODULEID_CONF_ID_MASK		0x3
> +#define CQSPI_REG_MODULEID_CONF_ID_LSB		0
> +#define CQSPI_REG_MODULEID_CONF_ID_OCTAL_PHY	0x0
> +#define CQSPI_REG_MODULEID_CONF_ID_OCTAL	0x1
> +#define CQSPI_REG_MODULEID_CONF_ID_QUAD_PHY	0x2
> +#define CQSPI_REG_MODULEID_CONF_ID_QUAD		0x3
> +
>  /* Interrupt status bits */
>  #define CQSPI_REG_IRQ_MODE_ERR			BIT(0)
>  #define CQSPI_REG_IRQ_UNDERFLOW			BIT(1)
> @@ -866,6 +878,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
>  		case SPI_NOR_QUAD:
>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
>  			break;
> +		case SPI_NOR_OCTAL:
> +			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> @@ -977,6 +992,17 @@ static int cqspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  	return ret;
>  }
>  
> +static struct of_device_id const cqspi_dt_ids[] = {
> +	{ .compatible = "cdns,qspi-nor", .data = (void *)0 },

Can you make the formatting for qspi and ospi the same ? Minor nit here
of course ...

> +	{
> +		.compatible = "cdns,ospi-nor",
> +		.data = (void *)CQSPI_FLAG_SUPPORTS_OCTAL
> +	},
> +	{ /* end of table */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, cqspi_dt_ids);
> +
>  static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
>  				    struct cqspi_flash_pdata *f_pdata,
>  				    struct device_node *np)
> @@ -1018,6 +1044,12 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct cqspi_st *cqspi = platform_get_drvdata(pdev);
> +	const struct of_device_id *match;
> +
> +	match = of_match_node(cqspi_dt_ids, np);
> +	if (match && match->data)
> +		cqspi->caps |= (unsigned long)match->data &
> +				CQSPI_FLAG_SUPPORTS_OCTAL;

Just use match->data, without clearing any bits .

>  	cqspi->is_decoded_cs = of_property_read_bool(np, "cdns,is-decoded-cs");
>  
> @@ -1074,9 +1106,23 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  	struct cqspi_flash_pdata *f_pdata;
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
> +	enum read_mode mode = SPI_NOR_QUAD;
>  	unsigned int cs;
> +	unsigned int rev_reg;
>  	int i, ret;
>  
> +	if (cqspi->caps & CQSPI_FLAG_SUPPORTS_OCTAL) {
> +		/* Determine, whether or not octal transfer MAY be supported */
> +		rev_reg = readl(cqspi->iobase + CQSPI_REG_MODULEID);
> +		dev_info(dev, "CQSPI Module id %x\n", rev_reg);

dev_dbg() please.

> +		switch (rev_reg & CQSPI_REG_MODULEID_CONF_ID_MASK) {
> +		case CQSPI_REG_MODULEID_CONF_ID_OCTAL_PHY:
> +		case CQSPI_REG_MODULEID_CONF_ID_OCTAL:
> +			mode = SPI_NOR_OCTAL;

break;

> +		}
> +	}
> +
>  	/* Get flash device data */
>  	for_each_available_child_of_node(dev->of_node, np) {
>  		ret = of_property_read_u32(np, "reg", &cs);
> @@ -1123,7 +1169,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  			goto err;
>  		}
>  
> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		ret = spi_nor_scan(nor, NULL, mode);
>  		if (ret)
>  			goto err;
>  
> @@ -1160,6 +1206,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	mutex_init(&cqspi->bus_mutex);
>  	cqspi->pdev = pdev;
>  	platform_set_drvdata(pdev, cqspi);
> +	cqspi->caps = 0;

The structure is zeroed-out on allocation, so this shouldn't be needed.

>  	/* Obtain configuration from OF. */
>  	ret = cqspi_of_get_pdata(pdev);
> @@ -1277,13 +1324,6 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
>  #define CQSPI_DEV_PM_OPS	NULL
>  #endif
>  
> -static struct of_device_id const cqspi_dt_ids[] = {
> -	{.compatible = "cdns,qspi-nor",},
> -	{ /* end of table */ }
> -};
> -
> -MODULE_DEVICE_TABLE(of, cqspi_dt_ids);
> -
>  static struct platform_driver cqspi_platform_driver = {
>  	.probe = cqspi_probe,
>  	.remove = cqspi_remove,
> 


-- 
Best regards,
Marek Vasut
