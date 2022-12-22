Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB61CC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Dec 2022 19:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=op1nATaNN7DuR5k5qiJrrTU30BIQXWdtPtryIThOmhs=; b=igOoJbT3Q5H5pX
	PomeN6LDcHSYzXodSgIf+bn0nR2+kpds8/9yjKjJEMDJ0WY2hJNXNWy1iHGmdHRTUqwW+ntpAvg8C
	Tc9B73nLT3UujTav09ZQxuQYPWoetA3zJbp1nDIuKC1AaJ8BTOp2WiJBDgUNpU8Jtp3reBO/MD0cp
	FQ3oz/LVLAfKOHP7WVUW1nDegtDp2RKrwIryYkOu506iPfx01F97z1gpYZh1OHmY8JKoydlFIcFrA
	jCPN9nTdw/kJ3UcWKwUTHK7t3InwdSEN+i5Z97yGTJMJsMAhd3JzMs1TrijW4NoHPByEUTstCYRKo
	bcRB0M+4eQkah9Yj4E9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RRp-00G2tG-UW; Thu, 22 Dec 2022 19:41:46 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RQz-00G2Jr-OR
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2022 19:40:55 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1p8RQy-0004XZ-02;
	Thu, 22 Dec 2022 20:40:52 +0100
Date: Thu, 22 Dec 2022 19:40:46 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH] mtd: ubi: attach MTD partition from device-tree
Message-ID: <a547e14ac90af041e8135af5fed9272931dda463.1671738005.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_114053_844184_79F4D45B 
X-CRM114-Status: GOOD (  23.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Split ubi_init() function into early function to be called by
device_initcall() and keep cmdline attachment in late_initcall().

Register MTD notifier and automatically attach MTD devices which are
marked as compatible with 'linux,ubi' in OF device-tree.

Keep behavior regarding ubiblock creation and attaching of UBI device
from kernel or module cmdline unchanged.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 16 +++-----
 drivers/mtd/ubi/build.c | 85 ++++++++++++++++++++++++++++++++---------
 drivers/mtd/ubi/ubi.h   |  2 +
 3 files changed, 74 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index d725215ae66e5..cbdbf6578869e 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -619,7 +619,7 @@ open_volume_desc(const char *name, int ubi_num, int vol_id)
 		return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
 }
 
-static void __init ubiblock_create_from_param(void)
+void __init ubiblock_create_from_param(void)
 {
 	int i, ret = 0;
 	struct ubiblock_param *p;
@@ -648,9 +648,10 @@ static void __init ubiblock_create_from_param(void)
 
 		ret = ubiblock_create(&vi);
 		if (ret) {
-			pr_err(
-			       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d\n",
-			       vi.name, p->ubi_num, p->vol_id, ret);
+			if (ret != -EEXIST && ret != -ENOENT)
+				pr_err(
+				       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d\n",
+				       vi.name, p->ubi_num, p->vol_id, ret);
 			continue;
 		}
 	}
@@ -681,13 +682,6 @@ int __init ubiblock_init(void)
 	if (ubiblock_major < 0)
 		return ubiblock_major;
 
