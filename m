Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BB310A88E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THAukNZtr5KqhrLtumgtatkqCfSCDRzgC87/Z8npSgs=; b=TmkFAgRzxepH91
	lI0vn/DVhc3tKVXW77Ix3VMlCPWQrULHlawV+ERV4j6YJA66ucY7ApvbQTH1K9Nos3/WORbA6nEkZ
	ZvdyqvLXriGHhBXf3VvlOndiNsP6oq+assbd5zSlYeTVLMBmG3ZCvPSHdNGYr6NfFiOwyEfnetvfY
	uGuOXIadctre5Kd5ZYgif/HYx5afeTq7rW24McoiMZldVc6QqLmugMuXNd8Q6DplA2rRidQ5QXM4J
	KhD9eD5lJXix8+2wgKUo58/r9esZmDFV6QAWmPebzCc3C7RovoJmUOeqdENKNvP4VZyiCpDjnGCdV
	K2rdxlXHG0bJcoUIzU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXK-00000005qdY-03z5;
	Thu, 26 Mar 2026 16:26:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXE-00000005qZz-3Wf0
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:26:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6769C1A300A;
	Thu, 26 Mar 2026 16:26:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 370DB601FA;
	Thu, 26 Mar 2026 16:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A616F10450C95;
	Thu, 26 Mar 2026 17:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774542374; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lFv1r9faEQTu1UkMy2vWIxsC6tbdpaaG5r+kI87RNaQ=;
	b=FX+aXyR+ZQsx+lELxkC4W095Bv8MkKG/9OTCbji+dUaqS65mJiWgCk0ASLmRNqcL3iwEzS
	T2ZkfcTlE5B/JcSuQ3YOvob6hCeUYSlNCe0g9NkIUk9nq1VonjwevpGMQzQ1x13yOg5t0b
	1C0uypUPLqEAxwHNkz2Kjh90/pwE14rGCyAOJ2rfhIh6GyUMUbRxBJHXw1UlonDort14bT
	6bBpVV5o8lDaRaKJEfZRTFvXZDVLyE4u+WX7Ar5D2mPzXFbM5e0iYnyRlF8ePvjSTGctTm
	ns/IF97kyBQ1dHiCKbQ2hBKfoCZoBbvw4BWtPWoR0niCRSq1OmLBkth9JDsUjw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:25:53 +0100
Subject: [PATCH v2 06/11] mtd: spinand: Use secondary ops for continuous
 reads
MIME-Version: 1.0
Message-Id: <20260326-winbond-v6-18-rc1-cont-read-v2-6-643de97a68a3@bootlin.com>
References: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
In-Reply-To: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_092617_025731_2DE11D58 
X-CRM114-Status: GOOD (  22.80  )
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

In case a chip supports continuous reads, but uses a slightly different
cache operation for these, it may provide a secondary operation template
which will be used only during continuous cache read operations.

From a vendor driver point of view, enabling this feature implies
providing a new set of templates for these continuous read
operations. The core will automatically pick the fastest variant,
depending on the hardware capabilities.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 61 ++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spinand.h | 12 +++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index a66510747b31..45c3afb9cceb 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -489,6 +489,11 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 
 	rdesc = spinand->dirmaps[req->pos.plane].rdesc;
 
+	if (spinand->op_templates->cont_read_cache && req->continuous)
+		rdesc->info.op_tmpl = &rdesc->info.secondary_op_tmpl;
+	else
+		rdesc->info.op_tmpl = &rdesc->info.primary_op_tmpl;
+
 	if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED &&
 	    req->mode != MTD_OPS_RAW)
 		rdesc->info.op_tmpl->data.ecc = true;
@@ -1221,6 +1226,7 @@ static struct spi_mem_dirmap_desc *spinand_create_rdesc(
 		 * its spi controller, use regular reading
 		 */
 		spinand->cont_read_possible = false;
+		memset(&info->secondary_op_tmpl, 0, sizeof(info->secondary_op_tmpl));
 
 		info->length = nanddev_page_size(nand) +
 			       nanddev_per_page_oobsize(nand);
@@ -1237,11 +1243,24 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct spi_mem_dirmap_info info = { 0 };
 	struct spi_mem_dirmap_desc *desc;
-	bool enable_ecc = false;
+	bool enable_ecc = false, secondary_op = false;
 
 	if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED)
 		enable_ecc = true;
 
+	if (spinand->cont_read_possible && spinand->op_templates->cont_read_cache)
+		secondary_op = true;
+
+	/*
+	 * Continuous read implies that only the main data is retrieved, backed
+	 * by an on-die ECC engine. It is not possible to use a pipelind ECC
+	 * engine with continuous read.
+	 */
+	if (enable_ecc && secondary_op) {
+		secondary_op = false;
+		spinand->cont_read_possible = false;
+	}
+
 	/* The plane number is passed in MSB just above the column address */
 	info.offset = plane << fls(nand->memorg.pagesize);
 
