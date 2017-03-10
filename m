Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmBN6-000135-K3
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 03:37:43 +0000
Received: by mail-wr0-x243.google.com with SMTP id l37so10030463wrc.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 19:37:19 -0800 (PST)
Subject: Re: [v2, 2/4] mtd: spi-nor: Add Octal SPI support to Cadence QSPI
 driver.
To: Artur Jedrysek <jartur@cadence.com>, linux-mtd@lists.infradead.org
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
 <1488960178-11079-1-git-send-email-jartur@cadence.com>
Cc: linux-kernel@vger.kernel.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <891f9177-e03c-85e0-ebab-2dc7df2ce9e0@gmail.com>
Date: Fri, 10 Mar 2017 04:37:16 +0100
MIME-Version: 1.0
In-Reply-To: <1488960178-11079-1-git-send-email-jartur@cadence.com>
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

On 03/08/2017 09:02 AM, Artur Jedrysek wrote:
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
>  drivers/mtd/spi-nor/cadence-quadspi.c | 69 +++++++++++++++++++++++++++++++----
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 9f8102d..a96471d 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -76,6 +76,7 @@ struct cqspi_st {
>  	u32			fifo_depth;
>  	u32			fifo_width;
>  	u32			trigger_address;
> +	u32			max_mode;

I think it's time to introduce flags instead,
ie. #define CQSPI_FLAG_SUPPORTS_OCTAL BIT(0)

>  	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
>  };
>  
> @@ -87,6 +88,10 @@ struct cqspi_st {
>  #define CQSPI_INST_TYPE_SINGLE			0
>  #define CQSPI_INST_TYPE_DUAL			1
>  #define CQSPI_INST_TYPE_QUAD			2
> +#define CQSPI_INST_TYPE_OCTAL			3
> +
> +#define CQSPI_MAX_MODE_QUAD			0
> +#define CQSPI_MAX_MODE_OCTAL			1
>  
>  #define CQSPI_DUMMY_CLKS_PER_BYTE		8
>  #define CQSPI_DUMMY_BYTES_MAX			4
> @@ -204,6 +209,14 @@ struct cqspi_st {
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
> @@ -866,6 +879,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
>  		case SPI_NOR_QUAD:
>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
>  			break;
> +		case SPI_NOR_OCTAL:
> +			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> @@ -977,6 +993,17 @@ static int cqspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  	return ret;
>  }
>  
> +static const u32 cqspi_max_mode_quad = CQSPI_MAX_MODE_QUAD;
> +static const u32 cqspi_max_mode_octal = CQSPI_MAX_MODE_OCTAL;
> +
> +static struct of_device_id const cqspi_dt_ids[] = {
> +	{ .compatible = "cdns,qspi-nor", .data = &cqspi_max_mode_quad },
> +	{ .compatible = "cdns,ospi-nor", .data = &cqspi_max_mode_octal },

.data = (void *)CQSPI_FLAG_SUPPORTS_OCTAL , then you don't need that
static const stuff ...

> +	{ /* end of table */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, cqspi_dt_ids);
> +
>  static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
>  				    struct cqspi_flash_pdata *f_pdata,
>  				    struct device_node *np)
> @@ -1018,6 +1045,13 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct cqspi_st *cqspi = platform_get_drvdata(pdev);
> +	const struct of_device_id *match;
> +
> +	cqspi->max_mode = CQSPI_MAX_MODE_QUAD;
> +
> +	match = of_match_node(cqspi_dt_ids, np);
> +	if (match && match->data)
> +		cqspi->max_mode = *((u32 *)match->data);

Use flags instead, see above.

>  	cqspi->is_decoded_cs = of_property_read_bool(np, "cdns,is-decoded-cs");
>  
> @@ -1074,9 +1108,35 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  	struct cqspi_flash_pdata *f_pdata;
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
> +	enum read_mode mode;
> +	enum read_mode dt_mode = SPI_NOR_QUAD;
>  	unsigned int cs;
> +	unsigned int rev_reg;
>  	int i, ret;
>  
> +	/* Determine, whether or not octal transfer MAY be supported */

But you already know that from DT, no ?

> +	rev_reg = readl(cqspi->iobase + CQSPI_REG_MODULEID);
> +	dev_info(dev, "CQSPI Module id %x\n", rev_reg);
> +
> +	switch (rev_reg & CQSPI_REG_MODULEID_CONF_ID_MASK) {
> +	case CQSPI_REG_MODULEID_CONF_ID_OCTAL_PHY:
> +	case CQSPI_REG_MODULEID_CONF_ID_OCTAL:
> +		mode = SPI_NOR_OCTAL;
> +		break;
> +	case CQSPI_REG_MODULEID_CONF_ID_QUAD:
> +	case CQSPI_REG_MODULEID_CONF_ID_QUAD_PHY:

Does this work on all revisions of CQSPI ?

> +		mode = SPI_NOR_QUAD;
> +		break;
> +	}
> +
> +	if (cqspi->max_mode == CQSPI_MAX_MODE_OCTAL)
> +		dt_mode = SPI_NOR_OCTAL;
> +
> +	if (mode == SPI_NOR_QUAD && dt_mode == SPI_NOR_OCTAL)
> +		dev_warn(dev, "Requested octal mode is not supported by the device.");
> +	else if (mode == SPI_NOR_OCTAL && dt_mode == SPI_NOR_QUAD)
> +		mode = SPI_NOR_QUAD;
> +
>  	/* Get flash device data */
>  	for_each_available_child_of_node(dev->of_node, np) {
>  		ret = of_property_read_u32(np, "reg", &cs);
> @@ -1123,7 +1183,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  			goto err;
>  		}
>  
> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		ret = spi_nor_scan(nor, NULL, mode);
>  		if (ret)
>  			goto err;
>  
> @@ -1277,13 +1337,6 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
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
