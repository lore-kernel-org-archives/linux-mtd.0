Received: from sovereign.computergmbh.de ([85.214.69.204])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHPH4-0003FT-Rb
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 19:59:17 +0000
Date: Tue, 22 Jan 2008 20:49:41 +0100 (CET)
From: Jan Engelhardt <jengelh@computergmbh.de>
To: David Woohouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD]: constify function pointer tables
In-Reply-To: <54038cd4f87a03884e4f59f8f3697889dfb63c54.1201030614.git.jengelh@computergmbh.de>
Message-ID: <Pine.LNX.4.64.0801222048520.5722@fbirervta.pbzchgretzou.qr>
References: <54038cd4f87a03884e4f59f8f3697889dfb63c54.1201030614.git.jengelh@computergmbh.de>
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

Signed-off-by: Jan Engelhardt <jengelh@computergmbh.de>
---
 drivers/mtd/ubi/cdev.c |    4 ++--
 drivers/mtd/ubi/ubi.h  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index fe4da1e..05ed76f 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -683,14 +683,14 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 }
 
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
index 5e941a6..3a8ab61 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -361,8 +361,8 @@ struct ubi_device {
 #endif
 };
 
-extern struct file_operations ubi_cdev_operations;
-extern struct file_operations ubi_vol_cdev_operations;
+extern const struct file_operations ubi_cdev_operations;
+extern const struct file_operations ubi_vol_cdev_operations;
 extern struct class *ubi_class;
 
 /* vtbl.c */
-- 
1.5.3.4
