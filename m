Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ1cz-0006Zh-Pt
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 23:09:42 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFT PATCH 1/4] mtd: fsl-quadspi: use automatic spi-nor detection
Date: Fri, 14 Aug 2015 01:09:14 +0200
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Han Xu <han.xu@freescale.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508140109.14149.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, August 14, 2015 at 12:46:02 AM, Brian Norris wrote:
> We don't really need the flash information from the device tree here.
> Let's stick with autodetection here instead.

Thanks for keeping me in the loop.

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c
> b/drivers/mtd/spi-nor/fsl-quadspi.c index d32b7e04ccca..2a17ec6269ff
> 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -1006,8 +1006,6 @@ static int fsl_qspi_probe(struct platform_device
> *pdev)
> 
>  	/* iterate the subnodes. */
>  	for_each_available_child_of_node(dev->of_node, np) {
> -		char modalias[40];
> -
>  		/* skip the holes */
>  		if (!q->has_second_chip)
>  			i *= 2;
> @@ -1030,10 +1028,6 @@ static int fsl_qspi_probe(struct platform_device
> *pdev) nor->prepare = fsl_qspi_prep;
>  		nor->unprepare = fsl_qspi_unprep;
> 
> -		ret = of_modalias_node(np, modalias, sizeof(modalias));
> -		if (ret < 0)
> -			goto mutex_failed;
> -
>  		ret = of_property_read_u32(np, "spi-max-frequency",
>  				&q->clk_rate);
>  		if (ret < 0)
> @@ -1042,7 +1036,7 @@ static int fsl_qspi_probe(struct platform_device
> *pdev) /* set the chip address for READID */
>  		fsl_qspi_set_base_addr(q, nor);
> 
> -		ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
> +		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);

This is something I don't quite understand. So we have a SPI NOR controller,
which as it's own struct device instance.

This controller can have multiple SPI NORs on it. Each SPI NOR has it's own
struct spi_nor instance and struct mtd_info instance, right?

But, all of the SPI NORs share the same struct device as the controller. Do
I understand that correctly ? Does that make sense to NOT allocate a new
struct device for each of the SPI NORs ?

Best regards,
Marek Vasut
