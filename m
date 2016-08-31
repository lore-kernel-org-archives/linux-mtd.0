Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyB-0004si-Pn
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:03 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/46] mtd: nandsim: Add basic control file support
Date: Wed, 31 Aug 2016 09:28:13 +0200
Message-Id: <20160831072853.27822-7-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

/dev/nandsim_ctrl accept ioctl() commands such that userspace
can configure nandsim.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 66 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1eb9344..0abbc88 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -44,6 +44,9 @@
 #include <linux/pagemap.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
+#include <linux/compat.h>
+#include <linux/miscdevice.h>
+#include <linux/major.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
@@ -2226,10 +2229,41 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	return;
 }
 
-/*
- * Module initialization function
- */
-static int __init ns_init_module(void)
+static long ns_ctrl_ioctl(struct file *file, unsigned int cmd,
+			  unsigned long arg)
+{
+	if (!capable(CAP_SYS_RESOURCE))
+		return -EPERM;
+
+	return -ENOTTY;
+}
+
+#ifdef CONFIG_COMPAT
+static long ns_ctrl_compat_ioctl(struct file *file, unsigned int cmd,
+				 unsigned long arg)
+{
+	unsigned long translated_arg = (unsigned long)compat_ptr(arg);
+
+	return ns_ctrl_ioctl(file, cmd, translated_arg);
+}
+#else
+#define ns_ctrl_compat_ioctl NULL
+#endif
+
+static const struct file_operations nansim_ctrl_fops = {
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = ns_ctrl_ioctl,
+	.compat_ioctl   = ns_ctrl_compat_ioctl,
+	.llseek         = no_llseek,
+};
+
+static struct miscdevice nandsim_ctrl_cdev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "nandsim_ctrl",
+	.fops = &nansim_ctrl_fops,
+};
+
+static int __init ns_init_default(void)
 {
 	struct nand_chip *chip;
 	struct nandsim *nand;
@@ -2404,12 +2438,7 @@ error:
 	return retval;
 }
 
-module_init(ns_init_module);
-
-/*
- * Module clean-up function
- */
-static void __exit ns_cleanup_module(void)
+static void __exit ns_cleanup_default(void)
 {
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
@@ -2424,6 +2453,23 @@ static void __exit ns_cleanup_module(void)
 	free_lists();
 }
 
+static int __init ns_init_module(void)
+{
+	int ret;
+
+	ret = ns_init_default();
+	if (ret)
+		return ret;
+
+	return misc_register(&nandsim_ctrl_cdev);
+}
+module_init(ns_init_module);
+
+static void __exit ns_cleanup_module(void)
+{
+	ns_cleanup_default();
+	misc_deregister(&nandsim_ctrl_cdev);
+}
 module_exit(ns_cleanup_module);
 
 MODULE_LICENSE ("GPL");
-- 
2.8.3
