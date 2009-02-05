Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVBoV-0003bZ-Du
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 21:31:11 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] MTD: add fsync capability
Date: Thu,  5 Feb 2009 22:25:51 +0100
Message-Id: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now, we can call fsync() on an mtd device.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/mtd/mtdchar.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e9ec59e..5f095bb 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -154,6 +154,20 @@ static int mtd_close(struct inode *inode, struct file *file)
 	return 0;
 } /* mtd_close */
 
+static int mtd_fsync(struct file *file, struct dentry *dentry, int datasync)
+{
+	struct mtd_file_info *mfi = file->private_data;
+	struct mtd_info *mtd = mfi->mtd;
+
+	DEBUG(MTD_DEBUG_LEVEL0, "MTD_fsync\n");
+
+	/* Only sync if opened RW */
+	if ((file->f_mode & FMODE_WRITE) && mtd->sync)
+		mtd->sync(mtd);
+
+	return 0;
+} /* mtd_fsync */
+
 /* FIXME: This _really_ needs to die. In 2.5, we should lock the
    userspace buffer down and use it directly with readv/writev.
 */
@@ -787,6 +801,7 @@ static const struct file_operations mtd_fops = {
 	.read		= mtd_read,
 	.write		= mtd_write,
 	.ioctl		= mtd_ioctl,
+	.fsync		= mtd_fsync,
 	.open		= mtd_open,
 	.release	= mtd_close,
 };
-- 
1.6.1.1
