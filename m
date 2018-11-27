Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRf8G-000490-Sp
 for linux-mtd@lists.infradead.org; Tue, 27 Nov 2018 15:18:38 +0000
Received: by mail-yw1-xc44.google.com with SMTP id h138-v6so7452556ywa.11
 for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2018 07:18:26 -0800 (PST)
MIME-Version: 1.0
References: <1541665796-21092-1-git-send-email-frieder.schrempf@kontron.de>
 <0fc1f198-0e87-01af-5a0e-3d21613c39f3@kontron.de>
In-Reply-To: <0fc1f198-0e87-01af-5a0e-3d21613c39f3@kontron.de>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 27 Nov 2018 16:18:14 +0100
Message-ID: <CAJiuCceD=qyasCUPqjyGQso3JGoxz4g_yg3uj18wP-2CKY9wyg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: spi: Add initial support for Toshiba
 TC58CVG2S0H
To: frieder.schrempf@kontron.de
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
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

On Tue, 27 Nov 2018 at 16:08, Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> +Cl=C3=A9ment P=C3=A9ron
>
> Hi Cl=C3=A9ment,
>
> FYI, this has already been merged to nand/next.
Just want to point the difference that I made when I try to introduce my dr=
iver.
The datasheet I used is this one :
https://media.digikey.com/pdf/Data%20Sheets/Toshiba%20PDFs/TC58CVG2S0HxAIx_=
Rev1.1_2016-11-08.pdf

>
> Regards,
> Frieder
>
> On 08.11.18 09:29, Frieder Schrempf wrote:
> > Add minimal support for the Toshiba TC58CVG2S0H SPI NAND chip.
> >
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > ---
> >   drivers/mtd/nand/spi/Makefile  |   2 +-
> >   drivers/mtd/nand/spi/core.c    |   1 +
> >   drivers/mtd/nand/spi/toshiba.c | 136 ++++++++++++++++++++++++++++++++=
++++
> >   include/linux/mtd/spinand.h    |   1 +
> >   4 files changed, 139 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makef=
ile
> > index b74e074..be5f735 100644
> > --- a/drivers/mtd/nand/spi/Makefile
> > +++ b/drivers/mtd/nand/spi/Makefile
> > @@ -1,3 +1,3 @@
> >   # SPDX-License-Identifier: GPL-2.0
> > -spinand-objs :=3D core.o macronix.o micron.o winbond.o
> > +spinand-objs :=3D core.o macronix.o micron.o toshiba.o winbond.o
> >   obj-$(CONFIG_MTD_SPI_NAND) +=3D spinand.o
> > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > index 30f8364..87bdf2a 100644
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
> > index 0000000..294bcf6
> > --- /dev/null
> > +++ b/drivers/mtd/nand/spi/toshiba.c
> > @@ -0,0 +1,136 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018 exceet electronics GmbH
> > + * Copyright (c) 2018 Kontron Electronics GmbH
> > + *
> > + * Author: Frieder Schrempf <frieder.schrempf@kontron.de>
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
> > +static int tc58cvg2s0h_ooblayout_ecc(struct mtd_info *mtd, int section=
,
> > +                                  struct mtd_oob_region *region)
> > +{
> > +     if (section > 7)
> > +             return -ERANGE;
> > +
> > +     region->offset =3D 128 + 16 * section;
> > +     region->length =3D 16;

Here you expose the ECC bits has 8 sections of 16 bytes.
But regarding the datasheet this should not be accessed page 32.
"The ECC parity code generated by internal ECC is stored in column
addresses 4224-4351 and the users cannot access to these specific
addresses when internal ECC is enabled."

> > +
> > +
> > +     return 0;
> > +}
> > +
> > +static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int sectio=
n,
> > +                                   struct mtd_oob_region *region)
> > +{
> > +     if (section > 7)
> > +             return -ERANGE;
> > +
> > +     region->offset =3D 2 + 16 * section;
> > +     region->length =3D 14;

This reserved 2 bytes for BBM for each section.
But maybe we could declare this as 1 section of 128bytes:

if (section)
         return -ERANGE;

region->offset =3D 2;
region->length =3D 126;


> > +
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct mtd_ooblayout_ops tc58cvg2s0h_ooblayout =3D {
> > +     .ecc =3D tc58cvg2s0h_ooblayout_ecc,
> > +     .free =3D tc58cvg2s0h_ooblayout_free,
> > +};
> > +
> > +static int tc58cvg2s0h_ecc_get_status(struct spinand_device *spinand,
> > +                                   u8 status)
> > +{
> > +     struct nand_device *nand =3D spinand_to_nand(spinand);
> > +     u8 mbf =3D 0;
> > +     struct spi_mem_op op =3D SPINAND_GET_FEATURE_OP(0x30, &mbf);
> > +
> > +     switch (status & STATUS_ECC_MASK) {
> > +     case STATUS_ECC_NO_BITFLIPS:
> > +             return 0;
> > +
> > +     case STATUS_ECC_UNCOR_ERROR:
> > +             return -EBADMSG;
> > +
> > +     case STATUS_ECC_HAS_BITFLIPS:
> > +             /*
> > +              * Let's try to retrieve the real maximum number of bitfl=
ips
> > +              * in order to avoid forcing the wear-leveling layer to m=
ove
> > +              * data around if it's not necessary.
> > +              */
> > +             if (spi_mem_exec_op(spinand->spimem, &op))
> > +                     return nand->eccreq.strength;
> > +
> > +             mbf >>=3D 4;
> > +
> > +             if (WARN_ON(mbf > nand->eccreq.strength || !mbf))
> > +                     return nand->eccreq.strength;
> > +
> > +             return mbf;
> > +

These take take care of 0, 0x1 and 0x2 but not 0x3 which is valid
page 26 of the datasheet :

ECC status bits indicate the status of internal ECC operation
00b: No bit flips were detected in previous page read.
01b: Bit flips were detected and corrected. Bit flip count did not
exceed the bit flip detection threshold. The threshold is set by bits
[7:4] in address 10h in the feature table.
10b: Multiple bit flips were detected and not corrected.
11b: Bit flips were detected and corrected. Bit flip count exceeded
the bit flip detection threshold. The threshold is set by bits [7:4]
in address 10h in the feature table

Regards,
Clement

> > +     default:
> > +             break;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static const struct spinand_info toshiba_spinand_table[] =3D {
> > +     SPINAND_INFO("TC58CVG2S0H", 0xCD,
> > +                  NAND_MEMORG(1, 4096, 256, 64, 2048, 1, 1, 1),
> > +                  NAND_ECCREQ(8, 512),
> > +                  SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> > +                                           &write_cache_variants,
> > +                                           &update_cache_variants),
> > +                  SPINAND_HAS_QE_BIT,
> > +                  SPINAND_ECCINFO(&tc58cvg2s0h_ooblayout,
> > +                                  tc58cvg2s0h_ecc_get_status)),
> > +};
> > +
> > +static int toshiba_spinand_detect(struct spinand_device *spinand)
> > +{
> > +     u8 *id =3D spinand->id.data;
> > +     int ret;
> > +
> > +     /*
> > +      * Toshiba SPI NAND read ID needs a dummy byte,
> > +      * so the first byte in id is garbage.
> > +      */
> > +     if (id[1] !=3D SPINAND_MFR_TOSHIBA)
> > +             return 0;
> > +
> > +     ret =3D spinand_match_and_init(spinand, toshiba_spinand_table,
> > +                                  ARRAY_SIZE(toshiba_spinand_table),
> > +                                  id[2]);
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
> > index 088ff96..816c4b0 100644
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
