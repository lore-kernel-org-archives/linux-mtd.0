Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC74C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w34pOhlQe8ADp7TQlpbQSKuSuqkcuFC+KW00fCUQ88E=; b=vaKapHKTDk/tn6
	vfVe9uh4MIhSsFrFQm+o/zDt0IqTwDexAPw+MfNMitRjf5zyZ1+zfPYY8BN6Y2zMjZrIZ81kNVAUR
	yD80Ouq5uMP1k6e6G4D6TGnVBGyqUUTdJe5LGK1sHpl28zwufzTGtKQRK0+qZz3G3pH6gGbDm/WIn
	nX8Y54I7b5vvFoQnhXqJYncbV2VARMTD4N3c9LJLMiN02TvMn5fgDRkLp4/inmwxMzD/tWzv1mh9z
	tpUa/n39S8a7jF0o2Nl/EsBwQv/aBgJpc1O5uQ4+bLX0V69xUo0lim97E8OiSaMDUQaBtowKhN8sF
	zemSLB6I0wFGxF8nvoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh7gB-008cbf-TG; Wed, 20 Apr 2022 10:35:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh7fd-008cEy-H4
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 10:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650450889; x=1681986889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M0fIb5H9Cd9ZjNreQpBif5jM+vgl6Gy3daqHCVmPlFk=;
 b=2bPu93PDr/Q9qibVP7Z3qUV1oj+n7fopIxQKf7p/t+wgneKA1kf7zhWM
 JJBT7bn9FH9HCA3cBiCO0ZtaZ/MSFfHqU7/XY6sLLtrORWO9X8BGWWY8x
 UPMGHZ6HuMpNkWyD0aYabw2G7XdOSKKbQM3OV4g5lL4YtvFv9m7/KgyJo
 OnU9MHAb+nkHiziRuDP5NHpi7DoabQ4xFxMUC09N9fWd2n3W3LRDKNIBA
 FjGBrSQJbHDCaQ7x0R/RpdOMqqcVZA3sYTnYXMmq6+o17S/LNbfV082Et
 Q2Z7r5AqAjYa/RNllK2/Cy7Ok68O9YnUAtkSk6OzRMPGN2nws/bCQPB/8 Q==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="170245864"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 03:34:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 03:34:48 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 03:34:46 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Takahiro.Kuwano@infineon.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 07/11] mtd: spi-nor: micron-st: Rework
 spi_nor_micron_octal_dtr_enable()
Date: Wed, 20 Apr 2022 13:34:23 +0300
Message-ID: <20220420103427.47867-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420103427.47867-1-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_033449_646000_1732C37A 
X-CRM114-Status: GOOD (  18.69  )
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
which made the code difficult to follow. Add dev_dbg messages in case
spi_nor_read_id() fails.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/micron-st.c | 111 +++++++++++++++++---------------
 1 file changed, 60 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 41b87868ecf9..ce62e6be8fd2 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -28,75 +28,78 @@
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
-
-		ret = spi_nor_wait_till_ready(nor);
-		if (ret)
-			return ret;
-	}
+	/* Use 20 dummy cycles for memory array reads. */
+	*buf = 20;
+	op = (struct spi_mem_op)
+		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR1V, 1, buf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
 
-	ret = spi_nor_write_enable(nor);
+	buf[0] = SPINOR_MT_OCT_DTR;
+	op = (struct spi_mem_op)
+		MICRON_ST_NOR_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR0V, 1, buf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
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
+	/* Read flash ID to make sure the switch was successful. */
+	ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
+	if (ret) {
+		dev_dbg(nor->dev, "error %d reading JEDEC ID after enabling 8D-8D-8D mode\n", ret);
+		return ret;
 	}
 
-	op = (struct spi_mem_op)
-		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
-			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
-					   SPINOR_REG_MT_CFR0V, 1),
-			   SPI_MEM_OP_NO_DUMMY,
-			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
+	if (memcmp(buf, nor->info->id, nor->info->id_len))
+		return -EINVAL;
 
-	if (!enable)
-		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+	return 0;
+}
+
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
+	ret = spi_nor_write_any_volatile_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
 	if (ret)
 		return ret;
 
 	/* Read flash ID to make sure the switch was successful. */
-	if (enable)
-		ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
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
@@ -104,6 +107,12 @@ static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
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
