Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC3D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzSr4AeMJ/OIS1BoOzKg7AuPHH5NLFFvi+fCV6XczkY=; b=Uy1UjuSSPiNZ1u
	BMNh2UdbfW08LPKOaLPGGeeV1CiyxOhQ/fTseCC3kFgiC+j3XWvENLI81SGhxce1bZAXoss9bqJ03
	6lihm3i7n9SkEN5WPKwsV2a59XzxvkEaGK5uSoQlnOn9uuYyJM0bjtxR75jFsqx/q6xyMf8jss3lF
	rcwaSQU2UnIIs48MiaGWYrLFLvrBWMOCeFZSmzyVtVvfJddqIIUytQw+J8433a4s+MA4zvyQNNpBT
	v7CByAUVhZRY528KyoNrkz8/lN6m5QNYyeUjNlKigpKq0DslmXP2MClPiAaBN5+vGOwBHpiTBQmes
	EJKqJ07+mSbJ2jFX/Z5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8G-00000002m8k-3i2v;
	Fri, 09 Jan 2026 17:18:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8D-00000002m0C-1uFh
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C3B81A2751;
	Fri,  9 Jan 2026 17:18:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6FDA606C6;
	Fri,  9 Jan 2026 17:18:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CF4B103C89B5;
	Fri,  9 Jan 2026 18:18:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dYZrs+RXfmLTkElRF8rJDqyvuBNMZBhyjBaevLKTgG0=;
	b=tkutj35lH9dAIxT7QJEFbQNZeOQ85inTVOh42yZIfEDabffbpwSyKIfVStzc6SnZr2Znvc
	HU+QbtGs7vemC7u+pabN1oqENrTQhVWICqEB3Y4R1qHABxsNHHdjujM9/gRCBTFq+RqmXy
	bDUhGtV6ynBYa7A//2+Ub3nenE4Qsvifi7/tQJIVio4LOkQT5Bcpaw0ITrftveVyxkzdKe
	yPFIHeLxJFm3fM1b3DtzdUORy8Kz+XY/moT6mJ1q5ixYb59QovVT2zhqka1CbYUhW77veS
	CzABnRNaDIjfKDegEsjINYCPpxIm+1mLwnf++SSIY96eBvEWzEWVKo4Wi+Njog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:12 +0100
Subject: [PATCH v2 14/27] mtd: spinand: List vendor specific operations and
 make sure they are supported
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-14-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091837_631702_0C0E7FE5 
X-CRM114-Status: GOOD (  17.80  )
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

It is probably safe to expect that all SPI controller drivers will ever
support all the most basic SPI NAND operations, such as write enable,
register reads, page program, block erases, etc. However, what about
vendor specific operations? So far nobody complained about it, but as we
are about to introduce octal DTR support, and as none of the SPI NAND
instruction set is defined in any standard, we must remain careful about
these extra operations.

One way to make sure we do not blindly get ourselves in strange
situations with vendor commands failing silently is to make the check
once for all, while probing the chip. However at this stage we have no
such list, so let's add the necessary infrastructure to allow:
- registering vendor operations,
- checking they are actually supported when appropriate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 26 ++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 609a955788fa..88d87a96ddb0 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1423,6 +1423,27 @@ static void spinand_init_ssdr_templates(struct spinand_device *spinand)
 	spinand->op_templates = &spinand->ssdr_op_templates;
 }
 
+static int spinand_support_vendor_ops(struct spinand_device *spinand,
+				      const struct spinand_info *info)
+{
+	int i;
+
+	/*
+	 * The vendor ops array is only used in order to verify this chip and all its memory
+	 * operations are supported. If we see patterns emerging, we could ideally name these
+	 * operations and define them at the SPI NAND core level instead.
+	 * For now, this only serves as a sanity check.
+	 */
+	for (i = 0; i < info->vendor_ops->nops; i++) {
+		const struct spi_mem_op *op = &info->vendor_ops->ops[i];
+
+		if (!spi_mem_supports_op(spinand->spimem, op))
+			return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
 static const struct spi_mem_op *
 spinand_select_op_variant(struct spinand_device *spinand,
 			  const struct spinand_op_variants *variants)
@@ -1492,6 +1513,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 	u8 *id = spinand->id.data;
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int i;
+	int ret;
 
 	for (i = 0; i < table_size; i++) {
 		const struct spinand_info *info = &table[i];
@@ -1537,6 +1559,10 @@ int spinand_match_and_init(struct spinand_device *spinand,
 
 		spinand->ssdr_op_templates.update_cache = op;
 
+		ret = spinand_support_vendor_ops(spinand, info);
+		if (ret)
+			return ret;
+
 		return 0;
 	}
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index f579245c90a6..88871287c739 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -493,6 +493,7 @@ struct spinand_user_otp {
  * @op_variants.read_cache: variants of the read-cache operation
  * @op_variants.write_cache: variants of the write-cache operation
  * @op_variants.update_cache: variants of the update-cache operation
+ * @vendor_ops: vendor specific operations
  * @select_target: function used to select a target/die. Required only for
  *		   multi-die chips
  * @configure_chip: Align the chip configuration with the core settings
@@ -517,6 +518,7 @@ struct spinand_info {
 		const struct spinand_op_variants *write_cache;
 		const struct spinand_op_variants *update_cache;
 	} op_variants;
+	const struct spinand_op_variants *vendor_ops;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
 	int (*configure_chip)(struct spinand_device *spinand);
@@ -543,6 +545,9 @@ struct spinand_info {
 		.update_cache = __update,				\
 	}
 
+#define SPINAND_INFO_VENDOR_OPS(__ops)					\
+	.vendor_ops = __ops
+
 #define SPINAND_ECCINFO(__ooblayout, __get_status)			\
 	.eccinfo = {							\
 		.ooblayout = __ooblayout,				\

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
