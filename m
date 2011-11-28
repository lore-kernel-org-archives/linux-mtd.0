Received: from rcsinet15.oracle.com ([148.87.113.117])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RV1dm-0001GK-Sx
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 13:53:06 +0000
Date: Mon, 28 Nov 2011 16:53:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [patch v2] mtd/docg3: dereferencing an ERR_PTR() in docg3_probe()
Message-ID: <20111128134947.GK21128@mwanda>
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda> <87r50vi20u.fsf@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="I4VOKWutKNZEOIPu"
Content-Disposition: inline
In-Reply-To: <87r50vi20u.fsf@free.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--I4VOKWutKNZEOIPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If doc_probe_device() returned an ERR_PTR, then we accidentally saved
that to docg3_floors[floor] =3D mtd; which gets derefenced in the error
handling when we call doc_release_device().

I've reworked the error handling to take care of that and hopefully
make it a little simpler.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Version 1 conflicted with another patch in stream.

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index d7df311..f7490a014 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2027,21 +2027,24 @@ static int __init docg3_probe(struct platform_devic=
e *pdev)
 	if (!docg3_bch)
 		goto nomem2;
=20
-	ret =3D 0;
 	for (floor =3D 0; floor < DOC_MAX_NBFLOORS; floor++) {
 		mtd =3D doc_probe_device(base, floor, dev);
-		if (floor =3D=3D 0 && !mtd)
-			goto notfound;
-		if (!IS_ERR_OR_NULL(mtd))
-			ret =3D mtd_device_parse_register(mtd, part_probes,
-							NULL, NULL, 0);
-		else
+		if (IS_ERR(mtd)) {
 			ret =3D PTR_ERR(mtd);
+			goto err_probe;
+		}
+		if (!mtd) {
+			if (floor =3D=3D 0)
+				goto notfound;
+			else
+				continue;
+		}
 		docg3_floors[floor] =3D mtd;
+		ret =3D mtd_device_parse_register(mtd, part_probes, NULL, NULL,
+						0);
 		if (ret)
 			goto err_probe;
-		if (mtd)
-			found++;
+		found++;
 	}
=20
 	ret =3D doc_register_sysfs(pdev, docg3_floors);

--I4VOKWutKNZEOIPu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO05JIAAoJEOnZkXI/YHqRFtMP/RTI1AgISLf/Q6JvZMMPJq7A
qWaS/gjQlERylrVZ4HYGgP4207fSBc5wHTjMUV6wY71X/4ceyKWiXcEmkE6RxJGe
mqyMlYvKH3LtMDVK2GBDSxGaDrQjHrKHLXdsqMiyD2nxOLxNu/kObz7kucEXAWM9
qtZLNfYng1ReVHsJSLkC+bdkHv/DJ2kQZ3J7nMHjpScpjn5+ju0thbDUyD6cbp4f
M5AnH+2yjr3bwuAVxqZ7dxYMZb15v//lfXA6tVHTb7I/0NwqWMdptNtMSQxDpT5/
pdAdlDI4AiMFYX7GtNo2Jyssm5fzmo3qbx7XJfvKnk7q3j2cZQeaRZX7JEJRW5S/
qoYARkfiOOaK9F0VI4n/HDaIRwWKfF6eNo1BFU47Z50q7b+KwAEq3wzFvFiKuLKd
rXIYbFitTa62CLovMsc0Kxsrx36FIRb1aMF8Ho6IJelxO/lfxDoG/cKw/ppRBlZK
4/cLx1OgdeshiGhLDFRKZ8wLBk7oPmYqQJqdYbuSikeQCi4/jryKip5VaryqELvo
DozFR1yKQMGJE+96RQweVtx7A4i4h8TKHRhoEksyS6uQqcDBofmGk9eBFJSHlBTM
d/o/s5zbT0r/H2wQxBgJndJfTouO+NDemx3R93Scc84Mn/0iIUD3BW+kOgOIcgPc
M10TzJvVKj4CX7Oahc/2
=OzXn
-----END PGP SIGNATURE-----

--I4VOKWutKNZEOIPu--
