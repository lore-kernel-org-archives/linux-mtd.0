Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0We6-0005RY-Ml
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 08:34:19 +0000
Received: by ywh42 with SMTP id 42so6054303ywh.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Oct 2009 01:34:14 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3 -v3] MTD: Add MTD NAND tests support
Date: Wed, 21 Oct 2009 17:34:03 +0900
Message-Id: <1256114044-12163-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <>
References: <>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	vimal singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This creates new MTD test group called MTD NAND tests which require
MTD NAND device support and moves mtd_oobtest, mtd_pagetest,
and mtd_subpagetest into this group.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: vimal singh <vimal.newwork@gmail.com>
---
 drivers/mtd/Kconfig        |    7 +++++++
 drivers/mtd/tests/Makefile |    6 +++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index ecf90f5..e2e22fa 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -33,6 +33,13 @@ config MTD_TESTS
 	  should normally be compiled as kernel modules. The modules perform
 	  various checks and verifications when loaded.
 
+config MTD_NAND_TESTS
+	tristate "MTD NAND tests support"
+	depends on MTD_TESTS
+	depends on MTD_NAND || MTD_ONENAND
+	help
+	  This option enables MTD tests which require NAND Device support.
+
 config MTD_CONCAT
 	tristate "MTD concatenating support"
 	help
diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index c1d5013..919d066 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -1,7 +1,7 @@
-obj-$(CONFIG_MTD_TESTS) += mtd_oobtest.o
-obj-$(CONFIG_MTD_TESTS) += mtd_pagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_readtest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_speedtest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
-obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
 obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
+obj-$(CONFIG_MTD_NAND_TESTS) += mtd_oobtest.o
+obj-$(CONFIG_MTD_NAND_TESTS) += mtd_pagetest.o
+obj-$(CONFIG_MTD_NAND_TESTS) += mtd_subpagetest.o
-- 
1.5.4.3
