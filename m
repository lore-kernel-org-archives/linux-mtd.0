Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEKat-0001yS-Lb
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2012 13:45:37 +0000
Message-ID: <5059CC77.5060505@pengutronix.de>
Date: Wed, 19 Sep 2012 15:45:27 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH RFC] bcm47xxsflash: just use memcpy for reading
References: <1348056494-30019-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1348056494-30019-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4D321FB8635DF845094D8766"
Cc: Jonas Gorski <jonas.gorski@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4D321FB8635DF845094D8766
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 09/19/2012 02:08 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> ---
> Still have to check it with aiaiai
> ---
>  drivers/mtd/devices/bcm47xxsflash.c |   31 ++-------------------------=
----
>  1 files changed, 2 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/=
bcm47xxsflash.c
> index a328872..2f8dfd4 100644
> --- a/drivers/mtd/devices/bcm47xxsflash.c
> +++ b/drivers/mtd/devices/bcm47xxsflash.c
> @@ -14,41 +14,14 @@ static int bcm47xxsflash_read(struct mtd_info *mtd,=
 loff_t from, size_t len,
>  			      size_t *retlen, u_char *buf)
>  {
>  	struct bcma_sflash *sflash =3D mtd->priv;
> -	size_t bytes_read =3D 0;
> -	__iomem u8 *src =3D (__iomem u8 *)KSEG0ADDR(sflash->window + from);
> -	int i;
> -	size_t unaligned_before, unaligned_after;
> =20
>  	/* Check address range */
>  	if ((from + len) > mtd->size)
>  		return -EINVAL;
> =20
> -	unaligned_before =3D from & 0x3;
> -	unaligned_after =3D (from + len) & 0x3;
> +	memcpy(buf, (void *)KSEG0ADDR(sflash->window + from), len);

You should not access iomem with memcpy, there is a memcpy_fromio(), but
it's an unoptimized readb loop on arm.

Marc
> =20
> -	for (i =3D 0; i < unaligned_before; i++) {
> -		*buf =3D readb(src);
> -		buf++;
> -		src++;
> -		bytes_read++;
> -	}
> -	for (i =3D from - unaligned_before; i < from + len - unaligned_after;=

> -	     i +=3D 4) {
> -		*(u32 *)buf =3D readl(src);
> -		buf +=3D 4;
> -		src +=3D 4;
> -		bytes_read +=3D 4;
> -	}
> -	for (i =3D 0; i < unaligned_after; i++) {
> -		*buf =3D readb(src);
> -		buf++;
> -		src++;
> -		bytes_read++;
> -	}
> -
> -	*retlen =3D bytes_read;
> -
> -	return 0;
> +	return len;
>  }
> =20
>  static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
>=20


--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--------------enig4D321FB8635DF845094D8766
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iEYEARECAAYFAlBZzHsACgkQjTAFq1RaXHM32gCeNfU3Ovhv9o8C12pSKgrZ4NO4
RV4AmgMahxFoiB06ID5DwJCDJUMMVgKU
=VoxE
-----END PGP SIGNATURE-----

--------------enig4D321FB8635DF845094D8766--
