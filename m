Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MFQJ2-0008Vm-LQ
	for linux-mtd@lists.infradead.org; Sat, 13 Jun 2009 10:17:55 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 0184D667CD
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Jun 2009 10:17:28 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix order of TEST/PARTITIONS kconfig options
Date: Sat, 13 Jun 2009 06:17:14 -0400
Message-Id: <1244888234-698-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The MTD_TEST config option was added in between the MTD_PARTITIONS config
and its dependent options which causes the resulting menu system to
display incorrectly as MTD_TEST does not depend on MTD_PARTITIONS.  So
move it up a few lines where it won't cause a problem.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/Kconfig |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 7d04fb9..11d971c 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -25,6 +25,14 @@ config MTD_DEBUG_VERBOSE
 	help
 	  Determines the verbosity level of the MTD debugging messages.
 
+config MTD_TESTS
+	tristate "MTD tests support"
+	depends on m
+	help
+	  This option includes various MTD tests into compilation. The tests
+	  should normally be compiled as kernel modules. The modules perform
+	  various checks and verifications when loaded.
+
 config MTD_CONCAT
 	tristate "MTD concatenating support"
 	help
@@ -45,14 +53,6 @@ config MTD_PARTITIONS
 	  devices. Partitioning on NFTL 'devices' is a different - that's the
 	  'normal' form of partitioning used on a block device.
 
-config MTD_TESTS
-	tristate "MTD tests support"
-	depends on m
-	help
-	  This option includes various MTD tests into compilation. The tests
-	  should normally be compiled as kernel modules. The modules perform
-	  various checks and verifications when loaded.
-
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
 	depends on MTD_PARTITIONS
-- 
1.6.3.1
