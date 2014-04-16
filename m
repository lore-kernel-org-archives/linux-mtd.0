Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaLaA-00080t-9k
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 08:52:38 +0000
Message-ID: <534E4528.6030700@freescale.com>
Date: Wed, 16 Apr 2014 16:54:00 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: fix __iomem annotations
References: <1397638079-1894-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397638079-1894-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2014=C4=EA04=D4=C216=C8=D5 16:47, Brian Norris =D0=B4=B5=C0:
> This corrects some sparse warnings:
>
>    drivers/mtd/spi-nor/fsl-quadspi.c:281:31: warning: incorrect type in=
 initializer (different address spaces) [sparse]
>    drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    expected void *[noderef=
] <asn:2>base [sparse]
>    drivers/mtd/spi-nor/fsl-quadspi.c:281:31:    got void [noderef] <asn=
:2>*iobase [sparse]
>    (etc.)
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Branched off of a previous patch series, but dropped the memcpy() stuff=
 for now
>
>  drivers/mtd/spi-nor/fsl-quadspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fs=
l-quadspi.c
> index b41bbbc531ff..8d659a2888d5 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -278,7 +278,7 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, vo=
id *dev_id)
> =20
>  static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  {
> -	void *__iomem base =3D q->iobase;
> +	void __iomem *base =3D q->iobase;
>  	int rxfifo =3D q->devtype_data->rxfifo;
>  	u32 lut_base;
>  	u8 cmd, addrlen, dummy;
> @@ -422,7 +422,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u=
8 cmd)
>  static int
>  fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsigned int addr, int len=
)
>  {
> -	void *__iomem base =3D q->iobase;
> +	void __iomem *base =3D q->iobase;
>  	int seqid;
>  	u32 reg, reg2;
>  	int err;
Acked-by: Huang Shijie <b32955@freescale.com>
