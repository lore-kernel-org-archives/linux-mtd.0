Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7206C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGotdBm47pACAoHhP5eN9oHjV1dSEZBIECdr61AU9Lw=; b=wRXTFSuytoTMfG
	ATqFtTmp1bF41hdrE4FwY3gE6j6+bVsZj/X7WUOiPnrbxb6p2xvqJrzSnS3khqdB9VF8WW5q5SHZg
	r3Mhykg7SyVhUEtkmQ2t0LYL875YchLow9V6HgJL+mVcKC8cDchEsAwEE0zieG5A2t8TJ6BlwMkdY
	5+ISAmzkmUDblxEbuDLgB22y+y/jdEryCBmwmfhfxEHmdlwEk25oX3xjYF7m8YssAgBGEFabNEoxI
	GCfd16WZQ+lRqYujVXytcMMaZ0BiQpsJNVN6PiUSOZrnN3Tha2yWGSsqGOI18g0XAVKtnz9i+oPvG
	xVN8XuauGSsejmCGciMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOeJ7-00Buqq-GG; Mon, 28 Feb 2022 11:35:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe20-00Bn0t-Jg
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 11:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646047052; x=1677583052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DR2YsqBmdwcOSI3VhJ4E7f+oGievG1RU62MQV0VJZB8=;
 b=GoW2IzL4Z43aUrf65PHZswbciYTorJWoam9DrjL4dvXMlfQOIOdemOX7
 c5Ob0v8hnU95i1j84UNRcKDk7p3MYlViZJXhPAzo/52YDKbuneC0VQ0nQ
 foeSCdkYeNZ6uJA9+cgI5RmX5nRiuNMgTGvdkUapFR+7h92YTa5EuQ6TY
 TmsziGQZg1PmiCI+lzMWoJGCe5NOChL6tPPG4bQsLI+IMv9fEYqMy8TTC
 kDDZ0x3mnl2b5t5xLeosmGZlxuKNySw8a57qksBxw5QZrSMElJMAGyLhx
 HrRLQoMI/juLBf6DelKxp/xOTqvbav2j+9IGvs/ZYn39DZC2NOTfuDD0a g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="163859339"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 04:17:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 04:17:31 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 04:17:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 4/8] mtd: spi-nor: core: Introduce method for RDID op
Date: Mon, 28 Feb 2022 13:17:08 +0200
Message-ID: <20220228111712.111737-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228111712.111737-1-tudor.ambarus@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_031732_722577_6EBA8204 
X-CRM114-Status: GOOD (  15.75  )
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

RDID is used in the core to auto detect the flash, but also by some
manufacturer drivers that contain flashes that support Octal DTR mode,
so that they can read the flash ID after the switch to Octal DTR was made
to test if the switch was successful. Introduce a core method for RDID op
to avoid code duplication.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 58 ++++++++++++++++++++++++++------------
 drivers/mtd/spi-nor/core.h |  9 ++++++
 2 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b1d6fa65417d..281e3d25f74c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -369,6 +369,41 @@ int spi_nor_write_disable(struct spi_nor *nor)
 	return ret;
 }
 
+/**
+ * spi_nor_read_id() - Read the JEDEC ID.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @naddr:	number of address bytes to send. Can be zero if the operation
+ *		does not need to send an address.
+ * @ndummy:	number of dummy bytes to send after an opcode or address. Can
+ *		be zero if the operation does not require dummy bytes.
+ * @id:		pointer to a DMA-able buffer where the value of the JEDEC ID
+ *		will be written.
+ * @reg_proto:	the SPI protocol for register operation.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+		    enum spi_nor_protocol reg_proto)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_NOR_READID_OP(naddr, ndummy, id, SPI_NOR_MAX_ID_LEN);
+
+		spi_nor_spimem_setup_op(nor, &op, reg_proto);
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
+						    SPI_NOR_MAX_ID_LEN);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
+
+	return ret;
+}
+
 /**
  * spi_nor_read_sr() - Read the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
@@ -1649,28 +1684,15 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
 	return NULL;
 }
 
-static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
+static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
 {
 	const struct flash_info *info;
 	u8 *id = nor->bouncebuf;
 	int ret;
 
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, id, 1));
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
-						    SPI_NOR_MAX_ID_LEN);
-	}
-	if (ret) {
-		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
+	ret = spi_nor_read_id(nor, 0, 0, id, nor->reg_proto);
+	if (ret)
 		return ERR_PTR(ret);
-	}
 
 	info = spi_nor_match_id(nor, id);
 	if (!info) {
@@ -2900,7 +2922,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 		info = spi_nor_match_name(nor, name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!info) {
-		detected_info = spi_nor_read_id(nor);
+		detected_info = spi_nor_detect(nor);
 		info = detected_info;
 	}
 	if (IS_ERR_OR_NULL(info))
@@ -2913,7 +2935,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	if (name && !detected_info && info->id_len) {
 		const struct flash_info *jinfo;
 
-		jinfo = spi_nor_read_id(nor);
+		jinfo = spi_nor_detect(nor);
 		if (IS_ERR(jinfo)) {
 			return jinfo;
 		} else if (jinfo != info) {
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b7fd760e3b47..f952061d5c24 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -11,6 +11,13 @@
 
 #define SPI_NOR_MAX_ID_LEN	6
 
+/* Standard SPI NOR flash operations. */
+#define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 0),			\
+		   SPI_MEM_OP_ADDR(naddr, 0, 0),			\
+		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 0))
+
 enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB	= BIT(0),
 	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
@@ -534,6 +541,8 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
+int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
+		    enum spi_nor_protocol reg_proto);
 int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
 int spi_nor_sr_ready(struct spi_nor *nor);
 int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
