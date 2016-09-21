Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeBn-0001gc-1X
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:51:59 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 21/46] mtd: nandsim: Implement preliminary destructor
 function
Date: Wed, 21 Sep 2016 11:51:13 +0200
Message-Id: <356f6bc6e887873e0011722a67a9436779013084.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

This function will be used via ioctl() to remove nandsim instances.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c  | 81 +++++++++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/nandsim.h |  2 +-
 2 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 344f5c4..bac3fde 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -39,6 +39,7 @@
 #include <linux/mtd/nandsim.h>
 #include <linux/delay.h>
 #include <linux/list.h>
+#include <linux/spinlock.h>
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/fs.h>
@@ -328,7 +329,10 @@ struct ns_file_data {
  */
 struct nandsim {
 	unsigned int index;
+	unsigned int refcnt;
+	spinlock_t refcnt_lock;
 	struct mtd_partition partitions[CONFIG_NANDSIM_MAX_PARTS];
+	bool destroying;
 	unsigned int nbparts;
 
 	uint busw;              /* flash chip bus width (8 or 16) */
@@ -2509,6 +2513,41 @@ static int ns_ctrl_new_instance(struct ns_new_instance_req *req)
 	return ns->index;
 }
 
+static int ns_ctrl_destroy_instance(struct ns_destroy_instance_req *req)
+{
+	struct mtd_info *nsmtd;
+	int id = req->id, ret = 0;
+	struct nand_chip *chip;
+	struct nandsim *ns;
+
+	if (id < 0 || id >= NS_MAX_DEVICES)
+		return -EINVAL;
+
+	mutex_lock(&ns_mtd_mutex);
+	nsmtd = ns_mtds[id];
+	if (nsmtd) {
+		chip = mtd_to_nand(nsmtd);
+		ns = nand_get_controller_data(chip);
+		spin_lock(&ns->refcnt_lock);
+		if (ns->refcnt > 0) {
+			ret = -EBUSY;
+			spin_unlock(&ns->refcnt_lock);
+			goto out;
+		}
+		ns->destroying = true;
+		spin_unlock(&ns->refcnt_lock);
+		ret = ns_destroy_instance(nsmtd);
+		if (ret)
+			goto out;
+		ns_mtds[id] = NULL;
+	}
+
+out:
+	mutex_unlock(&ns_mtd_mutex);
+
+	return ret;
+}
+
 static long ns_ctrl_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -2543,6 +2582,32 @@ static struct miscdevice nandsim_ctrl_cdev = {
 	.fops = &nansim_ctrl_fops,
 };
 
+static void ns_put_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
+
+	spin_lock(&ns->refcnt_lock);
+	ns->refcnt -= 1;
+	spin_unlock(&ns->refcnt_lock);
+}
+
+static int ns_get_device(struct mtd_info *mtd)
+{
+	int ret = 0;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nandsim *ns = nand_get_controller_data(chip);
+
+	spin_lock(&ns->refcnt_lock);
+	if (ns->destroying)
+		ret = -EBUSY;
+	else
+		ns->refcnt += 1;
+	spin_unlock(&ns->refcnt_lock);
+
+	return ret;
+}
+
 struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 {
 	struct nand_chip *chip;
@@ -2587,6 +2652,7 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	INIT_LIST_HEAD(&nand->grave_pages);
 	INIT_LIST_HEAD(&nand->weak_pages);
 	INIT_LIST_HEAD(&nand->weak_blocks);
+	spin_lock_init(&nand->refcnt_lock);
 
 	/*
 	 * Register simulator's callbacks.
@@ -2637,6 +2703,8 @@ struct mtd_info *ns_new_instance(struct nandsim_params *nsparam)
 	}
 
 	nsmtd->owner = THIS_MODULE;
+	nsmtd->_get_device = ns_get_device;
+	nsmtd->_put_device = ns_put_device;
 
 	if ((retval = parse_weakblocks(nand, nsparam->weakblocks)) != 0)
 		goto error;
@@ -2750,11 +2818,16 @@ error:
 }
 EXPORT_SYMBOL_GPL(ns_new_instance);
 
-void ns_destroy_instance(struct mtd_info *nsmtd)
+int ns_destroy_instance(struct mtd_info *nsmtd)
 {
+	int i, ret;
 	struct nand_chip *chip = mtd_to_nand(nsmtd);
 	struct nandsim *ns = nand_get_controller_data(chip);
-	int i;
+
+	ret = mtd_device_unregister(nsmtd);
+	if (ret)
+		return ret;
+	nand_cleanup(nsmtd);
 
 	nandsim_debugfs_remove(ns);
 	free_lists(ns);
@@ -2763,6 +2836,8 @@ void ns_destroy_instance(struct mtd_info *nsmtd)
 	for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
 		kfree(ns->partitions[i].name);
 	kfree(mtd_to_nand(nsmtd));        /* Free other structures */
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(ns_destroy_instance);
 
@@ -2773,7 +2848,7 @@ static void ns_destroy_all(void)
 	mutex_lock(&ns_mtd_mutex);
 	for (i = 0; i < NS_MAX_DEVICES; i++)
 		if (ns_mtds[i])
-			ns_destroy_instance(ns_mtds[i]);
+			WARN_ON(ns_destroy_instance(ns_mtds[i]) != 0);
 	mutex_unlock(&ns_mtd_mutex);
 }
 
diff --git a/include/linux/mtd/nandsim.h b/include/linux/mtd/nandsim.h
index 6e3b4a2..a0ca0fb 100644
--- a/include/linux/mtd/nandsim.h
+++ b/include/linux/mtd/nandsim.h
@@ -75,7 +75,7 @@ struct ns_backend_ops {
 };
 
 struct mtd_info *ns_new_instance(struct nandsim_params *nsparam);
-void ns_destroy_instance(struct mtd_info *nsmtd);
+int ns_destroy_instance(struct mtd_info *nsmtd);
 struct nandsim_geom *nandsim_get_geom(struct nandsim *ns);
 struct nandsim_regs *nandsim_get_regs(struct nandsim *ns);
 void nandsim_set_backend_data(struct nandsim *ns, void *data);
-- 
2.8.3
