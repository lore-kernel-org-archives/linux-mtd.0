Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E42C04FDF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKIh2qOW2eCsOQGRm9AJEShdc/wAmhpTH22XSt19MeA=; b=ze308bV/+/cqwe
	iCMNpAJxgHF2NWOinstcke+avyzp3A8PwvpfhNkFjzfvyVQUdd/eCW4v/5d7isSd7rlkrKOhmQA51
	3Sdl5CDdSeeTd7OhPR4Pt8qI0u4SoPy+E+nWm+c5x1RPgC97fTlFZwqh0YQnEd7+mK7TSaW0D0s0o
	tanJACI2kZPdKCFNT6+pBrk7l4cqJRNkRWEKrPIqrnKwXSjkchVhUPDTMZGAGhl8C8bvZKh0Bswb5
	pqec2gp1b32fTKjQnAD4PTjhPo56YYggoga7jckbX2zorBy6cdoHIm8aY36oBtwu8ui4vm0+3VsXN
	JxdWOYcdk4Ht4TfjipjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85i-0086l8-2G;
	Thu, 10 Aug 2023 16:00:50 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU85c-0086ep-1F
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:00:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 88BAB622F562;
	Thu, 10 Aug 2023 18:00:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id EDfStOmQ8fP8; Thu, 10 Aug 2023 18:00:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1C754635D2A1;
	Thu, 10 Aug 2023 18:00:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yaVTxL2OMKCP; Thu, 10 Aug 2023 18:00:40 +0200 (CEST)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id AF6E1635D295;
	Thu, 10 Aug 2023 18:00:39 +0200 (CEST)
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
Subject: [PATCH 2/7] scatterlist: Add kmap helpers
Date: Thu, 10 Aug 2023 18:00:13 +0200
Message-Id: <20230810160019.16977-3-richard@nod.at>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230810160019.16977-1-richard@nod.at>
References: <20230810160019.16977-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_090044_747378_5A63D1AA 
X-CRM114-Status: GOOD (  14.53  )
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

kmap_sg() is basically scsi_kmap_atomic_sg() but uses kmap_local()
and does not enforce disabled interrupts.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/linux/scatterlist.h |  3 ++
 lib/scatterlist.c           | 55 +++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 77df3d7b18a61..dd25a87609491 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -692,4 +692,7 @@ bool sg_miter_skip(struct sg_mapping_iter *miter, off_t offset);
 bool sg_miter_next(struct sg_mapping_iter *miter);
 void sg_miter_stop(struct sg_mapping_iter *miter);
 
+void *kmap_sg(struct scatterlist *sgl, int sg_count, size_t *offset, size_t *len);
+void kunmap_sg(void *virt);
+
 #endif /* _LINUX_SCATTERLIST_H */
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index e86231a44c3de..7428d9461711d 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -1364,3 +1364,58 @@ ssize_t extract_iter_to_sg(struct iov_iter *iter, size_t maxsize,
 	}
 }
 EXPORT_SYMBOL_GPL(extract_iter_to_sg);
+
+/**
+ * kmap_sg - find and kmap an sg-elemnt
+ * @sgl:	scatter-gather list
+ * @sg_count:	number of segments in sg
+ * @offset:	offset in bytes into sg, on return offset into the mapped area
+ * @len:	bytes to map, on return number of bytes mapped
+ *
+ * Returns virtual address of the start of the mapped page
+ */
+void *kmap_sg(struct scatterlist *sgl, int sg_count, size_t *offset, size_t *len)
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
+	if (WARN_ON_ONCE(i == sg_count)) {
+		pr_err("%s: Bytes in sg: %zu, requested offset %zu, elements %d\n",
+		       __func__, sg_len, *offset, sg_count);
+		return NULL;
+	}
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
+	return kmap_local_page(page);
+}
+EXPORT_SYMBOL(kmap_sg);
+
+/**
+ * kunmap_sg - atomically unmap a virtual address, previously mapped with kmap_sg
+ * @virt:	virtual address to be unmapped
+ */
+void kunmap_sg(void *virt)
+{
+	kunmap_local(virt);
+}
+EXPORT_SYMBOL(kunmap_sg);
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
