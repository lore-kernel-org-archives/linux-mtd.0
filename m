Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9B0D26D7B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yE76fMGm7Zm+X1EghJ8lYeQJQdELImU2KTuWr0hX8nw=; b=RJA2mCwMRFApGC
	0PziUWkn3v43Rd9dbF4tDulwrnJOtoP4qeqJFZ0Mz0o/nLtC/0tPX8ojEgMX60PS04hEtjbHzgzU6
	5ZTrgsLIufSXO74v6b049SKotq5orN7Y2c+PV1S4Pbuqz/bcfpqbZzm9l8qquIxuG25yfQ2Hfv4dA
	oYjQTedJty/t6iJwa4dCkxhPbm3//mtCqa4KsLaLl3qPyKcN2bAlUApftqWT7gPjvrLYe1esQZqzr
	tRcuEKGPH8yHoXXurLZ5Rwp9i1BAnHACDnaZYn6HuIf94hEYQiU3pgC+Le1XUfd9g5q2tkUYQduK7
	rmiOMmY440uXvz93lNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8A-00000002lxC-3GRA;
	Fri, 09 Jan 2026 17:18:34 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG87-00000002lrg-2MR9
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 29A754E4202A;
	Fri,  9 Jan 2026 17:18:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2696606C6;
	Fri,  9 Jan 2026 17:18:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C7F8103C89B1;
	Fri,  9 Jan 2026 18:18:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C+NW7ufPtXAo90lRbqvpylIj3Nw7aLGrnWQNApnc12c=;
	b=geYncy1IUnZfeLV1g2M2kua6pOdWbNq9sZC7EbCL0Sm6YcBXJ9akT191QBKtkKEeVmkFKA
	2NaVsSc+SB8nwUD8wDC9rjRGy8bFASsa689lVMEqmTED5I6WOdTP7TBiTszX++6JN2LN+L
	QBlCxnpusTuZ9ekhDpzGyad3c65cYE4HfEq0sb8n9UAmiHaw5w0OtC4uE+FPb6sI19ZFdV
	b6DSceNRb1PmOlDfvGBfh4OV4obW0/aE0t42Gs34TtcS18ymaSA64dzygD8ORdrW2HuehS
	GkreL4Hhmq2d00V/d8Y6gB/wOHt3x2ROTpjdaDcLK//djjXNQsjb/1QSBtX/Vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:07 +0100
Subject: [PATCH v2 09/27] mtd: spinand: Create an array of operation
 templates
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-9-1fff6a2ddb80@bootlin.com>
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
X-CRM114-CacheID: sfid-20260109_091831_882491_1959A54A 
X-CRM114-Status: GOOD (  19.07  )
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

Currently, the SPI NAND core implementation directly calls macros to get
the various operations in shape. These macros are specific to the bus
interface, currently only supporting the single SDR interface (any
command following the 1S-XX-XX pattern).

Introducing support for other bus interfaces (such as octal DTR) would
mean that every user of these macros should become aware of the current
bus interface and act accordingly, picking up and adapting to the
current configuration. This would add quite a bit of boilerplate, be
repetitive as well as error prone in case we miss one occurrence.

Instead, let's create a table with all SPI NAND memory operations that
are currently supported. We initialize them with the same single SDR _OP
macros as before. This opens the possibility for users of the individual
macros to make use of these templates instead. This way, when we will add
another bus interface, we can just switch to another set of templates
and all users will magically fill in their spi_mem_op structures with
the correct ops.

The existing read, write and update cache variants are also moved in
this template array, which is barely noticeable by callers as we also
add a structure member pointing to it.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c    | 38 +++++++++++++++++++++++++++----------
 drivers/mtd/nand/spi/winbond.c |  4 ++--
 include/linux/mtd/spinand.h    | 43 +++++++++++++++++++++++++++++++++---------
 3 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b6613f2651bd..3e1b6c6c6a22 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -184,9 +184,9 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 	if (!(spinand->flags & SPINAND_HAS_QE_BIT))
 		return 0;
 
