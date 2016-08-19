Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baoGf-0006eN-Mu
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 18:11:46 +0000
Received: by mail-pf0-x244.google.com with SMTP id y134so1795480pfg.3
 for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2016 11:11:25 -0700 (PDT)
Date: Sat, 20 Aug 2016 02:01:31 +0800
From: Han Xu <xhnjupt@gmail.com>
To: LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, han.xu@nxp.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: constify fsl_qspi_devtype_data
Message-ID: <20160819180131.GA729@shlinux2>
References: <1471352198-7327-1-git-send-email-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471352198-7327-1-git-send-email-clabbe.montjoie@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2016 at 02:56:38PM +0200, LABBE Corentin wrote:
> All fsl_qspi_devtype_data structures are never modified.
> This patch constify them.
> 
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 5c82e4e..b4d8953 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -224,7 +224,7 @@ struct fsl_qspi_devtype_data {
>  	int driver_data;
>  };
>  
> -static struct fsl_qspi_devtype_data vybrid_data = {
> +static const struct fsl_qspi_devtype_data vybrid_data = {
>  	.devtype = FSL_QUADSPI_VYBRID,
>  	.rxfifo = 128,
>  	.txfifo = 64,
> @@ -232,7 +232,7 @@ static struct fsl_qspi_devtype_data vybrid_data = {
>  	.driver_data = QUADSPI_QUIRK_SWAP_ENDIAN,
>  };
>  
> -static struct fsl_qspi_devtype_data imx6sx_data = {
> +static const struct fsl_qspi_devtype_data imx6sx_data = {
>  	.devtype = FSL_QUADSPI_IMX6SX,
>  	.rxfifo = 128,
>  	.txfifo = 512,
> @@ -241,7 +241,7 @@ static struct fsl_qspi_devtype_data imx6sx_data = {
>  		       | QUADSPI_QUIRK_TKT245618,
>  };
>  
> -static struct fsl_qspi_devtype_data imx7d_data = {
> +static const struct fsl_qspi_devtype_data imx7d_data = {
>  	.devtype = FSL_QUADSPI_IMX7D,
>  	.rxfifo = 512,
>  	.txfifo = 512,
> @@ -250,7 +250,7 @@ static struct fsl_qspi_devtype_data imx7d_data = {
>  		       | QUADSPI_QUIRK_4X_INT_CLK,
>  };
>  
> -static struct fsl_qspi_devtype_data imx6ul_data = {
> +static const struct fsl_qspi_devtype_data imx6ul_data = {
>  	.devtype = FSL_QUADSPI_IMX6UL,
>  	.rxfifo = 128,
>  	.txfifo = 512,
> -- 
> 2.7.3
> 
Acked-by: Han Xu <han.xu@nxp.com>
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
