Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmkUq-0004lf-PY
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 11:13:06 +0000
Received: by obcuz6 with SMTP id uz6so1581975obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 03:13:03 -0800 (PST)
Message-ID: <1326712487.14299.47.camel@sauron.fi.intel.com>
Subject: Re: ubifs mount fails due to corrupt empty space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gabriel Matni <gabriel.matni@gmail.com>
Date: Mon, 16 Jan 2012 13:14:47 +0200
In-Reply-To: <CALuiOdd6vgDogxf9+RFWhb-uUoDLji2CawB3Gvisg2iW4C7PiA@mail.gmail.com>
References: <CALuiOdd6vgDogxf9+RFWhb-uUoDLji2CawB3Gvisg2iW4C7PiA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2NR9YJp3nGMbT8UKcxYr"
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


--=-2NR9YJp3nGMbT8UKcxYr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-01-12 at 21:24 -0500, Gabriel Matni wrote:
> ) Is the usage of this patch safe?

No, it is wrong and unsafe.

> 4) Any suggestions?

Did you check if your driver protects empty space? If no, try to make it
so. The other way is to teach UBI/UBIFS allow for bit-flips in empty
space.

> Kernel log when attempting to mount the file system (2 UBI volumes on
> mtd12 each having a ubifs):
>=20
> <5>[   68.901714] UBI: attaching mtd12 to ubi12

mtd12? Often when people have so many MTD devices it is an indication of
bad design. Why you have so many?

Also, if you can share the mtd12 image with me - I can take a closer
look, but it does not look like I will suggest anything new.

Please, check your driver to start with and let us know if it protects
the empty space.

Did you validate your driver with mtd tests, BTW?
(http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests)

--=20
Best Regards,
Artem Bityutskiy

--=-2NR9YJp3nGMbT8UKcxYr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFAanAAoJECmIfjd9wqK0eaUQAJU622eZSNMUHoZ+2Z/B7M9p
F5P5u4cpAd3JN04goa82PjdvK/ceqM0R1aKTAPfS1kK2NWMXNx38fQ9qXWCX4bqQ
9tSi8M7QTuay/B3kjsTn0okGrITixmCTT9aeM2cQF1TukpvbVhcXlS6vT6s8DzEs
w9OnXqcQ+sYxbrfcPW29TSp+jriw9VABj0o/AQ1vVsNJVhaCyy1299kgpxorowSd
4kJ0SKi16+vELh1nh1ThRgA46NfbElaqy9v28XpPGfsgLY+MeyPSH7QloQoaAB1d
doM3jYHNUf2xgnrfvo9l3pO9I8zPv4ABQaBV+JUPioQlrCB1iWUkkBbiY7QoyCsK
q2cH6tiF4TGzhyeAQgg+bVsg0tmSwmG5Euus44duiNwAemaMy9Bx+Uq46+dyLkx0
g08qlbaqD4LXTTS2UESd6xySGrvMZwXduXe1+Zu1v7SQ4wz/ed05mDwpRwhWhEYQ
IcQBJHaZ/rE0CJD6JeMruIL3zzdor59Cno0c86ACq5rvkR2dGim188GCIHBhs4xg
u/majuOt+YovkwHPYKw+4p4tSHMbh4Y9YD6Xw2MWwCVA3OWOJ+W6DAv1X90Hr+hu
T8LRR4UJwTwtKoTFoyBC41ePwAW1ewynMY00fJ7l30SElzH1hwBsKpJKED1BY86Q
v2TU2DvXn/mbCEmfPIya
=dtiV
-----END PGP SIGNATURE-----

--=-2NR9YJp3nGMbT8UKcxYr--
