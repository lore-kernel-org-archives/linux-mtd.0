Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200EAC04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41YD/fSlwa9Yi3mQeKcVYqAsvS7ccdS7TXKTWlIfYWg=; b=kCTR0kX9pRLA04
	TLJiebh/5OCPJaor9Sl/lNP45DgPTHtZC/nGMhlmhDgoe8SnqUQmRxq+c3sjQ6uiHi9jNWWpCX8mQ
	ZkvdK8GpK0N0APINcVxYMriRC2D/JvoVq/yrm5n8uBvf4nnyTZ7wvKiOWsE5jSUu/O5IBgtiqcvPS
	sezWw+Uikl1EyRp+zDxrVb+mnw5XQWLWfJ/MTmfrdk8NYUFqAVc1mcDxUMXYsOY4EUHRvIb4Cw4S0
	4KtfeEFjRDNEQboAjzaIg1eY3t3Cd0asnqKct8jTrSS23qofNb3wkM4021KQ5XzrEV6ZILy8EadMi
	MVMvmriUlJgtj9QqTQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85j-0086lZ-17;
	Thu, 10 Aug 2023 16:00:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85c-0086eh-0B
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CC647635D290;
	Thu, 10 Aug 2023 18:00:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 98qcvanlYtQc; Thu, 10 Aug 2023 18:00:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 34314635D2A1;
	Thu, 10 Aug 2023 18:00:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xBBmf1iN98Fa; Thu, 10 Aug 2023 18:00:38 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id C5849635D290;
	Thu, 10 Aug 2023 18:00:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Christoph Hellwig <hch@infradead.org>,
	Stephan Wurm <stephan.wurm@a-eberle.de>,
	Richard Weinberger <richard@nod.at>,
	stable@vger.kernel.org,
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
Subject: [PATCH 1/7] ubi: block: Refactor sg list processing for highmem
Date: Thu, 10 Aug 2023 18:00:12 +0200
Message-Id: <20230810160019.16977-2-richard@nod.at>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090044_423726_B6611162 
X-CRM114-Status: GOOD (  25.21  )
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

Currently sg_virt() is used while filling the sg list from LEB data.
This approach cannot work with highmem.

Refactor ubi_eba_read_leb_sg() to use kmap_atomic() for sg list
access.
Since kmap_atomic() disables preempt a bounce buffer is needed.
kmap_local_page() is not used to allow easy backporting of this patch
to older kernels.

The followup patches in this series will switch to kmap_sg()
and we can remove our own helper and the bounce buffer.

Cc: stable@vger.kernel.org
Fixes: 9ff08979e1742 ("UBI: Add initial support for scatter gather")
Reported-by: Stephan Wurm <stephan.wurm@a-eberle.de>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/block.c | 11 ++---
 drivers/mtd/ubi/eba.c   | 95 ++++++++++++++++++++++++++++-------------
 include/linux/mtd/ubi.h | 12 +++---
 3 files changed, 76 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 437c5b83ffe51..5b2e6c74ac5a8 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -193,13 +193,10 @@ static blk_status_t ubiblock_read(struct request *req)
 
 	blk_mq_start_request(req);
 
-	/*
-	 * It is safe to ignore the return value of blk_rq_map_sg() because
-	 * the number of sg entries is limited to UBI_MAX_SG_COUNT
-	 * and ubi_read_sg() will check that limit.
-	 */
 	ubi_sgl_init(&pdu->usgl);
-	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
+	ret = blk_rq_map_sg(req->q, req, pdu->usgl.sg);
+	ubi_assert(ret > 0 && ret < UBI_MAX_SG_COUNT);
+	pdu->usgl.len = ret;
 
 	while (bytes_left) {
 		/*
@@ -212,7 +209,7 @@ static blk_status_t ubiblock_read(struct request *req)
 		ret = ubi_read_sg(dev->desc, leb, &pdu->usgl, offset, to_read);
 		if (ret < 0)
 			break;
-
+		pdu->usgl.tot_offset += to_read;
 		bytes_left -= to_read;
 		to_read = bytes_left;
 		leb += 1;
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 655ff41863e2b..82c54bf7c2067 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -31,6 +31,7 @@
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <linux/err.h>
+#include <linux/highmem.h>
 #include "ubi.h"
 
 /* Number of physical eraseblocks reserved for atomic LEB change operation */
@@ -730,6 +731,44 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	return err;
 }
 
