From: Ben Shelton <ben.shelton@ni.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Introduce CONFIG_MTD_RESERVE_END
Date: Wed, 29 Apr 2015 14:28:02 -0500
Message-Id: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
Cc: Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jeff Westfahl <jeff.westfahl@ni.com>

Add a new config parameter CONFIG_MTD_RESERVE_END. This is used with
command line partition parsing to reserve space at the end of a
partition defined with a size of '-', which indicates it should use all
remaining space.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
---
 drivers/mtd/Kconfig       | 24 ++++++++++++++++++++++++
 drivers/mtd/cmdlinepart.c |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index a03ad29..f7df08c 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -110,6 +110,30 @@ config MTD_CMDLINE_PARTS
 
 	  If unsure, say 'N'.
 
+config MTD_RESERVE_END
+	int "Reserved space at the end of an all remaining space partition"
+	depends on MTD_CMDLINE_PARTS = "y"
+	default 0
+	---help---
+	  Specify an amount of reserved space at the end of the last MTD
+	  partition when the size is specified with '-' to denote all
+	  remaining space.
+
+	  This can be useful if, for example, the BBT is stored at the end
+	  of the flash, and you don't want those blocks counted as part of
+	  the last MTD partition. This is less heavyweight than reserving
+	  the BBT blocks with a separate MTD partition. The BBT marks its
+	  own blocks as bad blocks, which prevents an MTD driver such as
+	  UBI from getting an accurate count of the actual bad blocks in
+	  the MTD partition that contains the BBT.
+
+	  The value is specified in bytes. As an example, a typical BBT
+	  reserves four erase blocks, and a typical erase block size is
+	  128kB. To reserve that much space at the end of the flash, the
+	  value for this config option would be 524288.
+
+	  If unsure, use the default value of zero.
+
 config MTD_AFS_PARTS
 	tristate "ARM Firmware Suite partition parsing"
 	depends on ARM
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index c850300..9b83c1a 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -340,7 +340,8 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			offset = part->parts[i].offset;
 
 		if (part->parts[i].size == SIZE_REMAINING)
-			part->parts[i].size = master->size - offset;
+			part->parts[i].size = master->size - offset -
+					      CONFIG_MTD_RESERVE_END;
 
 		if (offset + part->parts[i].size > master->size) {
 			printk(KERN_WARNING ERRP
-- 
2.3.7
