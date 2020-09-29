Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33054C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9825220897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2KS2M7Je"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9825220897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XGCDWsk/XnwfvJEh434p/Xkvt78x8kY9esN7FVx39Yo=; b=2KS2M7JeDu25DqB+GZc+UJpRa
	lS2kVJUyJjgJ2W452GKNe0FHdBND3DdbIK3CKh/whL/g+oAaxX3YusYORG9ZgCUlV23B/7428MYZ7
	P6tvNbe5y/x5lWSZY64nNUmMTGiB9UZshSo+p5ROTA6l/4t2bftTGO0ldnoYQOS6uzuBosZyJEjoN
	CLNyeLYG/0K+j7V1x4OZRyRX4oWhq5Z27puUe4v+sc4s+nBR/WGGHIn6d1egXbojUgIp70p3q31oe
	9jfUZ+rRdCXjPXVepVJIKC4QXK0Pc/1QHjkrfd0aI1Jy60neRg799pBhmSOn3W6vU4hkx/Pzskude
	/BilFnPJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOcv-0001EO-NM; Tue, 29 Sep 2020 23:01:41 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcm-0001AM-Jj
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:35 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F0067200008;
 Tue, 29 Sep 2020 23:01:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/20] mtd: nand: ecc: Add an I/O request tweaking mechanism
Date: Wed, 30 Sep 2020 01:01:05 +0200
Message-Id: <20200929230124.31491-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190132_871515_E45DE2F4 
X-CRM114-Status: GOOD (  18.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently, BCH and Hamming engine are sharing the same
tweaking/restoring I/O mechanism: they need the I/O request to fully
cover the main/OOB area. Let's make this code generic as sharing the
code between two drivers is already a win. Maybe other ECC engine
drivers will need it too.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc.c   | 106 +++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h |  32 ++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index 4a56e6c0da67..86bbc4ecc58a 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -95,6 +95,7 @@
 
 #include <linux/module.h>
 #include <linux/mtd/nand.h>
+#include <linux/slab.h>
 
 /**
  * nand_ecc_init_ctx - Init the ECC engine context
@@ -479,6 +480,111 @@ bool nand_ecc_is_strong_enough(struct nand_device *nand)
 }
 EXPORT_SYMBOL(nand_ecc_is_strong_enough);
 
+/* ECC engine driver internal helpers */
+int nand_ecc_init_req_tweaking(struct nand_ecc_req_tweak_ctx *ctx,
+			       struct nand_device *nand)
+{
+	unsigned int total_buffer_size;
+
+	ctx->nand = nand;
+
+	/* Let the user decide the exact length of each buffer */
+	if (!ctx->page_buffer_size)
+		ctx->page_buffer_size = nanddev_page_size(nand);
+	if (!ctx->oob_buffer_size)
+		ctx->oob_buffer_size = nanddev_per_page_oobsize(nand);
+
+	total_buffer_size = ctx->page_buffer_size + ctx->oob_buffer_size;
+
+	ctx->spare_databuf = kzalloc(total_buffer_size, GFP_KERNEL);
+	if (!ctx->spare_databuf)
+		return -ENOMEM;
+
+	ctx->spare_oobbuf = ctx->spare_databuf + ctx->page_buffer_size;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_ecc_init_req_tweaking);
+
+void nand_ecc_cleanup_req_tweaking(struct nand_ecc_req_tweak_ctx *ctx)
+{
+	kfree(ctx->spare_databuf);
+}
+EXPORT_SYMBOL_GPL(nand_ecc_cleanup_req_tweaking);
+
+/*
+ * Ensure data and OOB area is fully read/written otherwise the correction might
+ * not work as expected.
+ */
+void nand_ecc_tweak_req(struct nand_ecc_req_tweak_ctx *ctx,
+			struct nand_page_io_req *req)
+{
+	struct nand_device *nand = ctx->nand;
+	struct nand_page_io_req *orig, *tweak;
+
+	/* Save the original request */
+	ctx->orig_req = *req;
+	ctx->bounce_data = false;
+	ctx->bounce_oob = false;
+	orig = &ctx->orig_req;
+	tweak = req;
+
+	/* Ensure the request covers the entire page */
+	if (true) {//todo (orig->datalen < nanddev_page_size(nand)) {
+		ctx->bounce_data = true;
+		tweak->dataoffs = 0;
+		tweak->datalen = nanddev_page_size(nand);
+		tweak->databuf.in = ctx->spare_databuf;
+		memset(tweak->databuf.in, 0xFF, ctx->page_buffer_size);
+	}
+
+	if (true) {//todo (orig->ooblen < nanddev_per_page_oobsize(nand)) {
+		ctx->bounce_oob = true;
+		tweak->ooboffs = 0;
+		tweak->ooblen = nanddev_per_page_oobsize(nand);
+		tweak->oobbuf.in = ctx->spare_oobbuf;
+		memset(tweak->oobbuf.in, 0xFF, ctx->oob_buffer_size);
+	}
+
+	/* Copy the data that must be writen in the bounce buffers, if needed */
+	if (orig->type == NAND_PAGE_WRITE) {
+		if (ctx->bounce_data)
+			memcpy((void *)tweak->databuf.out + orig->dataoffs,
+			       orig->databuf.out, orig->datalen);
+
+		if (ctx->bounce_oob)
+			memcpy((void *)tweak->oobbuf.out + orig->ooboffs,
+			       orig->oobbuf.out, orig->ooblen);
+	}
+}
+EXPORT_SYMBOL_GPL(nand_ecc_tweak_req);
+
+void nand_ecc_restore_req(struct nand_ecc_req_tweak_ctx *ctx,
+			  struct nand_page_io_req *req)
+{
+	struct nand_page_io_req *orig, *tweak;
+
+	orig = &ctx->orig_req;
+	tweak = req;
+
+	/* Restore the data read from the bounce buffers, if needed */
+	if (orig->type == NAND_PAGE_READ) {
+		if (ctx->bounce_data)
+			memcpy(orig->databuf.in,
+			       tweak->databuf.in + orig->dataoffs,
+			       orig->datalen);
+
+		if (ctx->bounce_oob)
+			memcpy(orig->oobbuf.in,
+			       tweak->oobbuf.in + orig->ooboffs,
+			       orig->ooblen);
+	}
+
+	/* Ensure the original request is restored */
+	*req = *orig;
+}
+EXPORT_SYMBOL_GPL(nand_ecc_restore_req);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 697ea2474a7c..36e4fe08d0ea 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -278,6 +278,38 @@ int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req);
 bool nand_ecc_is_strong_enough(struct nand_device *nand);
 
