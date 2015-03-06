Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU0dZ-00021p-Jo
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 22:22:30 +0000
Received: by igbhn18 with SMTP id hn18so7669939igb.2
 for <linux-mtd@lists.infradead.org>; Fri, 06 Mar 2015 14:22:07 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: linux-mtd@lists.infradead.org, richard.weinberger@gmail.com,
 ezequiel.garcia@imgtec.com, computersforpeace@gmail.com
Subject: [PATCH] mtd: part: Create the master device node when partitioned
Date: Fri,  6 Mar 2015 14:22:02 -0800
Message-Id: <1425680522-7898-1-git-send-email-dehrenberg@chromium.org>
Cc: namnguyen@chromium.org, gwendal@chromium.org,
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

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/Kconfig   |  9 +++++++++
 drivers/mtd/mtdcore.c | 11 ++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 71fea89..92d4bc7 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -309,6 +309,15 @@ config MTD_SWAP
 	  The driver provides wear leveling by storing erase counter into the
 	  OOB.
 
+config MTD_PARTITIONED_MASTER
+	bool "Retain master device when partitioned"
+	default n
+	depends on MTD
+	help
+	  Ordinarily, either a master is present or several partitions
+	  are present. This config option leaves the master in even if
+	  the device is partitioned.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 11883bd..c7c1245 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -548,7 +548,15 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
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
@@ -569,6 +577,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
+out:
 	return err;
 }
 EXPORT_SYMBOL_GPL(mtd_device_parse_register);
-- 
2.2.0.rc0.207.ga3a616c