-	/*
-	 * Attach block devices from 'block=' module param.
-	 * Even if one block device in the param list fails to come up,
-	 * still allow the module to load and leave any others up.
-	 */
-	ubiblock_create_from_param();
-
 	/*
 	 * Block devices are only created upon user requests, so we ignore
 	 * existing volumes.
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5e90a4423b699..9c5bd0524b9fe 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -27,6 +27,7 @@
 #include <linux/log2.h>
 #include <linux/kthread.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/major.h>
 #include "ubi.h"
@@ -1198,9 +1199,42 @@ static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 	return mtd;
 }
 
+static void __init ubi_notify_add(struct mtd_info *mtd)
+{
+	struct device_node *np = mtd_get_of_node(mtd);
+	int err;
+
+	if (!of_device_is_compatible(np, "linux,ubi"))
+		return;
+
+	mutex_lock(&ubi_devices_mutex);
+	err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO, 0, 0, false);
+	mutex_unlock(&ubi_devices_mutex);
+	if (err >= 0)
+		ubiblock_create_from_param();
+}
+
+static void __init ubi_notify_remove(struct mtd_info *mtd)
+{
+	int i;
+
+	for (i = 0; i < UBI_MAX_DEVICES; i++)
+		if (ubi_devices[i]) {
+			mutex_lock(&ubi_devices_mutex);
+			if (ubi_devices[i]->mtd->index == mtd->index)
+				ubi_detach_mtd_dev(ubi_devices[i]->ubi_num, 1);
+			mutex_unlock(&ubi_devices_mutex);
+		}
+}
+
+static struct mtd_notifier ubi_mtd_notifier __initdata = {
+	.add = ubi_notify_add,
+	.remove = ubi_notify_remove,
+};
+
 static int __init ubi_init(void)
 {
-	int err, i, k;
+	int err;
 
 	/* Ensure that EC and VID headers have correct size */
 	BUILD_BUG_ON(sizeof(struct ubi_ec_hdr) != 64);
@@ -1235,6 +1269,33 @@ static int __init ubi_init(void)
 	if (err)
 		goto out_slab;
 
+	err = ubiblock_init();
+	if (err) {
+		pr_err("UBI error: block: cannot initialize, error %d\n", err);
+
+		/* See comment above re-ubi_is_module(). */
+		if (ubi_is_module())
+			goto out_slab;
+	}
+
+	register_mtd_user(&ubi_mtd_notifier);
+
+	return 0;
+out_slab:
+	kmem_cache_destroy(ubi_wl_entry_slab);
+out_dev_unreg:
+	misc_deregister(&ubi_ctrl_cdev);
+out:
+	class_unregister(&ubi_class);
+	pr_err("UBI error: cannot initialize UBI, error %d\n", err);
+
+	return err;
+}
+device_initcall(ubi_init);
+
+static int __init ubi_init_attach(void)
+{
+	int err, i, k;
 
 	/* Attach MTD devices */
 	for (i = 0; i < mtd_devs; i++) {
@@ -1282,14 +1343,10 @@ static int __init ubi_init(void)
 		}
 	}
 
-	err = ubiblock_init();
-	if (err) {
-		pr_err("UBI error: block: cannot initialize, error %d\n", err);
-
-		/* See comment above re-ubi_is_module(). */
-		if (ubi_is_module())
-			goto out_detach;
-	}
+	/*
+	 * Attach block devices from 'block=' module param.
+	 */
+	ubiblock_create_from_param();
 
 	return 0;
 
@@ -1300,17 +1357,9 @@ static int __init ubi_init(void)
 			ubi_detach_mtd_dev(ubi_devices[k]->ubi_num, 1);
 			mutex_unlock(&ubi_devices_mutex);
 		}
-	ubi_debugfs_exit();
-out_slab:
-	kmem_cache_destroy(ubi_wl_entry_slab);
-out_dev_unreg:
-	misc_deregister(&ubi_ctrl_cdev);
-out:
-	class_unregister(&ubi_class);
-	pr_err("UBI error: cannot initialize UBI, error %d\n", err);
 	return err;
 }
-late_initcall(ubi_init);
+late_initcall(ubi_init_attach);
 
 static void __exit ubi_exit(void)
 {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8f1bd4fa1008..ad8593b8ad17e 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -976,11 +976,13 @@ static inline void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol) {}
 
 /* block.c */
 #ifdef CONFIG_MTD_UBI_BLOCK
+void ubiblock_create_from_param(void);
 int ubiblock_init(void);
 void ubiblock_exit(void);
 int ubiblock_create(struct ubi_volume_info *vi);
 int ubiblock_remove(struct ubi_volume_info *vi);
 #else
+static inline void ubiblock_create_from_param(void) {}
 static inline int ubiblock_init(void) { return 0; }
 static inline void ubiblock_exit(void) {}
 static inline int ubiblock_create(struct ubi_volume_info *vi)

base-commit: e45fb347b630ee76482fe938ba76cf8eab811290
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
