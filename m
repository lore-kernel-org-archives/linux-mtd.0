Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9772EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5oj4cjImgEbQETyehJvAV9mTEG2cToLvtOB+CJxs9g=; b=H+LeCEDOz/NoQJ
	8cq2CBZx8sXEctWWWIiKEJkI5xUMtJyRy42FzJoJi5cmp7t3ZNc+Jvcj9ZVNRfzsXpYenvIY5RiYz
	O1CdremwAgjq2LjSdNXgyLShr7dV392UFYLpc7GTmJ28shYawCWqmn6Hp3dSrqalG+XdVDgx8FX55
	efcyqDLC+Ivy7Yi3mBgbF0A07gv1hJ2K9nAa+iPEOU6kvKGn+BGVoe7MH+kwjGWIDEbsQ7/bCLOpz
	De4kBi9R4Frfk0e27cFxFUjwA3BJ6Ur6+uav1C64R7/eSysD3sFLlQrc7ay424vRASQpO2LebT37T
	dAefoinJEt4z0itUODww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7gN-008cjv-0J; Wed, 20 Apr 2022 10:35:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7fi-008cHk-U3
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650450894; x=1681986894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tpEy2gHD3aAuDswBbT3iSstEvBWSHcIGyEqbmJDrwEQ=;
 b=Iv8OJoMXwpNrJ89PFGUJ+QTffTjDD9XwmQX0SJI4hzrLb4+aoQRj4o2V
 KSV6rm9myN0LAmTdtVeRR5xURFj9Dxkd9kOz3sahGtnJhG2YK/b4oimS0
 zuGckC5/7PSnk/AeJDXgdxRrEk/ACwGaEBxzVDOWO27CCzAYMRH3y+9zd
 2nGtGSIGRcDwtgcBIjkZ7DuUYPWcEA1YZcNv3i44wUGxGx4CDv3CGG4q4
 3nurBEEI28tceGGd+MKF7FftWbXDRgMUapyNxcAeYk5l2mk3LhBC51iC/
 y4K6Z5zLyOJrIumkgV3kOMCfAsD2t3U6R/5LLxln5a1OiHDmo8qG3nCSm g==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="92939116"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:34:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:34:53 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 03:34:51 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 09/11] mtd: spi-nor: Introduce templates for SPI NOR
 operations
Date: Wed, 20 Apr 2022 13:34:25 +0300
Message-ID: <20220420103427.47867-10-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420103427.47867-1-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_033455_158888_B3591FDC 
X-CRM114-Status: GOOD (  11.44  )
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

Clean the op declaration and hide the details of each op. With this it
results a cleanner, easier to read code. No functional change expected.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Acked-by: Michael Walle <michael@walle.cc>
Acked-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c      | 101 ++++++-------------------------
 drivers/mtd/spi-nor/core.h      | 102 ++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/micron-st.c |  24 ++++----
 drivers/mtd/spi-nor/spansion.c  |  26 +++++---
 drivers/mtd/spi-nor/xilinx.c    |  12 ++--
 5 files changed, 158 insertions(+), 107 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 08bf58e5dbd1..2bfa84100d38 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -364,11 +364,7 @@ int spi_nor_write_enable(struct spi_nor *nor)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
+		struct spi_mem_op op = SPI_NOR_WREN_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -395,11 +391,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
+		struct spi_mem_op op = SPI_NOR_WRDI_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -459,11 +451,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, sr, 0));
+		struct spi_mem_op op = SPI_NOR_RDSR_OP(sr);
 
 		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
 			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
@@ -503,11 +491,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, cr, 0));
+		struct spi_mem_op op = SPI_NOR_RDCR_OP(cr);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -536,14 +520,7 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(enable ?
-						  SPINOR_OP_EN4B :
-						  SPINOR_OP_EX4B,
-						  0),
-				  SPI_MEM_OP_NO_ADDR,
-				  SPI_MEM_OP_NO_DUMMY,
-				  SPI_MEM_OP_NO_DATA);
+		struct spi_mem_op op = SPI_NOR_EN4B_EX4B_OP(enable);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -577,11 +554,7 @@ static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	nor->bouncebuf[0] = enable << 7;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BRWR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 0));
+		struct spi_mem_op op = SPI_NOR_BRWR_OP(nor->bouncebuf);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -611,11 +584,7 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
 	nor->bouncebuf[0] = ear;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREAR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 0));
+		struct spi_mem_op op = SPI_NOR_WREAR_OP(nor->bouncebuf);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -726,11 +695,7 @@ int spi_nor_global_block_unlock(struct spi_nor *nor)
 		return ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_GBULK, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
+		struct spi_mem_op op = SPI_NOR_GBULK_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -765,11 +730,7 @@ int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
 		return ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(len, sr, 0));
+		struct spi_mem_op op = SPI_NOR_WRSR_OP(sr, len);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -969,11 +930,7 @@ static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
 		return ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(1, sr2, 0));
+		struct spi_mem_op op = SPI_NOR_WRSR2_OP(sr2);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -1005,11 +962,7 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, sr2, 0));
+		struct spi_mem_op op = SPI_NOR_RDSR2_OP(sr2);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -1038,11 +991,7 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CHIP_ERASE, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
+		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
 
@@ -1184,10 +1133,8 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 0),
-				   SPI_MEM_OP_ADDR(nor->addr_width, addr, 0),
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
+			SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
+						nor->addr_width, addr);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
 
