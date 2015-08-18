Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRaly-00036G-9s
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 06:53:27 +0000
Date: Tue, 18 Aug 2015 14:52:52 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <b45815@freescale.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 4/6] mtd: nand: gpmi: add GPMI NAND support for i.MX7D
Message-ID: <20150818065252.GB10641@free64-pc.asiapac.arm.com>
References: <1439868295-24890-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1439868295-24890-1-git-send-email-b45815@freescale.com>
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

On Mon, Aug 17, 2015 at 10:24:55PM -0500, Han Xu wrote:
> support GPMI NAND on i.MX7D
>=20
> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/nand/gpmi-nand/bch-regs.h  | 14 +++++++-------
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 10 ++++++----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 24 ++++++++++++++++++++----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  7 +++++--
>  4 files changed, 38 insertions(+), 17 deletions(-)
>=20
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
>  #define MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0=09=0911
>  #define MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0=09(0x1f << MX6Q_BP_BCH_FLASH0LAYO=
UT0_ECC0)
>  #define BF_BCH_FLASH0LAYOUT0_ECC0(v, x)=09=09=09=09\
> -=09(GPMI_IS_MX6(x)=09=09=09=09=09\
> +=09((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))=09=09=09=09\

I suggest we can introduce a new macro to wrap it:
#define GPMI_IS_MX(x) (GPMI_IS_MX6(x) || GPMI_IS_MX7(x)

So when the imx8 or imx9 appear, we only change the GPMI_IS_MX(), and we do=
 not need to
change so many places as show below.=20

thanks
Huang Shijie
        =20

>  =09=09? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT0_ECC0)=09\
>  =09=09=09& MX6Q_BM_BCH_FLASH0LAYOUT0_ECC0)=09\
>  =09=09: (((v) << BP_BCH_FLASH0LAYOUT0_ECC0)=09=09\
> @@ -65,7 +65,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14=09=09=09\
>  =09=09=09=09(0x1 << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)
>  #define BF_BCH_FLASH0LAYOUT0_GF(v, x)=09=09=09=09\
> -=09((GPMI_IS_MX6(x) && ((v) =3D=3D 14))=09=09=09\
> +=09(((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) =3D=3D 14))\
>  =09=09? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)=09\
>  =09=09=09& MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14)=09\
>  =09=09: 0=09=09=09=09=09=09\
> @@ -77,7 +77,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE=09\
>  =09=09=09(0x3ff << BP_BCH_FLASH0LAYOUT0_DATA0_SIZE)
>  #define BF_BCH_FLASH0LAYOUT0_DATA0_SIZE(v, x)=09=09=09=09\
> -=09(GPMI_IS_MX6(x)=09=09=09=09=09=09\
> +=09((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))=09\
>  =09=09? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)=09\
>  =09=09: ((v) & BM_BCH_FLASH0LAYOUT0_DATA0_SIZE)=09=09\
>  =09)
> @@ -96,7 +96,7 @@
>  #define MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN=09=0911
>  #define MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN=09(0x1f << MX6Q_BP_BCH_FLASH0LAYO=
UT1_ECCN)
>  #define BF_BCH_FLASH0LAYOUT1_ECCN(v, x)=09=09=09=09\
> -=09(GPMI_IS_MX6(x)=09=09=09=09=09\
> +=09((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))=09=09=09=09\
>  =09=09? (((v) << MX6Q_BP_BCH_FLASH0LAYOUT1_ECCN)=09\
>  =09=09=09& MX6Q_BM_BCH_FLASH0LAYOUT1_ECCN)=09\
>  =09=09: (((v) << BP_BCH_FLASH0LAYOUT1_ECCN)=09=09\
> @@ -107,7 +107,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14=09=09=09\
>  =09=09=09=09(0x1 << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)
>  #define BF_BCH_FLASH0LAYOUT1_GF(v, x)=09=09=09=09\
> -=09((GPMI_IS_MX6(x) && ((v) =3D=3D 14))=09=09=09\
> +=09(((GPMI_IS_MX6(x) || GPMI_IS_MX7(x)) && ((v) =3D=3D 14))\
>  =09=09? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT1_GF_13_14)=09\
>  =09=09=09& MX6Q_BM_BCH_FLASH0LAYOUT1_GF_13_14)=09\
>  =09=09: 0=09=09=09=09=09=09\
> @@ -119,7 +119,7 @@
>  #define MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE=09\
>  =09=09=09(0x3ff << BP_BCH_FLASH0LAYOUT1_DATAN_SIZE)
>  #define BF_BCH_FLASH0LAYOUT1_DATAN_SIZE(v, x)=09=09=09=09\
> -=09(GPMI_IS_MX6(x)=09=09=09=09=09=09\
> +=09((GPMI_IS_MX6(x) || GPMI_IS_MX7(x))=09\
>  =09=09? (((v) >> 2) & MX6Q_BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)=09\
>  =09=09: ((v) & BM_BCH_FLASH0LAYOUT1_DATAN_SIZE)=09=09\
>  =09)
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpm=
i-nand/gpmi-lib.c
> index 43fa16b..6b37414 100644
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
>  =09struct nand_chip *chip =3D &this->nand;
> =20
>  =09/* Enable the asynchronous EDO feature. */
> -=09if (GPMI_IS_MX6(this) && chip->onfi_version) {
> +=09if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
> +=09=09=09&& chip->onfi_version) {
>  =09=09int mode =3D onfi_get_async_timing_mode(chip);
> =20
>  =09=09/* We only support the timing mode 4 and mode 5. */
> @@ -1093,12 +1094,13 @@ int gpmi_is_ready(struct gpmi_nand_data *this, un=
signed chip)
>  =09if (GPMI_IS_MX23(this)) {
>  =09=09mask =3D MX23_BM_GPMI_DEBUG_READY0 << chip;
>  =09=09reg =3D readl(r->gpmi_regs + HW_GPMI_DEBUG);
> -=09} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this)) {
> +=09} else if (GPMI_IS_MX28(this) || GPMI_IS_MX6(this) ||
> +=09=09=09GPMI_IS_MX7(this)) {
>  =09=09/*
>  =09=09 * In the imx6, all the ready/busy pins are bound
>  =09=09 * together. So we only need to check chip 0.
>  =09=09 */
> -=09=09if (GPMI_IS_MX6(this))
> +=09=09if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
>  =09=09=09chip =3D 0;
> =20
>  =09=09/* MX28 shares the same R/B register as MX6Q. */
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 01d24dd..0462103 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -77,6 +77,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6sx =
=3D {
>  =09.max_chain_delay =3D 12,
>  };
> =20
> +static const struct gpmi_devdata gpmi_devdata_imx7d =3D {
> +=09.type =3D IS_MX7D,
> +=09.bch_max_ecc_strength =3D 62,
> +=09.max_chain_delay =3D 12,
> +};
> +
>  static irqreturn_t bch_irq(int irq, void *cookie)
>  {
>  =09struct gpmi_nand_data *this =3D cookie;
> @@ -575,6 +581,10 @@ static char *extra_clks_for_mx6q[GPMI_CLK_MAX] =3D {
>  =09"gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch",
>  };
> =20
> +static char *extra_clks_for_mx7d[GPMI_CLK_MAX] =3D {
> +=09"gpmi_bch_apb",
> +};
> +
>  static int gpmi_get_clks(struct gpmi_nand_data *this)
>  {
>  =09struct resources *r =3D &this->resources;
> @@ -592,6 +602,8 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
>  =09/* Get extra clocks */
>  =09if (GPMI_IS_MX6(this))
>  =09=09extra_clks =3D extra_clks_for_mx6q;
> +=09if (GPMI_IS_MX7(this))
> +=09=09extra_clks =3D extra_clks_for_mx7d;
>  =09if (!extra_clks)
>  =09=09return 0;
> =20
> @@ -608,7 +620,7 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
>  =09=09r->clock[i] =3D clk;
>  =09}
> =20
> -=09if (GPMI_IS_MX6(this))
> +=09if (GPMI_IS_MX6(this) || GPMI_IS_MX7(this))
>  =09=09/*
>  =09=09 * Set the default value for the gpmi clock.
>  =09=09 *
> @@ -1869,7 +1881,7 @@ static int gpmi_init_last(struct gpmi_nand_data *th=
is)
>  =09 *  (1) the chip is imx6, and
>  =09 *  (2) the size of the ECC parity is byte aligned.
>  =09 */
> -=09if (GPMI_IS_MX6(this) &&
> +=09if ((GPMI_IS_MX6(this) || GPMI_IS_MX7(this)) &&
>  =09=09((bch_geo->gf_len * bch_geo->ecc_strength) % 8) =3D=3D 0) {
>  =09=09ecc->read_subpage =3D gpmi_ecc_read_subpage;
>  =09=09chip->options |=3D NAND_SUBPAGE_READ;
> @@ -1936,7 +1948,8 @@ static int gpmi_nand_init(struct gpmi_nand_data *th=
is)
>  =09if (ret)
>  =09=09goto err_out;
> =20
> -=09ret =3D nand_scan_ident(mtd, GPMI_IS_MX6(this) ? 2 : 1, NULL);
> +=09ret =3D nand_scan_ident(mtd, GPMI_IS_MX6(this) || GPMI_IS_MX7(this)\
> +=09=09=09=09? 2 : 1, NULL);
>  =09if (ret)
>  =09=09goto err_out;
> =20
> @@ -1980,7 +1993,10 @@ static const struct of_device_id gpmi_nand_id_tabl=
e[] =3D {
>  =09}, {
>  =09=09.compatible =3D "fsl,imx6sx-gpmi-nand",
>  =09=09.data =3D &gpmi_devdata_imx6sx,
> -=09}, {}
> +=09}, {
> +=09=09.compatible =3D "fsl,imx7d-gpmi-nand",
> +=09=09.data =3D (void *)&gpmi_devdata_imx7d,
> +=09}
>  };
>  MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
> =20
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.h
> index 544062f..1e105f1 100644
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
>  =09IS_MX23,
>  =09IS_MX28,
>  =09IS_MX6Q,
> -=09IS_MX6SX
> +=09IS_MX6SX,
> +=09IS_MX7D
>  };
> =20
>  struct gpmi_devdata {
> @@ -306,6 +307,8 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
>  #define GPMI_IS_MX28(x)=09=09((x)->devdata->type =3D=3D IS_MX28)
>  #define GPMI_IS_MX6Q(x)=09=09((x)->devdata->type =3D=3D IS_MX6Q)
>  #define GPMI_IS_MX6SX(x)=09((x)->devdata->type =3D=3D IS_MX6SX)
> +#define GPMI_IS_MX7D(x)=09=09((x)->devdata->type =3D=3D IS_MX7D)
> =20
>  #define GPMI_IS_MX6(x)=09=09(GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x))
> +#define GPMI_IS_MX7(x)=09=09(GPMI_IS_MX7D(x))
>  #endif
> --=20
> 1.9.1
>=20
