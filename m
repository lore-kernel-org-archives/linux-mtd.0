Received: from sovereign.computergmbh.de ([85.214.69.204])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LM9Db-0005l4-5Y
	for linux-mtd@lists.infradead.org; Sun, 11 Jan 2009 22:55:55 +0000
Date: Sun, 11 Jan 2009 23:55:39 +0100 (CET)
From: Jan Engelhardt <jengelh@medozas.de>
Sender: jengelh@sovereign.computergmbh.de
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: mtd: constify VFTs
Message-ID: <alpine.LSU.2.00.0901112354590.20643@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

parent 9850cd2553595f0efa726b0ba45e7b47def8ded2 (v2.6.29-rc1-8-g9850cd2)
commit 1b4a88617720bf38c46614bf9308ccbb150979bb
Author: Jan Engelhardt <jengelh@medozas.de>
Date:   Sun Jan 11 23:55:02 2009 +0100

mtd: constify VFTs

Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
---
 drivers/mtd/ubi/cdev.c |    6 +++---
 drivers/mtd/ubi/ubi.h  |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 98cf31e..56001c8 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -987,20 +987,20 @@ static int ctrl_cdev_ioctl(struct inode *inode, struct file *file,
 }
 
 /* UBI control character device operations */
-struct file_operations ubi_ctrl_cdev_operations = {
+const struct file_operations ubi_ctrl_cdev_operations = {
 	.ioctl = ctrl_cdev_ioctl,
 	.owner = THIS_MODULE,
 };
 
 /* UBI character device operations */
-struct file_operations ubi_cdev_operations = {
+const struct file_operations ubi_cdev_operations = {
 	.owner = THIS_MODULE,
 	.ioctl = ubi_cdev_ioctl,
 	.llseek = no_llseek,
 };
 
 /* UBI volume character device operations */
-struct file_operations ubi_vol_cdev_operations = {
+const struct file_operations ubi_vol_cdev_operations = {
 	.owner   = THIS_MODULE,
 	.open    = vol_cdev_open,
 	.release = vol_cdev_release,
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 4a8ec48..381f0e1 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -449,9 +449,9 @@ struct ubi_device {
 };
 
 extern struct kmem_cache *ubi_wl_entry_slab;
-extern struct file_operations ubi_ctrl_cdev_operations;
-extern struct file_operations ubi_cdev_operations;
-extern struct file_operations ubi_vol_cdev_operations;
+extern const struct file_operations ubi_ctrl_cdev_operations;
+extern const struct file_operations ubi_cdev_operations;
+extern const struct file_operations ubi_vol_cdev_operations;
 extern struct class *ubi_class;
 extern struct mutex ubi_devices_mutex;
 
-- 
# Created with git-export-patch
