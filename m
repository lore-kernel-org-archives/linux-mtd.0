Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TBNVL-0001Uy-VG
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 10:15:40 +0000
Message-ID: <1347358840.21359.67.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2] mtd: basic (read only) driver for BCMA serial flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 11 Sep 2012 13:20:40 +0300
In-Reply-To: <1346699237-414-1-git-send-email-zajec5@gmail.com>
References: <1346699237-414-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lyJ4ChSMfpNerl6jdRwo"
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


--=-lyJ4ChSMfpNerl6jdRwo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 21:07 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This registers MTD driver for serial flash platform device. Right now it
> supports reading only, writing still has to be implemented.
> At this point it's marked as BROKEN, because it requires code present in
> net tree that wasn't mainlined yet.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

What are exactly the changes it depends on? URL? Are they staged for
3.7?

> +static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
> +				   struct mtd_info *mtd)
> +{
> +	mtd->priv =3D sflash;
> +	mtd->name =3D "bcm47xxsflash";
> +	mtd->owner =3D THIS_MODULE;
> +	mtd->type =3D MTD_ROM;
> +	mtd->size =3D sflash->size;
> +	mtd->_read =3D bcm47xxsflash_read;

I guess also
mtd->flags =3D MTD_CAP_ROM;
would be good to add.

> +	mtd->writesize =3D 1; /* FIXME */

Is "FIXME" needed? Why? If needed, write a more descriptive comment.

Also I guess
mtd->writebufsize =3D mtd->writesize;

> +static int __devexit bcm47xxsflash_remove(struct platform_device *pdev)
> +{
> +	struct bcma_sflash *sflash =3D dev_get_platdata(&pdev->dev);
> +
> +	if (!sflash->mtd) {
> +		WARN_ON(1);
> +		return -ENODEV;
> +	}

Why do you need this check with a warning? Can this happen, in which
cases?

--=20
Best Regards,
Artem Bityutskiy

--=-lyJ4ChSMfpNerl6jdRwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQTxB4AAoJECmIfjd9wqK0s+cQAIDh1XOPBDkrF1Sfx2mPPYoG
Q4YQQEGWeecYMcIIobq3Ys01nkJo3UTOWwUCjfWZ6KWyJl68oUwKBjCQ90f1v/3K
laC5CD7z4wpgkze0K1v8P1qmk4FNWdtXitln/3/JZScgVmkYN+oM3uR+jEOoe6+A
6I3dl9LoHpClq9OKZGpBeRBPPDSifbVFPDfNzBuInp/8WlCnjMAHval6NY+Aajs0
cCNQ212O+H8dOQh4kV1uJO5P7Hg1pxU1HUclKQ37DWiIqSLhg14tg6ZLyj7Nvfu+
C8r6ymNv02gEHWzSPIu8VHiNEJCwA7uAlRb01QB3uxoOmg+qsk8HuueO0mLPYxs0
4uibwIOWmbLd8qRxY/uIb6eV2XtkWuqWAr3aM3fSf/g0tQERkUE6FvyzlDJXW8no
Z5hBhm9HCoUS9O7I5Hjkcbk69hzbBelfHgpq1qbW+YCkntgbHcKZrxQgJDpRWFvA
PCu96Cw8yOsNJfz1Wsn6LCgs7WacfolCdm3ozYnDQoD6bVGTr91oKG1iRAncKsaV
znM3KNGQIaSqPcffaZYrgM3xj18pbYWGz2uLjgH80gAeubB+OWLsdmS/i8iNQr0X
mcf8e8f1fiSgnqTZ6SzuTDMZ0DDRrdKG15RzvLGD8UFVawcolM8eERr+LvSg/Zr5
wUmSU1F7KkRqBp7KZvvn
=0Jgy
-----END PGP SIGNATURE-----

--=-lyJ4ChSMfpNerl6jdRwo--
