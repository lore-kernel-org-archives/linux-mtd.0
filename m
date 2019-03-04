Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E303FC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:15:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF372206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MZwyi0eq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF372206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVtNKIagwR+BI3raZ3tVvpIomQ13AwlgfXOtH+jEFso=; b=MZwyi0eqh2Y5gA
	X9mUX5zzniLJVaQHS47XwXk+zf+KotsjbaWMLR5FRnwXcljznV/+dQrREpeg3xWT+XHVBnzeQlXkk
	35edDJ/Odrli9pmvMh/Ik+p5o/DbLM8v3iqMFHxPmMcjqgO4WkXC4MRzyCOxx61GaA2s4Ew8SKkpc
	5otjEvyRRdrBwIBRBY2z7xV+meTUzxdWqxJ6hq+iIpDz9BgTJotuktttobmi+8LXM7Wx8qvtsMr+M
	vsFXFrs/C71evwFMxyjyYURHRlxIVDVust9vgGk6YzVXRXL4J7LuIq0fbJxRl1b8kaQoKEP8HAjSR
	X/Fg+tXbUyhvnZCccHqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0u0C-00072h-OV; Mon, 04 Mar 2019 20:15:56 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u02-0006t2-FB; Mon, 04 Mar 2019 20:15:48 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DDED0240007;
 Mon,  4 Mar 2019 20:15:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 01/15] mtd: nand: Add max_bad_eraseblocks_per_lun info to
 memorg
Date: Mon,  4 Mar 2019 21:15:08 +0100
Message-Id: <20190304201522.11323-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_121546_810978_94967475 
X-CRM114-Status: GOOD (  16.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

NAND datasheets usually give the maximum number of bad blocks per LUN
and this number can be used to help upper layers decide how much blocks
they should reserve for bad block handling.

Add a max_bad_eraseblocks_per_lun to the nand_memory_organization
struct and update the NAND_MEMORG() macro (and its users) accordingly.

We also provide a default mtd->_max_bad_blocks() implementation.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/core.c           | 34 +++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/gigadevice.c |  6 +++---
 drivers/mtd/nand/spi/macronix.c   |  4 ++--
 drivers/mtd/nand/spi/micron.c     |  2 +-
 drivers/mtd/nand/spi/toshiba.c    |  2 +-
 drivers/mtd/nand/spi/winbond.c    |  4 ++--
 include/linux/mtd/nand.h          |  6 +++++-
 7 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index e6554b401813..0a2be5e6d669 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -173,6 +173,40 @@ int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo)
 }
 EXPORT_SYMBOL_GPL(nanddev_mtd_erase);
 
