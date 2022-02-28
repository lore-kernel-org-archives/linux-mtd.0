Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D67C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWGGowYaJxu/WZ6LTRx1oBjd1CCDKceEORHnzbDCy8s=; b=oWJNx6dBixGWlP
	ddbxTY27H8m+U1rqIkGDP5jCyGTPjjgi/HO3H50TdkLBThNJeW7nsTXT5c6lvCpHNQWVUwaYi4Y8g
	mhTxf0o1Lw7EXDnlovDcajA0ksii7agEw/UFZPl1JqOsu9xYl1wCg0LC2QITcKZSksT7Jk1Fnf03u
	NdE9pPQaRFNr/jOt85GNUY/PZ3Qy74vxZhCQYoHhsFKe1CiCAxBPuWVLqEdWjJg3eHubNQIuATd3t
	0KruG5ZWK8JHFXaLs+rwKBl3M0rVhNqQtsy5VkfP11AQs1AlSg8wPGQ+6r8NtApq2zcXFUsKap2NJ
	JF7+hhfWKMsM52f0b9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOePC-00Bx2e-Er; Mon, 28 Feb 2022 11:41:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe2D-00Bn1x-9E
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 11:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646047065; x=1677583065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ivp/5wz4XsxyZzgJpq+svBmUNmbMqIyRnZqJXbHlIyw=;
 b=AhG7cL+VnucXw0O7TaNQVm9v54TPZlHDEoOuOy3qcxrm5kIGPcaevU4f
 QTFU7oQajwWqRYlfP6fOxnK88qS59K9GbXp+3qBGnAx24TcDg8UKJomit
 snliyV2D5dzOCvO140ZoYSmOJlz/25c4/c46L6ts3J0vfGU1CeP19Z4ez
 YZtEnlCrx1n+IkacHsMkAzwkmKOX0oGb7ATb87FkRmx6fI3U1eKl/zW8J
 i5hi9dyqpuqCa7Sj2dDP7E0sF/8Ear7U3jEf0M/s/UFWVRSAviUXxfwky
 DCKxyyMA9Wymhz2uAh/sGrCDA6FCCCsS9G6RECn2Yhj9Xq6QuIZmo1uBz g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155099373"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 04:17:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 04:17:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 04:17:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 7/8] mtd: spi-nor: micron-st: Rework
 spi_nor_micron_octal_dtr_enable()
Date: Mon, 28 Feb 2022 13:17:11 +0200
Message-ID: <20220228111712.111737-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228111712.111737-1-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_031745_398697_2AD1813F 
X-CRM114-Status: GOOD (  17.33  )
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
Split spi_nor_micron_octal_dtr_enable() in spi_nor_micron_octal_dtr_en()
and spi_nor_micron_octal_dtr_dis() as it no longer made sense to try to
keep everything alltogether: too many "if (enable)" throughout the code,
which made the code difficult to follow.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/micron-st.c | 105 +++++++++++++++++---------------
 1 file changed, 55 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 41b87868ecf9..12ec3660fd6f 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -28,73 +28,72 @@
 #define FSR_P_ERR		BIT(4)	/* Program operation status */
 #define FSR_PT_ERR		BIT(1)	/* Protection error bit */
 
-static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+/* Micron ST SPI NOR flash operations. */
+#define MICRON_ST_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 0),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
+
+static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
 	int ret;
 
-	if (enable) {
-		/* Use 20 dummy cycles for memory array reads. */
-		ret = spi_nor_write_enable(nor);
-		if (ret)
-			return ret;
-
-		*buf = 20;
-		op = (struct spi_mem_op)
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
-				   SPI_MEM_OP_ADDR(3, SPINOR_REG_MT_CFR1V, 1),
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-		if (ret)
-			return ret;
+	/* Use 20 dummy cycles for memory array reads. */
+	*buf = 20;
+	op = (struct spi_mem_op)
+		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR1V, 1, buf);
+	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
 
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			return ret;
-	}
+	buf[0] = SPINOR_MT_OCT_DTR;
+	op = (struct spi_mem_op)
+		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR0V, 1, buf);
+	ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
 
-	ret = spi_nor_write_enable(nor);
+	/* Read flash ID to make sure the switch was successful. */
+	ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
 	if (ret)
 		return ret;
 
-	if (enable) {
-		buf[0] = SPINOR_MT_OCT_DTR;
-	} else {
-		/*
-		 * The register is 1-byte wide, but 1-byte transactions are not
-		 * allowed in 8D-8D-8D mode. The next register is the dummy
-		 * cycle configuration register. Since the transaction needs to
-		 * be at least 2 bytes wide, set the next register to its
-		 * default value. This also makes sense because the value was
-		 * changed when enabling 8D-8D-8D mode, it should be reset when
-		 * disabling.
-		 */
-		buf[0] = SPINOR_MT_EXSPI;
-		buf[1] = SPINOR_REG_MT_CFR1V_DEF;
-	}
+	if (memcmp(buf, nor->info->id, nor->info->id_len))
+		return -EINVAL;
 
-	op = (struct spi_mem_op)
-		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
-			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
-					   SPINOR_REG_MT_CFR0V, 1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
+	return 0;
+}
 
-	if (!enable)
-		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+static int micron_st_nor_octal_dtr_dis(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+	int ret;
 
-	ret = spi_mem_exec_op(nor->spimem, &op);
+	/*
+	 * The register is 1-byte wide, but 1-byte transactions are not allowed
+	 * in 8D-8D-8D mode. The next register is the dummy cycle configuration
+	 * register. Since the transaction needs to be at least 2 bytes wide,
+	 * set the next register to its default value. This also makes sense
+	 * because the value was changed when enabling 8D-8D-8D mode, it should
+	 * be reset when disabling.
+	 */
+	buf[0] = SPINOR_MT_EXSPI;
+	buf[1] = SPINOR_REG_MT_CFR1V_DEF;
+	op = (struct spi_mem_op)
+		MICRON_ST_NOR_WR_ANY_REG_OP(4, SPINOR_REG_MT_CFR0V, 2, buf);
+	ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
 	if (ret)
 		return ret;
 
 	/* Read flash ID to make sure the switch was successful. */
-	if (enable)
-		ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
-	else
-		ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
+	ret = spi_nor_read_id(nor, 0, 0, buf, SNOR_PROTO_1_1_1);
 	if (ret)
 		return ret;
 
@@ -104,6 +103,12 @@ static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
 	return 0;
 }
 
+static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	return enable ? micron_st_nor_octal_dtr_en(nor) :
+			micron_st_nor_octal_dtr_dis(nor);
+}
+
 static void mt35xu512aba_default_init(struct spi_nor *nor)
 {
 	nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
