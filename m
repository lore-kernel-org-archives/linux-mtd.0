Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLH2C-000317-B1
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 20:36:04 +0000
Received: by padck2 with SMTP id ck2so46117992pad.0
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 13:35:43 -0700 (PDT)
Date: Fri, 31 Jul 2015 13:35:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frank.Li@freescale.com
Cc: linux-mtd@lists.infradead.org, b45815@freescale.com, lznuaa@gmail.com
Subject: Re: [PATCH v3 2/8] mtd: spi-nor: fsl-quadspi: use quirk to
 distinguish different qspi version
Message-ID: <20150731203539.GB10676@google.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
 <1437761188-8179-3-git-send-email-Frank.Li@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437761188-8179-3-git-send-email-Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 25, 2015 at 02:06:22AM +0800, Frank.Li@freescale.com wrote:
> From: Han Xu <b45815@freescale.com>
> 
> add several quirk to distinguish different version of qspi module.
> 
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index ac9d633..5f31bc7 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -28,6 +28,11 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>  
> +/* Controller needs driver to swap endian */
> +#define QUADSPI_QUIRK_SWAP_ENDIAN	(1 << 0)
> +/* Controller needs 4x internal clock */
> +#define QUADSPI_QUIRK_4X_INT_CLK	(1 << 1)
> +
>  /* The registers */
>  #define QUADSPI_MCR			0x00
>  #define QUADSPI_MCR_RESERVED_SHIFT	16
> @@ -202,20 +207,23 @@ struct fsl_qspi_devtype_data {
>  	int rxfifo;
>  	int txfifo;
>  	int ahb_buf_size;
> +	int driver_data;
>  };
>  
>  static struct fsl_qspi_devtype_data vybrid_data = {
>  	.devtype = FSL_QUADSPI_VYBRID,
>  	.rxfifo = 128,
>  	.txfifo = 64,
> -	.ahb_buf_size = 1024
> +	.ahb_buf_size = 1024,
> +	.driver_data = QUADSPI_QUIRK_SWAP_ENDIAN

All field entries (including the last) should end the line with a comma,
so if you add fields in the future, you don't need to mess with the
previous line. This helps to keep the line-diff history a little more
clear.

>  };
>  
>  static struct fsl_qspi_devtype_data imx6sx_data = {
>  	.devtype = FSL_QUADSPI_IMX6SX,
>  	.rxfifo = 128,
>  	.txfifo = 512,
> -	.ahb_buf_size = 1024
> +	.ahb_buf_size = 1024,
> +	.driver_data = QUADSPI_QUIRK_4X_INT_CLK

Ditto.

Otherwise, looks good:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>

>  };
>  
>  #define FSL_QSPI_MAX_CHIP	4
> @@ -239,14 +247,14 @@ struct fsl_qspi {
>  	struct mutex lock;
>  };
>  
> -static inline int is_vybrid_qspi(struct fsl_qspi *q)
> +static inline int needs_swap_endian(struct fsl_qspi *q)
>  {
> -	return q->devtype_data->devtype == FSL_QUADSPI_VYBRID;
> +	return q->devtype_data->driver_data & QUADSPI_QUIRK_SWAP_ENDIAN;
>  }
>  
> -static inline int is_imx6sx_qspi(struct fsl_qspi *q)
> +static inline int needs_4x_clock(struct fsl_qspi *q)
>  {
> -	return q->devtype_data->devtype == FSL_QUADSPI_IMX6SX;
> +	return q->devtype_data->driver_data & QUADSPI_QUIRK_4X_INT_CLK;
>  }
>  
>  /*
> @@ -255,7 +263,7 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q)
>   */
>  static inline u32 fsl_qspi_endian_xchg(struct fsl_qspi *q, u32 a)
>  {
> -	return is_vybrid_qspi(q) ? __swab32(a) : a;
> +	return needs_swap_endian(q) ? __swab32(a) : a;
>  }
>  
>  static inline void fsl_qspi_unlock_lut(struct fsl_qspi *q)
> @@ -650,7 +658,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  	unsigned long rate = q->clk_rate;
>  	int ret;
>  
> -	if (is_imx6sx_qspi(q))
> +	if (needs_4x_clock(q))
>  		rate *= 4;
>  
>  	ret = clk_set_rate(q->clk, rate);
> -- 
> 1.9.1
> 