+/**
+ * nanddev_mtd_max_bad_blocks() - Get the maximum number of bad eraseblock on
+ *				  a specific region of the NAND device
+ * @mtd: MTD device
+ * @offs: offset of the NAND region
+ * @len: length of the NAND region
+ *
+ * Default implementation for mtd->_max_bad_blocks(). Only works if
+ * nand->memorg.max_bad_eraseblocks_per_lun is > 0.
+ *
+ * Return: a positive number encoding the maximum number of eraseblocks on a
+ * portion of memory, a negative error code otherwise.
+ */
+int nanddev_mtd_max_bad_blocks(struct mtd_info *mtd, loff_t offs, size_t len)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct nand_pos pos, end;
+	unsigned int max_bb = 0;
+
+	if (!nand->memorg.max_bad_eraseblocks_per_lun)
+		return -ENOTSUPP;
+
+	nanddev_offs_to_pos(nand, offs, &pos);
+	nanddev_offs_to_pos(nand, offs + len, &end);
+
+	for (nanddev_offs_to_pos(nand, offs, &pos);
+	     nanddev_pos_cmp(&pos, &end) < 0;
+	     nanddev_pos_next_lun(nand, &pos))
+		max_bb += nand->memorg.max_bad_eraseblocks_per_lun;
+
+	return max_bb;
+}
+EXPORT_SYMBOL_GPL(nanddev_mtd_max_bad_blocks);
+
 /**
  * nanddev_init() - Initialize a NAND device
  * @nand: NAND device
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e4141c20947a..c434fbed3ce5 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -88,7 +88,7 @@ static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
 
 static const struct spinand_info gigadevice_spinand_table[] = {
 	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
@@ -97,7 +97,7 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
 				     gd5fxgq4xa_ecc_get_status)),
 	SPINAND_INFO("GD5F2GQ4xA", 0xF2,
-		     NAND_MEMORG(1, 2048, 64, 64, 2048, 1, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
@@ -106,7 +106,7 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
 				     gd5fxgq4xa_ecc_get_status)),
 	SPINAND_INFO("GD5F4GQ4xA", 0xF4,
-		     NAND_MEMORG(1, 2048, 64, 64, 4096, 1, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 4096, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 98f6b9c4b684..c6300d9d63f9 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -94,7 +94,7 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB", 0x12,
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 40, 1, 1, 1),
 		     NAND_ECCREQ(4, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
@@ -103,7 +103,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF2GE4AB", 0x22,
-		     NAND_MEMORG(1, 2048, 64, 64, 2048, 2, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 20, 2, 1, 1),
 		     NAND_ECCREQ(4, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 9c4381d6847b..7d7b1f7fcf71 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -92,7 +92,7 @@ static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
 
 static const struct spinand_info micron_spinand_table[] = {
 	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
-		     NAND_MEMORG(1, 2048, 128, 64, 2048, 2, 1, 1),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 081265557e70..00ddab08e6c6 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -95,7 +95,7 @@ static int tc58cvg2s0h_ecc_get_status(struct spinand_device *spinand,
 
 static const struct spinand_info toshiba_spinand_table[] = {
 	SPINAND_INFO("TC58CVG2S0H", 0xCD,
-		     NAND_MEMORG(1, 4096, 256, 64, 2048, 1, 1, 1),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 5d944580b898..a6c17e0cace8 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -76,7 +76,7 @@ static int w25m02gv_select_target(struct spinand_device *spinand,
 
 static const struct spinand_info winbond_spinand_table[] = {
 	SPINAND_INFO("W25M02GV", 0xAB,
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 2),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 2),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
@@ -85,7 +85,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
 	SPINAND_INFO("W25N01GV", 0xAA,
-		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7f53ece2c039..d32bb623d532 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -19,6 +19,7 @@
  * @oobsize: OOB area size
  * @pages_per_eraseblock: number of pages per eraseblock
  * @eraseblocks_per_lun: number of eraseblocks per LUN (Logical Unit Number)
+ * @max_bad_eraseblocks_per_lun: maximum number of eraseblocks per LUN
  * @planes_per_lun: number of planes per LUN
  * @luns_per_target: number of LUN per target (target is a synonym for die)
  * @ntargets: total number of targets exposed by the NAND device
@@ -29,18 +30,20 @@ struct nand_memory_organization {
 	unsigned int oobsize;
 	unsigned int pages_per_eraseblock;
 	unsigned int eraseblocks_per_lun;
+	unsigned int max_bad_eraseblocks_per_lun;
 	unsigned int planes_per_lun;
 	unsigned int luns_per_target;
 	unsigned int ntargets;
 };
 
-#define NAND_MEMORG(bpc, ps, os, ppe, epl, ppl, lpt, nt)	\
+#define NAND_MEMORG(bpc, ps, os, ppe, epl, mbb, ppl, lpt, nt)	\
 	{							\
 		.bits_per_cell = (bpc),				\
 		.pagesize = (ps),				\
 		.oobsize = (os),				\
 		.pages_per_eraseblock = (ppe),			\
 		.eraseblocks_per_lun = (epl),			\
+		.max_bad_eraseblocks_per_lun = (mbb),		\
 		.planes_per_lun = (ppl),			\
 		.luns_per_target = (lpt),			\
 		.ntargets = (nt),				\
@@ -729,5 +732,6 @@ static inline bool nanddev_bbt_is_initialized(struct nand_device *nand)
 
 /* MTD -> NAND helper functions. */
 int nanddev_mtd_erase(struct mtd_info *mtd, struct erase_info *einfo);
+int nanddev_mtd_max_bad_blocks(struct mtd_info *mtd, loff_t offs, size_t len);
 
 #endif /* __LINUX_MTD_NAND_H */
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
