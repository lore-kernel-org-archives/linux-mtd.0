Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D43C001E0
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Oct 2023 18:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a4Xp+Bt2L5LwujHaoHIjOQf/ImDTDr+ReP7prGcly4Y=; b=aEc9FEKt59A/Pp
	jrBcJBtsK5qUN6f5EXepmvPo9Dd8kSG7nVhHPfyoxq9o4p3TrJN8DdXlH6zduSarOzQEw8Yz0xQf9
	hLjzYZ27nNPqCC351z01c+BK1uz509BCRc8CF1ybF3TPJUMQOH/9y/SHhCNU59iayClFHj7+CzbX4
	7DbDyWclyd6PuHPawkx5LA61Hs1Rc/NF7H+ybbFQ2R7sURsuXlD0KBwew2xb4m2NA2dTfHkIPGv75
	b0SqRuXmS2SmDoEWjZNi1tpzfdR//mqS4P35YqebuXE/EYL6gT2wHl//eZmh8es9W9HOrMhIr3Bv7
	/88swTo+Nn29dZF0MEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quHBc-004OW4-3B;
	Sat, 21 Oct 2023 18:59:00 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quHBY-004OVV-37
	for linux-mtd@lists.infradead.org;
	Sat, 21 Oct 2023 18:58:58 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C271C6343CB4;
	Sat, 21 Oct 2023 20:58:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id P-b8PQmRRzfA; Sat, 21 Oct 2023 20:58:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5BA596343CB5;
	Sat, 21 Oct 2023 20:58:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WHulukewPv4l; Sat, 21 Oct 2023 20:58:50 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 0B96B6343CB4;
	Sat, 21 Oct 2023 20:58:50 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	joern@lazybastard.org,
	Christoph Hellwig <hch@lst.de>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: block2mtd: Add a valid holder to blkdev_put()
Date: Sat, 21 Oct 2023 20:58:32 +0200
Message-Id: <20231021185832.25592-1-richard@nod.at>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_115857_177926_FC0A5883 
X-CRM114-Status: GOOD (  10.59  )
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

Since commit 2736e8eeb0ccd ("block: use the holder as indication for exclusive opens")
blkdev_put() requires a valid holder argument.
So, do so also in block2mtd to unbreak bdev->bd_holder refcounting.

Cc: Christoph Hellwig <hch@lst.de>
Cc: stable@vger.kernel.org
Fixes: 2736e8eeb0ccd ("block: use the holder as indication for exclusive opens")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/devices/block2mtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index be106dc20ff3c..8c37650bbce45 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -209,7 +209,7 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 	if (dev->blkdev) {
 		invalidate_mapping_pages(dev->blkdev->bd_inode->i_mapping,
 					0, -1);
-		blkdev_put(dev->blkdev, NULL);
+		blkdev_put(dev->blkdev, dev);
 	}
 
 	kfree(dev);
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
