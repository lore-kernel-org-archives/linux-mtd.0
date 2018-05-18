Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJlc8-0000Sm-Vm
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 20:04:35 +0000
Date: Fri, 18 May 2018 22:04:11 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 cyrille.pitchen@wedev4u.fr, han.xu@nxp.com, computersforpeace@gmail.com,
 festevam@gmail.com
Subject: Re: [PATCH v2] mtd: fsl-quadspi: add support for ls2080a/ls1080a
Message-ID: <20180518220411.441936db@bbrezillon>
In-Reply-To: <1517332798-16644-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1517332798-16644-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

On Tue, 30 Jan 2018 22:49:58 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> LS2080a/LS1088a supports Freescale Quad SPI controller.
> Add fsl-quadspi driver support for ls2080a and ls1088a chip.
> 
> Signed-off-by: Suresh Gupta <suresh.gupta@nxp.com>
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

Queued to spi-nor/next.

Thanks,

Boris

> ---
> Depends on
>  https://patchwork.ozlabs.org/project/linux-mtd/list/?series=26084
> 
> Changes for v2:
> - Remove void * cast of_device_id structure for ls2080a_data.
> - Generate patch from spi-nor/next branch.
> 
>  drivers/mtd/spi-nor/fsl-quadspi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 035dacd..b9c5918 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -214,6 +214,7 @@ enum fsl_qspi_devtype {
>  	FSL_QUADSPI_IMX7D,
>  	FSL_QUADSPI_IMX6UL,
>  	FSL_QUADSPI_LS1021A,
> +	FSL_QUADSPI_LS2080A,
>  };
>  
>  struct fsl_qspi_devtype_data {
> @@ -267,6 +268,15 @@ struct fsl_qspi_devtype_data {
>  	.driver_data = 0,
>  };
>  
> +static const struct fsl_qspi_devtype_data ls2080a_data = {
> +	.devtype = FSL_QUADSPI_LS2080A,
> +	.rxfifo = 128,
> +	.txfifo = 64,
> +	.ahb_buf_size = 1024,
> +	.driver_data = QUADSPI_QUIRK_TKT253890,
> +};
> +
> +
>  #define FSL_QSPI_MAX_CHIP	4
>  struct fsl_qspi {
>  	struct spi_nor nor[FSL_QSPI_MAX_CHIP];
> @@ -821,6 +831,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  	{ .compatible = "fsl,imx7d-qspi", .data = &imx7d_data, },
>  	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
>  	{ .compatible = "fsl,ls1021a-qspi", .data = (void *)&ls1021a_data, },
> +	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
