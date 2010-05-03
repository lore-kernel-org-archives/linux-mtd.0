Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O8sge-0003X4-3P
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 10:15:41 +0000
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: [PATCH 4/4] UBI: improve corrupted flash handling
Date: Mon,  3 May 2010 13:13:02 +0300
Message-Id: <1272881582-17196-5-git-send-email-Artem.Bityutskiy@nokia.com>
In-Reply-To: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
References: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch improves the way UBI handles corrupted flash, or flash
containing garbage or non-UBI data, which is the same from UBI POW.
Namely, we do the following:

* if 5% or more PEBs are corrupted, refuse the flash
* if less than 5% PEBs are corrupted, do not refuse the flash
  and format these PEBs
* if less than 8 PEBs are corrupted, format them silently, otherwise
  print a warning message.

Reported-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |  103 +++++++++++++++++++++++++++++++++++++++---------
 1 files changed, 84 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index dc5e061..c326f5b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -760,8 +760,6 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	}
 
-	si->is_empty = 0;
-
 	if (!ec_corr) {
 		int image_seq;
 
@@ -892,6 +890,87 @@ adjust_mean_ec:
 }
 
 /**
+ * check_what_we_have - check what PEB were found by scanning.
+ * @ubi: UBI device description object
+ * @si: scanning information
+ *
+ * This is a helper function which takes a look what PEBs were found by
+ * scanning, and decides whether the flash is empty and should be formatted and
+ * whether there are too many corrupted PEBs and we should not attach this
+ * MTD device. Returns zero if we should proceed with attaching the MTD device,
+ * and %-EINVAL if we should not.
+ */
+static int check_what_we_have(const struct ubi_device *ubi,
+			      struct ubi_scan_info *si)
+{
+	struct ubi_scan_leb *seb;
+	int max_corr;
+
+	max_corr = ubi->peb_count - si->bad_peb_count - si->alien_peb_count;
+	max_corr = max_corr / 20 ?: 8;
+
+	/*
+	 * Few corrupted PEBs are not a problem and may be just a result of
+	 * unclean reboots. However, many of them may indicate some problems
+	 * with the flash HW or driver.
+	 */
+	if (si->corr_peb_count >= 8) {
+		int cnt;
+
+		ubi_warn("%d PEBs are corrupted", si->corr_peb_count);
+		printk(KERN_WARNING "corrupted PEBs are:");
+		list_for_each_entry(seb, &si->corr, u.list)
+			printk(KERN_CONT " %d", seb->pnum);
+		printk(KERN_CONT "\n");
+
+		/*
+		 * If too many PEBs are corrupted, we refuse attaching,
+		 * otherwise, only print a warning.
+		 */
+		if (si->corr_peb_count >= max_corr) {
+			ubi_err("too many corrupted PEBs, refusing this device");
+			return -EINVAL;
+		}
+	}
+
+	if (si->free_peb_count + si->used_peb_count +
+	    si->alien_peb_count == 0) {
+		/* No UBI-formatted eraseblocks were found */
+		if (si->corr_peb_count == si->read_err_count &&
+		    si->corr_peb_count < 8) {
+			/* No or just few corrupted PEBs, and all of them had a
+			 * read error. We assume that those are bad PEBs, which
+			 * were just not marked as bad so far.
+			 *
+			 * This piece of code basically tries to distinguish
+			 * between the following 2 situations:
+			 *
+			 * 1. Flash is empty, but there are few bad PEBs, which
+			 *    are not marked as bad so far, and which were read
+			 *    with error. We want to go ahead and format this
+			 *    flash. While formating, the faulty PEBs will
+			 *    probably be marked as bad.
+			 *
+			 * 2. Flash contains probably contain non-UBI data
+			 *    and we do not want to format it and destroy
+			 *    possibly needed data (e.g., the bootloader MTD
+			 *    partition was accidentally fed to UBI).
+			 */
+			si->is_empty = 1;
+			ubi_msg("empty MTD device detected");
+		} else {
+			ubi_err("MTD device possibly contains non-UBI data, "
+				"refusing it");
+			return -EINVAL;
+		}
+	}
+
+	if (si->corr_peb_count >= 0)
+		ubi_msg("corrupted PEBs will be formatted");
+	return 0;
+}
+
+/**
  * ubi_scan - scan an MTD device.
  * @ubi: UBI device description object
  *
@@ -915,7 +994,6 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	INIT_LIST_HEAD(&si->erase);
 	INIT_LIST_HEAD(&si->alien);
 	si->volumes = RB_ROOT;
-	si->is_empty = 1;
 
 	err = -ENOMEM;
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
@@ -941,22 +1019,9 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	if (si->ec_count)
 		si->mean_ec = div_u64(si->ec_sum, si->ec_count);
 
-	if (si->is_empty)
-		ubi_msg("empty MTD device detected");
-
-	/*
-	 * Few corrupted PEBs are not a problem and may be just a result of
-	 * unclean reboots. However, many of them may indicate some problems
-	 * with the flash HW or driver. Print a warning in this case.
-	 */
-	if (si->corr_peb_count >= 8 ||
-	    si->corr_peb_count >= ubi->peb_count / 4) {
-		ubi_warn("%d PEBs are corrupted", si->corr_peb_count);
-		printk(KERN_WARNING "corrupted PEBs are:");
-		list_for_each_entry(seb, &si->corr, u.list)
-			printk(KERN_CONT " %d", seb->pnum);
-		printk(KERN_CONT "\n");
-	}
+	err = check_what_we_have(ubi, si);
+	if (err)
+		goto out_vidh;
 
 	/*
 	 * In case of unknown erase counter we use the mean erase counter
-- 
1.6.6.1
