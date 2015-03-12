Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW6hr-0002U7-2I
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 17:15:36 +0000
Received: by igdh15 with SMTP id h15so18021632igd.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 10:15:11 -0700 (PDT)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: computersforpeace@gmail.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: part: Create the master device node when
 partitioned
Date: Thu, 12 Mar 2015 10:15:06 -0700
Message-Id: <1426180507-23889-1-git-send-email-dehrenberg@chromium.org>
Cc: gwendal@chromium.org, dbrownell@users.sourceforge.net,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For many use cases, it helps to have a device node for the entire
MTD device as well as device nodes for the individual partitions.
For example, this allows querying the entire device's properties.
A common idiom is to create an additional partition which spans
over the whole device.

This patch makes a config option, CONFIG_MTD_PARTITIONED_MASTER,
which makes the master partition present even when the device is
partitioned. This isn't turned on by default since it presents
a backwards-incompatible device numbering.

The patch also makes the parent of a partition device be the master,
if the config flag is set, now that the master is a full device.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/Kconfig   | 13 +++++++++++++
 drivers/mtd/mtdcore.c | 14 ++++++++++++--
 drivers/mtd/mtdpart.c | 21 +++++++++++++++------
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 71fea89..a03ad29 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -309,6 +309,19 @@ config MTD_SWAP
 	  The driver provides wear leveling by storing erase counter into the
 	  OOB.
 
+config MTD_PARTITIONED_MASTER
+	bool "Retain master device when partitioned"
+	default n
+	depends on MTD
+	help
+	  For historical reasons, by default, either a master is present or
+	  several partitions are present, but not both. The concern was that
+	  data listed in multiple partitions was dangerous; however, SCSI does
+	  this and it is frequently useful for applications. This config option
+	  leaves the master in even if the device is partitioned. It also makes
+	  the parent of the partition device be the master device, rather than
+	  what lies behind the master.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 11883bd..8a36f2b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -523,7 +523,8 @@ out_error:
  *   found this functions tries to fallback to information specified in
  *   @parts/@nr_parts.
  * * If any partitioning info was found, this function registers the found
- *   partitions.
+ *   partitions. If the MTD_PARTITIONED_MASTER option is set, then the device
+ *   as a whole is registered first.
  * * If no partitions were found this function just registers the MTD device
  *   @mtd and exits.
  *
@@ -548,7 +549,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 
 	if (err > 0) {
-		err = add_mtd_partitions(mtd, real_parts, err);
+		int nbparts = err;
+#ifdef CONFIG_MTD_PARTITIONED_MASTER
+		err = add_mtd_device(mtd);
+		if (err == 1) {
+			err = -ENODEV;
+			goto out;
+		}
+#endif
+		err = add_mtd_partitions(mtd, real_parts, nbparts);
 		kfree(real_parts);
 	} else if (err == 0) {
 		err = add_mtd_device(mtd);
@@ -569,6 +578,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
+out:
 	return err;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index e779de3..1799d18 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -379,10 +379,19 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.name = name;
 	slave->mtd.owner = master->owner;
 
-	/* NOTE:  we don't arrange MTDs as a tree; it'd be error-prone
-	 * to have the same data be in two different partitions.
-	 */
-	slave->mtd.dev.parent = master->dev.parent;
+	/* NOTE: Historically, we didn't arrange MTDs as a tree out of
+	 * concern for showing the same data in multiple partitions.
+	 * However, it is very useful to have the master node present,
+	 * so the MTD_PARTITIONED_MASTER option allows that. The master
+	 * will have device nodes etc only if this is set, so make the
+	 * parent conditional on that option. Note, this is a way to
+	 * distinguish between the master and the partition in sysfs.
+ 	 */
+#ifdef CONFIG_MTD_PARTITIONED_MASTER
+	slave->mtd.dev.parent = &master->dev;
+#else
+ 	slave->mtd.dev.parent = master->dev.parent;
+#endif
 
 	slave->mtd._read = part_read;
 	slave->mtd._write = part_write;
@@ -631,8 +640,8 @@ EXPORT_SYMBOL_GPL(mtd_del_partition);
  * and registers slave MTD objects which are bound to the master according to
  * the partition definitions.
  *
- * We don't register the master, or expect the caller to have done so,
- * for reasons of data integrity.
+ * For historical reasons, this function's caller only registers the master
+ * if the MTD_PARTITIONED_MASTER config option is set.
  */
 
 int add_mtd_partitions(struct mtd_info *master,
-- 
2.2.0.rc0.207.ga3a616c
