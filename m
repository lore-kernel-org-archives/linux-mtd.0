Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBEk7-0004ho-UM
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 03:35:40 +0000
Received: by mail-ie0-f169.google.com with SMTP id y20so6739149ier.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 19:35:17 -0800 (PST)
Sender: Daniel Ehrenberg <dehrenberg@google.com>
From: Dan Ehrenberg <dehrenberg@chromium.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
Date: Tue, 13 Jan 2015 19:34:58 -0800
Message-Id: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
Cc: grundler@chromium.org, gwendal@chromium.org, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each partition on a device with bad blocks iterates over its erase
blocks to find an accurate count of bad blocks. The iteration can take
some time, especially on devices with many erase blocks which are
configured to use the OOB area to detect if the block is bad. This
patch makes a config option, MTD_PART_BAD_BLOCK_COUNT, which can
be turned off to skip the initial scan and forgo an accurate count.

Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
---
 drivers/mtd/Kconfig   | 9 +++++++++
 drivers/mtd/mtdpart.c | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 94b8210..cc5678f 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -309,6 +309,15 @@ config MTD_SWAP
 	  The driver provides wear leveling by storing erase counter into the
 	  OOB.
 
+config MTD_PART_BAD_BLOCK_COUNT
+	bool "Accurate bad block count for partitions"
+	default y
+	help
+	  Maintain an accurate count of bad blocks within the partition.
+	  With this option turned off, the bad block count might be
+	  inaccurate, avoiding a scan in partition initialization in
+	  order to improve boot performance on some systems.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a3e3a7d..aba0d6c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -531,6 +531,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 	slave->mtd.ecc_strength = master->ecc_strength;
 	slave->mtd.bitflip_threshold = master->bitflip_threshold;
 
+#ifdef CONFIG_MTD_PART_BAD_BLOCK_COUNT
 	if (master->_block_isbad) {
 		uint64_t offs = 0;
 
@@ -542,6 +543,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
 			offs += slave->mtd.erasesize;
 		}
 	}
+#endif
 
 out_register:
 	return slave;
-- 
2.2.0.rc0.207.ga3a616c
