Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OHKnG-0007po-S8
	for linux-mtd@lists.infradead.org; Wed, 26 May 2010 17:53:28 +0000
Received: from octopus.hi.pengutronix.de ([2001:6f8:1178:2:215:17ff:fe12:23b0])
	by metis.ext.pengutronix.de with esmtp (Exim 4.71)
	(envelope-from <wsa@pengutronix.de>) id 1OHKnA-00027x-2G
	for linux-mtd@lists.infradead.org; Wed, 26 May 2010 19:53:20 +0200
Received: from wsa by octopus.hi.pengutronix.de with local (Exim 4.69)
	(envelope-from <wsa@pengutronix.de>) id 1OHKnA-00060s-18
	for linux-mtd@lists.infradead.org; Wed, 26 May 2010 19:53:20 +0200
Date: Wed, 26 May 2010 19:53:20 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Do we remove from jedec_probe.c?
Message-ID: <20100526175320.GD24167@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

now that Guillaume introduced cfi-support for some SST-flashes, I wonder if
those can be removed from jedec_probe.c? Or should they stay for
backward-compatibility?

Proposed patch would look like this:

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_prob=
e.c
index d72a5fb..37fdff3 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -146,8 +146,6 @@
 #define SST29LE512	0x003d
 #define SST39LF800	0x2781
 #define SST39LF160	0x2782
-#define SST39VF1601	0x234b
-#define SST39VF3201	0x235b
 #define SST39WF1601	0x274b
 #define SST39WF1602	0x274a
 #define SST39LF512	0x00D4
@@ -1500,19 +1498,6 @@ static const struct amd_flash_info jedec_table[] =3D=
 {
 			ERASEINFO(0x1000,256)
 		}
 	}, {
-		.mfr_id		=3D CFI_MFR_SST,     /* should be CFI */
-		.dev_id		=3D SST39VF1601,
-		.name		=3D "SST 39VF1601",
-		.devtypes	=3D CFI_DEVICETYPE_X16,
-		.uaddr		=3D MTD_UADDR_0xAAAA_0x5555,
-		.dev_size	=3D SIZE_2MiB,
-		.cmd_set	=3D P_ID_AMD_STD,
-		.nr_regions	=3D 2,
-		.regions	=3D {
-			ERASEINFO(0x1000,256),
-			ERASEINFO(0x1000,256)
-		}
-	}, {
 		/* CFI is broken: reports AMD_STD, but needs custom uaddr */
 		.mfr_id		=3D CFI_MFR_SST,
 		.dev_id		=3D SST39WF1601,
@@ -1541,21 +1526,6 @@ static const struct amd_flash_info jedec_table[] =3D=
 {
 			ERASEINFO(0x1000,256)
 		}
 	}, {
-		.mfr_id		=3D CFI_MFR_SST,     /* should be CFI */
-		.dev_id		=3D SST39VF3201,
-		.name		=3D "SST 39VF3201",
-		.devtypes	=3D CFI_DEVICETYPE_X16,
-		.uaddr		=3D MTD_UADDR_0xAAAA_0x5555,
-		.dev_size	=3D SIZE_4MiB,
-		.cmd_set	=3D P_ID_AMD_STD,
-		.nr_regions	=3D 4,
-		.regions	=3D {
-			ERASEINFO(0x1000,256),
-			ERASEINFO(0x1000,256),
-			ERASEINFO(0x1000,256),
-			ERASEINFO(0x1000,256)
-		}
-	}, {
 		.mfr_id		=3D CFI_MFR_SST,
 		.dev_id		=3D SST36VF3203,
 		.name		=3D "SST 36VF3203",

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkv9YBAACgkQD27XaX1/VRto7ACfV6hIfmbu6AF7t7Rx0YQu+rej
NusAnRNc39mK+hG4QUXnQGttsoOQIO90
=ot01
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--
