Received: from s159.web-hosting.com ([68.65.121.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWo9Y-0004qC-4E
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 16:11:21 +0000
Received: from mail-la0-f47.google.com ([209.85.215.47]:36608)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <jteki@openedev.com>) id 1ZWo97-002Esw-PL
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 12:10:58 -0400
Received: by lanb10 with SMTP id b10so3182322lan.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 09:10:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1440586128-4325-1-git-send-email-jteki@openedev.com>
References: <1440586128-4325-1-git-send-email-jteki@openedev.com>
Date: Tue, 1 Sep 2015 21:40:52 +0530
Message-ID: <CAD6G_RT05bSJCz1_-GhLudQXiCoULbbUzvrUqihz1_TNY=APkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: Add clear flag status register
 support
From: Jagan Teki <jteki@openedev.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jagan Teki <jteki@openedev.com>,
 Hou Zhiqiang <B48286@freescale.com>, "Mingkai.Hu" <Mingkai.Hu@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26 August 2015 at 16:18, Jagan Teki <jteki@openedev.com> wrote:
> The clear flag status register operation is required by Micron
> SPI-NOR chips, which support FSR. And if error bits of FSR
> have been set like protection, voltage, erase, and program,
> it must be cleared by executing clear FSR operation.
>
> Signed-off-by: Jagan Teki <jteki@openedev.com>
> Cc: Hou Zhiqiang <B48286@freescale.com>
> Cc: Mingkai.Hu <Mingkai.Hu@freescale.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>

Any response, please comment

> ---
> Changes for v2:
>         - Write cfsr instead of reading it.
>         - Return -EINVAL instead of -1
>
>  drivers/mtd/spi-nor/spi-nor.c | 23 +++++++++++++++++++----
>  include/linux/mtd/spi-nor.h   |  9 +++++++++
>  2 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f954d03..0a77061 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -163,6 +163,18 @@ static inline int write_disable(struct spi_nor *nor)
>         return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
>  }
>
> +/*
> + * The clear flag status register operation is required by Micron
> + * SPI-NOR chips, which support FSR. And if error bits of FSR
> + * have been set like protection, voltage, erase, and program,
> + * it must be cleared by executing clear FSR operation.
> + * Returns negative if error occurred.
> + */
> +static inline int write_cfsr(struct spi_nor *nor)
> +{
> +       return nor->write_reg(nor, SPINOR_OP_WRCFSR, NULL, 0);
> +}
> +
>  static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
>         return mtd->priv;
> @@ -209,10 +221,13 @@ static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  static inline int spi_nor_fsr_ready(struct spi_nor *nor)
>  {
>         int fsr = read_fsr(nor);
> -       if (fsr < 0)
> -               return fsr;
> -       else
> -               return fsr & FSR_READY;
> +       if (fsr & FSR_ERR_MASK) {
> +               pr_err("flag status(0x%x) error occured\n", fsr);
> +               write_cfsr(nor);
> +               return -EINVAL;
> +       }
> +
> +       return fsr & FSR_READY;
>  }
>
>  static int spi_nor_ready(struct spi_nor *nor)
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index c5a58c4..0288081 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -35,6 +35,7 @@
>  #define SPINOR_OP_RDID         0x9f    /* Read JEDEC ID */
>  #define SPINOR_OP_RDCR         0x35    /* Read configuration register */
>  #define SPINOR_OP_RDFSR                0x70    /* Read flag status register */
> +#define SPINOR_OP_WRCFSR       0x50    /* Write clear flag status register */
>
>  /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>  #define SPINOR_OP_READ4                0x13    /* Read data bytes (low frequency) */
> @@ -74,6 +75,14 @@
>  /* Enhanced Volatile Configuration Register bits */
>  #define EVCR_QUAD_EN_MICRON    0x80    /* Micron Quad I/O */
>
> +/* Flag Status Register Error bits */
> +#define FSR_ERR_PROT           0x2     /* Protection */
> +#define FSR_ERR_VOLT           0x8     /* Voltage on Vpp */
> +#define FSR_ERR_PROG           0x10    /* Program operation */
> +#define FSR_ERR_ERASE          0x20    /* Erase operation */
> +#define FSR_ERR_MASK           (FSR_ERR_PROT | FSR_ERR_VOLT | \
> +                               FSR_ERR_PROG | FSR_ERR_ERASE)
> +
>  /* Flag Status Register bits */
>  #define FSR_READY              0x80
>
> --
> 1.9.1
>

thanks!
-- 
Jagan.