-	if (spinand->op_templates.read_cache->data.buswidth == 4 ||
-	    spinand->op_templates.write_cache->data.buswidth == 4 ||
-	    spinand->op_templates.update_cache->data.buswidth == 4)
+	if (spinand->op_templates->read_cache->data.buswidth == 4 ||
+	    spinand->op_templates->write_cache->data.buswidth == 4 ||
+	    spinand->op_templates->update_cache->data.buswidth == 4)
 		enable = true;
 
 	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE,
@@ -1154,7 +1154,7 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	info.offset = plane << fls(nand->memorg.pagesize);
 
 	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
-	info.op_tmpl = *spinand->op_templates.update_cache;
+	info.op_tmpl = *spinand->op_templates->update_cache;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
 					  spinand->spimem, &info);
 	if (IS_ERR(desc))
@@ -1162,7 +1162,7 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc = desc;
 
-	info.op_tmpl = *spinand->op_templates.read_cache;
+	info.op_tmpl = *spinand->op_templates->read_cache;
 	desc = spinand_create_rdesc(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
@@ -1177,7 +1177,7 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	}
 
 	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
-	info.op_tmpl = *spinand->op_templates.update_cache;
+	info.op_tmpl = *spinand->op_templates->update_cache;
 	info.op_tmpl.data.ecc = true;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
 					  spinand->spimem, &info);
@@ -1186,7 +1186,7 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc_ecc = desc;
 
-	info.op_tmpl = *spinand->op_templates.read_cache;
+	info.op_tmpl = *spinand->op_templates->read_cache;
 	info.op_tmpl.data.ecc = true;
 	desc = spinand_create_rdesc(spinand, &info);
 	if (IS_ERR(desc))
@@ -1323,6 +1323,22 @@ static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
 		return spinand->manufacturer->ops->cleanup(spinand);
 }
 
+static void spinand_init_ssdr_templates(struct spinand_device *spinand)
+{
+	struct spinand_mem_ops *tmpl = &spinand->ssdr_op_templates;
+
+	tmpl->reset = (struct spi_mem_op)SPINAND_RESET_1S_0_0_OP;
+	tmpl->readid = (struct spi_mem_op)SPINAND_READID_1S_1S_1S_OP(0, 0, NULL, 0);
+	tmpl->wr_en = (struct spi_mem_op)SPINAND_WR_EN_1S_0_0_OP;
+	tmpl->wr_dis = (struct spi_mem_op)SPINAND_WR_DIS_1S_0_0_OP;
+	tmpl->set_feature = (struct spi_mem_op)SPINAND_SET_FEATURE_1S_1S_1S_OP(0, NULL);
+	tmpl->get_feature = (struct spi_mem_op)SPINAND_GET_FEATURE_1S_1S_1S_OP(0, NULL);
+	tmpl->blk_erase = (struct spi_mem_op)SPINAND_BLK_ERASE_1S_1S_0_OP(0);
+	tmpl->page_read = (struct spi_mem_op)SPINAND_PAGE_READ_1S_1S_0_OP(0);
+	tmpl->prog_exec = (struct spi_mem_op)SPINAND_PROG_EXEC_1S_1S_0_OP(0);
+	spinand->op_templates = &spinand->ssdr_op_templates;
+}
+
 static const struct spi_mem_op *
 spinand_select_op_variant(struct spinand_device *spinand,
 			  const struct spinand_op_variants *variants)
@@ -1421,21 +1437,21 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		if (!op)
 			return -EOPNOTSUPP;
 
-		spinand->op_templates.read_cache = op;
+		spinand->ssdr_op_templates.read_cache = op;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.write_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
-		spinand->op_templates.write_cache = op;
+		spinand->ssdr_op_templates.write_cache = op;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.update_cache);
 		if (!op)
 			return -EOPNOTSUPP;
 
