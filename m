Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768DDC433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Nov 2022 23:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h15mPjfygAGGEO+Ck71YNJC7F5oNyERDm9gCKVVCLS0=; b=rMaB05632y/jRE
	N15Xj7yxKuZ+ia0wfvxFjFcrYMo7WZwHPigF40FZh8eFM9UaqvCS0IJZep3xauDtKLeEaJ2zPkwL5
	fhEFfFhzE5mJdlyuIS7Zu98QtIDDO7p5ybG3yoaYqZa/D9Wv3C7ZvZ9GAOcvAHQhRYZYr9e/QidxV
	Ovw1YZn4WZmtsybhOZy6J2yL/6rAf/PvGikYaZ67Uu6wxqio9IlaT5QWh0Hlk7z6DOauGilGnyIxR
	2A1eTVGyZaQ5eXVHEcrywU/VNuFpHNrplm5ZFbwZrU53xgcbmipvLqQvo71yqN00NS5MvSNKvYFQa
	Nl5hA7F0SpEhlD1l4/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXdu-0091wD-Ns; Tue, 08 Nov 2022 23:04:30 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXds-0091ve-Mm
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2022 23:04:29 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1osXde-0005td-94; Wed, 09 Nov 2022 00:04:14 +0100
Date: Tue, 8 Nov 2022 23:02:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v4 1/5] block: add new flag to add partitions read-only
Message-ID: <Y2rgGbInlwwnPt9q@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_150428_749391_916879DC 
X-CRM114-Status: GOOD (  13.23  )
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

Add flag ADDPART_FLAG_READONLY to allow partition parsers marking a
partition to be set read-only.
This is needed for the uImage.FIT partition parser added by a follow-up
commit: we need to be sure the contents of uImage.FIT sub-images
remain unaltered they are validated using a hash within the uImage.FIT
structure which also serves as partition table.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 block/blk.h             | 1 +
 block/partitions/core.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/block/blk.h b/block/blk.h
index e85703ae81dd..05ac426350b2 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -414,6 +414,7 @@ void blk_free_ext_minor(unsigned int minor);
 #define ADDPART_FLAG_NONE	0
 #define ADDPART_FLAG_RAID	1
 #define ADDPART_FLAG_WHOLEDISK	2
+#define ADDPART_FLAG_READONLY	4
 int bdev_add_partition(struct gendisk *disk, int partno, sector_t start,
 		sector_t length);
 int bdev_del_partition(struct gendisk *disk, int partno);
diff --git a/block/partitions/core.c b/block/partitions/core.c
index b8112f52d388..355646b0707d 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -398,6 +398,9 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 			goto out_del;
 	}
 
+	if (flags & ADDPART_FLAG_READONLY)
+		bdev->bd_read_only = true;
+
 	/* everything is up and running, commence */
 	err = xa_insert(&disk->part_tbl, partno, bdev, GFP_KERNEL);
 	if (err)
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
