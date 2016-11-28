Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBHK6-00051Y-0R
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 08:30:03 +0000
Subject: Re: [PATCH] mtd: spi-nor: constify fsl_qspi_devtype_data
To: LABBE Corentin <clabbe.montjoie@gmail.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <han.xu@nxp.com>
References: <1471352198-7327-1-git-send-email-clabbe.montjoie@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <b499726b-6148-ee60-69a7-afa8f3c3c5c0@atmel.com>
Date: Mon, 28 Nov 2016 09:29:48 +0100
MIME-Version: 1.0
In-Reply-To: <1471352198-7327-1-git-send-email-clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 16/08/2016 à 14:56, LABBE Corentin a écrit :
> All fsl_qspi_devtype_data structures are never modified.
> This patch constify them.
> 
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
Applied to git://github.com/spi-nor/linux.git

Thanks!

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
> 
