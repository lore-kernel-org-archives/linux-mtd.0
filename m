Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dgnfn-0003xZ-Sy
 for linux-mtd@lists.infradead.org; Sun, 13 Aug 2017 07:51:01 +0000
Date: Sun, 13 Aug 2017 09:50:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH] mtd: nand: hynix: add support for 20nm NAND chips
Message-ID: <20170813095035.6c4fc69e@bbrezillon>
In-Reply-To: <20170805121624.25553-1-martin.blumenstingl@googlemail.com>
References: <20170805121624.25553-1-martin.blumenstingl@googlemail.com>
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

Hi Martin,

Le Sat,  5 Aug 2017 14:16:24 +0200,
Martin Blumenstingl <martin.blumenstingl@googlemail.com> a =C3=A9crit :

> According to the datasheet of the H27UCG8T2BTR the NAND Technology field
> (6th byte of the "Device Identifier Description", bits 0-2) the
> following values are possible:
> - 0x0 =3D 48nm
> - 0x1 =3D 41nm
> - 0x2 =3D 32nm
> - 0x3 =3D 26nm
> - 0x4 =3D 20nm
> - (all others are reserved)
>=20
> Fix this by extending the mask for this field to allow detecting value
> 0x4 (20nm) as valid NAND technology.
> Without this the detection of the ECC requirements fails, because the
> code assumes that the device is a 48nm device (0x4 & 0x3 =3D 0x0) and
> aborts with "Invalid ECC requirements" because it cannot map the "ECC
> Level". Extending the mask makes the ECC requirement detection code
> recognize this chip as <=3D 26nm and sets up the ECC step size and ECC
> strength correctly.

Applied.

>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/mtd/nand/nand_hynix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
> index b12dc7325378..bd9a6e343848 100644
> --- a/drivers/mtd/nand/nand_hynix.c
> +++ b/drivers/mtd/nand/nand_hynix.c
> @@ -477,7 +477,7 @@ static void hynix_nand_extract_ecc_requirements(struc=
t nand_chip *chip,
>  		 * The ECC requirements field meaning depends on the
>  		 * NAND technology.
>  		 */
> -		u8 nand_tech =3D chip->id.data[5] & 0x3;
> +		u8 nand_tech =3D chip->id.data[5] & 0x7;

We should probably define macros to extract information from ID bytes
at some point, but let's keep that for later.

> =20
>  		if (nand_tech < 3) {
>  			/* > 26nm, reference: H27UBG8T2A datasheet */
> @@ -533,7 +533,7 @@ static void hynix_nand_extract_scrambling_requirement=
s(struct nand_chip *chip,
>  		if (nand_tech > 0)
>  			chip->options |=3D NAND_NEED_SCRAMBLING;
>  	} else {
> -		nand_tech =3D chip->id.data[5] & 0x3;
> +		nand_tech =3D chip->id.data[5] & 0x7;
> =20
>  		/* < 32nm */
>  		if (nand_tech > 2)
