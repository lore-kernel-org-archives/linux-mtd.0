Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE2DC001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0eWlqhRcl2fW27oQ8hkx+AM1NhyzIqsaappclAXBq8=; b=XECIwF3qN16qv4
	Fwo8YOvdyNMl+tqLV31RbG+mGcOGNxcqtyF9rgAU87ABoHx7FWmYXG+lqIFwVChPh4brMnHD8ObFx
	SBxWCJNyTdYOB+VXJYAwTioSCsoEPRexRFjUndBj5BZwZuAwZ4lmWgdj3r1YgphJ3SBVbqFXn6Lo7
	MvQKofq5vrfyJYgLZ/6RXgo14EiWK/0A7eobcQDXmkicVJ4Wim/P+HrwhwaKYq34NAdLoFyK11llS
	X7CYkjhFx/TaCeFEl0q5nbyF3+IIFfn9fyTg1vOeFpxpogaaOQJUoSHcq0ocfwLb6hpSOd0e/FvpT
	YSnA8smb+g/GyQAsP2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPC3-002stt-3B;
	Tue, 08 Aug 2023 16:04:23 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPC1-002ssV-1y
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 16:04:22 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qTPBw-0007ZB-2E;
	Tue, 08 Aug 2023 16:04:16 +0000
Date: Tue, 8 Aug 2023 17:04:09 +0100
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
Subject: [PATCH v3 3/8] mtd: ubi: block: don't return on error when removing
Message-ID: <e7e15b3ae9f80b2a18464a01bf4a1c5f3ae1ca3a.1691510312.git.daniel@makrotopia.org>
References: <cover.1691510312.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1691510312.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_090421_671158_D7973A3F 
X-CRM114-Status: GOOD (  17.83  )
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
