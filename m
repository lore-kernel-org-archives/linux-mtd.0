Received: from ozlabs.org ([2402:b800:7003:1:1::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSi8s-0002OZ-D3
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 04:39:36 +0000
Date: Tue, 22 Nov 2011 15:39:11 +1100
From: Tony Breeds <tony@bakeyournoodle.com>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: ndfc: fix typo in structure dereference
Message-ID: <20111122043904.GA22504@thor.bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In commit 9d7948c50055e74b693ce9e99a709b2e5bbc1942 (mtd: ndfc: use
ofpart through generic parsing) we dereference a non pointer type
causing the following compiler error:
drivers/mtd/nand/ndfc.c: In function 'ndfc_chip_init':
drivers/mtd/nand/ndfc.c:191: error: invalid type argument of '->' (have 'st=
ruct mtd_part_parser_data')

Fix that.

Signed-off-by: Tony Breeds <tony@bakeyournoodle.com>
---
 drivers/mtd/nand/ndfc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index ee17139..f8aacf4 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -188,7 +188,7 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (!flash_np)
 		return -ENODEV;
=20
-	ppdata->of_node =3D flash_np;
+	ppdata.of_node =3D flash_np;
 	ndfc->mtd.name =3D kasprintf(GFP_KERNEL, "%s.%s",
 			dev_name(&ndfc->ofdev->dev), flash_np->name);
 	if (!ndfc->mtd.name) {
--=20
1.7.6.4

Yours Tony

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOyydoAAoJEEsCiJRY75GKVDcQAILf+YjzaTDMxUHBxW0XsYWO
aCydFigXYjnVWlzMas2V8aLM94zNVnO9hzNuUSBOqYsolgOEppOG5SyMcdwI+p6r
ShgWWeXHQZwEVIk+pzTKkgLGl+aTeG1zHuUTe2/4CpwbL+3Kps6hltDiec5TGCqs
2CeqrOm1S1qRrSekvdH92W/I3Ax3yKFs+e4FqICq2Eh3h+yV1kX5ANST3mjCCMgF
WawFOk36nd86917XXXS7ZaQyxrf+nPSREFTTmW1x3+RVU02dDxEKY4Ajh28hmvY/
GURf62d8Ik1FniEe32K/dyC6Tm7tZixpJL+s2w6s8/8cwm6Oe63C0InE9QUfFc0C
xEt027i3CAhlwStnPVXG18UrvsxUMfGCxlBkd+gT2r1i4kUBqMj0KFmyW63FPjQO
qmBJBPfSGsxYBvyqMyh2TrSSwMEOJa5PTARXC5CaDFJ/TnQ7oQPsCx2/mUmV7Aom
J1rUfTisAjIf585Uc0LZyNQ67+puFW0kMEvKJB9kSMAIhbUJ5pupwuH1jWs+F89g
BnVIAuWR73yZ0dDJ54YZfWf4hBkJxvMvWN24RSORzwzVkLckhlvRz8KqqhjvCIWZ
LFXSOPaAEYx1bo8Zx0gBngJ1iaif4EMS/xm44oO/+Rmnw5cVf5WvuYxwB0555UVr
EwIJHRTSMR0+XGP68rfH
=BgE+
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
