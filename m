Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHD1-0006dR-50
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 08:23:31 +0000
Message-ID: <1353054248.3618.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd nand : print flash size during detection
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Fri, 16 Nov 2012 10:24:08 +0200
In-Reply-To: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
References: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KsvCyyUegNqM+94LOI32"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KsvCyyUegNqM+94LOI32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-06 at 12:03 +0100, Matthieu CASTET wrote:
> This help to detect bad flash identification in case the size is not pres=
ent
> on the name (ONFI).
>=20
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> ---
>  drivers/mtd/nand/nand_base.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c90ef66..8916bc6 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3292,10 +3292,10 @@ ident_done:
>  		chip->cmdfunc =3D nand_command_lp;
> =20
>  	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),=
"
> -		" page size: %d, OOB size: %d\n",
> +		" %dMiB page size: %d, OOB size: %d\n",

Is this readable? No comma after the size. I guess it is better to add
"size %dMiB," instead?

--=20
Best Regards,
Artem Bityutskiy

--=-KsvCyyUegNqM+94LOI32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpfgoAAoJECmIfjd9wqK0LhoQALhVRbtL7TH2aurnVUk3ev7J
IvYDhrcs+vkn9yCjzXU4hxzxARxZSPi2hz3WJjDkDRy2DAKKvPFxj51N4LNp+V37
dG+X4HqVBG672XUEYF/UAT1ww3qFc+1ruf0wIAvK2sc/9aGr9vTutyfGS41+gZDg
uS4/Y5HliyY/FxZYp4XLBUSS1jjEOKPazpkJvAydLgB0GrrSxqltdDNgjX0tOR2Q
6hs94e82DyxPtnMCaXQGXqnvvGWsfQssOcU/y3LxZRds4KIsdug1lc8hNAp/ISUW
eSr3flyJsWGvKt+X4PpTYowwoap094tuZ1y9AA9xwun6YosWRrlc2HUIx2OnNNN3
QQ7YXf/hXAwbgoKJ6x6ulJ2VJoM7fVtkFqnR7c5qO8sMu/m/VYVRXfz5BCdFi0Yh
LCfC+BAc1541dplRel31JAFwDNABzgFrYp+4s8sZer9ZuCluI48tgjl7BpYSKZrd
TsspWE+u9yQ5HfWFCkl/KNrND4QUu0wkE/ZwFJa4kflGRy43fjJk+aqcetSE0C8+
87mhJapyXiNcJgx+BbrtjzPz/1KsDhaVRuYQpxnGNbjnOZ15qoAuJwTs5gqsJuWQ
bukRoJ5JHC7/SxYbaCPnWSoVnazI7bc5wj3wn3/1UUfouY/7O6Ek5QDoXElWkEYE
kKHryK1fruaNn4cT5L82
=Go+H
-----END PGP SIGNATURE-----

--=-KsvCyyUegNqM+94LOI32--