@@ -1259,6 +1278,10 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	/* Read descriptor */
 	info.primary_op_tmpl = *spinand->op_templates->read_cache;
 	info.primary_op_tmpl.data.ecc = enable_ecc;
+	if (secondary_op) {
+		info.secondary_op_tmpl = *spinand->op_templates->cont_read_cache;
+		info.secondary_op_tmpl.data.ecc = enable_ecc;
+	}
 	desc = spinand_create_rdesc(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
@@ -1607,6 +1630,33 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		if (ret)
 			return ret;
 
+		if (info->op_variants.cont_read_cache) {
+			op = spinand_select_op_variant(spinand, SSDR,
+						       info->op_variants.cont_read_cache);
+			if (op) {
+				const struct spi_mem_op *read_op;
+
+				read_op = spinand->ssdr_op_templates.read_cache;
+
+				/*
+				 * Sometimes the fastest continuous read variant may not
+				 * be supported. In this case, prefer to use the fastest
+				 * read from cache variant and disable continuous reads.
+				 */
+				if (read_op->cmd.buswidth > op->cmd.buswidth ||
+				    (read_op->cmd.dtr && !op->cmd.dtr) ||
+				    read_op->addr.buswidth > op->addr.buswidth ||
+				    (read_op->addr.dtr && !op->addr.dtr) ||
+				    read_op->data.buswidth > op->data.buswidth ||
+				    (read_op->data.dtr && !op->data.dtr))
+					spinand->cont_read_possible = false;
+				else
+					spinand->ssdr_op_templates.cont_read_cache = op;
+			} else {
+				spinand->cont_read_possible = false;
+			}
+		}
+
 		/* I/O variants selection with octo-spi DDR commands (optional) */
 
 		ret = spinand_init_odtr_instruction_set(spinand);
@@ -1629,6 +1679,15 @@ int spinand_match_and_init(struct spinand_device *spinand,
 					       info->op_variants.update_cache);
 		spinand->odtr_op_templates.update_cache = op;
 
+		if (info->op_variants.cont_read_cache) {
+			op = spinand_select_op_variant(spinand, ODTR,
+						       info->op_variants.cont_read_cache);
+			if (op)
+				spinand->odtr_op_templates.cont_read_cache = op;
+			else
+				spinand->cont_read_possible = false;
+		}
+
 		return 0;
 	}
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index bbf17c346887..aab17e2c8ac9 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -575,6 +575,7 @@ enum spinand_bus_interface {
  * @op_variants.read_cache: variants of the read-cache operation
  * @op_variants.write_cache: variants of the write-cache operation
  * @op_variants.update_cache: variants of the update-cache operation
+ * @op_variants.cont_read_cache: variants of the continuous read-cache operation
  * @vendor_ops: vendor specific operations
  * @select_target: function used to select a target/die. Required only for
  *		   multi-die chips
@@ -599,6 +600,7 @@ struct spinand_info {
 		const struct spinand_op_variants *read_cache;
 		const struct spinand_op_variants *write_cache;
 		const struct spinand_op_variants *update_cache;
+		const struct spinand_op_variants *cont_read_cache;
 	} op_variants;
 	const struct spinand_op_variants *vendor_ops;
 	int (*select_target)(struct spinand_device *spinand,
@@ -628,6 +630,14 @@ struct spinand_info {
 		.update_cache = __update,				\
 	}
 
+#define SPINAND_INFO_OP_VARIANTS_WITH_CONT(__read, __write, __update, __cont_read) \
+	{								\
+		.read_cache = __read,					\
+		.write_cache = __write,					\
+		.update_cache = __update,				\
+		.cont_read_cache = __cont_read,				\
+	}
+
 #define SPINAND_INFO_VENDOR_OPS(__ops)					\
 	.vendor_ops = __ops
 
@@ -699,6 +709,7 @@ struct spinand_dirmap {
  * @read_cache: read cache op template
  * @write_cache: write cache op template
  * @update_cache: update cache op template
+ * @cont_read_cache: continuous read cache op template (optional)
  */
 struct spinand_mem_ops {
 	struct spi_mem_op reset;
@@ -713,6 +724,7 @@ struct spinand_mem_ops {
 	const struct spi_mem_op *read_cache;
 	const struct spi_mem_op *write_cache;
 	const struct spi_mem_op *update_cache;
+	const struct spi_mem_op *cont_read_cache;
 };
 
 /**

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
