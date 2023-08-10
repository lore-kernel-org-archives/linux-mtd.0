Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE12BC04FE2
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3V/GqxhN8PRvj/3vok9nkpo9ZtwSg/XBQEXi1ZolPYo=; b=YOk1daYSFcadgW
	mDCpK1vo16DhmBtYmMRve/F5vAjjJyLYA8SWy9rItun9SLj8oV/WjausJp50bpnhA1ZW4JIXYucE0
	H0FdpiL0EJACJD4FGV8U8UbApWh41dZFD85yRnmWNORfnvWaYCQzfpfhZmXpv+VRdaZ32E2yRhUdB
	/X/ehT8LHdedy/MOMBn2Akg9jO2M5jPlJCPTIJ/B98gwG1ujcgtXmwGkCLnzgpI0h7utqU595pJGT
	M3oxEZHNImw9HO+VAe7i6G0bk7TvhULcwpdyAa7At0W4do8hpQdmEmhLP3IoOmpI4sb1HUu9WuRbZ
	ZfTv971g7edAjrTW5Mug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85m-0086o8-35;
	Thu, 10 Aug 2023 16:00:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85j-0086kw-0P
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D890A635D2A8;
	Thu, 10 Aug 2023 18:00:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id id0-MKyNRELX; Thu, 10 Aug 2023 18:00:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7B8F6635D2A2;
	Thu, 10 Aug 2023 18:00:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NtQ5uhq1a5o1; Thu, 10 Aug 2023 18:00:49 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 10ECD635D29F;
	Thu, 10 Aug 2023 18:00:49 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Christoph Hellwig <hch@infradead.org>,
	Stephan Wurm <stephan.wurm@a-eberle.de>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Oliver Neukum <oliver@neukum.org>,
	Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 7/7] scsi: core: Remove scsi_kmap_atomic_sg()
Date: Thu, 10 Aug 2023 18:00:18 +0200
Message-Id: <20230810160019.16977-8-richard@nod.at>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090051_488488_D67C27BB 
X-CRM114-Status: GOOD (  12.14  )
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

All users have been migrated to use kmap_sg(), let's kill
this helper.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/scsi/scsi_lib.c  | 60 ----------------------------------------
 include/scsi/scsi_cmnd.h |  4 ---
 2 files changed, 64 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index ad9afae49544a..70469502aeb76 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -3001,66 +3001,6 @@ scsi_host_unblock(struct Scsi_Host *shost, int new_state)
 }
 EXPORT_SYMBOL_GPL(scsi_host_unblock);
 
-/**
- * scsi_kmap_atomic_sg - find and atomically map an sg-elemnt
- * @sgl:	scatter-gather list
- * @sg_count:	number of segments in sg
- * @offset:	offset in bytes into sg, on return offset into the mapped area
- * @len:	bytes to map, on return number of bytes mapped
- *
- * Returns virtual address of the start of the mapped page
- */
-void *scsi_kmap_atomic_sg(struct scatterlist *sgl, int sg_count,
-			  size_t *offset, size_t *len)
-{
-	int i;
-	size_t sg_len = 0, len_complete = 0;
-	struct scatterlist *sg;
-	struct page *page;
-
-	WARN_ON(!irqs_disabled());
-
-	for_each_sg(sgl, sg, sg_count, i) {
-		len_complete = sg_len; /* Complete sg-entries */
-		sg_len += sg->length;
-		if (sg_len > *offset)
-			break;
-	}
-
-	if (unlikely(i == sg_count)) {
-		printk(KERN_ERR "%s: Bytes in sg: %zu, requested offset %zu, "
-			"elements %d\n",
-		       __func__, sg_len, *offset, sg_count);
-		WARN_ON(1);
-		return NULL;
-	}
-
-	/* Offset starting from the beginning of first page in this sg-entry */
-	*offset = *offset - len_complete + sg->offset;
-
-	/* Assumption: contiguous pages can be accessed as "page + i" */
-	page = nth_page(sg_page(sg), (*offset >> PAGE_SHIFT));
-	*offset &= ~PAGE_MASK;
-
-	/* Bytes in this sg-entry from *offset to the end of the page */
-	sg_len = PAGE_SIZE - *offset;
-	if (*len > sg_len)
-		*len = sg_len;
-
-	return kmap_atomic(page);
-}
-EXPORT_SYMBOL(scsi_kmap_atomic_sg);
-
-/**
- * scsi_kunmap_atomic_sg - atomically unmap a virtual address, previously mapped with scsi_kmap_atomic_sg
- * @virt:	virtual address to be unmapped
- */
-void scsi_kunmap_atomic_sg(void *virt)
-{
-	kunmap_atomic(virt);
-}
-EXPORT_SYMBOL(scsi_kunmap_atomic_sg);
-
 void sdev_disable_disk_events(struct scsi_device *sdev)
 {
 	atomic_inc(&sdev->disk_events_disable_depth);
diff --git a/include/scsi/scsi_cmnd.h b/include/scsi/scsi_cmnd.h
index 526def14e7fb7..919ac97229481 100644
--- a/include/scsi/scsi_cmnd.h
+++ b/include/scsi/scsi_cmnd.h
@@ -163,10 +163,6 @@ void scsi_done_direct(struct scsi_cmnd *cmd);
 
 extern void scsi_finish_command(struct scsi_cmnd *cmd);
 
-extern void *scsi_kmap_atomic_sg(struct scatterlist *sg, int sg_count,
-				 size_t *offset, size_t *len);
-extern void scsi_kunmap_atomic_sg(void *virt);
-
 blk_status_t scsi_alloc_sgtables(struct scsi_cmnd *cmd);
 void scsi_free_sgtables(struct scsi_cmnd *cmd);
 
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
