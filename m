Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwAIm-00047I-Ny
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 15:58:14 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <dedekind1@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] UBI: add debugfs file for tracking PEB state
Date: Mon, 17 Oct 2016 10:57:22 -0500
Message-ID: <1476719842-28642-1-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ben Shelton <ben.shelton@ni.com>

Add a file under debugfs to allow easy access to the erase count for
each physical erase block on an UBI device.  This is useful when
debugging data integrity issues with UBIFS on NAND flash devices.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Signed-off-by: Zach Brown <zach.brown@ni.com>
---
 drivers/mtd/ubi/debug.c | 151 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index f101a49..6086822 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -22,6 +22,7 @@
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
 #include <linux/module.h>
+#include <linux/seq_file.h>
 
 
 /**
@@ -386,7 +387,9 @@ out:
 	return count;
 }
 
-/* File operations for all UBI debugfs files */
+/* File operations for all UBI debugfs files except
+ * detailed_erase_block_info
+ */
 static const struct file_operations dfs_fops = {
 	.read   = dfs_file_read,
 	.write  = dfs_file_write,
@@ -395,6 +398,146 @@ static const struct file_operations dfs_fops = {
 	.owner  = THIS_MODULE,
 };
 
+/* As long as the position is less then that total number of erase blocks,
+ * we still have more to print.
+ */
+static void *eraseblk_count_seq_start(struct seq_file *s, loff_t *pos)
+{
+	struct ubi_device *ubi = s->private;
+
+	if (*pos == 0)
+		return SEQ_START_TOKEN;
+
+	if (*pos < ubi->peb_count)
+		return pos;
+
+	return NULL;
+}
+
+/* Since we are using the position as the iterator, we just need to check if we
+ * are done and increment the position.
+ */
+static void *eraseblk_count_seq_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct ubi_device *ubi = s->private;
+
+	if (v == SEQ_START_TOKEN)
+		return pos;
+	(*pos)++;
+
+	if (*pos < ubi->peb_count)
+		return pos;
+
+	return NULL;
+}
+
+static void eraseblk_count_seq_stop(struct seq_file *s, void *v)
+{
+}
+
+enum block_status {
+	BLOCK_STATUS_OK,
+	BLOCK_STATUS_BAD_BLOCK,
+	BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX
+};
+
+static char const *block_status_names[] = {"OK", "marked_bad",
+					   "erase_count_beyond_max"};
+
+enum read_status {
+	READ_STATUS_OK,
+	READ_STATUS_ERR_READING_BLOCK,
+};
+
+static char const *read_status_names[] = {"OK", "err_reading_block"};
+
+static int eraseblk_count_seq_show(struct seq_file *s, void *iter)
+{
+	struct ubi_device *ubi = s->private;
+	struct ubi_wl_entry *wl;
+	int *block_number = iter;
+	int erase_count = -1;
+	enum block_status b_sts = BLOCK_STATUS_OK;
+	enum read_status r_sts = READ_STATUS_OK;
+	int err;
+
+	/* If this is the start, print a header */
+	if (iter == SEQ_START_TOKEN) {
+		seq_puts(s,
+			 "physical_block_number\terase_count\tblock_status\tread_status\n");
+		return 0;
+	}
+
+	err = ubi_io_is_bad(ubi, *block_number);
+	if (err) {
+		if (err < 0)
+			r_sts = READ_STATUS_ERR_READING_BLOCK;
+		else
+			b_sts = BLOCK_STATUS_BAD_BLOCK;
+	} else {
+		spin_lock(&ubi->wl_lock);
+
+		wl = ubi->lookuptbl[*block_number];
+		if (wl)
+			erase_count = wl->ec;
+		else
+			r_sts = READ_STATUS_ERR_READING_BLOCK;
+
+		spin_unlock(&ubi->wl_lock);
+
+		if (erase_count > UBI_MAX_ERASECOUNTER)
+			b_sts = BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX;
+	}
+
+	seq_printf(s, "%-22d\t%-11d\t%-12s\t%-12s\n", *block_number,
+		   erase_count, block_status_names[b_sts],
+		   read_status_names[r_sts]);
+	return 0;
+}
+
+static const struct seq_operations eraseblk_count_seq_ops = {
+	.start = eraseblk_count_seq_start,
+	.next = eraseblk_count_seq_next,
+	.stop = eraseblk_count_seq_stop,
+	.show = eraseblk_count_seq_show
+};
+
+static int eraseblk_count_open(struct inode *inode, struct file *f)
+{
+	struct seq_file *s;
+	int err;
+
+	err = seq_open(f, &eraseblk_count_seq_ops);
+	if (err)
+		return err;
+
+	s = f->private_data;
+	s->private = ubi_get_device((unsigned long)inode->i_private);
+
+	if (!s->private)
+		return -ENODEV;
+	else
+		return 0;
+}
+
+static int eraseblk_count_release(struct inode *inode, struct file *f)
+{
+	struct seq_file *s = f->private_data;
+	struct ubi_device *ubi = s->private;
+
+	ubi_put_device(ubi);
+
+	return seq_release(inode, f);
+}
+
+static const struct file_operations eraseblk_count_fops = {
+	.owner = THIS_MODULE,
+	.open = eraseblk_count_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = eraseblk_count_release,
+};
+
 /**
  * ubi_debugfs_init_dev - initialize debugfs for an UBI device.
  * @ubi: UBI device description object
@@ -491,6 +634,12 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 		goto out_remove;
 	d->dfs_power_cut_max = dent;
 
+	fname = "detailed_erase_block_info";
+	dent = debugfs_create_file(fname, S_IRUSR, d->dfs_dir, (void *)ubi_num,
+				   &eraseblk_count_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+
 	return 0;
 
 out_remove:
-- 
2.7.4
