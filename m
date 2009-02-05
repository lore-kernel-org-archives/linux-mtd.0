Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVBoV-0003ba-Dj
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 21:31:11 +0000
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] UBI: add fsync capability
Date: Thu,  5 Feb 2009 22:25:52 +0100
Message-Id: <1233869152-23992-2-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
References: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now, we can call fsync() on an UBI volume.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/mtd/ubi/cdev.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f9631eb..9e2a108 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -186,6 +186,17 @@ static loff_t vol_cdev_llseek(struct file *file, loff_t offset, int origin)
 	return new_offset;
 }
 
+static int vol_cdev_fsync(struct file *file, struct dentry *dentry,
+			  int datasync)
+{
+	struct ubi_volume_desc *desc = file->private_data;
+	struct ubi_volume *vol = desc->vol;
+	struct ubi_device *ubi = vol->ubi;
+
+	return ubi_sync(ubi->ubi_num);
+}
+
+
 static ssize_t vol_cdev_read(struct file *file, __user char *buf, size_t count,
 			     loff_t *offp)
 {
@@ -1053,6 +1064,7 @@ const struct file_operations ubi_vol_cdev_operations = {
 	.llseek         = vol_cdev_llseek,
 	.read           = vol_cdev_read,
 	.write          = vol_cdev_write,
+	.fsync		= vol_cdev_fsync,
 	.unlocked_ioctl = vol_cdev_ioctl,
 	.compat_ioctl   = vol_cdev_compat_ioctl,
 };
-- 
1.6.1.1
