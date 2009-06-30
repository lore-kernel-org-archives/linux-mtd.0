Received: from exprod6ob111.obsmtp.com ([64.18.1.26] helo=psmtp.com)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MLj9Z-0008RA-18
	for linux-mtd@lists.infradead.org; Tue, 30 Jun 2009 19:38:11 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] ep93xx: cleanup includes in ts7250 nand driver
Date: Tue, 30 Jun 2009 15:38:00 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901A1356B@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "linux-arm-kernel" <linux-arm-kernel@lists.arm.linux.org.uk>,
	<linux-mtd@lists.infradead.org>
Cc: Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ep93xx: cleanup includes in ts7250 nand driver

1. <linux/io.h> should be included not <asm/io.h>
2. add platform specific header <mach/ts72xx.h>

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Lennert Buytenhek <buytenh@wantstofly.org>

---

diff --git a/drivers/mtd/nand/ts7250.c b/drivers/mtd/nand/ts7250.c
index 2c410a0..0f5562a 100644
--- a/drivers/mtd/nand/ts7250.c
+++ b/drivers/mtd/nand/ts7250.c
@@ -24,8 +24,11 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
-#include <asm/io.h>
+#include <linux/io.h>
+
 #include <mach/hardware.h>
+#include <mach/ts72xx.h>
+
 #include <asm/sizes.h>
 #include <asm/mach-types.h>
 =20