@@ -1983,10 +1930,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
 static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 				       const struct spi_nor_read_command *read)
 {
-	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(read->opcode, 0),
-					  SPI_MEM_OP_ADDR(3, 0, 0),
-					  SPI_MEM_OP_DUMMY(1, 0),
-					  SPI_MEM_OP_DATA_IN(2, NULL, 0));
+	struct spi_mem_op op = SPI_NOR_READ_OP(read->opcode);
 
 	spi_nor_spimem_setup_op(nor, &op, read->proto);
 
@@ -2009,10 +1953,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 				   const struct spi_nor_pp_command *pp)
 {
-	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(pp->opcode, 0),
-					  SPI_MEM_OP_ADDR(3, 0, 0),
-					  SPI_MEM_OP_NO_DUMMY,
-					  SPI_MEM_OP_DATA_OUT(2, NULL, 0));
+	struct spi_mem_op op = SPI_NOR_PP_OP(pp->opcode);
 
 	spi_nor_spimem_setup_op(nor, &op, pp->proto);
 
@@ -2836,10 +2777,7 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 	struct spi_mem_op op;
 	int ret;
 
-	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 0),
-			SPI_MEM_OP_NO_DUMMY,
-			SPI_MEM_OP_NO_ADDR,
-			SPI_MEM_OP_NO_DATA);
+	op = (struct spi_mem_op)SPINOR_SRSTEN_OP;
 
 	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
@@ -2849,10 +2787,7 @@ static void spi_nor_soft_reset(struct spi_nor *nor)
 		return;
 	}
 
-	op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 0),
-			SPI_MEM_OP_NO_DUMMY,
-			SPI_MEM_OP_NO_ADDR,
-			SPI_MEM_OP_NO_DATA);
+	op = (struct spi_mem_op)SPINOR_SRST_OP;
 
 	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 62ddadba0c33..658ed1779faa 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -18,6 +18,108 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 0))
 
+#define SPI_NOR_WREN_OP							\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPI_NOR_WRDI_OP							\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRDI, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPI_NOR_RDSR_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_IN(1, buf, 0))
+
+#define SPI_NOR_WRSR_OP(buf, len)					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(len, buf, 0))
+
+#define SPI_NOR_RDSR2_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
+#define SPI_NOR_WRSR2_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
+#define SPI_NOR_RDCR_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_IN(1, buf, 0))
+
+#define SPI_NOR_EN4B_EX4B_OP(enable)					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B, 0),	\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPI_NOR_BRWR_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_BRWR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
+#define SPI_NOR_WREAR_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREAR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
+#define SPI_NOR_GBULK_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_GBULK, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPI_NOR_CHIP_ERASE_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CHIP_ERASE, 0),		\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPI_NOR_SECTOR_ERASE_OP(opcode, addr_width, addr)		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
+		   SPI_MEM_OP_ADDR(addr_width, addr, 0),		\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPI_NOR_READ_OP(opcode)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
+		   SPI_MEM_OP_ADDR(3, 0, 0),				\
+		   SPI_MEM_OP_DUMMY(1, 0),				\
+		   SPI_MEM_OP_DATA_IN(2, NULL, 0))
+
+#define SPI_NOR_PP_OP(opcode)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
+		   SPI_MEM_OP_ADDR(3, 0, 0),				\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(2, NULL, 0))
+
+#define SPINOR_SRSTEN_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 0),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DATA)
+
+#define SPINOR_SRST_OP							\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 0),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DATA)
+
 enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB	= BIT(0),
 	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index ce62e6be8fd2..61db4896e327 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -35,6 +35,18 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
+#define MICRON_ST_RDFSR_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_IN(1, buf, 0))
+
+#define MICRON_ST_CLFSR_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
 static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
@@ -324,11 +336,7 @@ static int micron_st_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, fsr, 0));
+		struct spi_mem_op op = MICRON_ST_RDFSR_OP(fsr);
 
 		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
 			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
@@ -363,11 +371,7 @@ static void micron_st_nor_clear_fsr(struct spi_nor *nor)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
+		struct spi_mem_op op = MICRON_ST_CLFSR_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 56b43074ef17..7404ca067ca9 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -30,6 +30,18 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
 
+#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, buf)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_IN(1, buf, 0))
+
+#define SPANSION_CLSR_OP						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
@@ -165,12 +177,12 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
 	 * CFR3V[4] and set the correct size.
 	 */
 	struct spi_mem_op op =
-		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
-			   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR3V, 1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
+		CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
+					  nor->bouncebuf);
 	int ret;
 
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
 	ret = spi_mem_exec_op(nor->spimem, &op);
 	if (ret)
 		return ret;
@@ -320,11 +332,7 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
+		struct spi_mem_op op = SPANSION_CLSR_OP;
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 9459ac2609dc..1d2f5db047bd 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -15,6 +15,12 @@
 #define XSR_PAGESIZE		BIT(0)	/* Page size in Po2 or Linear */
 #define XSR_RDY			BIT(7)	/* Ready */
 
+#define XILINX_RDSR_OP(buf)						\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(XILINX_OP_RDSR, 0),			\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_IN(1, buf, 0))
+
 #define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
 		.id = {							\
 			((_jedec_id) >> 16) & 0xff,			\
@@ -72,11 +78,7 @@ static int xilinx_nor_read_sr(struct spi_nor *nor, u8 *sr)
 	int ret;
 
 	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(XILINX_OP_RDSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, sr, 0));
+		struct spi_mem_op op = XILINX_RDSR_OP(sr);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
