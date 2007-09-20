Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYN1K-000512-GG
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 10:28:53 -0400
Subject: [PATCH] MTD: OneNAND: fix error print
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Sep 2007 17:28:34 +0300
Message-Id: <1190298515.14370.201.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 20 Sep 2007 19:14:50 +0300
Subject: [PATCH] MTD: OneNAND: fix error print

Do not scare people if a correctable ECC error was detected.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onena=
nd_base.c
index 0537fac..960863a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -318,12 +318,14 @@ static int onenand_wait(struct mtd_info *mtd, int sta=
te)
 	if (interrupt & ONENAND_INT_READ) {
 		int ecc =3D this->read_word(this->base + ONENAND_REG_ECC_STATUS);
 		if (ecc) {
-			printk(KERN_ERR "onenand_wait: ECC error =3D 0x%04x\n", ecc);
 			if (ecc & ONENAND_ECC_2BIT_ALL) {
+				printk(KERN_ERR "onenand_wait: ECC error =3D 0x%04x\n", ecc);
 				mtd->ecc_stats.failed++;
 				return ecc;
-			} else if (ecc & ONENAND_ECC_1BIT_ALL)
+			} else if (ecc & ONENAND_ECC_1BIT_ALL) {
+				printk(KERN_NOTICE "onenand_wait: correctable ECC error =3D 0x%04x\n",=
 ecc);
 				mtd->ecc_stats.corrected++;
+			}
 		}
 	} else if (state =3D=3D FL_READING) {
 		printk(KERN_ERR "onenand_wait: read timeout! ctrl=3D0x%04x intr=3D0x%04x=
\n", ctrl, interrupt);
--=20
1.5.0.6


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
