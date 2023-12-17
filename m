Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC3FC3DA6E
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Dec 2023 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+W56qlU4agjyAs+BGlpvTKKHPM1Uj2TrxZB2cYMiMF0=; b=CU1UsV+NAr1jLK
	Bz0Os9YOPknrwNADMSZMPVXND3he2tHWBYIGyoVQVJMjJcQUB7Nr9JKre9ounm6KSoJjvGJWD6c04
	FU9651WdwlSSnQACbm+cVkayZ/R/lgpxA34JdbO+KjPo3YJHo/wdXj7zp07/VldifR9773ACQNa2/
	3VX7C+I1swQ7P8xEgiOXJeKYuxZqOSdYYswmoM9CzQ5dmBZNLHmJBlLMmDg2aTmHwh0wD5DtAMWzy
	TkzAmY67af8Khq2zEyvI80nINJwGxoYYmsnIZBz85U4g4Fg4zZyEW4ofDXzzYrWJ3761rzyjeaqcc
	hxctlLgOzli3+VBFhgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEzUZ-008ZEO-0m;
	Sun, 17 Dec 2023 22:20:11 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEzUN-008ZBm-1S
	for linux-mtd@lists.infradead.org;
	Sun, 17 Dec 2023 22:20:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rEzUI-0001c5-12;
	Sun, 17 Dec 2023 22:19:55 +0000
Date: Sun, 17 Dec 2023 22:19:52 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/7] mtd: ubi: attach from device tree
Message-ID: <bed1996b6583c5d3c6d4d952497bc1770d606357.1702850093.git.daniel@makrotopia.org>
References: <cover.1702850093.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1702850093.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_142000_107342_E91455C5 
X-CRM114-Status: GOOD (  22.19  )
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

Introduce device tree compatible 'linux,ubi' and attach compatible MTD
devices using the MTD add notifier. This is needed for a UBI device to
be available early at boot (and not only after late_initcall), so
volumes on them can be used eg. as NVMEM providers for other drivers.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/build.c | 135 ++++++++++++++++++++++++++++------------
 1 file changed, 96 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7d4ff1193db6f..8c3f763e4ddb8 100644
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
@@ -1219,43 +1220,43 @@ static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 	return mtd;
 }
 
-static int __init ubi_init(void)
+static void ubi_notify_add(struct mtd_info *mtd)
 {
-	int err, i, k;
+	struct device_node *np = mtd_get_of_node(mtd);
+	int err;
 
-	/* Ensure that EC and VID headers have correct size */
-	BUILD_BUG_ON(sizeof(struct ubi_ec_hdr) != 64);
-	BUILD_BUG_ON(sizeof(struct ubi_vid_hdr) != 64);
+	if (!of_device_is_compatible(np, "linux,ubi"))
+		return;
 
-	if (mtd_devs > UBI_MAX_DEVICES) {
-		pr_err("UBI error: too many MTD devices, maximum is %d\n",
-		       UBI_MAX_DEVICES);
-		return -EINVAL;
-	}
+	/*
+	 * we are already holding &mtd_table_mutex, but still need
+	 * to bump refcount
+	 */
+	err = __get_mtd_device(mtd);
+	if (err)
+		return;
 
-	/* Create base sysfs directory and sysfs files */
-	err = class_register(&ubi_class);
+	/* called while holding mtd_table_mutex */
+	mutex_lock_nested(&ubi_devices_mutex, SINGLE_DEPTH_NESTING);
+	err = ubi_attach_mtd_dev(mtd, UBI_DEV_NUM_AUTO, 0, 0, false, false);
+	mutex_unlock(&ubi_devices_mutex);
 	if (err < 0)
-		return err;
-
-	err = misc_register(&ubi_ctrl_cdev);
-	if (err) {
-		pr_err("UBI error: cannot register device\n");
-		goto out;
-	}
+		__put_mtd_device(mtd);
+}
 
