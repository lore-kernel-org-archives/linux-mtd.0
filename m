Received: from mail-qa0-x22b.google.com ([2607:f8b0:400d:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YEk1J-0000rF-IR
 for linux-mtd@lists.infradead.org; Fri, 23 Jan 2015 19:35:54 +0000
Received: by mail-qa0-f43.google.com with SMTP id v10so7315014qac.2
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jan 2015 11:35:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1421973787-3240-1-git-send-email-festevam@gmail.com>
References: <1421973787-3240-1-git-send-email-festevam@gmail.com>
Date: Fri, 23 Jan 2015 13:35:31 -0600
Message-ID: <CA+EcR23aJYDF_W8BrQayKm=z_p1k4am+4WRi8miT2cWZOf7amg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: fsl-quadspi: Fix the error paths
From: Han Xu <xhnjupt@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 22, 2015 at 6:43 PM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Jumping to 'map_failed' label is not correct at these points, as it misses to
> disable the clocks that were previously enabled.
>
> Jump to 'irq_failed' label instead that will correctly disable the clocks.
>
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index a46bea3..a733bd2 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -890,24 +890,24 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>
>                 ret = of_modalias_node(np, modalias, sizeof(modalias));
>                 if (ret < 0)
> -                       goto map_failed;
> +                       goto irq_failed;
>
>                 ret = of_property_read_u32(np, "spi-max-frequency",
>                                 &q->clk_rate);
>                 if (ret < 0)
> -                       goto map_failed;
> +                       goto irq_failed;
>
>                 /* set the chip address for READID */
>                 fsl_qspi_set_base_addr(q, nor);
>
>                 ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
>                 if (ret)
> -                       goto map_failed;
> +                       goto irq_failed;
>
>                 ppdata.of_node = np;
>                 ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
>                 if (ret)
> -                       goto map_failed;
> +                       goto irq_failed;
>
>                 /* Set the correct NOR size now. */
>                 if (q->nor_size == 0) {
> --
> 1.9.1
Acked-by: Han Xu <han.xu@freescale.com>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
