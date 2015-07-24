Received: from mail-vn0-x234.google.com ([2607:f8b0:400c:c0f::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIf7Q-0004Vr-SV
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 15:42:45 +0000
Received: by vnav141 with SMTP id v141so10410135vna.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2015 08:42:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437507599-25424-7-git-send-email-Frank.Li@freescale.com>
References: <1437507599-25424-1-git-send-email-Frank.Li@freescale.com>
 <1437507599-25424-7-git-send-email-Frank.Li@freescale.com>
Date: Fri, 24 Jul 2015 10:42:19 -0500
Message-ID: <CA+EcR20tdPxQpqS3CZ5ZGXTf8Fi2PFoJs57-VBdWYEbVrcFL5Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] mtd: spi-nor: fsl-quadspi: fix unsupported cmd when
 run flash_erase
From: Han Xu <xhnjupt@gmail.com>
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "b45815@freescale.com" <b45815@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2015 at 2:39 PM,  <Frank.Li@freescale.com> wrote:
> From: Frank Li <Frank.Li@freescale.com>
>
> fsl-quadspi 21e0000.qspi: Unsupported cmd 0x20
>
> when config CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enable,
> erase will use SPINOR_OP_BE_4K, which was not supported by fsl-quadspi
> driver
>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>

Acked-by: Han Xu <han.xu@freescale.com>

> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 68054c1..d2981c5 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -396,11 +396,11 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>         lut_base = SEQID_SE * 4;
>
>         if (q->nor_size <= SZ_16M) {
> -               cmd = SPINOR_OP_SE;
> +               cmd = q->nor[0].erase_opcode;
>                 addrlen = ADDR24BIT;
>         } else {
>                 /* use the 4-byte address */
> -               cmd = SPINOR_OP_SE;
> +               cmd = q->nor[0].erase_opcode;
>                 addrlen = ADDR32BIT;
>         }
>
> @@ -471,6 +471,8 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>         case SPINOR_OP_BRWR:
>                 return SEQID_BRWR;
>         default:
> +               if (cmd == q->nor[0].erase_opcode)
> +                       return SEQID_SE;
>                 dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
>                 break;
>         }
> --
> 1.9.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
