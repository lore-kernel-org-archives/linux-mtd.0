Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgren-0001nn-L5
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:52:38 +0000
Received: by mail-pa0-f52.google.com with SMTP id fb1so3229800pad.25
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:52:15 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:52:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] mtd: fsl-quadspi: Provide an error code on
 spi_nor_match_id() failure
Message-ID: <20141022085212.GM16128@brian-ubuntu>
References: <1413570669-30738-1-git-send-email-festevam@gmail.com>
 <1413570669-30738-2-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413570669-30738-2-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 b45815@freescale.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2014 at 03:31:09PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> If spi_nor_match_id fails then we need to propagate an error code into 'ret',
> otherwise the probe function will succeed.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index c5d10c3..4a2799f 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -911,8 +911,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  			goto map_failed;
>  
>  		id = spi_nor_match_id(modalias);
> -		if (!id)
> +		if (!id) {
> +			ret = -EINVAL;
>  			goto map_failed;
> +		}

The call to spi_nor_match_id() was dropped, so this patch is not
necessary any more.

>  
>  		ret = of_property_read_u32(np, "spi-max-frequency",
>  				&q->clk_rate);

Regards,
Brian
