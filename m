Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb4wO-0007ji-SC
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 07:41:50 +0000
Message-ID: <1353483740.2701.1.camel@sauron.fi.intel.com>
Subject: Re: Patch to solve NULL pointer dereference in physmap_of.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Wed, 21 Nov 2012 09:42:20 +0200
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3ADE0635@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3ADE0635@SI-MBX14.de.bosch.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4AXoTifHnW8ZBlH3Mcu3"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4AXoTifHnW8ZBlH3Mcu3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-11-09 at 08:45 +0100, Prins Anton (ST-CO/ENG1.1) wrote:
> commit 0905a6f4aec377123e94d2260f2f7a0d867e19be
> Author: Anton Prins <anton.prins@nl.bosch.com>
> Date:   Fri Nov 9 10:12:58 2012 +0100
>=20
>     Correct error checking to prevent a NULL pointer dereference
>=20
>     The problem only occurs if the DTS is not correct, the requested mapp=
ing is not reserved on the parent bus.
>     In this special case the count is 1, but the list_size after mapping =
is 0. list_size 0 should generate an error!

Sorry, I do not really understand which problem this patch solves, could
you please improve the commit message and re-send?

>=20
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.=
c
> index 2e6fb68..83d121e 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -267,13 +267,14 @@ static int __devinit of_flash_probe(struct platform=
_device *dev)
>                 info->list[i].mtd->dev.parent =3D &dev->dev;
>         }
>=20

It seems the error condition should be checked and acted upon here. What
you looks more like making the code less readable.

> -       err =3D 0;
>         if (info->list_size =3D=3D 1) {
> +               err =3D 0;
>                 info->cmtd =3D info->list[0].mtd;
>         } else if (info->list_size > 1) {
>                 /*
>                  * We detected multiple devices. Concatenate them togethe=
r.
>                  */
> +               err =3D 0;
>                 info->cmtd =3D mtd_concat_create(mtd_list, info->list_siz=
e,
>                                                dev_name(&dev->dev));
>                 if (info->cmtd =3D=3D NULL)

--=20
Best Regards,
Artem Bityutskiy

--=-4AXoTifHnW8ZBlH3Mcu3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrIXdAAoJECmIfjd9wqK0UEYP/jDPPvwtfjDYxtU88yqGl/0D
OUHgSEZFwG6Br3C5BURKO5HY2FL5ZV62VcomejSW+PeSZnNCIecpvaHDmLL4forW
qafGrh9Y1uxGPTTTP2h7QRFcOCGBoin8a6h7T3FqSHoRFMm20xrUaNp8YhC03C/a
ti1htjghvPZwI7Goj+0lIqeo+rTiNP/08WvcDLIcQW6yD87UO9kONkL1Ll5G+owx
QfCxLXMtvsScJO/y/Rfli8pB1ylJ+X3N8ATPK2MPjNG+LR0vfQFmYR8d1bp2iv6r
W/Z1116gk0QdKhb8M5SXhcLv8J6rCE4+gyxAyCqdqTI7ZCZR6WaMKbzlH1UbA10b
kNq0bUF3+cuNiFfIL8f7V42wZgJ0b5NUyN0GVmLzUZqAcGNodKu/YZZ4neHh4QZy
QkqXxtS2aINMWMkwYgbQfRaKi1SV0C+Z8UfIi76m6tr9UfQ8Qw5RtvDULtSHQa4B
qMF0TfNHE5Vj1y9aHTrRDpfn4hdPiFLioy45r76nNTc7aZ1u0BaEYsyuWRMfJnBr
bN2si+tulqFttpYffXL1nxagNhg99pqdILizwH8KpVZs89rZP7lBM1tmjLSmOqvW
WuCdYoMfpioP1HNbDLTz6WyYDcGv5HZAmymIoqukI+wFuUVOQ8Ja3qFgzofaMYSm
rfO/dj1G+CIj4OiSsImh
=C/NO
-----END PGP SIGNATURE-----

--=-4AXoTifHnW8ZBlH3Mcu3--
