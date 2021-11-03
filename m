Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BDBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 12:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E514610FC
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 12:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E514610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eD1seY7ts3Ax8lNwe8YTNKO9qCjT3ZJv3AG51hbLKSc=; b=2dco9m0kIE64QL
	BRjiEta5hUMeNrLXtFDr78oDh4U3qp8TZKPbXFgTITKcJO8+yLdEPz66MlvkCwEii14aglFii9bFj
	x+8Hj2vMPaKZ0T094ZMSGliuipu3xSTbj7/GQorvwOvSwIrljNYprzyqFMHd2Ok1VuwAxlZ6ltROQ
	l1o90m/WWuy7oG3xISLOyoaew2tc4itV7ET02wU+cqE+ZsLRwEiFi2cCKGcl7Ockmyt+GT3TC5iuW
	tIhqOdBvMbzf6XUoEw1xWcurvEt5Snwts1Ej93w5V1RDzwRz39q6VuOI35Aa6e5ysPsQ8NID41pNQ
	fWiGCHe0s9O+3tqf5wMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miFHf-0056Zf-UG; Wed, 03 Nov 2021 12:22:27 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miFHC-0056IM-Bq; Wed, 03 Nov 2021 12:21:58 +0000
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
Subject: [PATCH v2 07/13] nvdimm/pmem: use add_disk() error handling
Date: Wed,  3 Nov 2021 05:21:51 -0700
Message-Id: <20211103122157.1215783-8-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103122157.1215783-1-mcgrof@kernel.org>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
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

Now that device_add_disk() supports returning an error, use
that. We must unwind alloc_dax() on error.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/pmem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index d98af6c31f42..fe7ece1534e1 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -505,7 +505,9 @@ static int pmem_attach_disk(struct device *dev,
 	dax_write_cache(dax_dev, nvdimm_has_cache(nd_region));
 	pmem->dax_dev = dax_dev;
 
-	device_add_disk(dev, disk, pmem_attribute_groups);
+	rc = device_add_disk(dev, disk, pmem_attribute_groups);
+	if (rc)
+		goto out_cleanup_dax;
 	if (devm_add_action_or_reset(dev, pmem_release_disk, pmem))
 		return -ENOMEM;
 
@@ -516,6 +518,10 @@ static int pmem_attach_disk(struct device *dev,
 	if (!pmem->bb_state)
 		dev_warn(dev, "'badblocks' notification disabled\n");
 	return 0;
+
+out_cleanup_dax:
+	kill_dax(pmem->dax_dev);
+	put_dax(pmem->dax_dev);
 out:
 	blk_cleanup_disk(pmem->disk);
 	return rc;
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
