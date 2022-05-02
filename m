Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9709BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 16:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQ649morClnt+CCq0Bz9JeT6WhhtfIHSgLof3CQqPQQ=; b=ancxUCJzZSEuUF
	NHFoWEtm1LRCAU4AU4AGjsprf5m2faXkx+n1G1Nobk5W5e5KJetSTw9bQUhIhohDbHlmbUQMnuMHl
	/k3LoCtObZlWqcYc3pdCEDO+QMm0soRbUXXItWORe+56LLQXI3ez9BAybEBEVwHOCWWX972dyf0Nk
	gDoHGaZYgwGa8jl9Hipw6onANdkMn2YDFVqfFweTi8oty/EdWww0bFlY70K+JoAEbHdJ32fB85Jb2
	UxTDHG7jPxR1NIpwvVj6SXqObHFpAlfaY1oCG3eG0kIqM3Q0Pb1WdI18AaXM5dEsEvnjZw+hLiwu3
	gAemwLQGhST+/PDj7a+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlYhz-001fXn-W9; Mon, 02 May 2022 16:15:36 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlYht-001fWR-ID
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 16:15:33 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1nlYhs-00086L-3v; Mon, 02 May 2022 18:15:28 +0200
Date: Mon, 2 May 2022 17:15:22 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-block@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tom Rini <trini@konsulko.com>, Jens Axboe <axboe@kernel.dk>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/5] block: add new flag to add partitions read-only
Message-ID: <YnADmkRdOzztzi/I@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_091529_662624_85006E9B 
X-CRM114-Status: GOOD (  13.14  )
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
index 434017701403fb..c20592fe9bed4b 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -404,6 +404,7 @@ void blk_free_ext_minor(unsigned int minor);
 #define ADDPART_FLAG_NONE	0
 #define ADDPART_FLAG_RAID	1
 #define ADDPART_FLAG_WHOLEDISK	2
+#define ADDPART_FLAG_READONLY	4
 int bdev_add_partition(struct gendisk *disk, int partno, sector_t start,
 		sector_t length);
 int bdev_del_partition(struct gendisk *disk, int partno);
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 8a0ec929023bcd..3e70860beb655e 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -399,6 +399,9 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
 			goto out_del;
 	}
 
+	if (flags & ADDPART_FLAG_READONLY)
+		bdev->bd_read_only = true;
+
 	/* everything is up and running, commence */
 	err = xa_insert(&disk->part_tbl, partno, bdev, GFP_KERNEL);
 	if (err)
-- 
2.36.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
