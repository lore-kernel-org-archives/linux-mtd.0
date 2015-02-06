Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJa9t-0005Bb-O6
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 04:04:46 +0000
Received: by mail-pa0-f53.google.com with SMTP id lf10so6943786pab.12
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 20:04:24 -0800 (PST)
Date: Thu, 5 Feb 2015 20:04:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] mtd: fsl-quadspi: Fix the error paths
Message-ID: <20150206040421.GD18140@ld-irv-0074>
References: <1421973787-3240-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421973787-3240-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com, han.xu@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 22, 2015 at 10:43:05PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Jumping to 'map_failed' label is not correct at these points, as it misses to
> disable the clocks that were previously enabled.
> 
> Jump to 'irq_failed' label instead that will correctly disable the clocks.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Applied all 3 to l2-mtd.git, thanks.

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
>  		ret = of_modalias_node(np, modalias, sizeof(modalias));
>  		if (ret < 0)
> -			goto map_failed;
> +			goto irq_failed;
>  
>  		ret = of_property_read_u32(np, "spi-max-frequency",
>  				&q->clk_rate);
>  		if (ret < 0)
> -			goto map_failed;
> +			goto irq_failed;
>  
>  		/* set the chip address for READID */
>  		fsl_qspi_set_base_addr(q, nor);
>  
>  		ret = spi_nor_scan(nor, modalias, SPI_NOR_QUAD);
>  		if (ret)
> -			goto map_failed;
> +			goto irq_failed;
>  
>  		ppdata.of_node = np;
>  		ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
>  		if (ret)
> -			goto map_failed;
> +			goto irq_failed;
>  
>  		/* Set the correct NOR size now. */
>  		if (q->nor_size == 0) {

FYI, the error handling is still wrong here (it's just less wrong). If
the second device fails to scan for some reason, you aren't
unregistering the first. This will leave an MTD around that has no
driver backing it.

Brian
