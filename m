Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9B7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGkJAQx2hepqu1z045CMEoMeEz6uQf/q361oul35Omc=; b=ZTosuW4zWs8T7T
	dIsByNlVjkU4dgpq4v1mwgOT+75h/RuW8sd7x2ECNYGtl5pfqADshmZt6+3aySnCVxqxtJqm6aDPo
	Rqvol2X/L5dN4ool6qP7l/cOCmv27+HheOH+Cib6alsnRR1HlaVQBLmp5Rsb/jNu+Njefla3DcNYC
	V3p89Jq8uPNEn1JTSYfubzeJeLPyjDTjZyja6OVrhA5PGgzYc9hZaiRllWZtqTileYUAO4/88QZjo
	JQiD4g396RqV8/f9vTZECl5Zk1miLpH4wRByKhYP1bSRIulb7XSkhR+Ma1YBWwlODjA4pztgo2k4z
	a6WUygYwuR6d48sHk7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlnio-004Ziu-Ow; Tue, 03 May 2022 08:17:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlniG-004ZK8-FC
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651565812; x=1683101812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l+i55jB+7x9VYYrOiJrA+DkLmZ+QWX7oLl6mG9C/S6I=;
 b=aFpb2HuzjZiNtIyqyctpyRDhBPZwfoFsf5Mejf4r5bCaSWK719o/en7c
 UQJi5QCf933eSP1Llcps+n1xWn1Ly6BaxYnc9MwAL9b4VPgyCw1n8f0FP
 aw6Jhc5KphjFR7NDoiZ5/zxVwLQmrOSv947l0wHQs/ksUzCkv3qXzQIid
 s9uX9mIQ/Jz2ou19O3dZ5plDfwCUzxBsgzsgbXxafm3Ig5KXZEjtxWrna
 pofgwnPD6ELYrN4WxgzxTMbpsua4i2oD54yNpapVqcdI3KJv8mLukAboe
 iyU/7ZkcZH0pE9SC6lPjsozbSb15yLqPOEsnzfx2SLKczrBs1Vd5hUuRG g==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="94355384"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:16:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:16:51 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:16:49 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v14 8/8] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Tue, 3 May 2022 11:16:27 +0300
Message-ID: <20220503081627.341870-9-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503081627.341870-1-tudor.ambarus@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_011652_649608_637BC0B1 
X-CRM114-Status: GOOD (  20.40  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.

These Infineon chips support volatile version of configuration registers
and it is recommended to update volatile registers in the field application
due to a risk of the non-volatile registers corruption by power interrupt.
Add support for volatile QE bit.

For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
uniform sector sizes are supported. This is due to missing or incorrect
entries in SMPT. Fixup for other sector sizes configurations will be
followed up as needed.

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 125 +++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index e130f5398763..f78a15b985ea 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,6 +14,8 @@
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
+#define SPINOR_REG_CYPRESS_CFR1V		0x00800002
+#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN	BIT(1)	/* Quad Enable */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
 #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24	0xb
 #define SPINOR_REG_CYPRESS_CFR3V		0x00800004
@@ -113,6 +115,63 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
+ *                                      register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 cfr1v_written;
+	int ret;
+
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
+					  SPINOR_REG_CYPRESS_CFR1V,
+					  nor->bouncebuf);
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_nbytes,
+					  SPINOR_REG_CYPRESS_CFR1V, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	cfr1v_written = nor->bouncebuf[0];
+
+	/* Read back and check it. */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
+					  SPINOR_REG_CYPRESS_CFR1V,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] != cfr1v_written) {
+		dev_err(nor->dev, "CFR1: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * cypress_nor_set_page_size() - Set page size which corresponds to the flash
  *                               configuration.
@@ -144,6 +203,56 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
+			const struct sfdp_parameter_header *bfpt_header,
+			const struct sfdp_bfpt *bfpt)
+{
+	/* Replace Quad Enable with volatile version */
+	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
+
+	return cypress_nor_set_page_size(nor);
+}
+
+static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_nor_erase_type *erase_type =
+					nor->params->erase_map.erase_type;
+	int i;
+
+	/*
+	 * In some parts, 3byte erase opcodes are advertised by 4BAIT.
+	 * Convert them to 4byte erase opcodes.
+	 */
+	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
+		switch (erase_type[i].opcode) {
+		case SPINOR_OP_SE:
+			erase_type[i].opcode = SPINOR_OP_SE_4B;
+			break;
+		case SPINOR_OP_BE_4K:
+			erase_type[i].opcode = SPINOR_OP_BE_4K_4B;
+			break;
+		default:
+			break;
+		}
+	}
+}
+
+static void s25hx_t_late_init(struct spi_nor *nor)
+{
+	/* Fast Read 4B requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
+}
+
+static struct spi_nor_fixups s25hx_t_fixups = {
+	.post_bfpt = s25hx_t_post_bfpt_fixup,
+	.post_sfdp = s25hx_t_post_sfdp_fixup,
+	.late_init = s25hx_t_late_init,
+};
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -320,6 +429,22 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
