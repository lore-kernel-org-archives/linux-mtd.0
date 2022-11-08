Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFD3C4332F
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Nov 2022 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pnBBwBSec2K9NVm3IEVZHBnHXS3JX5eap3QHfMJBm4E=; b=MC974irQySQo0l
	cHj7g5D7wZ3c4Lv8ZfquN4Y9MBJZDvw5d9G+f4q65ueeKKVFPYduH+dGyQonbW2I3Y8ccFloZtmPt
	5ZCi3miF9BTElBaAfKHwiu2L91dY5oGLPl4QNpnIpmm3UGtQ7hJFhzOHSbmTMjLD2DcxmiVNclqkP
	2vNhn+A5amD1SkbcMxs5l0KDQpX+eMlDTOfqf0ZOpFbrXUPUczJ5w5LPIp6MjYkUOPGjL0WRRLHp2
	+TaAbA5vAnKZzTGcS7aJpuGdc6kPH3YIe0GXAwia3cUDMy8mhbXvvMpH8BiJ0Mh+fZCNnsjyvS0PG
	ITgfCRwh6hTEDSYMnA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXfD-0092Ht-HN; Tue, 08 Nov 2022 23:05:51 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osXfA-0092Gl-Sk
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2022 23:05:50 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1osXex-0005vp-Nv; Wed, 09 Nov 2022 00:05:35 +0100
Date: Tue, 8 Nov 2022 23:04:13 +0000
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
Subject: [PATCH v4 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
Message-ID: <Y2rgbfpYfpbLKHaf@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_150548_937454_D11C9DFB 
X-CRM114-Status: GOOD (  12.37  )
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

Add Kconfig boolean CONFIG_MTD_BLOCK_PARTITIONS and enable block
partition parsers on non-NAND mtdblock devices in case it is selected.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/Kconfig       | 11 +++++++++++
 drivers/mtd/mtd_blkdevs.c |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 796a2eccbef0..12874dec1569 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -69,6 +69,17 @@ config MTD_BLOCK_RO
 	  You do not need this option for use with the DiskOnChip devices. For
 	  those, enable NFTL support (CONFIG_NFTL) instead.
 
+config MTD_BLOCK_PARTITIONS
+	bool "Scan for partitions on MTD block devices"
+	depends on MTD_BLOCK || MTD_BLOCK_RO
+	default y if FIT_PARTITION
+	help
+	  Scan MTD block devices for partitions (ie. MBR, GPT, uImage.FIT, ...).
+	  (NAND devices are omitted, ubiblock should be used instead when)
+
+	  Unless your MTD partitions contain sub-partitions mapped using a
+	  partition table, say no.
+
 comment "Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK."
 	depends on MTD_BLOCK || MTD_BLOCK_RO
 
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 60b222799871..e6f2e0888246 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -359,7 +359,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	} else {
 		snprintf(gd->disk_name, sizeof(gd->disk_name),
 			 "%s%d", tr->name, new->devnum);
-		gd->flags |= GENHD_FL_NO_PART;
+
+		if (!IS_ENABLED(CONFIG_MTD_BLOCK_PARTITIONS) || mtd_type_is_nand(new->mtd))
+			gd->flags |= GENHD_FL_NO_PART;
 	}
 
 	set_capacity(gd, ((u64)new->size * tr->blksize) >> 9);
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
