Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA148C001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 19:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+haGevLnXitPPCIQSQy2aWPrySFEsl1rJrnnVIurCoA=; b=lUhScwyR7nLArL
	iEQ+qdvUKjfJnqbq4ZPs/7mYByL/KaYr1dH1oyKdIzOzOH02cfYQjPaRMj0mx3fyLSYcgb6F2VYca
	Y0qpUu5yT7ytZXPw7VP2q+4+/Pl8bE27zzJNEhkbERqdsN+yhfyZwO0LPzBBRM0zXgjXzS7bEf6be
	hh7kWfo2D3TYdPkIAXFLBDG7vwYk4KNhJc9yuucpqpFK2Pn+PN9cxzPF2mlwnu5+WiW3GJBWPLug6
	10qvmKl2B37TDvZfr44/HZo4xQvg3ENRulXjbnSTi/P/f57+M94kT+MT8xGP6ECD7WwqKB63b96ir
	FFTn5/XTuJX0p9T5zQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYKk-00H5RB-2t;
	Mon, 31 Jul 2023 19:13:34 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYKg-00H5P6-2c
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 19:13:32 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qQYKY-0001iC-0W;
	Mon, 31 Jul 2023 19:13:23 +0000
Date: Mon, 31 Jul 2023 20:13:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] mtd: ubi: introduce pre-removal notification for UBI
 volumes
Message-ID: <bd9b2cdaa2517817830ab14bc9e0e2567a4aae78.1690823629.git.daniel@makrotopia.org>
References: <cover.1690823629.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1690823629.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_121330_851415_37DCBF44 
X-CRM114-Status: GOOD (  18.19  )
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

Introduce a new notification type UBI_VOLUME_SHUTDOWN to inform users
that a volume is just about to be removed.
This is needed because users (such as the NVMEM subsystem) expect that
at the time their removal function is called, the parenting device is
still available (for removal of sysfs nodes, for example, in case of
NVMEM which otherwise WARNs on volume removal).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/block.c | 26 ++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c |  7 ++++++-
 drivers/mtd/ubi/vmt.c   |  5 +++++
 include/linux/mtd/ubi.h |  2 ++
 4 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 99b5f502c9dbc..1d5148371991b 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -533,6 +533,29 @@ static int ubiblock_resize(struct ubi_volume_info *vi)
 	return 0;
 }
 
+static int ubiblock_shutdown(struct ubi_volume_info *vi)
+{
+	struct ubiblock *dev;
+	struct gendisk *disk;
+	int ret = 0;
+
+	mutex_lock(&devices_mutex);
+	dev = find_dev_nolock(vi->ubi_num, vi->vol_id);
+	if (!dev) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
+	disk = dev->gd;
+
+out_unlock:
+	mutex_unlock(&devices_mutex);
+
+	if (!ret)
+		blk_mark_disk_dead(disk);
+
+	return ret;
+};
+
 static bool
 match_volume_desc(struct ubi_volume_info *vi, const char *name, int ubi_num, int vol_id)
 {
@@ -624,6 +647,9 @@ static int ubiblock_notify(struct notifier_block *nb,
 	case UBI_VOLUME_REMOVED:
 		ubiblock_remove(&nt->vi, true);
 		break;
+	case UBI_VOLUME_SHUTDOWN:
+		ubiblock_shutdown(&nt->vi);
+		break;
 	case UBI_VOLUME_RESIZED:
 		ubiblock_resize(&nt->vi);
 		break;
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index c153373c13dab..ccee4a28ffe97 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1088,7 +1088,6 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway, bool have_lock)
 		return -EINVAL;
 
 	spin_lock(&ubi_devices_lock);
-	put_device(&ubi->dev);
 	ubi->ref_count -= 1;
 	if (ubi->ref_count) {
 		if (!anyway) {
@@ -1099,6 +1098,12 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway, bool have_lock)
 		ubi_err(ubi, "%s reference count %d, destroy anyway",
 			ubi->ubi_name, ubi->ref_count);
 	}
+	spin_unlock(&ubi_devices_lock);
+
+	ubi_notify_all(ubi, UBI_VOLUME_SHUTDOWN, NULL);
+
+	spin_lock(&ubi_devices_lock);
+	put_device(&ubi->dev);
 	ubi_devices[ubi_num] = NULL;
 	spin_unlock(&ubi_devices_lock);
 
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 2c867d16f89f7..eed4b57c61bda 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -352,6 +352,11 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 		err = -EBUSY;
 		goto out_unlock;
 	}
+	spin_unlock(&ubi->volumes_lock);
+
+	ubi_volume_notify(ubi, vol, UBI_VOLUME_SHUTDOWN);
+
+	spin_lock(&ubi->volumes_lock);
 	ubi->volumes[vol_id] = NULL;
 	spin_unlock(&ubi->volumes_lock);
 
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index a529347fd75b2..562f92504f2b7 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -192,6 +192,7 @@ struct ubi_device_info {
  *			or a volume was removed)
  * @UBI_VOLUME_RESIZED: a volume has been re-sized
  * @UBI_VOLUME_RENAMED: a volume has been re-named
+ * @UBI_VOLUME_SHUTDOWN: a volume is going to removed, shutdown users
  * @UBI_VOLUME_UPDATED: data has been written to a volume
  *
  * These constants define which type of event has happened when a volume
@@ -202,6 +203,7 @@ enum {
 	UBI_VOLUME_REMOVED,
 	UBI_VOLUME_RESIZED,
 	UBI_VOLUME_RENAMED,
+	UBI_VOLUME_SHUTDOWN,
 	UBI_VOLUME_UPDATED,
 };
 
-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
