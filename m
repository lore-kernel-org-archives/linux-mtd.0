Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVJF5-0003Rs-V2
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 14:03:27 +0000
From: Sandeep Jain <Sandeep_Jain@mentor.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Steve
 Longerbeam <steve_longerbeam@mentor.com>, Jim Baxter <jim_baxter@mentor.com>,
 Sandeep Jain <Sandeep_Jain@mentor.com>
Subject: [PATCH] mtd: Allocate bdi objects dynamically
Date: Thu, 4 Aug 2016 19:31:15 +0530
Message-ID: <1470319275-9465-1-git-send-email-Sandeep_Jain@mentor.com>
In-Reply-To: <Sandeep Jain <Sandeep_Jain@mentor.com>
References: <Sandeep Jain <Sandeep_Jain@mentor.com>
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

From: Steve Longerbeam <steve_longerbeam@mentor.com>

The MTD backing dev info objects mtd_bdi was statically allocated.
So when MTD is built as a loadable module, this object fall in the
vmalloc address space.

The problem with that, is that the BDI APIs use wake_up_bit(), which calls
virt_to_page() to retrieve the memory zone of the page containing the
wait_queue to wake up, and virt_to_page() is not valid for vmalloc or
highmem addresses.

Fix this by allocating the BDI objects dynamically with kmalloc. The
objects now fall in the logical address space so that BDI APIs will
work in all cases (mtd builtin or module).

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
Signed-off-by: Jim Baxter <jim_baxter@mentor.com>
Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>
---
 drivers/mtd/mtdcore.c |   30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e3936b8..9015b94 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -47,8 +47,7 @@
 
 #include "mtdcore.h"
 
-static struct backing_dev_info mtd_bdi = {
-};
+static struct backing_dev_info *mtd_bdi;
 
 #ifdef CONFIG_PM_SLEEP
 
@@ -397,7 +396,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (WARN_ONCE(mtd->backing_dev_info, "MTD already registered\n"))
 		return -EEXIST;
 
-	mtd->backing_dev_info = &mtd_bdi;
+	mtd->backing_dev_info = mtd_bdi;
 
 	BUG_ON(mtd->writesize == 0);
 	mutex_lock(&mtd_table_mutex);
@@ -1668,18 +1667,20 @@ static const struct file_operations mtd_proc_ops = {
 /*====================================================================*/
 /* Init code */
 
-static int __init mtd_bdi_init(struct backing_dev_info *bdi, const char *name)
+static struct backing_dev_info * __init mtd_bdi_init(char *name)
 {
+	struct backing_dev_info *bdi;
 	int ret;
 
-	ret = bdi_init(bdi);
-	if (!ret)
-		ret = bdi_register(bdi, NULL, "%s", name);
+	bdi = kzalloc(sizeof(*bdi), GFP_KERNEL);
+	if (!bdi)
+		return ERR_PTR(-ENOMEM);
 
+	ret = bdi_setup_and_register(bdi, name);
 	if (ret)
-		bdi_destroy(bdi);
+		kfree(bdi);
 
-	return ret;
+	return ret ? ERR_PTR(ret) : bdi;
 }
 
 static struct proc_dir_entry *proc_mtd;
@@ -1692,9 +1693,11 @@ static int __init init_mtd(void)
 	if (ret)
 		goto err_reg;
 
-	ret = mtd_bdi_init(&mtd_bdi, "mtd");
-	if (ret)
+	mtd_bdi = mtd_bdi_init("mtd");
+	if (IS_ERR(mtd_bdi)) {
+		ret = PTR_ERR(mtd_bdi);
 		goto err_bdi;
+	}
 
 	proc_mtd = proc_create("mtd", 0, NULL, &mtd_proc_ops);
 
@@ -1707,6 +1710,8 @@ static int __init init_mtd(void)
 out_procfs:
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
+	bdi_destroy(mtd_bdi);
+	kfree(mtd_bdi);
 err_bdi:
 	class_unregister(&mtd_class);
 err_reg:
@@ -1720,7 +1725,8 @@ static void __exit cleanup_mtd(void)
 	if (proc_mtd)
 		remove_proc_entry("mtd", NULL);
 	class_unregister(&mtd_class);
-	bdi_destroy(&mtd_bdi);
+	bdi_destroy(mtd_bdi);
+	kfree(mtd_bdi);
 	idr_destroy(&mtd_idr);
 }
 
-- 
1.7.9.5