+/*
+ * Basically a copy of scsi_kmap_atomic_sg().
+ * As long scsi_kmap_atomic_sg() is not part of lib/scatterlist.c have
+ * our own version to avoid a dependency on CONFIG_SCSI.
+ */
+static void *ubi_kmap_atomic_sg(struct scatterlist *sgl, int sg_count,
+			  size_t *offset, size_t *len)
+{
+	int i;
+	size_t sg_len = 0, len_complete = 0;
+	struct scatterlist *sg;
+	struct page *page;
+
+	for_each_sg(sgl, sg, sg_count, i) {
+		len_complete = sg_len; /* Complete sg-entries */
+		sg_len += sg->length;
+		if (sg_len > *offset)
+			break;
+	}
+
+	if (WARN_ON_ONCE(i == sg_count))
+		return NULL;
+
+	/* Offset starting from the beginning of first page in this sg-entry */
+	*offset = *offset - len_complete + sg->offset;
+
+	/* Assumption: contiguous pages can be accessed as "page + i" */
+	page = nth_page(sg_page(sg), (*offset >> PAGE_SHIFT));
+	*offset &= ~PAGE_MASK;
+
+	/* Bytes in this sg-entry from *offset to the end of the page */
+	sg_len = PAGE_SIZE - *offset;
+	if (*len > sg_len)
+		*len = sg_len;
+
+	return kmap_atomic(page);
+}
+
 /**
  * ubi_eba_read_leb_sg - read data into a scatter gather list.
  * @ubi: UBI device description object
@@ -748,40 +787,38 @@ int ubi_eba_read_leb_sg(struct ubi_device *ubi, struct ubi_volume *vol,
 			struct ubi_sgl *sgl, int lnum, int offset, int len,
 			int check)
 {
-	int to_read;
-	int ret;
-	struct scatterlist *sg;
+	size_t map_len, map_offset, cur_offset;
+	int ret, to_read = len;
+	char *bounce_buf;
 
-	for (;;) {
-		ubi_assert(sgl->list_pos < UBI_MAX_SG_COUNT);
-		sg = &sgl->sg[sgl->list_pos];
-		if (len < sg->length - sgl->page_pos)
-			to_read = len;
-		else
-			to_read = sg->length - sgl->page_pos;
-
-		ret = ubi_eba_read_leb(ubi, vol, lnum,
-				       sg_virt(sg) + sgl->page_pos, offset,
-				       to_read, check);
-		if (ret < 0)
-			return ret;
-
-		offset += to_read;
-		len -= to_read;
-		if (!len) {
-			sgl->page_pos += to_read;
-			if (sgl->page_pos == sg->length) {
-				sgl->list_pos++;
-				sgl->page_pos = 0;
-			}
+	bounce_buf = kvmalloc(to_read, GFP_KERNEL);
+	if (!bounce_buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
-			break;
-		}
+	ret = ubi_eba_read_leb(ubi, vol, lnum, bounce_buf, offset, to_read, check);
+	if (ret < 0)
+		goto out;
+
+	cur_offset = 0;
+	while (to_read > 0) {
+		char *dst;
 
-		sgl->list_pos++;
-		sgl->page_pos = 0;
+		map_len = to_read;
+		map_offset = cur_offset + sgl->tot_offset;
+
+		dst = ubi_kmap_atomic_sg(sgl->sg, sgl->len, &map_offset, &map_len);
+		memcpy(dst + map_offset, bounce_buf + cur_offset, map_len);
+		kunmap_atomic(dst);
+
+		cur_offset += map_len;
+		to_read -= map_len;
 	}
 
+	ret = 0;
+out:
+	kvfree(bounce_buf);
 	return ret;
 }
 
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index a529347fd75b2..521e0e8b3ede3 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -115,8 +115,8 @@ struct ubi_volume_info {
 
 /**
  * struct ubi_sgl - UBI scatter gather list data structure.
- * @list_pos: current position in @sg[]
- * @page_pos: current position in @sg[@list_pos]
+ * @list_len: number of elemtns in @sg[]
+ * @tot_offset: current position the scatter gather list
  * @sg: the scatter gather list itself
  *
  * ubi_sgl is a wrapper around a scatter list which keeps track of the
@@ -124,8 +124,8 @@ struct ubi_volume_info {
  * it can be used across multiple ubi_leb_read_sg() calls.
  */
 struct ubi_sgl {
-	int list_pos;
-	int page_pos;
+	int len;
+	int tot_offset;
 	struct scatterlist sg[UBI_MAX_SG_COUNT];
 };
 
@@ -138,8 +138,8 @@ struct ubi_sgl {
  */
 static inline void ubi_sgl_init(struct ubi_sgl *usgl)
 {
-	usgl->list_pos = 0;
-	usgl->page_pos = 0;
+	usgl->len = 0;
+	usgl->tot_offset = 0;
 }
 
 /**
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
