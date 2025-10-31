Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912CACCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtU0POPsbw7H/PLpSmB3p88WlmD/FCD1APfNRIDlaD8=; b=wSUxBjsGa8XatY
	aai9rhz3aceA/J6bHsxbhFwArQ/waXyRyFwBlUiUnzSHT2eVxV//lXGDUXVV8KOJu6RKDCjlzE4WN
	VdYp+gl0zfIhBLOk1ggm/wZMmTVfLX5vV5jW7bGh9GmYZLPEVDZic+qXP2pMGYAsEre4j61jhbKv9
	RWoHDwf5CMBeATD7uBk4pMATvGa6p9WKh4/BuYIsVLmQsuN4167G+9BkSAIjOtA8wrl9FvAoVFm03
	Sv+hjFMhOyaZXfh0gVtdro9Mlu0TNZhYP0xn9vsUWybliTmmGXR60Ot64v//PAGOwvjqg/xBj8Prv
	+mqSXStdwhHyI8mH4C5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsw2-00000006V4z-0fal;
	Fri, 31 Oct 2025 17:29:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvQ-00000006ULp-0Cti
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8C32E4E41442;
	Fri, 31 Oct 2025 17:28:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62E5960704;
	Fri, 31 Oct 2025 17:28:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C039411818007;
	Fri, 31 Oct 2025 18:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZnZdiNJPbIqvHm/HDag2fb8foKcg/2VPHnNDy+534Sc=;
	b=gpthj2FszYm3wOTAqiSK3W+RfJBtylUVIZ+zV2ruI3xuhvmtaMrXhuh1XzdpXJsAHq+R1o
	89HHVe7LwxFqaQtm2lv/PCN7OSQ2UNeeX07xooxQ9mFgz7moCStfaOwJCXraDPze8FPCP5
	Y+80heOSuOgs3I2tDYLWGCNACHSVw2IZV0rG5DICtcoo5Kke4mNRBVZ1eN3Tcem3tbc+n4
	gmAkF7E7zQ/LP1DjWcpgG3QaQzwCIQlkqIqbUtKzC2WE+qVF74XUVFQVEemEK6s6eA0yVi
	U4MzWcqcBUU7ayKKvKgmE8VORtMuM3g5m/HJM6lvaDDHO3L3X/4NVy4D8405UA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:59 +0100
Subject: [PATCH 15/28] mtd: spinand: List vendor specific operations and
 make sure they are supported
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-15-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102832_419496_3853DA48 
X-CRM114-Status: GOOD (  17.36  )
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
index d4f46a17f77e15ac0ab26397e88d37119636b003..7c01516c6b6acb41d2cc080d6fbaaa5ace661602 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1338,6 +1338,27 @@ static void spinand_init_ssdr_templates(struct spinand_device *spinand)
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
@@ -1407,6 +1428,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 	u8 *id = spinand->id.data;
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int i;
+	int ret;
 
 	for (i = 0; i < table_size; i++) {
 		const struct spinand_info *info = &table[i];
@@ -1452,6 +1474,10 @@ int spinand_match_and_init(struct spinand_device *spinand,
 
 		spinand->ssdr_op_templates.update_cache = op;
 
+		ret = spinand_support_vendor_ops(spinand, info);
+		if (ret)
+			return ret;
+
 		return 0;
 	}
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index a8fd04a67cfa9925bd68c57539d86e0816b76274..0565cdeb3f7b652699d420a8c05c3fe53fcc2253 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -492,6 +492,7 @@ struct spinand_user_otp {
  * @op_variants.read_cache: variants of the read-cache operation
  * @op_variants.write_cache: variants of the write-cache operation
  * @op_variants.update_cache: variants of the update-cache operation
+ * @vendor_ops: vendor specific operations
  * @select_target: function used to select a target/die. Required only for
  *		   multi-die chips
  * @configure_chip: Align the chip configuration with the core settings
@@ -516,6 +517,7 @@ struct spinand_info {
 		const struct spinand_op_variants *write_cache;
 		const struct spinand_op_variants *update_cache;
 	} op_variants;
+	const struct spinand_op_variants *vendor_ops;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
 	int (*configure_chip)(struct spinand_device *spinand);
@@ -542,6 +544,9 @@ struct spinand_info {
 		.update_cache = __update,				\
 	}
 
+#define SPINAND_INFO_VENDOR_OPS(__ops)					\
+	.vendor_ops = __ops
+
 #define SPINAND_ECCINFO(__ooblayout, __get_status)			\
 	.eccinfo = {							\
 		.ooblayout = __ooblayout,				\

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
