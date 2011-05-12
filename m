Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVv5-000297-2a
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:27:11 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so1274214wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:27:10 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 1/7] mtd: always build partitioning support
Date: Thu, 12 May 2011 14:26:52 +0100
Message-Id: <1305206818-31752-2-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are very few situations where MTD partitioning is not required,
and the benefit in code size reduction by making this configurable does
not warrant the level of ifdeffery needed.
---
 drivers/mtd/Kconfig     |   17 ++---------------
 drivers/mtd/Makefile    |    3 +--
 include/linux/mtd/mtd.h |    8 --------
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index b4567c3..7df4eec 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -34,18 +34,7 @@ config MTD_TESTS
 	  various checks and verifications when loaded.
 
 config MTD_PARTITIONS
-	bool "MTD partitioning support"
-	help
-	  If you have a device which needs to divide its flash chip(s) up
-	  into multiple 'partitions', each of which appears to the user as
-	  a separate MTD device, you require this option to be enabled. If
-	  unsure, say 'Y'.
-
-	  Note, however, that you don't need this option for the DiskOnChip
-	  devices. Partitioning on NFTL 'devices' is a different - that's the
-	  'normal' form of partitioning used on a block device.
-
-if MTD_PARTITIONS
+	bool
 
 config MTD_REDBOOT_PARTS
 	tristate "RedBoot partition table parsing"
@@ -99,7 +88,7 @@ endif # MTD_REDBOOT_PARTS
 
 config MTD_CMDLINE_PARTS
 	bool "Command line partition table parsing"
-	depends on MTD_PARTITIONS = "y" && MTD = "y"
+	depends on MTD = "y"
 	---help---
 	  Allow generic configuration of the MTD partition tables via the kernel
 	  command line. Multiple flash resources are supported for hardware where
@@ -164,8 +153,6 @@ config MTD_AR7_PARTS
 	---help---
 	  TI AR7 partitioning support
 
-endif # MTD_PARTITIONS
-
 comment "User Modules And Translation Layers"
 
 config MTD_CHAR
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index d578095..39664c4 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -4,8 +4,7 @@
 
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
-mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o
-mtd-$(CONFIG_MTD_PARTITIONS)	+= mtdpart.o
+mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o
 mtd-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
 
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9d5306b..7a74942 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -348,15 +348,7 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
-#ifdef CONFIG_MTD_PARTITIONS
 void mtd_erase_callback(struct erase_info *instr);
-#else
-static inline void mtd_erase_callback(struct erase_info *instr)
-{
-	if (instr->callback)
-		instr->callback(instr);
-}
-#endif
 
 /*
  * Debugging macro and defines
-- 
1.7.4.4
