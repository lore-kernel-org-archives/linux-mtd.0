Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3849C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxrEj42kWIWl5o5ZXGqS9zAAOVttaDRM4CpFgfp22PM=; b=LGNrOb6pODAXTY
	SSvM9tep8Dnmf/k7ZGCfyNt8+TXPFZW2ZjL1kmvL5KQD5ylGmBS1XJkdoo6uxB92vEIlgFQf3asNR
	HNg/ufP6aXrqxeyDy4YvStj6gOfbeys4Ptt4bAj76/2lrJbiKUFlsMNTlagWBDDr8ZsZvzkvVePSt
	vMykUvIaIW4POLjp/eLgRm4Kpxa9lsowiug2ZP2y9HfoBc/QpCm3KAfq+bM9RFtL0+CfiSvbZ9Yf5
	bLwkA3wUPKFOhe+qj46Lcm+TB8ux+rd794YTRxp+/QiEuP0FQzi0oKemC3cTZpqtFeJXyDP+qqgOi
	ZXXFzCgHvYjad/j/EI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQVn-00Bn3V-Ba; Thu, 21 Apr 2022 06:41:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQVV-00BmuI-SG
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:41:40 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 2so4103972pjw.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiLQl9Fbw/dgmyWu+dMxxxgEtAz4zruKJrdWl24hovc=;
 b=JM+O9jgOIQlTF+N1Qx5hwiyc9kfvhNmsVI7AwxDAH2nUGQ3Wt52p1ZyTscPcqF+V9w
 zG/ExB2Jnb6hVbp7ecXd7TpMJxnWSEeUvcbv94RW7/azHE3V3sczCnyD6L+IAFdJ2gCQ
 9Kh8dnvk3W2cFTcc32NPYZUqDiE7EUqIsiLHqzWSGy0ijKdJHB68QS6jq8VyHVLBsTxe
 sL0jmnG0qZjikDyUSxfJ0Qn2DPanpxwfytZm6IPblx0tOtNqTR4IG1R0EbiyG7RXeK6p
 9Cn9+NkLiSdyLgHCCAl5F9IQ1iUQZd+qxUrLfsB414f9hddNoHS6qFIC49ZMaBgejA76
 iyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiLQl9Fbw/dgmyWu+dMxxxgEtAz4zruKJrdWl24hovc=;
 b=SvRkldJPSbWES4+6lftkUGpWKp595T9YAa/x2PljpOdvXXcObXtVPeyatV3ZxM7OZD
 FF5qsvdsX23BRjvx/hR8GMlW3JNmeXS8YyQNZTYy1b8DluMaYZXJgiaOdyqVnIlNHyN6
 TUnPOVA182DZva6Tj5hQD8nF9z/5MO7cLo4MQquye8JL3joXZ/YUUEO5q6K36XPcOGUc
 iauTamdHnT7OXOCMitXBP3gr7Y056S0M8rMIu+APDuEP9HuQbnPt7D6mVxuDNpr4EP8y
 P+99T16f0qte8ZOid+tersiFN4RfMF5sSMH82bj9fyLydziSGmwsBpWpiDyt0VKYq9Ks
 0sXA==
X-Gm-Message-State: AOAM530GIxmWnBkY/d9yGvYiIKsLEwbXlBuZrQCSfFGQ4YWx6bCZpnkq
 wvHK0GRyruKG0dCokMpqHezDYwWyXvs=
X-Google-Smtp-Source: ABdhPJypXsiT+Gy7PNjLN4VNnykMMfwXUG2YNFPZMynmDhbefgHdZt3uSk9uPG9w5eu0GwslISPvSw==
X-Received: by 2002:a17:902:9b95:b0:151:533b:9197 with SMTP id
 y21-20020a1709029b9500b00151533b9197mr24490165plp.66.1650523297392; 
 Wed, 20 Apr 2022 23:41:37 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b0050ad3051f53sm2075037pfd.147.2022.04.20.23.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:41:37 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v12 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Thu, 21 Apr 2022 15:40:56 +0900
