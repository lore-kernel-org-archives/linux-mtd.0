Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E47BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 23:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2876604D2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 23:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2876604D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+25F939SG+4MfA90um/oSqCkp+uvQizWq5davgZVkw=; b=qSpDH6/pWbtnA8
	BJTHgwNk7quI1YL+Dju/BoUoYyy6KbDjGKhWQbo/FFXVokQ4TmvzyuSFd4QS3Tcf24jDVfXKcwpZ8
	Hnv04ZUA7tItgLMP77A59s4N9zL0/SjJVixBGS0GTnwGEKCgijC5dFWB1UQQyUHfsU/Um+xjmfKDz
	pW+zZw+DBLFkd1C6OXsurlnvGKP9XMfQ6SLtKRfu0Am6xdFKw8jB2htEXSvP+/RNAQsqOR+OU6tOn
	QULzubk9giMkeweig+aJUYmXz55ScfVVY3ubWyOPHJ38ID3LPRro8d34u4WhJWm2jL4+fQ+qF1SlK
	M9SHMFkzTJKRI0dcsjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miPNp-006uwV-Ga; Wed, 03 Nov 2021 23:09:29 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miPJ8-006seT-K3; Wed, 03 Nov 2021 23:04:38 +0000
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
Subject: [PATCH v5 05/14] nvdimm/pmem: cleanup the disk if pmem_release_disk()
 is yet assigned
Date: Wed,  3 Nov 2021 16:04:28 -0700
Message-Id: <20211103230437.1639990-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103230437.1639990-1-mcgrof@kernel.org>
References: <20211103230437.1639990-1-mcgrof@kernel.org>
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

Prior to devm being able to use pmem_release_disk() there are other
failure which can occur for which we must account for and release the
disk for. Address those few cases.

Fixes: 3dd60fb9d95d ("nvdimm/pmem: stop using q_usage_count as external pgmap refcount")
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/pmem.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index c74d7bceb222..bcfc36e7295f 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -428,8 +428,10 @@ static int pmem_attach_disk(struct device *dev,
 		bb_range.end = res->end;
 	}
 
-	if (IS_ERR(addr))
-		return PTR_ERR(addr);
+	if (IS_ERR(addr)) {
+		rc = PTR_ERR(addr);
+		goto out;
+	}
 	pmem->virt_addr = addr;
 
 	blk_queue_write_cache(q, true, fua);
@@ -454,7 +456,8 @@ static int pmem_attach_disk(struct device *dev,
 		flags = DAXDEV_F_SYNC;
 	dax_dev = alloc_dax(pmem, disk->disk_name, &pmem_dax_ops, flags);
 	if (IS_ERR(dax_dev)) {
-		return PTR_ERR(dax_dev);
+		rc = PTR_ERR(dax_dev);
+		goto out;
 	}
 	dax_write_cache(dax_dev, nvdimm_has_cache(nd_region));
 	pmem->dax_dev = dax_dev;
@@ -469,8 +472,10 @@ static int pmem_attach_disk(struct device *dev,
 					  "badblocks");
 	if (!pmem->bb_state)
 		dev_warn(dev, "'badblocks' notification disabled\n");
-
 	return 0;
+out:
+	blk_cleanup_disk(pmem->disk);
+	return rc;
 }
 
 static int nd_pmem_probe(struct device *dev)
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
