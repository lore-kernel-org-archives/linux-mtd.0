Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Lws-0005Km-ID
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 12:05:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 goliath@sigma-star.at, alex@nextthing.co, beanhuo@micron.com,
 David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>
Subject: [PATCH 12/13] ubi: Add debugfs knob to force LEB consolidation
Date: Mon, 30 May 2016 14:04:33 +0200
Message-Id: <1464609874-15488-13-git-send-email-richard@nod.at>
In-Reply-To: <1464609874-15488-1-git-send-email-richard@nod.at>
References: <1464609874-15488-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Gstir <david@sigma-star.at>

Normally UBI only consolidates LEB when free space is running low. This debugfs
knob changes this behaviour to always consolidate LEBs when possible.

Signed-off-by: David Gstir <david@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/consolidate.c |  3 +++
 drivers/mtd/ubi/debug.c       | 10 ++++++++++
 drivers/mtd/ubi/debug.h       |  5 +++++
 drivers/mtd/ubi/ubi.h         |  4 ++++
 4 files changed, 22 insertions(+)

diff --git a/drivers/mtd/ubi/consolidate.c b/drivers/mtd/ubi/consolidate.c
index de1479d..7313be0 100644
--- a/drivers/mtd/ubi/consolidate.c
+++ b/drivers/mtd/ubi/consolidate.c
@@ -333,6 +333,9 @@ bool ubi_conso_consolidation_needed(struct ubi_device *ubi)
 	if (!consolidation_possible(ubi))
 		return false;
 
+	if (ubi_dbg_force_leb_consolidation(ubi))
+		return true;
+
 	return ubi->free_count - ubi->beb_rsvd_pebs <=
 	       ubi->consolidation_threshold;
 }
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 6178fa1..14b0ce5 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -281,6 +281,8 @@ static ssize_t dfs_file_read(struct file *file, char __user *user_buf,
 		val = d->emulate_bitflips;
 	else if (dent == d->dfs_emulate_io_failures)
 		val = d->emulate_io_failures;
+	else if (dent == d->dfs_force_leb_consolidation)
+		val = d->force_leb_consolidation;
 	else if (dent == d->dfs_emulate_power_cut) {
 		snprintf(buf, sizeof(buf), "%u\n", d->emulate_power_cut);
 		count = simple_read_from_buffer(user_buf, count, ppos,
@@ -374,6 +376,8 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 		d->emulate_bitflips = val;
 	else if (dent == d->dfs_emulate_io_failures)
 		d->emulate_io_failures = val;
+	else if (dent == d->dfs_force_leb_consolidation)
+		d->force_leb_consolidation = val;
 	else
 		count = -EINVAL;
 
@@ -480,6 +484,12 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 		goto out_remove;
 	d->dfs_power_cut_max = dent;
 
+	fname = "force_leb_consolidation";
+	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, (void *)ubi_num,
+				   &dfs_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	d->dfs_force_leb_consolidation = dent;
 	return 0;
 
 out_remove:
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index c3ed0d5..c9bace4 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -121,6 +121,11 @@ static inline int ubi_dbg_chk_fastmap(const struct ubi_device *ubi)
 	return ubi->dbg.chk_fastmap;
 }
 
+static inline int ubi_dbg_force_leb_consolidation(struct ubi_device *ubi)
+{
+	return ubi->dbg.force_leb_consolidation;
+}
+
 static inline void ubi_enable_dbg_chk_fastmap(struct ubi_device *ubi)
 {
 	ubi->dbg.chk_fastmap = 1;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 47e5219..15c8ff6 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -414,6 +414,7 @@ struct ubi_wl_entry;
  * @emulate_bitflips: emulate bit-flips for testing purposes
  * @emulate_io_failures: emulate write/erase failures for testing purposes
  * @emulate_power_cut: emulate power cut for testing purposes
+ * @force_leb_consolidation: always consolidate LEBs
  * @power_cut_counter: count down for writes left until emulated power cut
  * @power_cut_min: minimum number of writes before emulating a power cut
  * @power_cut_max: maximum number of writes until emulating a power cut
@@ -424,6 +425,7 @@ struct ubi_wl_entry;
  * @dfs_chk_fastmap: debugfs knob to enable UBI fastmap extra checks
  * @dfs_emulate_bitflips: debugfs knob to emulate bit-flips
  * @dfs_emulate_io_failures: debugfs knob to emulate write/erase failures
+ * @dfs_force_leb_consolidation: debugfs knob to enable constant LEB conso.
  * @dfs_emulate_power_cut: debugfs knob to emulate power cuts
  * @dfs_power_cut_min: debugfs knob for minimum writes before power cut
  * @dfs_power_cut_max: debugfs knob for maximum writes until power cut
@@ -435,6 +437,7 @@ struct ubi_debug_info {
 	unsigned int emulate_bitflips:1;
 	unsigned int emulate_io_failures:1;
 	unsigned int emulate_power_cut:2;
+	unsigned int force_leb_consolidation:1;
 	unsigned int power_cut_counter;
 	unsigned int power_cut_min;
 	unsigned int power_cut_max;
@@ -445,6 +448,7 @@ struct ubi_debug_info {
 	struct dentry *dfs_chk_fastmap;
 	struct dentry *dfs_emulate_bitflips;
 	struct dentry *dfs_emulate_io_failures;
+	struct dentry *dfs_force_leb_consolidation;
 	struct dentry *dfs_emulate_power_cut;
 	struct dentry *dfs_power_cut_min;
 	struct dentry *dfs_power_cut_max;
-- 
2.7.3
