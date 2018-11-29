Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSJ3b-0000Yp-1J
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 09:56:29 +0000
Received: by mail-yw1-xc41.google.com with SMTP id q11so524855ywa.0
 for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2018 01:56:16 -0800 (PST)
MIME-Version: 1.0
References: <1543411097-24229-1-git-send-email-frieder.schrempf@kontron.de>
In-Reply-To: <1543411097-24229-1-git-send-email-frieder.schrempf@kontron.de>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 29 Nov 2018 10:56:02 +0100
Message-ID: <CAJiuCcdEo4-fZBCvrEJV-GLU_3izbu9VTjj-biCEKaAjeYxOrg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: Fix ECC status and OOB layout for
 Toshiba TC58CVG2S0H
To: frieder.schrempf@kontron.de
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, richard@nod.at,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
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

On Wed, 28 Nov 2018 at 14:18, Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> When reading the status of the on-chip ECC, the Toshiba chip returns
> two different states for reporting corrected bitflips. We should check
> for both of them.
>
> Also return the free OOB bytes as one contiguous area, instead of
> multiple sections.
>
> Suggested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Acked-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  drivers/mtd/nand/spi/toshiba.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshib=
a.c
> index 294bcf6..9731752 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -11,6 +11,7 @@
>  #include <linux/mtd/spinand.h>
>
>  #define SPINAND_MFR_TOSHIBA            0x98
> +#define TOSH_STATUS_ECC_HAS_BITFLIPS_T (3 << 4)
>
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>                 SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> @@ -33,19 +34,17 @@ static int tc58cvg2s0h_ooblayout_ecc(struct mtd_info =
*mtd, int section,
>         region->offset =3D 128 + 16 * section;
>         region->length =3D 16;
>
> -
>         return 0;
>  }
>
>  static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int section,
>                                       struct mtd_oob_region *region)
>  {
> -       if (section > 7)
> +       if (section > 0)
>                 return -ERANGE;
>
> -       region->offset =3D 2 + 16 * section;
> -       region->length =3D 14;
> -

I will just add a comment here to say that we reserve 2 bytes for BBM.

Else, it's fine for me.

Regards,
Clement

> +       region->offset =3D 2;
> +       region->length =3D 126;
>
>         return 0;
>  }
> @@ -70,6 +69,7 @@ static int tc58cvg2s0h_ecc_get_status(struct spinand_de=
vice *spinand,
>                 return -EBADMSG;
>
>         case STATUS_ECC_HAS_BITFLIPS:
> +       case TOSH_STATUS_ECC_HAS_BITFLIPS_T:
>                 /*
>                  * Let's try to retrieve the real maximum number of bitfl=
ips
>                  * in order to avoid forcing the wear-leveling layer to m=
ove
> --
> 2.7.4