+/**
+ * struct nand_ecc_req_tweak_ctx - Help for automatically tweaking requests
+ * @orig_req: Pointer to the original IO request
+ * @nand: Related NAND device, to have access to its memory organization
+ * @page_buffer_size: Real size of the page buffer to use (can be set by the
+ *                    user before the tweaking mechanism initialization)
+ * @oob_buffer_size: Real size of the OOB buffer to use (can be set by the
+ *                   user before the tweaking mechanism initialization)
+ * @spare_databuf: Data bounce buffer
+ * @spare_oobbuf: OOB bounce buffer
+ * @bounce_data: Flag indicating a data bounce buffer is used
+ * @bounce_oob: Flag indicating an OOB bounce buffer is used
+ */
+struct nand_ecc_req_tweak_ctx {
+	struct nand_page_io_req orig_req;
+	struct nand_device *nand;
+	unsigned int page_buffer_size;
+	unsigned int oob_buffer_size;
+	void *spare_databuf;
+	void *spare_oobbuf;
+	bool bounce_data;
+	bool bounce_oob;
+};
+
+int nand_ecc_init_req_tweaking(struct nand_ecc_req_tweak_ctx *ctx,
+			       struct nand_device *nand);
+void nand_ecc_cleanup_req_tweaking(struct nand_ecc_req_tweak_ctx *ctx);
+void nand_ecc_tweak_req(struct nand_ecc_req_tweak_ctx *ctx,
+			struct nand_page_io_req *req);
+void nand_ecc_restore_req(struct nand_ecc_req_tweak_ctx *ctx,
+			  struct nand_page_io_req *req);
+
 /**
  * struct nand_ecc - Information relative to the ECC
  * @defaults: Default values, depend on the underlying subsystem
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
