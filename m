Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1W9y-0007Sa-5V
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 10:51:32 +0000
Date: Fri, 21 Apr 2017 12:51:07 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: [PATCH] nand_base: optimize checking of erased buffers
Message-ID: <20170421105107.GA7259@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20170420114057.GA4705@amd>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


If we see ~0UL in flash, there's no need for hweight, and no need to
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

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj55BsACgkQMOfwapXb+vJjHQCgvVr65119jGBo1VxL8WzlmHvK
CIIAnA8KnnPvemEPoJB4ocF46vN8XL96
=Vi9H
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
