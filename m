Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gReqd-00042n-77
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 15:00:29 +0000
Received: by mail-yb1-xb41.google.com with SMTP id z2-v6so9166014ybj.2
 for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2018 07:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20181127135923.13787-1-peron.clem@gmail.com>
 <df074de0-c9cc-9e6b-19b6-140319ff5f86@kontron.de>
In-Reply-To: <df074de0-c9cc-9e6b-19b6-140319ff5f86@kontron.de>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 27 Nov 2018 15:59:59 +0100
Message-ID: <CAJiuCcfq8K+_oBufnXEsu+8Usyvv60zA3ATXD_uGsn+2__RpNg@mail.gmail.com>
Subject: Re: [RFC] mtd: spinand: Add initial support for Toshiba TC58CVG2S0F
To: frieder.schrempf@kontron.de
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
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

Hi Frieder,

On Tue, 27 Nov 2018 at 15:47, Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> Hello Cl=C3=A9ment,
>
> On 27.11.18 14:59, Cl=C3=A9ment P=C3=A9ron wrote:
> > Add support for Toshiba chip TC58CVG2S0F
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >
> > Hi,
> >
> > Thanks a lot for adding this framework to Linux it's very nice and easy=
 to read.
> >
> > This is my first SPI Nand/Nand board so I'm still unfamiliar with those=
 BBM and OOB features.
