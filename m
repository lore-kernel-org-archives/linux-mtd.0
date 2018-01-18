Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecDsm-0005nb-E0
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 17:21:46 +0000
Received: by mail-oi0-x244.google.com with SMTP id n81so16218818oig.8
 for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2018 09:21:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1514889552-23603-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1514889552-23603-1-git-send-email-yogeshnarayan.gaur@nxp.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Thu, 18 Jan 2018 11:21:32 -0600
Message-ID: <CA+EcR23+mHbYTmexixjrJVK_-Nm=D=0tKQgGW4Z_QojMkpfM7w@mail.gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: fix api naming typo _init_ahb_read
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 prabhakar.kushwaha@nxp.com,
 suresh.gupta@nxp.com, cyrille.pitchen@wedev4u.fr,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 2, 2018 at 4:39 AM, Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:
> Fix api naming typo _init_ahb_read
> fsl_qspi_init_abh_read --> fsl_qspi_init_ahb_read
>
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
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
>         void __iomem *base = q->iobase;
>         int seqid;
> @@ -795,7 +795,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>         fsl_qspi_init_lut(q);
>
>         /* Init for AHB read */
> -       fsl_qspi_init_abh_read(q);
> +       fsl_qspi_init_ahb_read(q);
>
>         return 0;
>  }
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Acked-by: Han Xu <han.xu@nxp.com>

-- 
Sincerely,

Han XU
