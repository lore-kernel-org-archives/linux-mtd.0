Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766B0C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:47:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1969608FB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1969608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoLHT1fY37eAMPNyZsgUwEhlIpP0zWyyERT4tQaFvpc=; b=DR9/zlH1OdpO/L
	CeoWaRKETPTWFuN348pPn8CkttZz72Rfbv+W6oY3rTCysnRPdT4JuVIL/EvXUy1lLljWYVNytqvdt
	469/tnuPLI2DZ9p8kgezvzqKAhT7wXKn54wAXzCjqPmOLOuxvEatPM6B3IWzUVVRwu6r03b3Vxaq8
	3Po4lCmiIZc1UQfspbBPhOzX86yP4pfCtlCRuec8WwcMnki7Nbg8Z7F1Hk68nlppIO8M89fmrjiXA
	8qhSEdThKnqI5vI6e8g6x06DwR9hkTVjZ8BEIbpM0Kjk138p7gi2FSMwkI1CcfgtdYLVvNU5KZj9l
	3RZJDaSr2OQQCLuCSleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKLZ-005zvt-DP; Wed, 03 Nov 2021 17:46:49 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miKKA-005z5P-9b; Wed, 03 Nov 2021 17:45:22 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, efremov@linux.com, song@kernel.org,
 martin.petersen@oracle.com, hare@suse.de, jack@suse.cz,
 ming.lei@redhat.com, tj@kernel.org, mcgrof@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] nvdimm/btt: use goto error labels on btt_blk_init()
Date: Wed,  3 Nov 2021 10:45:10 -0700
Message-Id: <20211103174521.1426407-3-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103174521.1426407-1-mcgrof@kernel.org>
References: <20211103174521.1426407-1-mcgrof@kernel.org>
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

This will make it easier to share common error paths.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/btt.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index a62f23b945f1..416d31cda3e7 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1519,6 +1519,7 @@ static int btt_blk_init(struct btt *btt)
 {
 	struct nd_btt *nd_btt = btt->nd_btt;
 	struct nd_namespace_common *ndns = nd_btt->ndns;
+	int rc = -ENOMEM;
 
 	btt->btt_disk = blk_alloc_disk(NUMA_NO_NODE);
 	if (!btt->btt_disk)
@@ -1534,19 +1535,22 @@ static int btt_blk_init(struct btt *btt)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, btt->btt_disk->queue);
 
 	if (btt_meta_size(btt)) {
-		int rc = nd_integrity_init(btt->btt_disk, btt_meta_size(btt));
-
-		if (rc) {
-			blk_cleanup_disk(btt->btt_disk);
-			return rc;
-		}
+		rc = nd_integrity_init(btt->btt_disk, btt_meta_size(btt));
+		if (rc)
+			goto out_cleanup_disk;
 	}
+
 	set_capacity(btt->btt_disk, btt->nlba * btt->sector_size >> 9);
 	device_add_disk(&btt->nd_btt->dev, btt->btt_disk, NULL);
+
 	btt->nd_btt->size = btt->nlba * (u64)btt->sector_size;
 	nvdimm_check_and_set_ro(btt->btt_disk);
 
 	return 0;
+
+out_cleanup_disk:
+	blk_cleanup_disk(btt->btt_disk);
+	return rc;
 }
 
 static void btt_blk_cleanup(struct btt *btt)
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