-	ubi_wl_entry_slab = kmem_cache_create("ubi_wl_entry_slab",
-					      sizeof(struct ubi_wl_entry),
-					      0, 0, NULL);
-	if (!ubi_wl_entry_slab) {
-		err = -ENOMEM;
-		goto out_dev_unreg;
-	}
+static void ubi_notify_remove(struct mtd_info *mtd)
+{
+	/* do nothing for now */
+}
 
-	err = ubi_debugfs_init();
-	if (err)
-		goto out_slab;
+static struct mtd_notifier ubi_mtd_notifier = {
+	.add = ubi_notify_add,
+	.remove = ubi_notify_remove,
+};
 
+static int __init ubi_init_attach(void)
+{
+	int err, i, k;
 
 	/* Attach MTD devices */
 	for (i = 0; i < mtd_devs; i++) {
@@ -1304,25 +1305,79 @@ static int __init ubi_init(void)
 		}
 	}
 
+	return 0;
+
+out_detach:
+	for (k = 0; k < i; k++)
+		if (ubi_devices[k]) {
+			mutex_lock(&ubi_devices_mutex);
+			ubi_detach_mtd_dev(ubi_devices[k]->ubi_num, 1);
+			mutex_unlock(&ubi_devices_mutex);
+		}
+	return err;
+}
+#ifndef CONFIG_MTD_UBI_MODULE
+late_initcall(ubi_init_attach);
+#endif
+
+static int __init ubi_init(void)
+{
+	int err;
+
+	/* Ensure that EC and VID headers have correct size */
+	BUILD_BUG_ON(sizeof(struct ubi_ec_hdr) != 64);
+	BUILD_BUG_ON(sizeof(struct ubi_vid_hdr) != 64);
+
+	if (mtd_devs > UBI_MAX_DEVICES) {
+		pr_err("UBI error: too many MTD devices, maximum is %d\n",
+		       UBI_MAX_DEVICES);
+		return -EINVAL;
+	}
+
+	/* Create base sysfs directory and sysfs files */
+	err = class_register(&ubi_class);
+	if (err < 0)
+		return err;
+
+	err = misc_register(&ubi_ctrl_cdev);
+	if (err) {
+		pr_err("UBI error: cannot register device\n");
+		goto out;
+	}
+
+	ubi_wl_entry_slab = kmem_cache_create("ubi_wl_entry_slab",
+					      sizeof(struct ubi_wl_entry),
+					      0, 0, NULL);
+	if (!ubi_wl_entry_slab) {
+		err = -ENOMEM;
+		goto out_dev_unreg;
+	}
+
+	err = ubi_debugfs_init();
+	if (err)
+		goto out_slab;
+
 	err = ubiblock_init();
 	if (err) {
 		pr_err("UBI error: block: cannot initialize, error %d\n", err);
 
 		/* See comment above re-ubi_is_module(). */
 		if (ubi_is_module())
-			goto out_detach;
+			goto out_slab;
+	}
+
+	register_mtd_user(&ubi_mtd_notifier);
+
+	if (ubi_is_module()) {
+		err = ubi_init_attach();
+		if (err)
+			goto out_mtd_notifier;
 	}
 
 	return 0;
 
-out_detach:
-	for (k = 0; k < i; k++)
-		if (ubi_devices[k]) {
-			mutex_lock(&ubi_devices_mutex);
-			ubi_detach_mtd_dev(ubi_devices[k]->ubi_num, 1);
-			mutex_unlock(&ubi_devices_mutex);
-		}
-	ubi_debugfs_exit();
+out_mtd_notifier:
+	unregister_mtd_user(&ubi_mtd_notifier);
 out_slab:
 	kmem_cache_destroy(ubi_wl_entry_slab);
 out_dev_unreg:
@@ -1332,13 +1387,15 @@ static int __init ubi_init(void)
 	pr_err("UBI error: cannot initialize UBI, error %d\n", err);
 	return err;
 }
-late_initcall(ubi_init);
+device_initcall(ubi_init);
+
 
 static void __exit ubi_exit(void)
 {
 	int i;
 
 	ubiblock_exit();
+	unregister_mtd_user(&ubi_mtd_notifier);
 
 	for (i = 0; i < UBI_MAX_DEVICES; i++)
 		if (ubi_devices[i]) {
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
