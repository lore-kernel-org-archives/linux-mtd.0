Received: from mail-vn0-x232.google.com ([2607:f8b0:400c:c0f::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIf3d-0008V3-QA
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 15:38:47 +0000
Received: by vnk197 with SMTP id 197so10321107vnk.3
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 08:38:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437507599-25424-3-git-send-email-Frank.Li@freescale.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
 <1437507599-25424-3-git-send-email-Frank.Li@freescale.com>
Date: Fri, 24 Jul 2015 10:38:23 -0500
Message-ID: <CA+EcR20b24+Pea6xK0BdwdXES6_gvLfg-eYFG6PNWYbVrywXKw@mail.gmail.com>
Subject: Re: [PATCH 3/7] mtd: spi-nor: fsl-quadspi: add i.mx6ul support
From: Han Xu <xhnjupt@gmail.com>
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "b45815@freescale.com" <b45815@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2015 at 2:39 PM,  <Frank.Li@freescale.com> wrote:
> From: Frank Li <Frank.Li@freescale.com>
>
> Add i.mx6ul chip support
>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>

Acked-by: Han Xu <han.xu@freescale.com>

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 9c3e38d..921fba1 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -206,6 +206,7 @@ enum fsl_qspi_devtype {
>         FSL_QUADSPI_VYBRID,
>         FSL_QUADSPI_IMX6SX,
>         FSL_QUADSPI_IMX7D,
> +       FSL_QUADSPI_IMX6UL,
>  };
>
>  struct fsl_qspi_devtype_data {
> @@ -241,6 +242,15 @@ static struct fsl_qspi_devtype_data imx7d_data = {
>                        | QUADSPI_QUIRK_4X_INT_CLK
>  };
>
> +static struct fsl_qspi_devtype_data imx6ul_data = {
> +       .devtype = FSL_QUADSPI_IMX6UL,
> +       .rxfifo = 128,
> +       .txfifo = 512,
> +       .ahb_buf_size = 1024,
> +       .driver_data = QUADSPI_QUIRK_TKT253890
> +                      | QUADSPI_QUIRK_4X_INT_CLK
> +};
> +
>  #define FSL_QSPI_MAX_CHIP      4
>  struct fsl_qspi {
>         struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
> @@ -703,6 +713,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
>         { .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
>         { .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
>         { .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },
> +       { .compatible = "fsl,imx6ul-qspi", .data = (void *)&imx6ul_data, },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
