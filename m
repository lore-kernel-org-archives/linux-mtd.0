Received: from mail-vn0-x22e.google.com ([2607:f8b0:400c:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIf5N-0001t7-H4
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 15:40:36 +0000
Received: by vnk197 with SMTP id 197so10339930vnk.3
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 08:40:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
Date: Fri, 24 Jul 2015 10:40:12 -0500
Message-ID: <CA+EcR23Y8OF2e90jAgw7r1ufscXhejo7wk_OU1HQLK+S32AzKA@mail.gmail.com>
Subject: Re: [PATCH 1/7] mtd: spi-nor: fsl-quadspi: use quirk to distinguish
 different qspi version
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
> From: Han Xu <b45815@freescale.com>
>
> add several quirk to distinguish different version of qspi module.
>
> Signed-off-by: Han Xu <b45815@freescale.com>

Acked-by: Han Xu <han.xu@freescale.com>

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index e854004..258bebf 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -28,6 +28,11 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>
> +/* Controller needs driver to swap endian */
> +#define QUADSPI_QUIRK_SWAP_ENDIAN      (1 << 0)
> +/* Controller needs 4x internal clock */
> +#define QUADSPI_QUIRK_4X_INT_CLK       (1 << 1)
> +
>  /* The registers */
>  #define QUADSPI_MCR                    0x00
>  #define QUADSPI_MCR_RESERVED_SHIFT     16
> @@ -202,20 +207,23 @@ struct fsl_qspi_devtype_data {
>         int rxfifo;
>         int txfifo;
>         int ahb_buf_size;
> +       int driver_data;
>  };
>
>  static struct fsl_qspi_devtype_data vybrid_data = {
>         .devtype = FSL_QUADSPI_VYBRID,
>         .rxfifo = 128,
>         .txfifo = 64,
> -       .ahb_buf_size = 1024
> +       .ahb_buf_size = 1024,
> +       .driver_data = QUADSPI_QUIRK_SWAP_ENDIAN
>  };
>
>  static struct fsl_qspi_devtype_data imx6sx_data = {
>         .devtype = FSL_QUADSPI_IMX6SX,
>         .rxfifo = 128,
>         .txfifo = 512,
> -       .ahb_buf_size = 1024
> +       .ahb_buf_size = 1024,
> +       .driver_data = QUADSPI_QUIRK_4X_INT_CLK
>  };
>
>  #define FSL_QSPI_MAX_CHIP      4
> @@ -239,14 +247,14 @@ struct fsl_qspi {
>         struct mutex lock;
>  };
>
> -static inline int is_vybrid_qspi(struct fsl_qspi *q)
> +static inline int needs_swap_endian(struct fsl_qspi *q)
>  {
> -       return q->devtype_data->devtype == FSL_QUADSPI_VYBRID;
> +       return q->devtype_data->driver_data & QUADSPI_QUIRK_SWAP_ENDIAN;
>  }
>
> -static inline int is_imx6sx_qspi(struct fsl_qspi *q)
> +static inline int needs_4x_clock(struct fsl_qspi *q)
>  {
> -       return q->devtype_data->devtype == FSL_QUADSPI_IMX6SX;
> +       return q->devtype_data->driver_data & QUADSPI_QUIRK_4X_INT_CLK;
>  }
>
>  /*
> @@ -255,7 +263,7 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q)
>   */
>  static inline u32 fsl_qspi_endian_xchg(struct fsl_qspi *q, u32 a)
>  {
> -       return is_vybrid_qspi(q) ? __swab32(a) : a;
> +       return needs_swap_endian(q) ? __swab32(a) : a;
>  }
>
>  static inline void fsl_qspi_unlock_lut(struct fsl_qspi *q)
> @@ -650,7 +658,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>         unsigned long rate = q->clk_rate;
>         int ret;
>
> -       if (is_imx6sx_qspi(q))
> +       if (needs_4x_clock(q))
>                 rate *= 4;
>
>         ret = clk_set_rate(q->clk, rate);
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
