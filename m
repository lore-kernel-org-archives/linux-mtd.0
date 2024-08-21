Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C64C5472E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2024 16:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eUYLhYbYvd0H0MJN4A1givDKegfMQYjQjXqBo33xZc=; b=BVY4lz7ivYKnXs
	fyM0VNvzpSVKmLpKc65FHVcYpwb40io/yZ/sdnuCBXwA/UQqKef7GLxfGQXNOF1qijoy2VTnUmqXJ
	bhEhj0XqMEPJLMuDxNvj19GsQ+GcaRs5LkEiTA9JJ4hfGcXl0oxfl/Vh3WJXXvcAWQ3/A2TlBwMkt
	WHK108w4mI7HdDphlvo+lF95UVaoZHNz6VIA/781MG76wOsEy1fQzD42lYx4qwRuZ/JHiEDTwjtLv
	WUftBu/UtUqYf4mIXVIcBcqKRms9I5RhU5l/MtuqpS+Zg04nQ7nsXcWG+cDr/XU1FXp391n92xgpK
	LITsQQn1w5zuFTZF98iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9U-00000009kLb-39Sa;
	Wed, 21 Aug 2024 16:25:40 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgo9O-00000009kG1-0nwY
	for linux-mtd@lists.infradead.org;
	Wed, 21 Aug 2024 16:25:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E9E11BF208;
	Wed, 21 Aug 2024 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724257532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GQiSEgfFFAM+Aw4Nl4eUGdpDScw2QEh3IpZIF1je44=;
	b=Ifpi9F+BXOHvO6p+IWdXcWn8m+Ls1AUI1E2gun67xhPTOdlK6clvgRkz9rEbEY0wcQj8c7
	HxuDclm/lzU1K/FMehMuSIXhC7cDEUM/i5E4CTEQ8iOt1PYVTe7o2dcADOnEVfrm+bntV1
	UVtI53pGkW6ChZjB7lw9f98NZkig3Td9p/fx8ekW2GdpJT4qp5AN/RhP2RMZSUTqkLnIf7
	m6hNBhExxA8CVHVqoaYwlnVEqb4BvbFddssq3nUpJnKoO4DZMuK3l3VGYZhluN4S8i+5nc
	sHxOvX6ukZmHWj+floX+TYYmY8fFbuludejI8NVZbmjLZo1FQywRh4eGK/+k/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/9] mtd: nand: Introduce a block iterator
Date: Wed, 21 Aug 2024 18:25:21 +0200
Message-ID: <20240821162528.218292-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240821162528.218292-1-miquel.raynal@bootlin.com>
References: <20240821162528.218292-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_092534_523778_554CA288 
X-CRM114-Status: GOOD (  17.51  )
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

In order to be able to iterate easily across eraseblocks rather than
pages, let's introduce a block iterator inspired from the page iterator.

The main usage of this iterator will be for continuous/sequential reads,
where it is interesting to use a single request rather than split the
requests in smaller chunks (ie. pages) that can be hardly optimized.

So a "continuous" boolean get's added for this purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h | 74 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 92e06ac33815..1e4208040956 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -103,6 +103,8 @@ enum nand_page_io_req_type {
  * @ooblen: the number of OOB bytes to read from/write to this page
  * @oobbuf: buffer to store OOB data in or get OOB data from
  * @mode: one of the %MTD_OPS_XXX mode
+ * @continuous: no need to start over the operation at the end of each page, the
+ * NAND device will automatically prepare the next one
  *
  * This object is used to pass per-page I/O requests to NAND sub-layers. This
  * way all useful information are already formatted in a useful way and
@@ -125,6 +127,7 @@ struct nand_page_io_req {
 		void *in;
 	} oobbuf;
 	int mode;
+	bool continuous;
 };
 
 const struct mtd_ooblayout_ops *nand_get_small_page_ooblayout(void);
