Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AA0C4167D
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Oct 2023 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a8A7KfpRgdHxQ3yoJTCcXKjiuc45NjNb6CTdO62LmEk=; b=eMp9Lxz3wAEI0I
	kqdKf3sTAcn4aJ9Ji8asxM3bl1aUVt2MpYo4wqm6b9T1VUJH+zstnE9kuSiCOEBdS8V2bNQIRMMXV
	12SFi0knuGyvTcN/3E3STsQQu5RMW0r/soH92HOtn6Bzb72qfi6F9JZFVCWo3wjXgq49zjYIc0tB6
	gyjWfyG9HmFc1MKL23bBLRig8QSPh2Msmuh3I1K4W1ChIkXDXFx50DJWwuWuh0cZyMXfwcPijIxAH
	UkUNaYtLhPv6c0IKt8bDvNY73tv0P7Mu1WZZKojE1hKdK4XrGPCC3JqUbjxoSJc9ZdZWF+66FbDDv
	g6gHgKFEfS4ccrqS8UzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSpU-003Rsl-1K;
	Mon, 30 Oct 2023 14:01:20 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSpN-003RsO-2w;
	Mon, 30 Oct 2023 14:01:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	zhongjinghua@huawei.com,
	yukuai1@huaweicloud.com
Subject: [PATCH 1/2] ubi: block: don't use gendisk->first_minor for the idr_alloc return value
Date: Mon, 30 Oct 2023 15:01:05 +0100
Message-Id: <20231030140106.1393384-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

idr_alloc returns an int that is either a negative errno, or the
identifier actually allocated.  Use signed integer ret variable to
catch the return value and only assign it to gd->first_minor to prepare
for marking the first_minor field in the gendisk structure as unsigned.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/ubi/block.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 437c5b83ffe513..51d00b518d3197 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -402,13 +402,14 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	gd->fops = &ubiblock_ops;
 	gd->major = ubiblock_major;
 	gd->minors = 1;
-	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
-	if (gd->first_minor < 0) {
+	ret = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
+	if (ret < 0) {
 		dev_err(disk_to_dev(gd),
 			"block: dynamic minor allocation failed");
 		ret = -ENODEV;
 		goto out_cleanup_disk;
 	}
+	gd->first_minor  = ret;
 	gd->flags |= GENHD_FL_NO_PART;
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
