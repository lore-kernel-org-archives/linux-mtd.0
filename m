Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLHCg-0007O3-FD
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 20:46:54 +0000
Received: by pachj5 with SMTP id hj5so46030054pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 13:46:33 -0700 (PDT)
Date: Fri, 31 Jul 2015 13:46:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Cc: linux-mtd@lists.infradead.org, b45815@freescale.com, lznuaa@gmail.com
Subject: Re: [PATCH v3 4/8] mtd: spi-nor: fsl-quadspi: add i.mx6ul support
Message-ID: <20150731204629.GE10676@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <1437761188-8179-5-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437761188-8179-5-git-send-email-Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Same comments from the other patches:

On Sat, Jul 25, 2015 at 02:06:24AM +0800, Frank.Li@freescale.com wrote:
> From: Frank Li <Frank.Li@freescale.com>
> 
> Add i.mx6ul chip support
> 
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> Acked-by: Allen Xu <b45815@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 3fc94ad..3746542 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -206,6 +206,7 @@ enum fsl_qspi_devtype {
>  	FSL_QUADSPI_VYBRID,
>  	FSL_QUADSPI_IMX6SX,
>  	FSL_QUADSPI_IMX7D,
> +	FSL_QUADSPI_IMX6UL,
>  };
>  
>  struct fsl_qspi_devtype_data {
> @@ -241,6 +242,15 @@ static struct fsl_qspi_devtype_data imx7d_data = {
>  		       | QUADSPI_QUIRK_4X_INT_CLK
>  };
>  
> +static struct fsl_qspi_devtype_data imx6ul_data = {
> +	.devtype = FSL_QUADSPI_IMX6UL,
> +	.rxfifo = 128,
> +	.txfifo = 512,
> +	.ahb_buf_size = 1024,
> +	.driver_data = QUADSPI_QUIRK_TKT253890
> +		       | QUADSPI_QUIRK_4X_INT_CLK

End this line with a comma.

> +};
> +
>  #define FSL_QSPI_MAX_CHIP	4
>  struct fsl_qspi {
>  	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
> @@ -703,6 +713,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
>  	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
>  	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
>  	{ .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },
> +	{ .compatible = "fsl,imx6ul-qspi", .data = (void *)&imx6ul_data, },

Document this compatible property.

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
> -- 
> 1.9.1
> 

Brian
