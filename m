Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSoH9-0007Cx-NP
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 11:44:54 +0000
Message-ID: <1336736891.2625.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: nand: check the return code of
 'read_oob/read_oob_raw'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 11 May 2012 14:48:11 +0300
In-Reply-To: <20120509131334.2d0b7160@pixies.home.jungo.com>
References: <20120509130635.32973038@pixies.home.jungo.com>
 <20120509131334.2d0b7160@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mADCsEUJcqeXTJpDuv1f"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mADCsEUJcqeXTJpDuv1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 13:13 +0300, Shmulik Ladkani wrote:

> @@ -1826,9 +1827,12 @@ static int nand_do_read_oob(struct mtd_info *mtd, =
loff_t from,
> =20
>  	while (1) {
>  		if (ops->mode =3D=3D MTD_OPS_RAW)
> -			chip->ecc.read_oob_raw(mtd, chip, page);
> +			ret =3D chip->ecc.read_oob_raw(mtd, chip, page);
>  		else
> -			chip->ecc.read_oob(mtd, chip, page);
> +			ret =3D chip->ecc.read_oob(mtd, chip, page);
> +
> +		if (ret < 0)
> +			break;

For page reading the convention is that we keep reading and try to read
everything anyway, I guess it is reasonable thing to do for OOB as well?

--=20
Best Regards,
Artem Bityutskiy

--=-mADCsEUJcqeXTJpDuv1f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrPx7AAoJECmIfjd9wqK0wZwP/3qOJNyXYBsUzgcZei6CLw+t
6/tK3bGwHMmZPfua/Xw3/hB8qO6j1l9P/KHPcYikr/zqyCqxEXzT7srPx8fbSQgF
Ig1HvE+PyQN0boxTiHt6MIyCRHEmRemFiCyE9OlDcyYlXh2/bWR7AEHjBTb/zLc0
BYpGO3J9UDvYx7VjOph2wch3JyybjFmRfUAqeheJpaFrWnV3GrsYPVBsngDqDVOp
17eQ8hnJVFBSod/QsgDG/OTfUgo01L3OllN2u0cQjS/L8nQ3Ir6XFoPY6u2RI1J3
XeVaSCVx6FaRH8UDEmw9aEvnDcaKs8A68tpA0zaHljICnu9xeGR0b6tuC3pwG3Ar
+tsPF4+iiCVhcE2Xuc3t2UWOvSnMDzjEYzo8UV4Ee0OfvIbnu09O/rXqZcDH4M5i
l7oqJ3TwwncN2paDzMEFyBkg/iF4/hwcDTWKJALpD1SZDr1wDGJuLM2O0rSDyLyU
NuwLmzHz/tMl+OaDFF2BSwj+g1I8+X5fGUjp1QwI7t408Hzzd1ZIPY/5tbKpvKqH
uTcdeUT4jjm6ONo0KNq//cwm3kH5VU793GF+Cerw1ZZ9rmidgeBm6MZU+iHJp2wX
Bin9+u/7FJrOKK1M6MOiGoccAWSg4i54hZjkApHP3gE4GDSpWnEbmsCPE7XcwTvy
sS4zNJqE/2lmmx9oMgul
=Nb6W
-----END PGP SIGNATURE-----

--=-mADCsEUJcqeXTJpDuv1f--
