Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGAJn-0008N2-7t
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2012 15:11:31 +0000
Message-ID: <1348499489.4880.67.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] NAND BBT: use NAND_BBT_SCAN_MAXBLOCKS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 24 Sep 2012 18:11:29 +0300
In-Reply-To: <1347371454-17107-1-git-send-email-richard.genoud@gmail.com>
References: <1347371454-17107-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yiY4RphSw24mCSZl1Dmp"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yiY4RphSw24mCSZl1Dmp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 15:50 +0200, Richard Genoud wrote:
> In nand_bbt.c, a hardcoded value was used instead of the define meant
> for that, so we use the define.
>=20
> There's no functionnal change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-yiY4RphSw24mCSZl1Dmp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYHghAAoJECmIfjd9wqK0p98QAJ2cYy54F5K+eLhIG2d8P7iE
1kErooicy70AqDdgdiSOS5WgoQG7GZgEXxoJYIfE8ewK2YJfz8lUNA4ukXZlfhqo
fu08nU6qz5zUZN5d010mn/l94O2WsHiotEPfukdiCFf67T/G/YZ5ur9e5SKFDj51
9Y62Jl6MVfxXE5uyq6Y/pEIHw8HIt5FJ5wljoMhmkdP0duYNX3amxKXP6/i0Nrn8
DNdaAZ+ptfI/cUXCM85wSHVGpyBfhdiCZbAWiOBjNvJpy71SfxdgnhDUBCUt5tX0
1wGq0ni1pvUuy4+XKLxGoLUxwvt45kRt94N+U5RgBXFnILbAhln6cEa5DKPguPeA
bq7R7trSLWjYU0OVGsTGRJ8VlNPNV9uWMAduvRi6vC6yfxgEDr11TcTQIVxl+0I1
64ut1jlGTmqT36EhYi+Bz7DZjQobVJqieXBdZAZxugfHcSCLxd5nK1AProNCYJ5c
4cNi/i6uDr9jFaKSfd+2POsO8+DRakJiQkcdA2CfLt9t7XKL9PaYczeELKq6oCO4
/gUDq6mRObZoDXqijlU3aNwxMiiB+xioaHYJSRz+mKjzIe9a7GHjJjhGGjSMw0eG
7hMyRO0l5TOdsooNPM8uQdgj3fjkCTo6r/Z2nursGP8y5R5mdln36QIvPN9TyZNT
6xgghWdHZVFhl/12e2TX
=m2b4
-----END PGP SIGNATURE-----

--=-yiY4RphSw24mCSZl1Dmp--
