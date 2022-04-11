Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC46C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWLzfXWApUHFnY7ll7pCrmY41UIsKhKUoYiWvl2auxc=; b=akLkoSYDv+ie63
	lKzHNg7ucVKXbeRfkEv6vL+XX8WLlCjSlN+0CigOTOmSDNz7/mTqlNMTB2NI5XV8hQu/Cnib2MwUC
	c/FQPz1tl9nhLxUiKxPlGRqDeF5ocRfhpCtMrnl/ZJ8ReoS+ND93dpbcl//oTuWsIsJqeNDQGD8CK
	0DpkAQtG3c0fXWkDzs0pc+dzhhBb3cqC6xVqQAUt5WU/ggs4tZ4Z9IvNeG3eZZiy0KT5Q98M6VTlN
	40CVLMHbIKhscRAGUV5M9AE53eygSoph7Hn9Lzx4LIEQLegxij3jWzZhJd2q0VwjQ6DOJQ5S3QmnR
	OKklrPyC6qpknD2P6afw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqAI-007q6F-JZ; Mon, 11 Apr 2022 09:16:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq4a-007nBu-PM
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649668261; x=1681204261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QkgPbCam6M63CpqRU4By/vkwHVtyHHOvsN4BRk3QFJY=;
 b=CTJpqAjhrt3wex1ahM8xussBc7MmGxgEwyPZ3PEWN+E64pXKE5AN41t8
 i1hiX8upX9UZzSIXV9jQwlOfbiYyK/V26K9VXOb+hu5lkjbzoIWPqt0Mr
 Ehx+VG8vIbu3ChzGvzAvzQMDYmtV2wTjYqLx8WEYVzKs/Ka4oZ6+z2VrB
 T6RW/GAYzaDQLdswzho80PQuMK+f/hZDFMX8FB83Cptl95eXdyw1cV3ps
 MRHUVwMKTPCBl+WPvole9I/M9qxBbYDCzTUCA1V2KlgJN38IhS7vle60A
 s1KpQ3gsbXLWaNAqMlSGgUJh9O7fo/HsCeTvVRvgvsW6aP7Sbh5aEjSI9 Q==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="152208190"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 02:11:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 02:10:59 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 02:10:57 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v3 8/9] mtd: spi-nor: spansion: Rework
 spi_nor_cypress_octal_dtr_enable()
Date: Mon, 11 Apr 2022 12:10:32 +0300
Message-ID: <20220411091033.98754-9-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411091033.98754-1-tudor.ambarus@microchip.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_021100_988666_EE0D2988 
X-CRM114-Status: GOOD (  17.46  )
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

Introduce template operation to remove code duplication.
Split spi_nor_cypress_octal_dtr_enable() in
spi_nor_cypress_octal_dtr_ena() spi_nor_cypress_octal_dtr_dis() as it no
longer made sense to try to keep everything alltogether: too many
"if (enable)" throughout the code, which made the code difficult to read.
Add debug messages in case spi_nor_read_id() fails.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v3: collect R-b, update commit message, add dev_dbg message in case             
spi_nor_read_id() fails.

 drivers/mtd/spi-nor/spansion.c | 128 ++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 59 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index c5988312cc91..35d8edb515a3 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -23,87 +23,81 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 
-/**
- * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
- * @nor:		pointer to a 'struct spi_nor'
- * @enable:              whether to enable or disable Octal DTR
- *
- * This also sets the memory access latency cycles to 24 to allow the flash to
- * run at up to 200MHz.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+/* Cypress SPI NOR flash operations. */
+#define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
+
+static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
 	int ret;
 
-	if (enable) {
-		/* Use 24 dummy cycles for memory array reads. */
-		ret = spi_nor_write_enable(nor);
-		if (ret)
-			return ret;
+	/* Use 24 dummy cycles for memory array reads. */
+	*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR2V, 1, buf);
 
-		*buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
-		op = (struct spi_mem_op)
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
-				   SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR2V,
-						   1),
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
 
-		ret = spi_mem_exec_op(nor->spimem, &op);
-		if (ret)
-			return ret;
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
 
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			return ret;
+	nor->read_dummy = 24;
 
-		nor->read_dummy = 24;
-	}
+	/* Set the octal and DTR enable bits. */
+	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR5V, 1, buf);
 
-	/* Set/unset the octal and DTR enable bits. */
-	ret = spi_nor_write_enable(nor);
+	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
 	if (ret)
 		return ret;
 
-	if (enable) {
-		buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
-	} else {
-		/*
-		 * The register is 1-byte wide, but 1-byte transactions are not
-		 * allowed in 8D-8D-8D mode. Since there is no register at the
-		 * next location, just initialize the value to 0 and let the
-		 * transaction go on.
-		 */
-		buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
-		buf[1] = 0;
+	/* Read flash ID to make sure the switch was successful. */
+	ret = spi_nor_read_id(nor, 4, 3, buf, SNOR_PROTO_8_8_8_DTR);
+	if (ret) {
+		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
+		return ret;
 	}
 
-	op = (struct spi_mem_op)
-		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
-			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
-					   SPINOR_REG_CYPRESS_CFR5V,
-					   1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
+	if (memcmp(buf, nor->info->id, nor->info->id_len))
+		return -EINVAL;
 
-	if (!enable)
-		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+	return 0;
+}
 
-	ret = spi_mem_exec_op(nor->spimem, &op);
+static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	/*
+	 * The register is 1-byte wide, but 1-byte transactions are not allowed
+	 * in 8D-8D-8D mode. Since there is no register at the next location,
+	 * just initialize the value to 0 and let the transaction go on.
+	 */
+	buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
+	buf[1] = 0;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(4, SPINOR_REG_CYPRESS_CFR5V, 2, buf);
+	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
 	if (ret)
 		return ret;
 
 	/* Read flash ID to make sure the switch was successful. */
-	if (enable)
-		ret = spi_nor_read_id(nor, 4, 3, buf, SNOR_PROTO_8_8_8_DTR);
-	else
-		ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
-	if (ret)
+	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
+	if (ret) {
+		dev_dbg(nor->dev, "error %d reading JEDEC ID after disabling 8D-8D-8D mode\n", ret);
 		return ret;
+	}
 
 	if (memcmp(buf, nor->info->id, nor->info->id_len))
 		return -EINVAL;
@@ -111,6 +105,22 @@ static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	return 0;
 }
 
+/**
+ * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @enable:              whether to enable or disable Octal DTR
+ *
+ * This also sets the memory access latency cycles to 24 to allow the flash to
+ * run at up to 200MHz.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	return enable ? cypress_nor_octal_dtr_en(nor) :
+			cypress_nor_octal_dtr_dis(nor);
+}
+
 static void s28hs512t_default_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = cypress_nor_octal_dtr_enable;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
