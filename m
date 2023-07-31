Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DDBC04A94
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 19:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0eWlqhRcl2fW27oQ8hkx+AM1NhyzIqsaappclAXBq8=; b=kGuhw4WmoAs3xJ
	bUdJXG00Qo3tu8RtyAvpUQnNDq/w8LacGwEqU5TJXL5TjH9G/lZPBsfEedy0FyOchzcTKFqOaN+5j
	sPeqxugHUl0+OTxlCOi4mmjmHE1JTofvaS5nad+X53FPsn/poFwaV0JKCwL1KBtmsdh1aI/6vSNPP
	Zo2+Uu3QlnRw0apIlZW1ubFAXSU5kkQ6jIzCp5/Nxj8n8x41prV6nFYRh9panTJSkZpH5GFwf/jcv
	w0+74QV6JGYNlYd9+uLr+mSk2HdfthT3dl7rWUcBubhm6AroABwB+m8NfbY7YT924iK2FBF8UwA3Y
	eQKx81exe+Hz9GL2eCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYJ0-00H4tI-23;
	Mon, 31 Jul 2023 19:11:46 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYIy-00H4sN-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 19:11:45 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qQYIo-0001gy-1K;
	Mon, 31 Jul 2023 19:11:35 +0000
Date: Mon, 31 Jul 2023 20:11:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] mtd: ubi: block: don't return on error when removing
Message-ID: <49bb3589e98a65cc03e43809ad14066e59ace032.1690823629.git.daniel@makrotopia.org>
References: <cover.1690823629.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1690823629.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_121144_168507_9364B060 
X-CRM114-Status: GOOD (  16.88  )
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

There is no point on returning the error from ubiblock_remove in case
it is being called due to a volume removal event -- the volume is gone,
we should destroy and remove the ubiblock device no matter what.

Introduce new boolean parameter 'force' to tell ubiblock_remove to go
on even in case the ubiblock device is still busy. Use that new option
when calling ubiblock_remove due to a UBI_VOLUME_REMOVED event.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 6 +++---
 drivers/mtd/ubi/cdev.c  | 2 +-
 drivers/mtd/ubi/ubi.h   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 437c5b83ffe51..69fa6fecb8494 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -456,7 +456,7 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
 }
 
-int ubiblock_remove(struct ubi_volume_info *vi)
+int ubiblock_remove(struct ubi_volume_info *vi, bool force)
 {
 	struct ubiblock *dev;
 	int ret;
@@ -470,7 +470,7 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 
 	/* Found a device, let's lock it so we can check if it's busy */
 	mutex_lock(&dev->dev_mutex);
-	if (dev->refcnt > 0) {
+	if (dev->refcnt > 0 && !force) {
 		ret = -EBUSY;
 		goto out_unlock_dev;
 	}
@@ -545,7 +545,7 @@ static int ubiblock_notify(struct notifier_block *nb,
 		 */
 		break;
 	case UBI_VOLUME_REMOVED:
-		ubiblock_remove(&nt->vi);
+		ubiblock_remove(&nt->vi, true);
 		break;
 	case UBI_VOLUME_RESIZED:
 		ubiblock_resize(&nt->vi);
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f43430b9c1e65..bb55e863dd296 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -572,7 +572,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 		struct ubi_volume_info vi;
 
 		ubi_get_volume_info(desc, &vi);
-		err = ubiblock_remove(&vi);
+		err = ubiblock_remove(&vi, false);
 		break;
 	}
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8f1bd4fa1008..44c0eeaf1e1b0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -979,7 +979,7 @@ static inline void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol) {}
 int ubiblock_init(void);
 void ubiblock_exit(void);
 int ubiblock_create(struct ubi_volume_info *vi);
-int ubiblock_remove(struct ubi_volume_info *vi);
+int ubiblock_remove(struct ubi_volume_info *vi, bool force);
 #else
 static inline int ubiblock_init(void) { return 0; }
 static inline void ubiblock_exit(void) {}
@@ -987,7 +987,7 @@ static inline int ubiblock_create(struct ubi_volume_info *vi)
 {
 	return -ENOSYS;
 }
-static inline int ubiblock_remove(struct ubi_volume_info *vi)
+static inline int ubiblock_remove(struct ubi_volume_info *vi, bool force)
 {
 	return -ENOSYS;
 }
-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
