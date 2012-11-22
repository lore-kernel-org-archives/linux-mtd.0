Message-ID: <1353579697.2701.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 135/493] mtd: remove use of __devexit_p
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bill Pemberton <wfp5p@virginia.edu>
Date: Thu, 22 Nov 2012 12:21:37 +0200
In-Reply-To: <1353349642-3677-135-git-send-email-wfp5p@virginia.edu>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu>
 <1353349642-3677-135-git-send-email-wfp5p@virginia.edu>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-scHeDettyMiUk+X0iCO/"
Mime-Version: 1.0
Cc: Wan ZongShun <mcuos.com@gmail.com>, gregkh@linuxfoundation.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-scHeDettyMiUk+X0iCO/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-19 at 13:21 -0500, Bill Pemberton wrote:
> CONFIG_HOTPLUG is going away as an option so __devexit_p is no longer
> needed.
>=20
> Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>

Pushed this one and 238, 314, 363, 415 to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-scHeDettyMiUk+X0iCO/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrfyxAAoJECmIfjd9wqK0GGUQANADSgzILFfdYxeoUcTehdPd
SGzhKAvqz3IZGw+PC4RK6XLXFyNdiYm3zDALdcqpK4yi+B/weWhQOprXZi2cZ3uT
7wTXPfoNJJ6x0xOQvdgNgdjaANGzzHNwqKGQHWsZjFI7kF+ao52NaNwz3FKL1aFq
GcGsMp4hdU4zaDvLt2u4bD7a4wGR1BZpM+RGRATJj40zDxawrOd7tfcf+gRPwER2
GrjcRVJfqCzLDywp3wvUcl8LCtfLWWRcRna76hD7GbjGbQrcqSgKm0Nf+GzcoiOY
9aZEf0otv96AD+Jo4R21+WLmT8SfHhIN3uFmJG3eRVTC4pyubu+7w0+E9My+vh/G
EdApD6M+FNWgiDs6xxn3hFW8V67YvwVgnMxaW48p1JVT6mTghEsw64UTkts3OcsN
WvNKOvh2wNknQ0T7dRUEtqOiIzMbDF5YJDDFEs4bZwiTDOu43LMrFtZn/9BgrMPB
83fXDZj9STVq5YiZQFDwYhP76jgKh1LHvRkqcHqDpx/yggYSmdJxW1v/GRqAd/s2
ZxnGRKOaYiEZZ6Mv74apgB4OllQGwddPr7NMrNVV/OQfeSxHizN7bRtS836e4KvN
buBw0qQCgE8mL7e4rs/0ONMgkeTpeRnsht1HfhiO+MGtRUu68KoMymyzf0Giv7Yk
CJZsUPxgTynUiPkzb1f9
=4AsW
-----END PGP SIGNATURE-----

--=-scHeDettyMiUk+X0iCO/--
