Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1sTT-0002Rs-Cv
 for linux-mtd@lists.infradead.org; Sat, 22 Apr 2017 10:41:09 +0000
Date: Sat, 22 Apr 2017 12:40:33 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 marc_gonzalez@sigmadesigns.com
Cc: Dipen.Dudhat@freescale.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
Subject: [PATCH] tango_nand.c: fix ecc.stats_corrected in empty flash case
Message-ID: <20170422104033.GA14508@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <20170421154903.2782cd06@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fix ecc.stats_corrected in empty flash case.

Signed-off-by: Pavel Machek <pavel@denx.de>

---

This was suggested by Boris Brezillon in another context. Not tested;
I don't have the hardware.

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index 4a5e948..db4bff4 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -193,6 +193,8 @@ static int check_erased_page(struct nand_chip *chip, u8=
 *buf)
 						  chip->ecc.strength);
 		if (res < 0)
 			mtd->ecc_stats.failed++;
+		else
+			mtd->ecc_stats.corrected +=3D res;
=20
 		bitflips =3D max(res, bitflips);
 		buf +=3D pkt_size;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj7MyEACgkQMOfwapXb+vIWNQCfey7BecDhDDoJMv05i8PMpOse
vFAAnAuQVnqyPniZ1tAGHxHZTZhY0vdC
=q2sb
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
