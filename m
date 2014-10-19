Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfgGc-0003OR-Bi
 for linux-mtd@lists.infradead.org; Sun, 19 Oct 2014 02:30:46 +0000
Received: by mail-pa0-f43.google.com with SMTP id lf10so3025588pab.30
 for <linux-mtd@lists.infradead.org>; Sat, 18 Oct 2014 19:30:24 -0700 (PDT)
Date: Sun, 19 Oct 2014 10:30:10 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: fsl-quadspi: Propagate the error from
 of_modalias_node()
Message-ID: <20141019023007.GB1412@localhost.localdomain>
References: <1413570669-30738-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413570669-30738-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 b45815@freescale.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2014 at 03:31:08PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> The 'map_failed' label will return 'ret', so we need to assign the error
> code to 'ret', otherwise the probe function will return success.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 8d659a2..c5d10c3 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -906,7 +906,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  		nor->prepare = fsl_qspi_prep;
>  		nor->unprepare = fsl_qspi_unprep;
>  
> -		if (of_modalias_node(np, modalias, sizeof(modalias)) < 0)
> +		ret = of_modalias_node(np, modalias, sizeof(modalias));
> +		if (ret < 0)
>  			goto map_failed;
>  
>  		id = spi_nor_match_id(modalias);
> -- 
> 1.9.1
> 
thanks, please add my acks to both the patches.

Acked-by: Huang Shijie <shijie8@gmail.com>
