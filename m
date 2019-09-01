Return-Path: <SRS0=VU8e=W4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64284C3A5A4
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Sep 2019 20:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31BB621897
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Sep 2019 20:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SqLI2se/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31BB621897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zpWba9kF2qLXBaSKYtzDjirMaxxgtwKjmPhGs+6MLAI=; b=SqL
	I2se/F1uVU+YLOdQmTfc2lo8RzCKPGUlokUcsJeE1V86xOfZTrUbGRqjpxuh3f1GgZbbixgTLsTdx
	FJK9Vsp0PIFTSY2Sm5gu5Y26TUOT/Yeg0Y7j5tAbc7awYucG9S9XhHxMNdDdhYrZAZHeaIHmZB4Ir
	YSxaaLETPSh4TpJ+Ib2qbo/TTzL/y7Y8pxa+nOmoo83NetrFvKwNUGWdUpMKaweCZVnwGHP+WUwtq
	ABfPP3JNG4487JizYaPne3cYsHVbGKJ043MkMfLiOwQIbxG8XPpOHX+yM5KfqZLO2kwZyfTRHwO9V
	LpUJIAu/Vsd0vILj04cG6vhlydsDtCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4WWO-0000k7-Uy; Sun, 01 Sep 2019 20:32:24 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4WWJ-0000jj-Ax
 for linux-mtd@lists.infradead.org; Sun, 01 Sep 2019 20:32:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 5F825181821E2;
 Sun,  1 Sep 2019 22:32:14 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Sky_fYp9YhKW; Sun,  1 Sep 2019 22:32:13 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id pz2otfvD6dw0; Sun,  1 Sep 2019 22:32:12 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: block: Warn if volume size is not multiple of 512
Date: Sun,  1 Sep 2019 22:32:05 +0200
Message-Id: <20190901203205.13063-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_133219_531654_61A8607D 
X-CRM114-Status: GOOD (  16.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If volume size is not a multiple of 512, ubi block cuts
off the last bytes of an volume since the block layer works
on 512 byte sectors.
This can happen especially on NOR flash with minimal io
size of 1.

To avoid unpleasant surprises, print a warning.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/block.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 6025398955a2..e1a2ae21dfd3 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -345,15 +345,36 @@ static const struct blk_mq_ops ubiblock_mq_ops = {
 	.init_request	= ubiblock_init_request,
 };
 
+static int calc_disk_capacity(struct ubi_volume_info *vi, u64 *disk_capacity)
+{
+	u64 size = vi->used_bytes >> 9;
+
+	if (vi->used_bytes % 512) {
+		pr_warn("UBI: block: volume size is not a multiple of 512, "
+			"last %llu bytes are ignored!\n",
+			vi->used_bytes - (size << 9));
+	}
+
+	if ((sector_t)size != size)
+		return -EFBIG;
+
+	*disk_capacity = size;
+
+	return 0;
+}
+
 int ubiblock_create(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
 	struct gendisk *gd;
-	u64 disk_capacity = vi->used_bytes >> 9;
+	u64 disk_capacity;
 	int ret;
 
-	if ((sector_t)disk_capacity != disk_capacity)
-		return -EFBIG;
+	ret = calc_disk_capacity(vi, &disk_capacity);
+	if (ret) {
+		return ret;
+	}
+
 	/* Check that the volume isn't already handled */
 	mutex_lock(&devices_mutex);
 	if (find_dev_nolock(vi->ubi_num, vi->vol_id)) {
@@ -507,7 +528,8 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 static int ubiblock_resize(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
-	u64 disk_capacity = vi->used_bytes >> 9;
+	u64 disk_capacity;
+	int ret;
 
 	/*
 	 * Need to lock the device list until we stop using the device,
@@ -520,11 +542,16 @@ static int ubiblock_resize(struct ubi_volume_info *vi)
 		mutex_unlock(&devices_mutex);
 		return -ENODEV;
 	}
-	if ((sector_t)disk_capacity != disk_capacity) {
+
+	ret = calc_disk_capacity(vi, &disk_capacity);
+	if (ret) {
 		mutex_unlock(&devices_mutex);
-		dev_warn(disk_to_dev(dev->gd), "the volume is too big (%d LEBs), cannot resize",
-			 vi->size);
-		return -EFBIG;
+		if (ret == -EFBIG) {
+			dev_warn(disk_to_dev(dev->gd),
+				 "the volume is too big (%d LEBs), cannot resize",
+				 vi->size);
+		}
+		return ret;
 	}
 
 	mutex_lock(&dev->dev_mutex);
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
