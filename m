Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1ASf-0005dU-EB
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 11:41:24 +0000
Date: Thu, 20 Apr 2017 13:40:57 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170420114057.GA4705@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20170420002748.5c76c9b9@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Would it make sense to only do hweight if *bitmap !=3D ~0ULL ? Would it
> > make sense to only check for bitflips > bitflips_threshold each 128
> > bytes or something like that?
>=20
> I didn't go as far as you did and simply assumed hweight32/64() were
> already optimized. Feel free to propose extra improvements.

I'd propose this one (only compile tested, sorry, not sure how to test
this one). If we see ~0UL, there's no need for hweight, and no need to
check number of bitflips. So this should be net win.

Signed-off-by: Pavel Machek <pavel@denx.de>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b0524f8..96c27ec 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1357,7 +1357,10 @@ static int nand_check_erased_buf(void *buf, int len,=
 int bitflips_threshold)
=20
 	for (; len >=3D sizeof(long);
 	     len -=3D sizeof(long), bitmap +=3D sizeof(long)) {
-		weight =3D hweight_long(*((unsigned long *)bitmap));
+		unsigned long d =3D *((unsigned long *)bitmap);
+		if (d =3D=3D ~0UL)
+			continue;
+		weight =3D hweight_long(d);
 		bitflips +=3D BITS_PER_LONG - weight;
 		if (unlikely(bitflips > bitflips_threshold))
 			return -EBADMSG;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj4nkkACgkQMOfwapXb+vIuYwCfTaGP5qywXLwETAQ+x6/VD+3w
MtsAniO7bqHLv0NuU7MuI4oa5AaIhKjq
=pOMg
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
