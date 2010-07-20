Date: Mon, 19 Jul 2010 22:17:18 -0400
From: Kyle Spaans <kspaans@uwaterloo.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] drivers/mtd: remove makefile subdirectory processing
	redundancies
Message-ID: <20100720021718.GA32479@caffeine.csclub.uwaterloo.ca>
References: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
	<1279471590.16247.57.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <1279471590.16247.57.camel@localhost.localdomain>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 18, 2010 at 07:46:30PM +0300, Artem Bityutskiy wrote:
> On Wed, 2010-07-14 at 00:25 -0400, Kyle Spaans wrote:
> > Remove redundant config checks when the subdirectory's Makefile is alre=
ady
> > conditionally processed. Add more conditional processing when the subdi=
rectory
> > can be selected/deselected as a whole.
> >=20
> > Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
> > Reviewed-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > ---
>=20
> This does not apply to the mtd-2.6.git tree [1]. Also I spotted that
>=20
> ...
> =20
> > +obj-$(CONFIG_MTD_TESTS)		+=3D tests/
> > +obj-$(CONFIG_MTD_LPDDR)		+=3D lpddr/
> > +obj-$(CONFIG_MTD_NAND)		+=3D nand/
> > +obj-$(CONFIG_MTD_ONENAND)	+=3D onenand/
> >  obj-$(CONFIG_MTD_BI)		+=3D ubi/
>=20
> This cannot be right, because we have UBI, not 'BI'.

Weird! Mutt seems to have mangled the patch on me. I must have pressed some
buttons while composing the message. Try it now. Thanks! (Can I resubmit the
patch like this, or does it need to go in its own email? I can't quite tell
=66rom looking at linux-mtd and lkml traffic.)


Remove redundant config checks when the subdirectory's Makefile is already
conditionally processed. Add more conditional processing when the subdirect=
ory
can be selected/deselected as a whole.

Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
Reviewed-by: Robert P. J. Day <rpjday@crashcourse.ca>
---

 compile tested on Debian Lenny

 drivers/mtd/Makefile         |    6 +++++-
 drivers/mtd/lpddr/Makefile   |    2 +-
 drivers/mtd/nand/Makefile    |    2 +-
 drivers/mtd/onenand/Makefile |    4 ++--
 drivers/mtd/tests/Makefile   |   16 ++++++++--------
 drivers/mtd/ubi/Makefile     |    2 +-
 6 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 760abc5..3bf50bd 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -30,6 +30,10 @@ obj-$(CONFIG_MTD_OOPS)		+=3D mtdoops.o
 nftl-objs		:=3D nftlcore.o nftlmount.o
 inftl-objs		:=3D inftlcore.o inftlmount.o
=20
-obj-y		+=3D chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
+obj-y		+=3D chips/ maps/ devices/
=20
+obj-$(CONFIG_MTD_TESTS)		+=3D tests/
+obj-$(CONFIG_MTD_LPDDR)		+=3D lpddr/
+obj-$(CONFIG_MTD_NAND)		+=3D nand/
+obj-$(CONFIG_MTD_ONENAND)	+=3D onenand/
 obj-$(CONFIG_MTD_UBI)		+=3D ubi/
diff --git a/drivers/mtd/lpddr/Makefile b/drivers/mtd/lpddr/Makefile
index da48e46..0e9be65 100644
--- a/drivers/mtd/lpddr/Makefile
+++ b/drivers/mtd/lpddr/Makefile
@@ -3,4 +3,4 @@
 #
=20
 obj-$(CONFIG_MTD_QINFO_PROBE)	+=3D qinfo_probe.o
-obj-$(CONFIG_MTD_LPDDR)	+=3D lpddr_cmds.o
+obj-y				+=3D lpddr_cmds.o
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index e8ab884..8fe5869 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -2,7 +2,7 @@
 # linux/drivers/nand/Makefile
 #
=20
-obj-$(CONFIG_MTD_NAND)			+=3D nand.o
+obj-y					+=3D nand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+=3D nand_ecc.o
 obj-$(CONFIG_MTD_NAND_IDS)		+=3D nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+=3D sm_common.o
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile
index 2b7884c..f6a8495 100644
--- a/drivers/mtd/onenand/Makefile
+++ b/drivers/mtd/onenand/Makefile
@@ -3,12 +3,12 @@
 #
=20
 # Core functionality.
-obj-$(CONFIG_MTD_ONENAND)		+=3D onenand.o
+obj-y					+=3D onenand.o
=20
 # Board specific.
 obj-$(CONFIG_MTD_ONENAND_GENERIC)	+=3D generic.o
 obj-$(CONFIG_MTD_ONENAND_OMAP2)		+=3D omap2.o
-obj-$(CONFIG_MTD_ONENAND_SAMSUNG)       +=3D samsung.o
+obj-$(CONFIG_MTD_ONENAND_SAMSUNG)	+=3D samsung.o
=20
 # Simulator
 obj-$(CONFIG_MTD_ONENAND_SIM)		+=3D onenand_sim.o
diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index b44dcab..14adc55 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -1,8 +1,8 @@
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_oobtest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_pagetest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_readtest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_speedtest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_stresstest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_subpagetest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_torturetest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_nandecctest.o
+obj-y +=3D mtd_oobtest.o
+obj-y +=3D mtd_pagetest.o
+obj-y +=3D mtd_readtest.o
+obj-y +=3D mtd_speedtest.o
+obj-y +=3D mtd_stresstest.o
+obj-y +=3D mtd_subpagetest.o
+obj-y +=3D mtd_torturetest.o
+obj-y +=3D mtd_nandecctest.o
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index c9302a5..caf0316 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_MTD_UBI) +=3D ubi.o
+obj-y +=3D ubi.o
=20
 ubi-y +=3D vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o scan.o
 ubi-y +=3D misc.o
--=20
1.5.6.5


--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkxFBy4ACgkQ7ECsBhUMPvD1lgCfXmBe/1QmFZRLIXri991gP06g
IDcAnR9LSrbg5BFig5AryxBN662z/Xng
=nX/s
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
