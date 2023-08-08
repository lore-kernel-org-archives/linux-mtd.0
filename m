Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD27AC001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hb4ZSjtgzZKeMN1As0f89ArXwZHmanPnN8mUNKUfZ/k=; b=DaZMnZzQd/mgIU
	Jy1MsDgWDJLSFkby1/nXYiDV4fxzNuE3G7rAPeBYkNjLf6Ua3hFL+aC+s2lHKcLi1qOroHVtPxD3Z
	8kpDz3lrK+I3BKVS1CMZI7hP3ZyOTuAdysWIoWPEUVwMu+Zged0P00aAj5MvUKnlf0fDy6xEeKwHI
	ss5pyD50pp2/Y/zIqtIVVgyNuXsSN/SEyUgHU5u73LxHt3A23gzC2UYEp525bAHKIbTK0cwJKab1b
	5OCg3HkYiQWz+ZEWaOawJ0WdlDaEBA4pJXGkChMOW2/Z28a6RN+CGReg7RFH3eJ0qUQL5H5RcPJkL
	GHBHfiID4TC6Bxtoh4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPCN-002t0u-2c;
	Tue, 08 Aug 2023 16:04:43 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPCK-002t01-2v
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 16:04:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qTPCG-0007Zq-0R;
	Tue, 08 Aug 2023 16:04:36 +0000
Date: Tue, 8 Aug 2023 17:04:28 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/8] mtd: ubi: block: use notifier to create ubiblock from
 parameter
Message-ID: <f127480389cf9168feb7bbb912cf04242c2886a6.1691510312.git.daniel@makrotopia.org>
References: <cover.1691510312.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1691510312.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_090440_942504_7BA945E8 
X-CRM114-Status: GOOD (  28.43  )
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

Use UBI_VOLUME_ADDED notification to create ubiblock device specified
on kernel cmdline or module parameter.
This makes thing more simple and has the advantage that ubiblock devices
on volumes which are not present at the time the ubi module is probed
will still be created.

Suggested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 152 ++++++++++++++++++++++------------------
 1 file changed, 84 insertions(+), 68 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 69fa6fecb8494..e0618bbde3613 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -33,6 +33,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/namei.h>
 #include <linux/slab.h>
 #include <linux/mtd/ubi.h>
 #include <linux/blkdev.h>
@@ -65,10 +66,10 @@ struct ubiblock_pdu {
 };
 
 /* Numbers of elements set in the @ubiblock_param array */
-static int ubiblock_devs __initdata;
+static int ubiblock_devs;
 
 /* MTD devices specification parameters */
-static struct ubiblock_param ubiblock_param[UBIBLOCK_MAX_DEVICES] __initdata;
+static struct ubiblock_param ubiblock_param[UBIBLOCK_MAX_DEVICES];
 
 struct ubiblock {
 	struct ubi_volume_desc *desc;
@@ -532,6 +533,85 @@ static int ubiblock_resize(struct ubi_volume_info *vi)
 	return 0;
 }
 