Message-Id: <ff03da96d144b74b102dadf641931f6bf5ee9c8b.1650519576.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234137_975599_BBC11456 
X-CRM114-Status: GOOD (  19.61  )
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

For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
uniform sector sizes are supported. This is due to missing or incorrect
entries in SMPT. Fixup for other sector sizes configurations will be
followed up as needed.

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v12:
  - Cleanup fixups based on other patches in this series
  - Add part specific set_4byte_addr_mode()
  - Unset SNOR_F_4B_OPCODES flag to let core to call set_4byte_addr_mode
  
Changes in v11:
  - Cleanup fixups based on other patches in this series
  
Changes in v10:
  - Cleanup fixups and ID table based on other patches in this series

Changes in v9:
  - Use late_init() hook to fix mode clocks and writesize
  - Use PARSE_SFDP instead of NO_SFDP_FLAGS
  - Use MFR_FLAGS for USE_CLSR
  - Add comment block to explain about addr mode in post_bfpt_fixups()

Changes in v8:
  - Call write_disable in error case only
  - Use spi_nor_read_reg() helper
  - Use nor->bouncebuf instead of variable on stack
  - Update ID table to use FLAGS macro
  
Changes in v7:
  - Add missing device info table in v6
  
Changes in v6:
  - Remove 2Gb multi die pacakge support

Changes in v5:
  - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT

Changes in v4:
  - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
  - Remove USE_CLSR flags from S25HL02GT and S25HS02GT

Changes in v3:
  - Remove S25HL256T and S25HS256T
  - Add S25HL02GT and S25HS02GT 
  - Add support for multi-die package parts support
  - Remove erase_map fix for top/split sector layout
  - Set ECC data unit size (16B) to writesize

 drivers/mtd/spi-nor/spansion.c | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 248fe1b221fd..a1f6631a3449 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -14,6 +14,7 @@
 #define CYPRESS_NOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define CYPRESS_NOR_OP_RD_ANY_REG	0x65	/* Read any register */
 #define CYPRESS_NOR_OP_WR_ANY_REG	0x71	/* Write any register */
+#define CYPRESS_NOR_OP_EX4B		0xB8	/* Exit 4B Addr Mode */
 #define CYPRESS_NOR_OP_RD_FAST		0xee
 
 #define CYPRESS_NOR_REG_CFR1V			0x00800002
@@ -45,6 +46,13 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
+#define CYPRESS_NOR_EN4B_EX4B_OP(enable)				\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B :		\
+					   CYPRESS_NOR_OP_EX4B, 0),	\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
@@ -207,6 +215,46 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+static int s25hx_t_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	struct spi_mem_op op = CYPRESS_NOR_EN4B_EX4B_OP(enable);
+
+	spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+	return spi_mem_exec_op(nor->spimem, &op);
+}
+
+static int
+s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt)
+{
+	/* EX4B(E9h) is not supported. Use part specific method */
+	nor->params->set_4byte_addr_mode = s25hx_t_set_4byte_addr_mode;
+
+	/* Replace Quad Enable with volatile version */
+	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
+
+	return cypress_nor_set_page_size(nor);
+}
+
+static void s25hx_t_late_init(struct spi_nor *nor)
+{
+	/* Fast Read 4B requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
+
+	/* Read and Write Any Reg ops take 3B or 4B address */
+	nor->flags &= ~SNOR_F_4B_OPCODES;
+}
+
+static struct spi_nor_fixups s25hx_t_fixups = {
+	.post_bfpt = s25hx_t_post_bfpt_fixups,
+	.late_init = s25hx_t_late_init,
+};
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -383,6 +431,22 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
+		PARSE_SFDP
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
+		PARSE_SFDP
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
+		PARSE_SFDP
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
+		PARSE_SFDP
+		MFR_FLAGS(CYPRESS_NOR_USE_CLSR)
+		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