> >
> > In the ECC status maybe I should return the Maximum Bit Flip Count (pag=
e 34 of the DS) like it's done for Macronix.
> >
> > Datasheet could be found here: https://media.digikey.com/pdf/Data%20She=
ets/Toshiba%20PDFs/TC58CVG2S0HxAIx_Rev1.1_2016-11-08.pdf
> >
> >
> > Also this has not been fully tested and untested with a QuadSPI control=
ler.
>
> I'm afraid there is a big overlap between your patch and what I posted
> some days ago. See here: Patchwork [1] or linux-next [2].
>
> Please have a look at my patch and test it with your hardware. You seem
> to use the same chip as I am (except for the last letter in the part
> number, whose meaning I don't know).

Thanks for pointing that,

I'm not a linux-mtd subscriber could you reply and add my e-mail to your pa=
tch ?

Thanks
Clement

>
> Thanks,
> Frieder
>
> [1] https://patchwork.ozlabs.org/patch/994687/
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/drivers/mtd/nand/spi?h=3Dnext-20181127&id=3Df85fd9a073f7a0f063d046c07f055=
8c03b1d90de
>
> >
> > Thanks,
> > Clement
> >
> >
> >   drivers/mtd/nand/spi/Makefile  |   2 +-
> >   drivers/mtd/nand/spi/core.c    |   1 +
> >   drivers/mtd/nand/spi/toshiba.c | 112 ++++++++++++++++++++++++++++++++=
+
> >   include/linux/mtd/spinand.h    |   1 +
> >   4 files changed, 115 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/mtd/nand/spi/toshiba.c
> >
> > diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makef=
ile
> > index b74e074b363a..be5f73512ece 100644
> > --- a/drivers/mtd/nand/spi/Makefile
> > +++ b/drivers/mtd/nand/spi/Makefile
> > @@ -1,3 +1,3 @@
> >   # SPDX-License-Identifier: GPL-2.0
> > -spinand-objs :=3D core.o macronix.o micron.o winbond.o
> > +spinand-objs :=3D core.o macronix.o micron.o toshiba.o winbond.o
> >   obj-$(CONFIG_MTD_SPI_NAND) +=3D spinand.o
> > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > index 30f83649c481..87bdf2a7b724 100644
> > --- a/drivers/mtd/nand/spi/core.c
> > +++ b/drivers/mtd/nand/spi/core.c
> > @@ -766,6 +766,7 @@ static const struct nand_ops spinand_ops =3D {
> >   static const struct spinand_manufacturer *spinand_manufacturers[] =3D=
 {
> >       &macronix_spinand_manufacturer,
> >       &micron_spinand_manufacturer,
> > +     &toshiba_spinand_manufacturer,
> >       &winbond_spinand_manufacturer,
> >   };
> >
> > diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/tosh=
iba.c
> > new file mode 100644
> > index 000000000000..6ff65949ddd0
> > --- /dev/null
> > +++ b/drivers/mtd/nand/spi/toshiba.c
> > @@ -0,0 +1,112 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Author: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mtd/spinand.h>
> > +
> > +#define SPINAND_MFR_TOSHIBA          0x98
> > +
> > +static SPINAND_OP_VARIANTS(read_cache_variants,
> > +             SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> > +             SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> > +             SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
> > +             SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
> > +
> > +static SPINAND_OP_VARIANTS(write_cache_variants,
> > +             SPINAND_PROG_LOAD(true, 0, NULL, 0));
> > +
> > +static SPINAND_OP_VARIANTS(update_cache_variants,
> > +             SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > +
> > +static int tc58_ooblayout_ecc(struct mtd_info *mtd, int section,
> > +                           struct mtd_oob_region *region)
> > +{
> > +     /* ECC not accesible when Internal ECC is turned on. */
> > +     return -ERANGE;
> > +}
> > +
> > +static int tc58_ooblayout_free(struct mtd_info *mtd, int section,
> > +                            struct mtd_oob_region *region)
> > +{
> > +     if (section)
> > +             return -ERANGE;
> > +
> > +     /* Reserve 2 bytes for the BBM. */
> > +     region->offset =3D 2;
> > +     region->length =3D 126;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct mtd_ooblayout_ops tc58_ooblayout =3D {
> > +     .ecc =3D tc58_ooblayout_ecc,
> > +     .free =3D tc58_ooblayout_free,
> > +};
> > +
> > +static int tc58_ecc_get_status(struct spinand_device *spinand,
> > +                            u8 status)
> > +{
> > +     switch (status & STATUS_ECC_MASK) {
> > +     case STATUS_ECC_NO_BITFLIPS:
> > +             return 0;
> > +
> > +     case STATUS_ECC_HAS_BITFLIPS:
> > +             return 4;
> > +
> > +     case STATUS_ECC_UNCOR_ERROR:
> > +             return -EBADMSG;
> > +
> > +     default:
> > +             return 8;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static const struct spinand_info toshiba_spinand_table[] =3D {
> > +     SPINAND_INFO("TC58CVG2S0F", 0xCD,
> > +                  NAND_MEMORG(1, SZ_4K, 256, 64, 2048, 1, 1, 1),
> > +                  NAND_ECCREQ(8, 512),
> > +                  SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> > +                                           &write_cache_variants,
> > +                                           &update_cache_variants),
> > +                  0,
> > +                  SPINAND_ECCINFO(&tc58_ooblayout, tc58_ecc_get_status=
)),
> > +};
> > +/**
> > + * toshiba_spinand_detect - initialize device related part in spinand_=
device
> > + * struct if it is a Toshiba device.
> > + * @spinand: SPI NAND device structure
> > + */
> > +static int toshiba_spinand_detect(struct spinand_device *spinand)
> > +{
> > +     u8 *id =3D spinand->id.data;
> > +     int ret;
> > +
> > +     /*
> > +      * Toshiba SPI NAND read ID need a dummy byte,
> > +      * so the first byte in raw_id is dummy.
> > +      */
> > +     if (id[1] !=3D SPINAND_MFR_TOSHIBA)
> > +             return 0;
> > +
> > +     ret =3D spinand_match_and_init(spinand, toshiba_spinand_table,
> > +                                  ARRAY_SIZE(toshiba_spinand_table), i=
d[2]);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 1;
> > +}
> > +
> > +static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops=
 =3D {
> > +     .detect =3D toshiba_spinand_detect,
> > +};
> > +
> > +const struct spinand_manufacturer toshiba_spinand_manufacturer =3D {
> > +     .id =3D SPINAND_MFR_TOSHIBA,
> > +     .name =3D "Toshiba",
> > +     .ops =3D &toshiba_spinand_manuf_ops,
> > +};
> > diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> > index 088ff96c3eb6..816c4b00abca 100644
> > --- a/include/linux/mtd/spinand.h
> > +++ b/include/linux/mtd/spinand.h
> > @@ -196,6 +196,7 @@ struct spinand_manufacturer {
> >   /* SPI NAND manufacturers */
> >   extern const struct spinand_manufacturer macronix_spinand_manufacture=
r;
> >   extern const struct spinand_manufacturer micron_spinand_manufacturer;
> > +extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
> >   extern const struct spinand_manufacturer winbond_spinand_manufacturer=
;
> >
> >   /**
> >
