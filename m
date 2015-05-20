Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv7iR-0006N1-6o
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 17:23:35 +0000
Received: by pdbnk13 with SMTP id nk13so76103941pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 10:23:12 -0700 (PDT)
Date: Wed, 20 May 2015 10:23:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Haikun Wang <haikun.wang@freescale.com>
Subject: Re: [PATCH 1/2 v1] mtd: spi-nor: fsl-quadspi: Enable LS1021 support
Message-ID: <20150520172309.GE11598@ld-irv-0074>
References: <1429871214-44560-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429871214-44560-1-git-send-email-haikun.wang@freescale.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, han.xu@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 24, 2015 at 06:26:54PM +0800, Haikun Wang wrote:
> Add LS1021 QSPI chip special information
> 
> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 5d5d362..1742de9 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -194,6 +194,7 @@
>  enum fsl_qspi_devtype {
>  	FSL_QUADSPI_VYBRID,
>  	FSL_QUADSPI_IMX6SX,
> +	FSL_QUADSPI_LS1,
>  };
>  
>  struct fsl_qspi_devtype_data {
> @@ -217,6 +218,12 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
>  	.ahb_buf_size = 1024
>  };
>  
> +static struct fsl_qspi_devtype_data ls1_data = {
> +	.devtype = FSL_QUADSPI_LS1,
> +	.rxfifo = 128,
> +	.txfifo = 64;

Do you compile test your changes? This definition does not use valid C
syntax. This shows that not only did you not test your code, you didn't
even compile it. I can't take your code when you make your lack of
diligence that obvious.

Same thing for your second patch.

Brian

> +};
> +
>  #define FSL_QSPI_MAX_CHIP	4
>  struct fsl_qspi {
>  	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
> @@ -665,6 +672,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  static struct of_device_id fsl_qspi_dt_ids[] = {
>  	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
>  	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
> +	{ .compatible = "fsl,ls1-qspi", .data = (void *)&ls1_data, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
