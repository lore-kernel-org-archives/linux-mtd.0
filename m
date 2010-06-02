Received: from mail-fx0-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJpmR-00021v-K8
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2010 15:22:56 +0000
Received: by fxm11 with SMTP id 11so1581646fxm.16
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Jun 2010 08:22:53 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dwmw2 <dwmw2@infradead.org>
Subject: [PATCH V2] MTD: Fix NAND submenu
Date: Wed,  2 Jun 2010 18:22:48 +0300
Message-Id: <1275492168-4584-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move MTD_NAND_ECC and MTD_NAND_ECC_SMC above NAND memuconfig, to unbreak
display in xconfig.
This shouldn't change any depedencies

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/Kconfig |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 98a04b3..ffc3720 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -1,13 +1,3 @@
-menuconfig MTD_NAND
-	tristate "NAND Device Support"
-	depends on MTD
-	select MTD_NAND_IDS
-	select MTD_NAND_ECC
-	help
-	  This enables support for accessing all type of NAND flash
-	  devices. For further information see
-	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
-
 config MTD_NAND_ECC
 	tristate
 
@@ -19,6 +9,17 @@ config MTD_NAND_ECC_SMC
 	  Software ECC according to the Smart Media Specification.
 	  The original Linux implementation had byte 0 and 1 swapped.
 
+
+menuconfig MTD_NAND
+	tristate "NAND Device Support"
+	depends on MTD
+	select MTD_NAND_IDS
+	select MTD_NAND_ECC
+	help
+	  This enables support for accessing all type of NAND flash
+	  devices. For further information see
+	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
+
 if MTD_NAND
 
 config MTD_NAND_VERIFY_WRITE
-- 
1.7.0.4
