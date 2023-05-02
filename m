Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F0C77B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8iu/D4zk09rcPrcFbxIbE4bx9y5vlmguMu+MHolqXY=; b=SSahLYdcAOPa/8
	2D85Rv0X6eScTGTCtpywxYWRvoDc/LuikRAgJuFTYUy2dDeh9FkFVht+MQqP59sNRYJyZnqUH6wbI
	Gdc2Yd2UWw8K5lpcru460MeXx8By0z3AJloOo/9o06+yIHNPjVTqZKi7mQlSpB6qW9qmwD45XaUqe
	iJ5mBPEm7jDGEc+fbuE3qlowIVf8hqfa0v+IhDBURpYxCDMCoXa/ma6DaD6SDFv4B7JEQfV59WRar
	y69buB8bg1hx5+EQp1MdeqPbVoQxfiHDFXGFi/g9j/QaJWiFARb4CivB2YX7dj5Yg6kd/e7zk5AmC
	jhfQ+nEQuBw2woieerOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pttAy-0028Vq-0y;
	Tue, 02 May 2023 16:48:28 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pttAm-0028TY-2W
	for linux-mtd@lists.infradead.org;
	Tue, 02 May 2023 16:48:26 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pttAi-0000UW-1L;
	Tue, 02 May 2023 18:48:12 +0200
Date: Tue, 2 May 2023 17:48:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH 1/4] mtd: ubi: block: don't return on error when removing
Message-ID: <4bca8ffa66fa094da37625e66f3a2681058531d6.1683043928.git.daniel@makrotopia.org>
References: <cover.1683043928.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1683043928.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_094816_821671_05D2DB39 
X-CRM114-Status: GOOD (  17.08  )
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

Introduce a new boolean parameter 'force' to tell ubiblock_remove to go
on even in case the ubiblock device is still busy. Use that new option
when calling ubiblock_remove due to a UBI_VOLUME_REMOVED event.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 6 +++---
 drivers/mtd/ubi/cdev.c  | 2 +-
 drivers/mtd/ubi/ubi.h   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 3711d7f746003..6f5804f4b8f55 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -457,7 +457,7 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
 }
 
-int ubiblock_remove(struct ubi_volume_info *vi)
+int ubiblock_remove(struct ubi_volume_info *vi, bool force)
 {
 	struct ubiblock *dev;
 	int ret;
@@ -471,7 +471,7 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 
 	/* Found a device, let's lock it so we can check if it's busy */
 	mutex_lock(&dev->dev_mutex);
-	if (dev->refcnt > 0) {
+	if (dev->refcnt > 0 && !force) {
 		ret = -EBUSY;
 		goto out_unlock_dev;
 	}
@@ -546,7 +546,7 @@ static int ubiblock_notify(struct notifier_block *nb,
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
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
