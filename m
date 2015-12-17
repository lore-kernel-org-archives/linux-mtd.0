Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9O4S-0004gn-6z
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2015 02:13:33 +0000
Date: Thu, 17 Dec 2015 02:12:55 +0000
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <b45815@freescale.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, <fabio.estevam@freescale.com>,
 <hofrat@osadl.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <vinod.koul@intel.com>,
 <dan.j.williams@intel.com>, <dmaengine@vger.kernel.org>
Subject: Re: [PATCH v8 5/7] mtd: nand: gpmi: add GPMI NAND support for i.MX7D
Message-ID: <20151217021253.GE631@robwan01-pc.asiapac.arm.com>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-6-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1449096466-18064-6-git-send-email-b45815@freescale.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 04:47:44PM -0600, Han Xu wrote:
> support GPMI NAND on i.MX7D
>
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 14 +++++++-------
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 10 ++++++----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 27 ++++++++++++++++++++++-----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  7 +++++--
>  4 files changed, 40 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/bch-regs.h b/drivers/mtd/nand/gpm=
i-nand/bch-regs.h
> index 05bb91f..53e58bc 100644
> --- a/drivers/mtd/nand/gpmi-nand/bch-regs.h
> +++ b/drivers/mtd/nand/gpmi-nand/bch-regs.h
> @@ -1,7 +1,7 @@
>  /*
>   * Freescale GPMI NAND Flash Driver
>   *
> - * Copyright 2008-2011 Freescale Semiconductor, Inc.
> + * Copyright 2008-2015 Freescale Semiconductor, Inc.
>   * Copyright 2008 Embedded Alley Solutions, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify
> @@ -54,7 +54,7 @@
>  #define MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0               11
>  #define MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0       (0x1f << MX6Q_BP_BCH_FLASH0=
LAYOUT0_ECC0)
>  #define BF_BCH_FLASH0LAYOUT0_ECC0(v, x)                              \
> -     (GPMI_IS_MX6(x)                                 \
> +     ((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))                             \
>               ? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0)      \
>                       & MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0)       \
>               : (((v) << BP_BCH_FLASH0LAYOUT0_ECC0)           \
> @@ -65,7 +65,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14                   \
>                               (0x1 << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)
>  #define BF_BCH_FLASH0LAYOUT0_GF(v, x)                                \
> -     ((GPMI_IS_MX6(x) && ((v) =3D=3D 14))                        \
> +     (((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) =3D=3D 14))\
>               ? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)  \
>                       & MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14)   \
>               : 0                                             \
> @@ -77,7 +77,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE \
>                       (0x3ff << BP_BCH_FLASH0LAYOUT0_DATA0_SIZE)
>  #define BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(v, x)                           =
     \
> -     (GPMI_IS_MX6(x)                                         \
> +     ((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))     \
>               ? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)   \
>               : ((v) & BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)               \
>       )
> @@ -96,7 +96,7 @@
>  #define MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN               11
>  #define MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN       (0x1f << MX6Q_BP_BCH_FLASH0=
LAYOUT1_ECCN)
>  #define BF_BCH_FLASH0LAYOUT1_ECCN(v, x)                              \
> -     (GPMI_IS_MX6(x)                                 \
> +     ((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))                             \
>               ? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN)      \
>                       & MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN)       \
>               : (((v) << BP_BCH_FLASH0LAYOUT1_ECCN)           \
> @@ -107,7 +107,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14                   \
>                               (0x1 << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)
>  #define BF_BCH_FLASH0LAYOUT1_GF(v, x)                                \
> -     ((GPMI_IS_MX6(x) && ((v) =3D=3D 14))                        \
> +     (((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) =3D=3D 14))\
>               ? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)  \
>                       & MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14)   \
>               : 0                                             \
> @@ -119,7 +119,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE \
>                       (0x3ff << BP_BCH_FLASH0LAYOUT1_DATAN_SIZE)
>  #define BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(v, x)                           =
     \
> -     (GPMI_IS_MX6(x)                                         \
> +     ((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))     \
>               ? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)   \
>               : ((v) & BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)               \
>       )
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 43fa16b..1f26a79 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
> @@ -1,7 +1,7 @@
>  /*
>   * Freescale GPMI NAND Flash Driver
>   *
> - * Copyright (C) 2008-2011 Freescale Semiconductor, Inc.
> + * Copyright (C) 2008-2015 Freescale Semiconductor, Inc.
>   * Copyright (C) 2008 Embedded Alley Solutions, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify
> @@ -971,7 +971,8 @@ int gpmi_extra_init(struct gpmi_nand_data *this)
>       struct nand_chip *chip =3D &this->nand;
>
>       /* Enable the asynchronous EDO feature. */
> -     if (GPMI_IS_MX6(this) && chip->onfi_version) {
> +     if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) &&
> +                     chip->onfi_version) {
>               int mode =3D onfi_get_async_timing_mode(chip);
>
>               /* We only support the timing mode 4 and mode 5. */
> @@ -1093,12 +1094,13 @@ int gpmi_is_ready(struct gpmi_nand_data *this, un=
signed chip)
>       if (GPMI_IS_MX23(this)) {
>               mask =3D MX23_BM_GPMI_DEBUG_READY0 << chip;
>               reg =3D readl(r->gpmi_regs + HW_GPMI_DEBUG);
> -     } else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this)) {
> +     } else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this) ||
> +                     GPMI_IS_MX7(this)) {
>               /*
>                * In the imx6, all the ready/busy pins are bound
>                * together. So we only need to check chip 0.
>                */
> -             if (GPMI_IS_MX6(this))
> +             if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
>                       chip =3D 0;
>
>               /* MX28 shares the same R/B register as MX6Q. */
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 298c1d1..9f67f0f 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -77,6 +77,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6sx =
=3D {
>       .max_chain_delay =3D 12,
>  };
>
> +static const struct gpmi_devdata gpmi_devdata_imx7d =3D {
> +     .type =3D IS_MX7D,
> +     .bch_max_ecc_strength =3D 62,
> +     .max_chain_delay =3D 12,
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>       struct gpmi_nand_data *this =3D cookie;
> @@ -575,6 +581,10 @@ static char *extra_clks_for_mx6q[GPMI_CLK_MAX] =3D {
>       "gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
>  };
>
> +static char *extra_clks_for_mx7d[GPMI_CLK_MAX] =3D {
> +     "gpmi_bch_apb",
> +};
> +
>  static int gpmi_get_clks(struct gpmi_nand_data *this)
>  {
>       struct resources *r =3D &this->resources;
> @@ -592,6 +602,8 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
>       /* Get extra clocks */
>       if (GPMI_IS_MX6(this))
>               extra_clks =3D extra_clks_for_mx6q;
> +     if (GPMI_IS_MX7(this))
> +             extra_clks =3D extra_clks_for_mx7d;
>       if (!extra_clks)
>               return 0;
>
> @@ -608,7 +620,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
>               r->clock[i] =3D clk;
>       }
>
> -     if (GPMI_IS_MX6(this))
> +     if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
>               /*
>                * Set the default value for the gpmi clock.
>                *
> @@ -1869,8 +1881,8 @@ static int gpmi_init_last(struct gpmi_nand_data *th=
is)
>        *  (1) the chip is imx6, and
>        *  (2) the size of the ECC parity is byte aligned.
>        */
> -     if (GPMI_IS_MX6(this) &&
> -             ((bch_geo->gf_len * bch_geo->ecc_strength) % 8) =3D=3D 0) {
> +     if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) &&
> +                     ((bch_geo->gf_len * bch_geo->ecc_strength) % 8) =3D=
=3D 0) {
>               ecc->read_subpage =3D gpmi_ecc_read_subpage;
>               chip->options |=3D NAND_SUBPAGE_READ;
>       }
> @@ -1936,7 +1948,8 @@ static int gpmi_nand_init(struct gpmi_nand_data *th=
is)
>       if (ret)
>               goto err_out;
>
> -     ret =3D nand_scan_ident(mtd, GPMI_IS_MX6(this) ? 2 : 1, NULL);
> +     ret =3D nand_scan_ident(mtd, GPMI_IS_MX6(this) ||
> +                     GPMI_IS_MX7(this) ? 2 : 1, NULL);
>       if (ret)
>               goto err_out;
>
> @@ -1979,7 +1992,11 @@ static const struct of_device_id gpmi_nand_id_tabl=
e[] =3D {
>       }, {
>               .compatible =3D "fsl,imx6sx-gpmi-nand",
>               .data =3D &gpmi_devdata_imx6sx,
> -     }, {}
> +     }, {
> +             .compatible =3D "fsl,imx7d-gpmi-nand",
> +             .data =3D (void *)&gpmi_devdata_imx7d,
> +     }, { /* sentinel */ }
> +
>  };
>  MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.h
> index 544062f..58b3d69 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
> @@ -1,7 +1,7 @@
>  /*
>   * Freescale GPMI NAND Flash Driver
>   *
> - * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
> + * Copyright (C) 2010-2015 Freescale Semiconductor, Inc.
>   * Copyright (C) 2008 Embedded Alley Solutions, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify
> @@ -123,7 +123,8 @@ enum gpmi_type {
>       IS_MX23,
>       IS_MX28,
>       IS_MX6Q,
> -     IS_MX6SX
> +     IS_MX6SX,
> +     IS_MX7D,
>  };
>
>  struct gpmi_devdata {
> @@ -306,6 +307,8 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX28(x)              ((x)->devdata->type =3D=3D IS_MX28)
>  #define GPMI_IS_MX6Q(x)              ((x)->devdata->type =3D=3D IS_MX6Q)
>  #define GPMI_IS_MX6SX(x)     ((x)->devdata->type =3D=3D IS_MX6SX)
> +#define GPMI_IS_MX7D(x)              ((x)->devdata->type =3D=3D IS_MX7D)
>
>  #define GPMI_IS_MX6(x)               (GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x=
))
> +#define GPMI_IS_MX7(x)               (GPMI_IS_MX7D(x))
>  #endif
> --
> 1.9.1
>
Acked-by: Huang Shijie <shijie.huang@arm.com>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
