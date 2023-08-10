Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D77DC05051
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+gEXbVHmV0H7q4xCoac+e0OXTEEdXFeBPJKI2ajFPU=; b=z+SNCZGVpwoZPS
	QI9fneZaF+ZgqR7yDFW/QDn+2F91s8nL6XpzY9WPlSJ79v2/e6/Ip6bcsf3ECT11+nhQmZqj9kE9o
	QiY7bbwKc7T5zByp2CTml0lR7KBTlHHVPitig+yVCwscRF9GP6A03RejffW4kRxYs2oyOBNEITl3p
	NQUqvNxZyOtxGk3JjUP0cIHbjWod6Pn/6tKFmYk3lLAkOCIiHEMp11oGyIgEXgLA5cvtgQXb9mQPA
	Xtz02M85QWA1LryjBFt6ZjsWmCzaVJXMpxT7LuKZK6JmIBOeMFwP2+Sfm6//pkud2iJ4FRqH7ftRP
	qvtW2g7WdiT7BlK3sGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85m-0086nq-1E;
	Thu, 10 Aug 2023 16:00:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85h-0086jE-18
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 13F5C635D2A4;
	Thu, 10 Aug 2023 18:00:48 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id bugUimCkv4m6; Thu, 10 Aug 2023 18:00:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9720F635D2A2;
	Thu, 10 Aug 2023 18:00:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NfQzJITzRPaO; Thu, 10 Aug 2023 18:00:47 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 386F5635D296;
	Thu, 10 Aug 2023 18:00:47 +0200 (CEST)
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
Subject: [PATCH 6/7] ubi: block: Switch to kmap_sg
Date: Thu, 10 Aug 2023 18:00:17 +0200
Message-Id: <20230810160019.16977-7-richard@nod.at>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090049_693630_BE478BAD 
X-CRM114-Status: GOOD (  16.17  )
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

Remove our copy of scsi_kmap_atomic_sg() and use the new helper
kmap_sg(). Since it is based on kmap_local() we can remove the
bounce buffer and perform IO while we hold the mapping.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c | 59 +++++--------------------------------------
 1 file changed, 6 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 82c54bf7c2067..650eacab27f03 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -731,44 +731,6 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 	return err;
 }
 
-/*
- * Basically a copy of scsi_kmap_atomic_sg().
- * As long scsi_kmap_atomic_sg() is not part of lib/scatterlist.c have
- * our own version to avoid a dependency on CONFIG_SCSI.
- */
-static void *ubi_kmap_atomic_sg(struct scatterlist *sgl, int sg_count,
-			  size_t *offset, size_t *len)
-{
-	int i;
-	size_t sg_len = 0, len_complete = 0;
-	struct scatterlist *sg;
-	struct page *page;
-
-	for_each_sg(sgl, sg, sg_count, i) {
-		len_complete = sg_len; /* Complete sg-entries */
-		sg_len += sg->length;
-		if (sg_len > *offset)
-			break;
-	}
-
-	if (WARN_ON_ONCE(i == sg_count))
-		return NULL;
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
-
 /**
  * ubi_eba_read_leb_sg - read data into a scatter gather list.
  * @ubi: UBI device description object
@@ -789,17 +751,6 @@ int ubi_eba_read_leb_sg(struct ubi_device *ubi, struct ubi_volume *vol,
 {
 	size_t map_len, map_offset, cur_offset;
 	int ret, to_read = len;
-	char *bounce_buf;
-
-	bounce_buf = kvmalloc(to_read, GFP_KERNEL);
-	if (!bounce_buf) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	ret = ubi_eba_read_leb(ubi, vol, lnum, bounce_buf, offset, to_read, check);
-	if (ret < 0)
-		goto out;
 
 	cur_offset = 0;
 	while (to_read > 0) {
@@ -808,9 +759,12 @@ int ubi_eba_read_leb_sg(struct ubi_device *ubi, struct ubi_volume *vol,
 		map_len = to_read;
 		map_offset = cur_offset + sgl->tot_offset;
 
-		dst = ubi_kmap_atomic_sg(sgl->sg, sgl->len, &map_offset, &map_len);
-		memcpy(dst + map_offset, bounce_buf + cur_offset, map_len);
-		kunmap_atomic(dst);
+		dst = kmap_sg(sgl->sg, sgl->len, &map_offset, &map_len);
+		ret = ubi_eba_read_leb(ubi, vol, lnum, dst + map_offset, offset + cur_offset,
+				       map_len, check);
+		if (ret < 0)
+			goto out;
+		kunmap_sg(dst);
 
 		cur_offset += map_len;
 		to_read -= map_len;
@@ -818,7 +772,6 @@ int ubi_eba_read_leb_sg(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	ret = 0;
 out:
-	kvfree(bounce_buf);
 	return ret;
 }
 
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
