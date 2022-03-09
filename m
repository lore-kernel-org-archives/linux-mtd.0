Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Mar 2022 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4W4EDfTEL+caSXAHKU694hoOPkI1xQBwZZFzFtU6Hg=; b=UynQz1a1m3dZHU
	AP7sbuccfxElLLzWWX7VDLyhhoEFel4IVH7pFDSXisARKlJRFBVFz7POlf3UOHx4rZCTPclhsM+1J
	Lo591Iysutr8lfBxr89+/IZJTEJxBhZz9iXvRfSFvfC9XOBAN6/Z801pX01kalQ+eIKIUIclaOBJG
	rZ/CYH0VvaH5//qNhZcSG6BcqTUVrnKzTcvucwUkFCRTAji5OufV8cJbb04RHv6OlKbxtC5fbSMpd
	rrq+gaRsOIeGbdkWMxneWBriyb/iNu0A2GryYDYfmB4d2TsFMhJLAn4I76OllFKsAy5NwJtUZCV0A
	kPkm6B+zoFcd5DUKW+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRxX5-0092I7-Su; Wed, 09 Mar 2022 14:43:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRxWM-00920X-5K
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2022 14:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646836953; x=1678372953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eA5JNvIl723INxo1Ek/ymL6Ifubo4QpgyLcZrgcY5wg=;
 b=yJCJFvjtm51bzsHaAHihVahPv7KQiMuOtmxp1uzbCNYUlB0flDUVH4Y5
 /OaC1J2mhvq/NkJ4r+As2fF1MP8TzxODGU8PNJYbZuWGlY949TjqaWji2
 6M6OVm0vVNRGYRgRVsRQKPi09QXrNg//dd+sZ0AdxiczPuwhkoOdlcGar
 G1PN5y6fR8c1O3EIsIBf69aaMT30ftfSfIUoblYecwlHNyec/QhXfuMdY
 TefqHRvk0Y6NCTrzzNDDPx1Ry3xFuxaPEZIMe7qLCpxql6+sA6DC58+An
 bIXHCT+Lg9427vDIgqNhEoL1u4Kc5fV1onHbwQwedfx3WC8wjvb27Q4oe g==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; d="scan'208";a="151414626"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 07:42:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 07:42:32 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 07:42:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
Date: Wed, 9 Mar 2022 16:42:15 +0200
Message-ID: <20220309144215.179449-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309144215.179449-1-tudor.ambarus@microchip.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_064234_303352_0BD72846 
X-CRM114-Status: GOOD (  14.10  )
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

Keep the SFDP definitions private and expose just the definitions that are
required by the core and manufacturer drivers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/sfdp.c | 52 +++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.h | 53 --------------------------------------
 2 files changed, 52 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 01e35354db3e..f5432cbd3daf 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -494,6 +494,50 @@ int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
 	return spi_nor_write_disable(nor);
 }
 
+/* 11th DWORD. */
+#define BFPT_DWORD11_PAGE_SIZE_SHIFT		4
+#define BFPT_DWORD11_PAGE_SIZE_MASK		GENMASK(7, 4)
+
+/* 15th DWORD. */
+/*
+ * (from JESD216 rev B)
+ * Quad Enable Requirements (QER):
+ * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
+ *         reads based on instruction. DQ3/HOLD# functions are hold during
+ *         instruction phase.
+ * - 001b: QE is bit 1 of status register 2. It is set via Write Status with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ *         Writing only one byte to the status register has the side-effect of
+ *         clearing status register 2, including the QE bit. The 100b code is
+ *         used if writing one byte to the status register does not modify
+ *         status register 2.
+ * - 010b: QE is bit 6 of status register 1. It is set via Write Status with
+ *         one data byte where bit 6 is one.
+ *         [...]
+ * - 011b: QE is bit 7 of status register 2. It is set via Write status
+ *         register 2 instruction 3Eh with one data byte where bit 7 is one.
+ *         [...]
+ *         The status register 2 is read using instruction 3Fh.
+ * - 100b: QE is bit 1 of status register 2. It is set via Write Status with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ *         In contrast to the 001b code, writing one byte to the status
+ *         register does not modify status register 2.
+ * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
+ *         Read Status instruction 05h. Status register2 is read using
+ *         instruction 35h. QE is set via Write Status instruction 01h with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ */
+#define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
+#define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
+#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
+#define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
+#define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
+
 #define BFPT_DWORD16_EN4B_MASK			GENMASK(31, 24)
 #define BFPT_DWORD16_EN4B_ALWAYS_4B		BIT(30)
 #define BFPT_DWORD16_EN4B_4B_OPCODES		BIT(29)
@@ -528,6 +572,14 @@ int spi_nor_set_4byte_addr_mode_wren_en4b_ex4b(struct spi_nor *nor, bool enable)
 #define BFPT_DWORD16_4B_ADDR_MODE_EN4B_EX4B		\
 	(BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
 
+#define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
+
+#define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
+#define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
+#define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
+#define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
+#define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
+
 /**
  * spi_nor_parse_bfpt() - read and parse the Basic Flash Parameter Table.
  * @nor:		pointer to a 'struct spi_nor'
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index da2d7ec2e0aa..fd7e3c935960 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -45,59 +45,6 @@ struct sfdp_bfpt {
 #define BFPT_DWORD5_FAST_READ_2_2_2		BIT(0)
 #define BFPT_DWORD5_FAST_READ_4_4_4		BIT(4)
 
-/* 11th DWORD. */
-#define BFPT_DWORD11_PAGE_SIZE_SHIFT		4
-#define BFPT_DWORD11_PAGE_SIZE_MASK		GENMASK(7, 4)
-
-/* 15th DWORD. */
-
-/*
- * (from JESD216 rev B)
- * Quad Enable Requirements (QER):
- * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
- *         reads based on instruction. DQ3/HOLD# functions are hold during
- *         instruction phase.
- * - 001b: QE is bit 1 of status register 2. It is set via Write Status with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- *         Writing only one byte to the status register has the side-effect of
- *         clearing status register 2, including the QE bit. The 100b code is
- *         used if writing one byte to the status register does not modify
- *         status register 2.
- * - 010b: QE is bit 6 of status register 1. It is set via Write Status with
- *         one data byte where bit 6 is one.
- *         [...]
- * - 011b: QE is bit 7 of status register 2. It is set via Write status
- *         register 2 instruction 3Eh with one data byte where bit 7 is one.
- *         [...]
- *         The status register 2 is read using instruction 3Fh.
- * - 100b: QE is bit 1 of status register 2. It is set via Write Status with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- *         In contrast to the 001b code, writing one byte to the status
- *         register does not modify status register 2.
- * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
- *         Read Status instruction 05h. Status register2 is read using
- *         instruction 35h. QE is set via Write Status instruction 01h with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- */
-#define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
-#define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
-#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
-#define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
-#define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
-#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
-#define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
-
-#define BFPT_DWORD16_SWRST_EN_RST		BIT(12)
-
-#define BFPT_DWORD18_CMD_EXT_MASK		GENMASK(30, 29)
-#define BFPT_DWORD18_CMD_EXT_REP		(0x0UL << 29) /* Repeat */
-#define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
-#define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
-#define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
-
 struct sfdp_parameter_header {
 	u8		id_lsb;
 	u8		minor;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
