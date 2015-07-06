Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCEwg-0004rZ-1Z
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 22:33:03 +0000
Received: by pddu5 with SMTP id u5so25652033pdd.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2015 15:32:40 -0700 (PDT)
Date: Mon, 6 Jul 2015 15:32:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Haikun Wang <haikun.wang@freescale.com>
Cc: linux-mtd@lists.infradead.org, han.xu@freescale.com,
	dwmw2@infradead.org
Subject: Re: [PATCH 1/5 v1] mtd: spi-nor: fsl-quadspi: Add a variable in
 'fsl_qspi_devtype_data' to enable platform specail feature
Message-ID: <20150706223233.GD18370@brian-ubuntu>
References: <1435656518-14022-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435656518-14022-1-git-send-email-haikun.wang@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Haikun,

On Tue, Jun 30, 2015 at 05:28:34PM +0800, Haikun Wang wrote:
> Add a variable in struct fsl_qspi_devtype_data.
> Add big endian registers flag.
> Enable big endian registers flag for LS1021A.
> 
> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 6cd14e4..40c7953 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -191,6 +191,9 @@
>  #define SEQID_EN4B		10
>  #define SEQID_BRWR		11
>  
> +/* Controller needs swap endian when access registers */
> +#define QUADSPI_QUIRK_REGMAP_BE    (1 << 5)
> +
>  enum fsl_qspi_devtype {
>  	FSL_QUADSPI_VYBRID,
>  	FSL_QUADSPI_IMX6SX,
> @@ -202,6 +205,7 @@ struct fsl_qspi_devtype_data {
>  	int rxfifo;
>  	int txfifo;
>  	int ahb_buf_size;
> +	int driver_data;
>  };
>  
>  static struct fsl_qspi_devtype_data vybrid_data = {
> @@ -222,7 +226,8 @@ static struct fsl_qspi_devtype_data ls1_data = {
>  	.devtype = FSL_QUADSPI_LS1,
>  	.rxfifo = 128,
>  	.txfifo = 64,
> -	.ahb_buf_size = 1024
> +	.ahb_buf_size = 1024,
> +	.driver_data = QUADSPI_QUIRK_REGMAP_BE
>  };
>  
>  #define FSL_QSPI_MAX_CHIP	4

This patch series appears to be based on an unreviewed, unapplied series
you sent a few weeks ago. But you didn't note the dependency. In the
future, please make note of such dependencies (e.g., by providing a
cover letter which explains this), to help reviewers like myself. If we
can't apply your patches, we can't really review them.

Thanks,
Brian
