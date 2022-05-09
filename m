Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4080DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 22:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAaYDG3i/xu9/b1QaJlIuV+jRzFElSsqyuUEfyRIQvs=; b=K8liz6VMsf3Not
	73ip4YDk06Ki1TtgOw9C4dSbSF5j+aVENy4VMKGfpYLAZE4EtzX9HjCGOVChCS3cFCpp+DKfpAtHA
	O16SUeCxgjkHVRcTc55VqrpRxBUdDfQmGEAqLwkW9rbq3+igH5HWrML/bCDHv6/PcsEqoELGyyJlz
	xGu1PrHqXRDgZr6v0mC3zKz6o+drtwm1A5FLFsUPSFWLi5K2N1ZLV6MFJe/w1Bqie+RkRQiUWAlZc
	7kmyqef9v9rNThiIlUa1ITOBAuj4n5IyhFK7ZskgjjzPu0nTQGP2/B46f0lm0Kjbk+mx6OMjDCSn4
	zy/VEdOJlPCgpJuOHV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBax-00GVp2-6x; Mon, 09 May 2022 22:11:11 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBaj-00GVf2-C1
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 22:10:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id e24so14312300pjt.2
 for <linux-mtd@lists.infradead.org>; Mon, 09 May 2022 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q/hX4iW2Hqc0H52Iw3Q66dzx4vlIiIdk30da075a/4c=;
 b=bHMMJV2yLYL33zf/sSKrqPGY6IBmLZ+i1owtYu6ceV3zst6oJ1ktAwdCIScg2zIVsd
 KcE2c/ewVY294FpVZ50Ue1wXYag4cyR1HAs7+smYzJqjphQuDQDkJKdLuuK1aHI0zFyr
 YKhajU3IcUJUYjOz0W++xz6PcnIRSg5sF/1ZEuvif/B6kILHbBbgRMotEd89ODuMZdCO
 954L4mgOrtSK/nTZEchw5Z+l7wgPISGkGJHZ0snV5IfqYL5SK3TCSAeZhQfez6hCFwWt
 bkQdwT+6yX8gpZsJcOoIrzXkoa0HMjHqj85i01Mnf8ZCB0u3RFvJEayOz6cdE0sX5Cbk
 OVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/hX4iW2Hqc0H52Iw3Q66dzx4vlIiIdk30da075a/4c=;
 b=YEqiXrhuNVCrxEpLsqKyyq6D/SG5z7DlNmW4fcZWklFOUzGClp9F1OzaeE+96qNmP0
 ymizpcSFGo9BoOlscggPTM0ZZpWLx6UMC2JglA+BpvnRH7mnHQlDvruq78GP4EWNFoIv
 Y+Nt4xDcRAB2cVMiP8x828pDXZa6VgLr6j3jIirvQOYihnbCTzDUAD5JWIOI6U2u2iQe
 ObZRCOIvU0GGvE2Rd1M0Iakbv3xd71GDLvz/yv9wX5H/VeXd5tT6Szuz954IQhAbhq/I
 tWDDeY3nG8lY+3YVhaFIxMqb4riI83JeH9krsIcW+BS6Hlo2czqNrwGeiXS2mnohT50R
 WJUA==
X-Gm-Message-State: AOAM533e3JW+wFxYrG2koCXxpANqfwh3JsnMCPJ1z+VN3xBh7Z+PU2WR
 XLoZ7LNY6W6e2AylctR6jCkQCDQjrq4=
X-Google-Smtp-Source: ABdhPJyUaXwRlMCWrXgJVXXGRSMDp/ptKssd/CUaUdpGP6wWMS8JFS9GuYUXf0+Rl7brNGs5u596OQ==
X-Received: by 2002:a17:90b:380b:b0:1dc:6d24:76ff with SMTP id
 mq11-20020a17090b380b00b001dc6d2476ffmr28199360pjb.42.1652134255786; 
 Mon, 09 May 2022 15:10:55 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056a0002bb00b0050dc76281ebsm9043247pfs.197.2022.05.09.15.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:10:55 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, michael@walle.cc, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v15 8/8] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Tue, 10 May 2022 07:10:09 +0900
Message-Id: <39ee4fb358611a35f3c614cec77cad62e4ae7f45.1652063152.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_151057_478160_9246EF9B 
X-CRM114-Status: GOOD (  21.93  )
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
 drivers/mtd/spi-nor/spansion.c | 129 +++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index e130f5398763..71c2fb1dc101 100644
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
@@ -113,6 +115,67 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
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
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
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
@@ -144,6 +207,56 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
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
@@ -320,6 +433,22 @@ static const struct flash_info spansion_nor_parts[] = {
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