-		spinand->op_templates.update_cache = op;
+		spinand->ssdr_op_templates.update_cache = op;
 
 		return 0;
 	}
@@ -1550,6 +1566,8 @@ static int spinand_init(struct spinand_device *spinand)
 	if (!spinand->scratchbuf)
 		return -ENOMEM;
 
+	spinand_init_ssdr_templates(spinand);
+
 	ret = spinand_detect(spinand);
 	if (ret)
 		goto err_free_bufs;
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 4870b2d5edb2..d5799c2df065 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -291,7 +291,7 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand)
 	u8 sr4;
 	int ret;
 
-	op = spinand->op_templates.read_cache;
+	op = spinand->op_templates->read_cache;
 	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
 		hs = false;
 	else if (op->cmd.buswidth == 1 && op->addr.buswidth == 1 &&
@@ -355,7 +355,7 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
 	u8 io_mode;
 	int ret;
 
-	op = spinand->op_templates.read_cache;
+	op = spinand->op_templates->read_cache;
 
 	single = (op->cmd.buswidth == 1 && op->addr.buswidth == 1 && op->data.buswidth == 1);
 	dtr = (op->cmd.dtr || op->addr.dtr || op->data.dtr);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index f7621b47b28f..2691b5818f77 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -599,6 +599,36 @@ struct spinand_dirmap {
 	struct spi_mem_dirmap_desc *rdesc_ecc;
 };
 
+/**
+ * struct spinand_mem_ops - SPI NAND memory operations
+ * @reset: reset op template
+ * @readid: read ID op template
+ * @wr_en: write enable op template
+ * @wr_dis: write disable op template
+ * @set_feature: set feature op template
+ * @get_feature: get feature op template
+ * @blk_erase: blk erase op template
+ * @page_read: page read op template
+ * @prog_exec: prog exec op template
+ * @read_cache: read cache op template
+ * @write_cache: write cache op template
+ * @update_cache: update cache op template
+ */
+struct spinand_mem_ops {
+	struct spi_mem_op reset;
+	struct spi_mem_op readid;
+	struct spi_mem_op wr_en;
+	struct spi_mem_op wr_dis;
+	struct spi_mem_op set_feature;
+	struct spi_mem_op get_feature;
+	struct spi_mem_op blk_erase;
+	struct spi_mem_op page_read;
+	struct spi_mem_op prog_exec;
+	const struct spi_mem_op *read_cache;
+	const struct spi_mem_op *write_cache;
+	const struct spi_mem_op *update_cache;
+};
+
 /**
  * struct spinand_device - SPI NAND device instance
  * @base: NAND device instance
@@ -606,10 +636,8 @@ struct spinand_dirmap {
  * @lock: lock used to serialize accesses to the NAND
  * @id: NAND ID as returned by READ_ID
  * @flags: NAND flags
- * @op_templates: various SPI mem op templates
- * @op_templates.read_cache: read cache op template
- * @op_templates.write_cache: write cache op template
- * @op_templates.update_cache: update cache op template
+ * @ssdr_op_templates: Templates for all single SDR SPI mem operations
+ * @op_templates: Templates for all SPI mem operations
  * @select_target: select a specific target/die. Usually called before sending
  *		   a command addressing a page or an eraseblock embedded in
  *		   this die. Only required if your chip exposes several dies
@@ -643,11 +671,8 @@ struct spinand_device {
 	struct spinand_id id;
 	u32 flags;
 
-	struct {
-		const struct spi_mem_op *read_cache;
-		const struct spi_mem_op *write_cache;
-		const struct spi_mem_op *update_cache;
-	} op_templates;
+	struct spinand_mem_ops ssdr_op_templates;
+	struct spinand_mem_ops *op_templates;
 
 	struct spinand_dirmap *dirmaps;
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
