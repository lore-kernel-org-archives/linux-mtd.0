Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWvAN-0006xE-JI
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 23:40:40 +0000
Received: by vkbc123 with SMTP id c123so66194758vkb.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 16:40:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
Date: Tue, 1 Sep 2015 18:40:17 -0500
Message-ID: <CA+EcR224fveExjquswAJn9+XZOSRyUA03H8u1tgtHsM-Qvn+tw@mail.gmail.com>
Subject: Re: [RFT PATCH 1/4] mtd: fsl-quadspi: use automatic spi-nor detection
From: Han Xu <xhnjupt@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Marek Vasut <marex@denx.de>, Joachim Eastwood <manabian@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Han Xu <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 13, 2015 at 5:46 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> We don't really need the flash information from the device tree here.
> Let's stick with autodetection here instead.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index d32b7e04ccca..2a17ec6269ff 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -1006,8 +1006,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>
>         /* iterate the subnodes. */
>         for_each_available_child_of_node(dev->of_node, np) {
> -               char modalias[40];
> -
>                 /* skip the holes */
>                 if (!q->has_second_chip)
>                         i *= 2;
> @@ -1030,10 +1028,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>                 nor->prepare = fsl_qspi_prep;
>                 nor->unprepare = fsl_qspi_unprep;
>
> -               ret = of_modalias_node(np, modalias, sizeof(modalias));
> -               if (ret < 0)
> -                       goto mutex_failed;
> -
>                 ret = of_property_read_u32(np, "spi-max-frequency",
>                                 &q->clk_rate);
>                 if (ret < 0)
> @@ -1042,7 +1036,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>                 /* set the chip address for READID */
>                 fsl_qspi_set_base_addr(q, nor);
>
> -               ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
> +               ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
>                 if (ret)
>                         goto mutex_failed;
>

Acked-by: Han xu <han.xu@freescale.com>
Tested-by: Han xu <han.xu@freescale.com>

> --
> 2.5.0.276.gf5e568e
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
