Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfgHh-0003ep-BL
 for linux-mtd@lists.infradead.org; Sun, 19 Oct 2014 02:31:54 +0000
Received: by mail-pd0-f170.google.com with SMTP id p10so2911026pdj.29
 for <linux-mtd@lists.infradead.org>; Sat, 18 Oct 2014 19:31:32 -0700 (PDT)
Date: Sun, 19 Oct 2014 10:31:19 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd : fsl-quadspi: Let the clocks error path be clearer
Message-ID: <20141019023117.GC1412@localhost.localdomain>
References: <1413576841-5707-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413576841-5707-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2014 at 05:14:01PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> When clk_prepare_enable(q->clk) fails it is clearer to disable the previous
> acquired clock (q->clk_en) in the error path rather than doing it locally.
> 
> So disable q->clk_en in the error path only.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index e1c517d..8006f26 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -843,9 +843,8 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  
>  	ret = clk_prepare_enable(q->clk);
>  	if (ret) {
> -		clk_disable_unprepare(q->clk_en);
>  		dev_err(dev, "can not enable the qspi clock\n");
> -		goto map_failed;
> +		goto clk_failed;
>  	}
>  
>  	/* find the irq */
> @@ -966,6 +965,7 @@ last_init_failed:
>  
>  irq_failed:
>  	clk_disable_unprepare(q->clk);
> +clk_failed:
>  	clk_disable_unprepare(q->clk_en);
>  map_failed:
>  	dev_err(dev, "Freescale QuadSPI probe failed\n");
> -- 
> 1.9.1
Acked-by: Huang Shijie <shijie8@gmail.com>
