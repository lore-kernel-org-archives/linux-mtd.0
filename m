Received: from mail-vn0-x235.google.com ([2607:f8b0:400c:c0f::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIf66-000399-2L
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 15:41:24 +0000
Received: by vnaa140 with SMTP id a140so10373231vna.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 08:40:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437507599-25424-6-git-send-email-Frank.Li@freescale.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
 <1437507599-25424-6-git-send-email-Frank.Li@freescale.com>
Date: Fri, 24 Jul 2015 10:40:56 -0500
Message-ID: <CA+EcR21RSOdyLEm4GpEcTLtemOSQW3j=vhvVKpznFprS4yNz=w@mail.gmail.com>
Subject: Re: [PATCH 6/7] mtd: spi-nor: fsl-quadspi: reset the module in the
 probe
From: Han Xu <xhnjupt@gmail.com>
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "b45815@freescale.com" <b45815@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, Huang Shijie <shijie8@gmail.com>
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
> The uboot may run the QuadSpi controler with command:
>     #sf probe
>
> So we should reset the module in the probe.
> This patch also clear the pending interrupts which arised by the uboot
> code.
>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>

Acked-by: Han Xu <han.xu@freescale.com>

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 10a2c23..68054c1 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -715,6 +715,11 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>         if (ret)
>                 return ret;
>
> +       /* Reset the module */
> +       writel(QUADSPI_MCR_SWRSTSD_MASK | QUADSPI_MCR_SWRSTHD_MASK,
> +               base + QUADSPI_MCR);
> +       udelay(1);
> +
>         /* Init the LUT table. */
>         fsl_qspi_init_lut(q);
>
> @@ -732,6 +737,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>         writel(QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,
>                         base + QUADSPI_MCR);
>
> +       /* clear all interrupt status */
> +       writel(0xffffffff, q->iobase + QUADSPI_FR);
> +
>         /* enable the interrupt */
>         writel(QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
>
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
