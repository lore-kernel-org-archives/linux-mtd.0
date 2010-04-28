Received: from tethra.basler.com ([206.107.254.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O7Fol-0001Qk-LU
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2010 22:33:20 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] mpc5121_nfc: Changed SVR check to allow MPC5123.
Date: Wed, 28 Apr 2010 17:33:19 -0500
Message-ID: <181804936ABC2349BE503168465576460E95836C@exchserver.basler.com>
From: "Steve Deiters" <SteveDeiters@BASLER.com>
To: <linux-mtd@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The revision in SVR for MPC5123 is 3.  The NFC is the same as MPC5121
revision 2.

---
 drivers/mtd/nand/mpc5121_nfc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c
b/drivers/mtd/nand/mpc5121_nfc.c
index 191bf99..dc04d74 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -666,10 +666,10 @@ static int __devinit mpc5121_nfc_probe(struct
of_device *op,
=20
 	/*
 	 * Check SoC revision. This driver supports only NFC
-	 * in MPC5121 revision 2.
+	 * in MPC5121 revision 2 and MPC5123 revision 3.
 	 */
 	rev =3D (mfspr(SPRN_SVR) >> 4) & 0xF;
-	if (rev !=3D 2) {
+	if ((rev !=3D 2) && (rev !=3D 3)) {
 		dev_err(dev, "SoC revision %u is not supported!\n",
rev);
 		return -ENXIO;
 	}
--=20
1.5.4.3
