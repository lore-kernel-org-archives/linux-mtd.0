Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cl04a-0007BS-Oa
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 21:21:44 +0000
Date: Mon, 6 Mar 2017 22:21:18 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artur Jedrysek <jartur@cadence.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add Octal SPI support to Cadence QSPI
 driver.
Message-ID: <20170306222118.6cfca9f7@bbrezillon>
In-Reply-To: <1488803545-22461-1-git-send-email-jartur@cadence.com>
References: <1488803545-22461-1-git-send-email-jartur@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 Mar 2017 12:32:25 +0000
Artur Jedrysek <jartur@cadence.com> wrote:

> Recent versions of Cadence QSPI controller support Octal SPI transfers
> as well. This patch updates existing driver to support such feature.
> 
> It is not possible to determine whether or not octal mode is supported
> just by looking at revision register alone. To solve that, an additional
> property in Device Tree is added to indicate such capability.
> Both (revision and DT property) are used to determine, which mode to
> pass to spi_nor_scan() call.

Hm, can we add a new compatible instead? Adding extra properties to
describe the set of functionalities supported by an IP is usually a
bad idea.

> 
> Additionally, the driver works on Xtensa CPU, hence Kconfig update.

This should be done in a separate commit (it has nothing to do with
octal mode support).

> 
> Signed-off-by: Artur Jedrysek <jartur@cadence.com>
> ---
>  drivers/mtd/spi-nor/Kconfig           |  2 +-
>  drivers/mtd/spi-nor/cadence-quadspi.c | 40 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 7252087..f195749 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -50,7 +50,7 @@ config SPI_ATMEL_QUADSPI
>  
>  config SPI_CADENCE_QUADSPI
>  	tristate "Cadence Quad SPI controller"
> -	depends on OF && (ARM || COMPILE_TEST)
> +	depends on OF && (ARM || XTENSA || COMPILE_TEST)
>  	help
>  	  Enable support for the Cadence Quad SPI Flash controller.
>  
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 9f8102d..5c06102 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -87,6 +87,7 @@ struct cqspi_st {
>  #define CQSPI_INST_TYPE_SINGLE			0
>  #define CQSPI_INST_TYPE_DUAL			1
>  #define CQSPI_INST_TYPE_QUAD			2
> +#define CQSPI_INST_TYPE_OCTAL			3
>  
>  #define CQSPI_DUMMY_CLKS_PER_BYTE		8
>  #define CQSPI_DUMMY_BYTES_MAX			4
> @@ -204,6 +205,14 @@ struct cqspi_st {
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
> @@ -866,6 +875,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
>  		case SPI_NOR_QUAD:
>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
>  			break;
> +		case SPI_NOR_OCTAL:
> +			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> @@ -1074,9 +1086,35 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
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
> +		mode = SPI_NOR_QUAD;
> +		break;
> +	}
> +
> +	if (of_property_read_bool(np, "cdns,octal-controller"))
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
> @@ -1123,7 +1161,7 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  			goto err;
>  		}
>  
> -		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
> +		ret = spi_nor_scan(nor, NULL, mode);
>  		if (ret)
>  			goto err;
>  
