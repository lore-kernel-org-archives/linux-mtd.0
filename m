From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: add MTD tests to compilation
Date: Mon,  8 Dec 2008 14:50:21 +0200
Message-Id: <1228740621-15197-9-git-send-email-dedekind@infradead.org>
In-Reply-To: <1228740621-15197-1-git-send-email-dedekind@infradead.org>
References: <1228740621-15197-1-git-send-email-dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Add MTD tests to Kconfig and Makefiles.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/Kconfig        |    8 ++++++++
 drivers/mtd/Makefile       |    2 +-
 drivers/mtd/tests/Makefile |    7 +++++++
 3 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 drivers/mtd/tests/Makefile

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index a90d50c..8581ed9 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -45,6 +45,14 @@ config MTD_PARTITIONS
 	  devices. Partitioning on NFTL 'devices' is a different - that's the
 	  'normal' form of partitioning used on a block device.
 
+config MTD_TESTS
+	tristate "MTD tests support"
+	depends on m
+	help
+	  This option includes various MTD tests into compilation. The tests
+	  should normally be compiled as kernel modules. The modules perform
+	  various checks and verifications when loaded.
+
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
 	depends on MTD_PARTITIONS
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 4b77335..40d304d 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -29,6 +29,6 @@ obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
 
-obj-y		+= chips/ maps/ devices/ nand/ onenand/
+obj-y		+= chips/ maps/ devices/ nand/ onenand/ tests/
 
 obj-$(CONFIG_MTD_UBI)		+= ubi/
diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
new file mode 100644
index 0000000..c1d5013
--- /dev/null
+++ b/drivers/mtd/tests/Makefile
@@ -0,0 +1,7 @@
+obj-$(CONFIG_MTD_TESTS) += mtd_oobtest.o
+obj-$(CONFIG_MTD_TESTS) += mtd_pagetest.o
+obj-$(CONFIG_MTD_TESTS) += mtd_readtest.o
+obj-$(CONFIG_MTD_TESTS) += mtd_speedtest.o
+obj-$(CONFIG_MTD_TESTS) += mtd_stresstest.o
+obj-$(CONFIG_MTD_TESTS) += mtd_subpagetest.o
+obj-$(CONFIG_MTD_TESTS) += mtd_torturetest.o
-- 
1.5.4.3
