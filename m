Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScDjU-0004Bi-Rf
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 10:44:57 +0000
Message-ID: <1338979723.6875.34.camel@sauron.fi.intel.com>
Subject: Re: ubi debugfs possible regression
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Parsons <lost.distance@yahoo.com>
Date: Wed, 06 Jun 2012 13:48:43 +0300
In-Reply-To: <1338943789.75555.YahooMailClassic@web29010.mail.ird.yahoo.com>
References: <1338943789.75555.YahooMailClassic@web29010.mail.ird.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7SSehcMnRnvtLbvijUiJ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7SSehcMnRnvtLbvijUiJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 01:49 +0100, Paul Parsons wrote:
> In v3.4, ubi worked OK without debugfs.
>=20
> In v3.5-rc1, ubi fails without debugfs:
>=20
> UBI error: ubi_debugfs_init: cannot create "ubi" debugfs directory, error=
 -19
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -19
>=20
> Is this not a regression?

It is, I'll look at this.

--=20
Best Regards,
Artem Bityutskiy

--=-7SSehcMnRnvtLbvijUiJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzzWLAAoJECmIfjd9wqK0mkMQAJeG5un+2sxvgY+gVzC10obB
bge5WKmDn5sknVH4db6TNYnvqvQk13HxYz4GfgRViaqpS4FMMbhqynGljjZofA6V
dy1s7nwtN0gl0KHdO3m0/+7ouZ/atCS5mJjgCiOsr7IAthGk2EB3JvjXjptHvm4X
3HxwmYxt5pNm++3kpy74lNDeZV3+X29doDxFV0K8idsoVEvnB6UwH/9OKXmo+KKA
BpBdD1VFxjr90AXUaaSiwE+gMh+/IlkJPjW8UpRDkPAxDOc6Q0djLX4MdsmRHKPJ
fGEITX4QAyEmem+mVyzHgkSPG1NjbKXSdGkQeIC3ltWTQaf6XnmJtTrTT07ZNk4N
uQC3LvdBHH8gwIYTomPjK4P2gcegDfGALNVompGdbMzeZsvXWmBzJ2hdu8C6HtZb
99B4HhljVHxk94amj1BHHH8s0OELNMGhe7LYlq8hXp/u4t9uwtnF5zKARLEoEYoi
Ubj1cPyRlblBCEUKU/Wv0lZb8s40Zwhv+XJXw1XrW42kLcr97DqTOPYN/8deJsEc
sRk3+pl1up81D/eLkcJ45vbq9ucJ2/DuCp4uoT3mg2oyPI0FhSjGzNImwzl5W1Rk
gnuei2q2ClB56uC7pDk6JPSRMsi87V0YhnH1Lnk+0vTXaf8UYjO6cIoM2IkNkRx5
6BTmRGJVVajNuJO5T2j0
=1mvV
-----END PGP SIGNATURE-----

--=-7SSehcMnRnvtLbvijUiJ--