@@ -937,6 +940,43 @@ static inline void nanddev_io_page_iter_init(struct nand_device *nand,
 	iter->req.ooblen = min_t(unsigned int,
 				 iter->oobbytes_per_page - iter->req.ooboffs,
 				 iter->oobleft);
+	iter->req.continuous = false;
+}
+
+/**
+ * nand_io_block_iter_init - Initialize a NAND I/O iterator
+ * @nand: NAND device
+ * @offs: absolute offset
+ * @req: MTD request
+ * @iter: NAND I/O iterator
+ *
+ * Initializes a NAND iterator based on the information passed by the MTD
+ * layer for block jumps (no OOB)
+ *
+ * In practice only reads may leverage this iterator.
+ */
+static inline void nanddev_io_block_iter_init(struct nand_device *nand,
+					      enum nand_page_io_req_type reqtype,
+					      loff_t offs, struct mtd_oob_ops *req,
+					      struct nand_io_iter *iter)
+{
+	unsigned int offs_in_eb;
+
+	iter->req.type = reqtype;
+	iter->req.mode = req->mode;
+	iter->req.dataoffs = nanddev_offs_to_pos(nand, offs, &iter->req.pos);
+	iter->req.ooboffs = 0;
+	iter->oobbytes_per_page = 0;
+	iter->dataleft = req->len;
+	iter->oobleft = 0;
+	iter->req.databuf.in = req->datbuf;
+	offs_in_eb = (nand->memorg.pagesize * iter->req.pos.page) + iter->req.dataoffs;
+	iter->req.datalen = min_t(unsigned int,
+				  nanddev_eraseblock_size(nand) - offs_in_eb,
+				  iter->dataleft);
+	iter->req.oobbuf.in = NULL;
+	iter->req.ooblen = 0;
+	iter->req.continuous = true;
 }
 
 /**
@@ -962,6 +1002,25 @@ static inline void nanddev_io_iter_next_page(struct nand_device *nand,
 				 iter->oobleft);
 }
 
+/**
+ * nand_io_iter_next_block - Move to the next block
+ * @nand: NAND device
+ * @iter: NAND I/O iterator
+ *
+ * Updates the @iter to point to the next block.
+ * No OOB handling available.
+ */
+static inline void nanddev_io_iter_next_block(struct nand_device *nand,
+					      struct nand_io_iter *iter)
+{
+	nanddev_pos_next_eraseblock(nand, &iter->req.pos);
+	iter->dataleft -= iter->req.datalen;
+	iter->req.databuf.in += iter->req.datalen;
+	iter->req.dataoffs = 0;
+	iter->req.datalen = min_t(unsigned int, nanddev_eraseblock_size(nand),
+				  iter->dataleft);
+}
+
 /**
  * nand_io_iter_end - Should end iteration or not
  * @nand: NAND device
@@ -997,6 +1056,21 @@ static inline bool nanddev_io_iter_end(struct nand_device *nand,
 	     !nanddev_io_iter_end(nand, iter);				\
 	     nanddev_io_iter_next_page(nand, iter))
 
+/**
+ * nand_io_for_each_block - Iterate over all NAND pages contained in an MTD I/O
+ *			    request, one block at a time
+ * @nand: NAND device
+ * @start: start address to read/write from
+ * @req: MTD I/O request
+ * @iter: NAND I/O iterator
+ *
+ * Should be used for iterating over blocks that are contained in an MTD request.
+ */
+#define nanddev_io_for_each_block(nand, type, start, req, iter)		\
+	for (nanddev_io_block_iter_init(nand, type, start, req, iter);	\
+	     !nanddev_io_iter_end(nand, iter);				\
+	     nanddev_io_iter_next_block(nand, iter))
+
 bool nanddev_isbad(struct nand_device *nand, const struct nand_pos *pos);
 bool nanddev_isreserved(struct nand_device *nand, const struct nand_pos *pos);
 int nanddev_markbad(struct nand_device *nand, const struct nand_pos *pos);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
