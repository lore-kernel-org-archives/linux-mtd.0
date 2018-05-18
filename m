Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJlaN-0007zJ-VQ
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 20:02:45 +0000
Date: Fri, 18 May 2018 22:02:21 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: <linux-mtd@lists.infradead.org>, boris.brezillon@free-electrons.com,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com
Subject: Re: [PATCH] mtd: fsl-quadspi: fix api naming typo _init_ahb_read
Message-ID: <20180518220221.77213525@bbrezillon>
In-Reply-To: <1514889552-23603-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1514889552-23603-1-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2 Jan 2018 16:09:12 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> Fix api naming typo _init_ahb_read
> fsl_qspi_init_abh_read --> fsl_qspi_init_ahb_read
> 
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

Queued to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index f17d224..943e9c4 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -661,7 +661,7 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
>   * causes the controller to clear the buffer, and use the sequence pointed
>   * by the QUADSPI_BFGENCR[SEQID] to initiate a read from the flash.
>   */
> -static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
> +static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
>  {
>  	void __iomem *base = q->iobase;
>  	int seqid;
> @@ -795,7 +795,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>  	fsl_qspi_init_lut(q);
>  
>  	/* Init for AHB read */
> -	fsl_qspi_init_abh_read(q);
> +	fsl_qspi_init_ahb_read(q);
>  
>  	return 0;
>  }



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
