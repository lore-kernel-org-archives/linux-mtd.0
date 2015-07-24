Received: from mail-vn0-x22e.google.com ([2607:f8b0:400c:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIf2Y-0007sA-QJ
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 15:37:39 +0000
Received: by vnaa140 with SMTP id a140so10333050vna.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 08:37:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437507599-25424-2-git-send-email-Frank.Li@freescale.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
 <1437507599-25424-2-git-send-email-Frank.Li@freescale.com>
Date: Fri, 24 Jul 2015 10:37:17 -0500
Message-ID: <CA+EcR21ubBgW+eUeu0bdsgw5fTD46ug-zf-eBv5OQ_2wr0N7_w@mail.gmail.com>
Subject: Re: [PATCH 2/7] mtd: spi-nor: fsl-quadspi: add imx7d support
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
> Support i.mx7d.
> quadspi in i.mx7d increase rxfifo.
> require fill at least 16byte to trigger data transfer.
>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> Signed-off-by: Han Xu <b45815@freescale.com>

Acked-by: Han Xu <han.xu@freescale.com>

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 258bebf..9c3e38d 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -32,6 +32,11 @@
>  #define QUADSPI_QUIRK_SWAP_ENDIAN      (1 << 0)
>  /* Controller needs 4x internal clock */
>  #define QUADSPI_QUIRK_4X_INT_CLK       (1 << 1)
> +/*
> + * TKT253890, Controller needs driver to fill txfifo till 16 byte to
> + * trigger data transfer even though extern data will not transferred.
> + */
> +#define QUADSPI_QUIRK_TKT253890                (1 << 2)
>
>  /* The registers */
>  #define QUADSPI_MCR                    0x00
> @@ -200,6 +205,7 @@
>  enum fsl_qspi_devtype {
>         FSL_QUADSPI_VYBRID,
>         FSL_QUADSPI_IMX6SX,
> +       FSL_QUADSPI_IMX7D,
>  };
>
>  struct fsl_qspi_devtype_data {
> @@ -226,6 +232,15 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
>         .driver_data = QUADSPI_QUIRK_4X_INT_CLK
>  };
>
> +static struct fsl_qspi_devtype_data imx7d_data = {
> +       .devtype = FSL_QUADSPI_IMX7D,
> +       .rxfifo = 512,
> +       .txfifo = 512,
> +       .ahb_buf_size = 1024,
> +       .driver_data = QUADSPI_QUIRK_TKT253890
> +                      | QUADSPI_QUIRK_4X_INT_CLK
> +};
> +
>  #define FSL_QSPI_MAX_CHIP      4
>  struct fsl_qspi {
>         struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
> @@ -257,6 +272,11 @@ static inline int needs_4x_clock(struct fsl_qspi *q)
>         return q->devtype_data->driver_data & QUADSPI_QUIRK_4X_INT_CLK;
>  }
>
> +static inline int needs_fill_txfifo(struct fsl_qspi *q)
> +{
> +       return q->devtype_data->driver_data & QUADSPI_QUIRK_TKT253890;
> +}
> +
>  /*
>   * An IC bug makes us to re-arrange the 32-bit data.
>   * The following chips, such as IMX6SLX, have fixed this bug.
> @@ -558,6 +578,11 @@ static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,
>                 txbuf++;
>         }
>
> +       /* fill the TXFIFO upto 16 bytes for i.MX7d */
> +       if (needs_fill_txfifo(q))
> +               for (; i < 4; i++)
> +                       writel(tmp, q->iobase + QUADSPI_TBDR);
> +
>         /* Trigger it */
>         ret = fsl_qspi_runcmd(q, opcode, to, count);
>
> @@ -677,6 +702,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  static const struct of_device_id fsl_qspi_dt_ids[] = {
>         { .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
>         { .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
> +       { .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },
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
