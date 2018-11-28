Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRsdU-00025S-Kp
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 05:43:46 +0000
Received: by mail-oi1-x242.google.com with SMTP id b141so21535882oii.12
 for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2018 21:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20181127152325.18437-1-gch981213@gmail.com>
In-Reply-To: <20181127152325.18437-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 28 Nov 2018 13:43:21 +0800
Message-ID: <CAJsYDVJL+G=M1gj49Tcr8i189SGbA7yNTa-OoDBXidPyXaJ6jg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: add support for GigaDevice GD5FxGQ4xA
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chuanhong Guo <gch981213@gmail.com> =E4=BA=8E2018=E5=B9=B411=E6=9C=8827=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8811:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Add support for GigaDevice GD5F1G/2G/4GQ4xA SPI NAND.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  drivers/mtd/nand/spi/Makefile     |   2 +-
>  drivers/mtd/nand/spi/core.c       |   1 +
>  drivers/mtd/nand/spi/gigadevice.c | 142 ++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h       |   1 +
>  4 files changed, 145 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mtd/nand/spi/gigadevice.c
>
> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefil=
e
> index be5f73512ece..753125082640 100644
> --- a/drivers/mtd/nand/spi/Makefile
> +++ b/drivers/mtd/nand/spi/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> -spinand-objs :=3D core.o macronix.o micron.o toshiba.o winbond.o
> +spinand-objs :=3D core.o gigadevice.o macronix.o micron.o toshiba.o winb=
ond.o
>  obj-$(CONFIG_MTD_SPI_NAND) +=3D spinand.o
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 87bdf2a7b724..479c2f2cf17f 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -764,6 +764,7 @@ static const struct nand_ops spinand_ops =3D {
>  };
>
>  static const struct spinand_manufacturer *spinand_manufacturers[] =3D {
> +       &gigadevice_spinand_manufacturer,
>         &macronix_spinand_manufacturer,
>         &micron_spinand_manufacturer,
>         &toshiba_spinand_manufacturer,
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gig=
adevice.c
> new file mode 100644
> index 000000000000..f8bacde18437
> --- /dev/null
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Author:
> + *     Chuanhong Guo <gch981213@gmail.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mtd/spinand.h>
> +
> +#define SPINAND_MFR_GIGADEVICE                         0xC8
> +#define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS       0x3
> +
> +static SPINAND_OP_VARIANTS(read_cache_variants,
> +               SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
> +               SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> +               SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> +               SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +               SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
> +               SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(write_cache_variants,
> +               SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
> +               SPINAND_PROG_LOAD(true, 0, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(update_cache_variants,
> +               SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
> +               SPINAND_PROG_LOAD(false, 0, NULL, 0));
> +
> +static int gd5fxgq4xa_ooblayout_ecc(struct mtd_info *mtd, int section,
> +                                 struct mtd_oob_region *region)
> +{
> +       if (section > 3)
> +               return -ERANGE;
> +
> +       region->offset =3D (16 * section) + 8;
> +       region->length =3D 8;
> +
> +       return 0;
> +}
> +
> +static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
> +                                  struct mtd_oob_region *region)
> +{
> +       if (section > 3)
> +               return -ERANGE;
> +
> +       region->offset =3D (16 * section) + 2;
> +       region->length =3D 6;
> +
> +       return 0;
> +}
> +
> +static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
> +                                        u8 status)
> +{
> +       switch (status & STATUS_ECC_MASK) {
> +       case STATUS_ECC_NO_BITFLIPS:
> +               return 0;
> +
> +       case STATUS_ECC_HAS_BITFLIPS:
> +               /* 1-7 bits are flipped. return the maximum. */
> +               return 7;
> +
> +       case GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS:
> +               return 8;
> +
> +       case STATUS_ECC_UNCOR_ERROR:
> +               return -EBADMSG;
> +
> +       default:
> +               break;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout =3D {
> +       .ecc =3D gd5fxgq4xa_ooblayout_ecc,
> +       .free =3D gd5fxgq4xa_ooblayout_free,
> +};
> +
> +static const struct spinand_info gigadevice_spinand_table[] =3D {
> +       SPINAND_INFO("GD5F1GQ4xA", 0xF1,
> +                    NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
> +                    NAND_ECCREQ(8, 512),
> +                    SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +                                             &write_cache_variants,
> +                                             &update_cache_variants),
> +                    0,
> +                    SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
> +                                    gd5fxgq4xa_ecc_get_status)),
> +       SPINAND_INFO("GD5F2GQ4xA", 0xF2,
> +                    NAND_MEMORG(1, 2048, 64, 64, 2048, 1, 1, 1),
> +                    NAND_ECCREQ(8, 512),
> +                    SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +                                             &write_cache_variants,
> +                                             &update_cache_variants),
> +                    0,
> +                    SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
> +                                    gd5fxgq4xa_ecc_get_status)),
> +       SPINAND_INFO("GD5F4GQ4xA", 0xF4,
> +                    NAND_MEMORG(1, 2048, 64, 64, 4096, 1, 1, 1),
> +                    NAND_ECCREQ(8, 512),
> +                    SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +                                             &write_cache_variants,
> +                                             &update_cache_variants),
> +                    0,
> +                    SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
> +                                    gd5fxgq4xa_ecc_get_status)),
> +};
> +
> +static int gigadevice_spinand_detect(struct spinand_device *spinand)
> +{
> +       u8 *id =3D spinand->id.data;
> +       int ret;
> +
> +       /*
> +        * For GD NANDs, There is an address byte needed to shift in befo=
re IDs
> +        * are read out, so the first byte in raw_id is dummy.
> +        */
> +       if (id[1] !=3D SPINAND_MFR_GIGADEVICE)
> +               return 0;
> +
> +       ret =3D spinand_match_and_init(spinand, gigadevice_spinand_table,
> +                                    ARRAY_SIZE(gigadevice_spinand_table)=
,
> +                                    id[2]);
> +       if (ret)
> +               return ret;
> +
> +       return 1;
> +}
> +
> +static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_op=
s =3D {
> +       .detect =3D gigadevice_spinand_detect,
> +};
> +
> +const struct spinand_manufacturer gigadevice_spinand_manufacturer =3D {
> +       .id =3D SPINAND_MFR_GIGADEVICE,
> +       .name =3D "GigaDevice",
> +       .ops =3D &gigadevice_spinand_manuf_ops,
> +};
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 816c4b00abca..b92e2aa955b6 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -194,6 +194,7 @@ struct spinand_manufacturer {
>  };
>
>  /* SPI NAND manufacturers */
> +extern const struct spinand_manufacturer gigadevice_spinand_manufacturer=
;
>  extern const struct spinand_manufacturer macronix_spinand_manufacturer;
>  extern const struct spinand_manufacturer micron_spinand_manufacturer;
>  extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
> --
> 2.19.1
>

Sorry. This version has a incorrect oob structure and a broken indent
at the beginning. I'll send a v2 later.
