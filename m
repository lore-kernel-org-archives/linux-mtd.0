Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z00J8-0006tX-C1
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 04:29:39 +0000
Received: by qkx62 with SMTP id 62so113024378qkx.3
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jun 2015 21:29:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1432554579-2431-1-git-send-email-haikun.wang@freescale.com>
References: <1432554579-2431-1-git-send-email-haikun.wang@freescale.com>
Date: Tue, 2 Jun 2015 23:29:13 -0500
Message-ID: <CA+EcR230Q5QbPB+_T3FMTmQSpVGnDRitbK5vqrnb+89--KGyZQ@mail.gmail.com>
Subject: Re: [PATCH 1/4 v2] mtd: spi-nor: fsl-quadspi: Enable LS1021 support
From: Han Xu <xhnjupt@gmail.com>
To: Haikun Wang <haikun.wang@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 25, 2015 at 6:49 AM, Haikun Wang <haikun.wang@freescale.com> wrote:
> Add LS1021 QSPI chip special information
>
> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
> ---
>
> Changes in v2:
> - Fix compile issue
> - Add ahb_buf_size initialization
>
>  drivers/mtd/spi-nor/fsl-quadspi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 5d5d362..91d6fab 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -194,6 +194,7 @@
>  enum fsl_qspi_devtype {
>         FSL_QUADSPI_VYBRID,
>         FSL_QUADSPI_IMX6SX,
> +       FSL_QUADSPI_LS1,
>  };
>
>  struct fsl_qspi_devtype_data {
> @@ -217,6 +218,13 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
>         .ahb_buf_size = 1024
>  };
>
> +static struct fsl_qspi_devtype_data ls1_data = {
> +       .devtype = FSL_QUADSPI_LS1,
> +       .rxfifo = 128,
> +       .txfifo = 64,
> +       .ahb_buf_size = 1024
> +};
> +
>  #define FSL_QSPI_MAX_CHIP      4
>  struct fsl_qspi {
>         struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
> @@ -665,6 +673,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  static struct of_device_id fsl_qspi_dt_ids[] = {
>         { .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
>         { .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
> +       { .compatible = "fsl,ls1-qspi", .data = (void *)&ls1_data, },

The patch doesn't apply to latest l2-mtd.git, could you please rebase
and resend?

Han Xu

>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
> --
> 2.1.0.27.g96db324
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
