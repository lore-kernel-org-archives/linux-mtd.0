Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvqo0-0003os-OR
 for linux-mtd@lists.infradead.org; Sat, 23 Sep 2017 20:13:43 +0000
Date: Sat, 23 Sep 2017 22:13:14 +0200
From: Pavel Machek <pavel@ucw.cz>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 trivial@kernel.org
Subject: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
Message-ID: <20170923201314.GA14742@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

C++ comments look wrong in kernel tree. Fix one.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 6cd0f6b..849543f1 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -267,7 +267,7 @@ struct mtd_info {
 	 */
 	unsigned int bitflip_threshold;
=20
-	// Kernel-only stuff starts here.
+	/* Kernel-only stuff starts here. */
 	const char *name;
 	int index;
=20

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlnGwFoACgkQMOfwapXb+vIgAgCdFXLdHJIIvtL/k5ZFNNv3puJG
30IAoLe3ri2/KNATY9Ku8ttQSLVyYvQ+
=mryV
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
