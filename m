Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVB4K-0004P3-21
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 08:01:10 +0000
Date: Fri, 7 Dec 2018 09:00:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peron.clem@gmail.com" <peron.clem@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3] mtd: spinand: Fix ECC status and OOB layout for
 Toshiba TC58CVG2S0H
Message-ID: <20181207090041.6b8d9731@xps13>
In-Reply-To: <1543823821-18352-1-git-send-email-frieder.schrempf@kontron.de>
References: <1543823821-18352-1-git-send-email-frieder.schrempf@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Schrempf, Cl=C3=A9ment,

Schrempf Frieder <frieder.schrempf@kontron.de> wrote on Mon, 3 Dec 2018
08:01:38 +0000:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> When reading the status of the on-chip ECC, the Toshiba chip returns
> two different states for reporting corrected bitflips. We should check
> for both of them.
>=20
> Also return the free OOB bytes as one contiguous area, instead of
> multiple sections.
>=20
> Suggested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
> Changes for v3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Add Acked-by
> * Add comment for BBM in OOB layout
>=20
> Changes for v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Remove the changes to the ECC bytes in the OOB layout
> ---
>  drivers/mtd/nand/spi/toshiba.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshib=
a.c
> index 294bcf6..0812655 100644
> --- a/drivers/mtd/nand/spi/toshiba.c
> +++ b/drivers/mtd/nand/spi/toshiba.c
> @@ -11,6 +11,7 @@
>  #include <linux/mtd/spinand.h>
> =20
>  #define SPINAND_MFR_TOSHIBA		0x98
> +#define TOSH_STATUS_ECC_HAS_BITFLIPS_T	(3 << 4)
> =20
>  static SPINAND_OP_VARIANTS(read_cache_variants,
>  		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> @@ -33,19 +34,18 @@ static int tc58cvg2s0h_ooblayout_ecc(struct mtd_info =
*mtd, int section,
>  	region->offset =3D 128 + 16 * section;
>  	region->length =3D 16;
> =20
> -
>  	return 0;
>  }
> =20
>  static int tc58cvg2s0h_ooblayout_free(struct mtd_info *mtd, int section,
>  				      struct mtd_oob_region *region)
>  {
> -	if (section > 7)
> +	if (section > 0)
>  		return -ERANGE;
> =20
> -	region->offset =3D 2 + 16 * section;
> -	region->length =3D 14;
> -
> +	/* 2 bytes reserved for BBM */
> +	region->offset =3D 2;
> +	region->length =3D 126;
> =20
>  	return 0;
>  }
> @@ -70,6 +70,7 @@ static int tc58cvg2s0h_ecc_get_status(struct spinand_de=
vice *spinand,
>  		return -EBADMSG;
> =20
>  	case STATUS_ECC_HAS_BITFLIPS:
> +	case TOSH_STATUS_ECC_HAS_BITFLIPS_T:
>  		/*
>  		 * Let's try to retrieve the real maximum number of bitflips
>  		 * in order to avoid forcing the wear-leveling layer to move

If you don't mind, I would like to squash this with the original patch.
What about also adding Clement's Acked-by to it?


Thanks,
Miqu=C3=A8l