+static bool
+match_volume_desc(struct ubi_volume_info *vi, const char *name, int ubi_num, int vol_id)
+{
+	int err, len;
+	struct path path;
+	struct kstat stat;
+
+	if (ubi_num == -1) {
+		/* No ubi num, name must be a vol device path */
+		err = kern_path(name, LOOKUP_FOLLOW, &path);
+		if (err)
+			return false;
+
+		err = vfs_getattr(&path, &stat, STATX_TYPE, AT_STATX_SYNC_AS_STAT);
+		path_put(&path);
+		if (err)
+			return false;
+
+		if (!S_ISCHR(stat.mode))
+			return false;
+
+		if (vi->ubi_num != ubi_major2num(MAJOR(stat.rdev)))
+			return false;
+
+		if (vi->vol_id != MINOR(stat.rdev) - 1)
+			return false;
+
+		return true;
+	}
+
+	if (vol_id == -1) {
+		if (vi->ubi_num != ubi_num)
+			return false;
+
+		len = strnlen(name, UBI_VOL_NAME_MAX + 1);
+		if (len < 1 || vi->name_len != len)
+			return false;
+
+		if (strcmp(name, vi->name))
+			return false;
+
+		return true;
+	}
+
+	if (vi->ubi_num != ubi_num)
+		return false;
+
+	if (vi->vol_id != vol_id)
+		return false;
+
+	return true;
+}
+
+static void
+ubiblock_create_from_param(struct ubi_volume_info *vi)
+{
+	int i, ret = 0;
+	struct ubiblock_param *p;
+
+	/*
+	 * Iterate over ubiblock cmdline parameters. If a parameter matches the
+	 * newly added volume create the ubiblock device for it.
+	 */
+	for (i = 0; i < ubiblock_devs; i++) {
+		p = &ubiblock_param[i];
+
+		if (!match_volume_desc(vi, p->name, p->ubi_num, p->vol_id))
+			continue;
+
+		ret = ubiblock_create(vi);
+		if (ret) {
+			pr_err(
+			       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d\n",
+			       vi->name, p->ubi_num, p->vol_id, ret);
+		}
+		break;
+	}
+}
+
 static int ubiblock_notify(struct notifier_block *nb,
 			 unsigned long notification_type, void *ns_ptr)
 {
@@ -539,10 +619,7 @@ static int ubiblock_notify(struct notifier_block *nb,
 
 	switch (notification_type) {
 	case UBI_VOLUME_ADDED:
-		/*
-		 * We want to enforce explicit block device creation for
-		 * volumes, so when a volume is added we do nothing.
-		 */
+		ubiblock_create_from_param(&nt->vi);
 		break;
 	case UBI_VOLUME_REMOVED:
 		ubiblock_remove(&nt->vi, true);
@@ -568,56 +645,6 @@ static struct notifier_block ubiblock_notifier = {
 	.notifier_call = ubiblock_notify,
 };
 
-static struct ubi_volume_desc * __init
-open_volume_desc(const char *name, int ubi_num, int vol_id)
-{
-	if (ubi_num == -1)
-		/* No ubi num, name must be a vol device path */
-		return ubi_open_volume_path(name, UBI_READONLY);
-	else if (vol_id == -1)
-		/* No vol_id, must be vol_name */
-		return ubi_open_volume_nm(ubi_num, name, UBI_READONLY);
-	else
-		return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
-}
-
-static void __init ubiblock_create_from_param(void)
-{
-	int i, ret = 0;
-	struct ubiblock_param *p;
-	struct ubi_volume_desc *desc;
-	struct ubi_volume_info vi;
-
-	/*
-	 * If there is an error creating one of the ubiblocks, continue on to
-	 * create the following ubiblocks. This helps in a circumstance where
-	 * the kernel command-line specifies multiple block devices and some
-	 * may be broken, but we still want the working ones to come up.
-	 */
-	for (i = 0; i < ubiblock_devs; i++) {
-		p = &ubiblock_param[i];
-
-		desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
-		if (IS_ERR(desc)) {
-			pr_err(
-			       "UBI: block: can't open volume on ubi%d_%d, err=%ld\n",
-			       p->ubi_num, p->vol_id, PTR_ERR(desc));
-			continue;
-		}
-
-		ubi_get_volume_info(desc, &vi);
-		ubi_close_volume(desc);
-
-		ret = ubiblock_create(&vi);
-		if (ret) {
-			pr_err(
-			       "UBI: block: can't add '%s' volume on ubi%d_%d, err=%d\n",
-			       vi.name, p->ubi_num, p->vol_id, ret);
-			continue;
-		}
-	}
-}
-
 static void ubiblock_remove_all(void)
 {
 	struct ubiblock *next;
@@ -643,18 +670,7 @@ int __init ubiblock_init(void)
 	if (ubiblock_major < 0)
 		return ubiblock_major;
 
-	/*
-	 * Attach block devices from 'block=' module param.
-	 * Even if one block device in the param list fails to come up,
-	 * still allow the module to load and leave any others up.
-	 */
-	ubiblock_create_from_param();
-
-	/*
-	 * Block devices are only created upon user requests, so we ignore
-	 * existing volumes.
-	 */
-	ret = ubi_register_volume_notifier(&ubiblock_notifier, 1);
+	ret = ubi_register_volume_notifier(&ubiblock_notifier, 0);
 	if (ret)
 		goto err_unreg;
 	return 0;
-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
