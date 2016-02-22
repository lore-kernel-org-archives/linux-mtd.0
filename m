Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXyKV-0003WB-AB
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 21:47:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: Fix early logging
Date: Mon, 22 Feb 2016 22:47:11 +0100
Message-Id: <1456177631-12667-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We must not use ubi_* log functions before the ubi_device
struct is initialized.
And while we are here, define a sane pr_fmt and add new lines to
existing pr_* calls.

Fixes: 32608703 ("UBI: Extend UBI layer debug/messaging capabilities")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 24 ++++++++++++------------
 drivers/mtd/ubi/ubi.h   |  3 +++
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 59e1384..4945db4 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -876,7 +876,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	for (i = 0; i < UBI_MAX_DEVICES; i++) {
 		ubi = ubi_devices[i];
 		if (ubi && mtd->index == ubi->mtd->index) {
-			ubi_err(ubi, "mtd%d is already attached to ubi%d",
+			pr_err("mtd%d is already attached to ubi%d\n",
 				mtd->index, i);
 			return -EEXIST;
 		}
@@ -891,7 +891,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	 * no sense to attach emulated MTD devices, so we prohibit this.
 	 */
 	if (mtd->type == MTD_UBIVOLUME) {
-		ubi_err(ubi, "refuse attaching mtd%d - it is already emulated on top of UBI",
+		pr_err("refuse attaching mtd%d - it is already emulated on top of UBI\n",
 			mtd->index);
 		return -EINVAL;
 	}
@@ -902,7 +902,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 			if (!ubi_devices[ubi_num])
 				break;
 		if (ubi_num == UBI_MAX_DEVICES) {
-			ubi_err(ubi, "only %d UBI devices may be created",
+			pr_err("only %d UBI devices may be created\n",
 				UBI_MAX_DEVICES);
 			return -ENFILE;
 		}
@@ -912,7 +912,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 		/* Make sure ubi_num is not busy */
 		if (ubi_devices[ubi_num]) {
-			ubi_err(ubi, "already exists");
+			pr_err("already exists\n");
 			return -EEXIST;
 		}
 	}
@@ -1220,7 +1220,7 @@ static int __init ubi_init(void)
 	BUILD_BUG_ON(sizeof(struct ubi_vid_hdr) != 64);
 
 	if (mtd_devs > UBI_MAX_DEVICES) {
-		pr_err("UBI error: too many MTD devices, maximum is %d",
+		pr_err("UBI error: too many MTD devices, maximum is %d\n",
 		       UBI_MAX_DEVICES);
 		return -EINVAL;
 	}
@@ -1232,7 +1232,7 @@ static int __init ubi_init(void)
 
 	err = misc_register(&ubi_ctrl_cdev);
 	if (err) {
-		pr_err("UBI error: cannot register device");
+		pr_err("UBI error: cannot register device\n");
 		goto out;
 	}
 
@@ -1259,7 +1259,7 @@ static int __init ubi_init(void)
 		mtd = open_mtd_device(p->name);
 		if (IS_ERR(mtd)) {
 			err = PTR_ERR(mtd);
-			pr_err("UBI error: cannot open mtd %s, error %d",
+			pr_err("UBI error: cannot open mtd %s, error %d\n",
 			       p->name, err);
 			/* See comment below re-ubi_is_module(). */
 			if (ubi_is_module())
@@ -1272,7 +1272,7 @@ static int __init ubi_init(void)
 					 p->vid_hdr_offs, p->max_beb_per1024);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
-			pr_err("UBI error: cannot attach mtd%d",
+			pr_err("UBI error: cannot attach mtd%d\n",
 			       mtd->index);
 			put_mtd_device(mtd);
 
@@ -1296,7 +1296,7 @@ static int __init ubi_init(void)
 
 	err = ubiblock_init();
 	if (err) {
-		pr_err("UBI error: block: cannot initialize, error %d", err);
+		pr_err("UBI error: block: cannot initialize, error %d\n", err);
 
 		/* See comment above re-ubi_is_module(). */
 		if (ubi_is_module())
@@ -1319,7 +1319,7 @@ out_dev_unreg:
 	misc_deregister(&ubi_ctrl_cdev);
 out:
 	class_unregister(&ubi_class);
-	pr_err("UBI error: cannot initialize UBI, error %d", err);
+	pr_err("UBI error: cannot initialize UBI, error %d\n", err);
 	return err;
 }
 late_initcall(ubi_init);
@@ -1447,7 +1447,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		int err = kstrtoint(token, 10, &p->max_beb_per1024);
 
 		if (err) {
-			pr_err("UBI error: bad value for max_beb_per1024 parameter: %s",
+			pr_err("UBI error: bad value for max_beb_per1024 parameter: %s\n",
 			       token);
 			return -EINVAL;
 		}
@@ -1458,7 +1458,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		int err = kstrtoint(token, 10, &p->ubi_num);
 
 		if (err) {
-			pr_err("UBI error: bad value for ubi_num parameter: %s",
+			pr_err("UBI error: bad value for ubi_num parameter: %s\n",
 			       token);
 			return -EINVAL;
 		}
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 915e4dd..93872d4 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -22,6 +22,9 @@
 #ifndef __UBI_UBI_H__
 #define __UBI_UBI_H__
 
+#undef pr_fmt
+#define pr_fmt(fmt) "%s: " fmt, __func__
+
 #include <linux/types.h>
 #include <linux/list.h>
 #include <linux/rbtree.h>
-- 
1.8.4.5
