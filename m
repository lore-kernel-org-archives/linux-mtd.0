Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6C3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H762yUMhRf1y+hD9KGIRizI2uRgw5irhbY+z6yQLrQ8=; b=1F6mnk5rMS1Vv6
	qeiJTGdl1QEd+iHFMYxwQXO8QBA0nIlQur4LUAHsPpYjtSaWKAOmgPmtlMweN/ue6ZXm80laTVm0L
	Pn6q5+/z19pmXeLfAWEbJyHA125EhYjf8MIkWxbVxL5aYJFliJj+N6p2Be93vbUMksuLdPz7cumE0
	p3ozN57ym36i1wguxZueEhEl9IhU6KGYWqQ1NyEgefgUja8Z/fy9jnfDHRMpggczNOKsgq39DAwQH
	e5ZsnyQsZuhH1xxE/PEGwoKdL+jqcwu5ucHJ0FV5rZjeBo+Me0OpNx/CtZKISaHsddCAmsBCoycm8
	NuVsVqoTcIWZ4w8C37sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOuyV-00EyZy-DI; Tue, 01 Mar 2022 05:23:03 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOuy0-00EyVA-DD
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 05:22:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so1231088pjb.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Feb 2022 21:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aiKx9iXBl0M0hJpQe7uu1M31jySTddq8NOxfCzROfFU=;
 b=iClL0gC41srhNtLrKYcfJwnM2etIhhjhTSNAEl9eypJcyOc2ScDhs020c1OU/C3LHX
 D/Ld6Fu3N1yjsbSk+BR0prMLAek4rPMUSE9TFfhYA2/8O7rPypA2zYIPLL3NEPMzEcy/
 JBKuo85OnnU4mVj4Jg1hMn08jf2B37D/omCpyC3W5oNMENxVhesvSwSnf3MOJgu25JkP
 ODNuqE/ZbBj8E33SmsZbcJdWl/49SUnrjJIByWZoRkqV6oo1spTu6AAyj55ppJkT2Xjc
 uiBcahcrCj6n2uZbVOJERxCrUkTfL1TCqs2cUE0owANCj2YFAjdOcMAcw1V9afk5Hsbw
 IUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aiKx9iXBl0M0hJpQe7uu1M31jySTddq8NOxfCzROfFU=;
 b=641jTeCYK91fX85cle07BWDLqjeDDJFCzyc+d6AzozgoyPlTqbrgu9M6vKdse1eoSq
 tysiXhJLO1L5RfO651u+Jy/H66N1MzZpZfi5erG3jFJFumQM6iam1qftKQ1y9GtlS8E8
 kHK1q1zXGG1iiqa2zdrYz9HHSZFVd4YidxHEcPG5Y6mVVjMf4xb81OqqY5NHFo4L83WU
 ObeW3HmjRDxhL+dr4q9kYaFrjDzi6sTDgSC2JaE7AWTSxQ0hIDNcEGq2fBZlMjW2LrJX
 r86LATrWVwwf1P0M82EBioi3wEG/H5wme3j33btfDdt1CrplvqxeBfJ+SNfljvwCWJcy
 djYw==
X-Gm-Message-State: AOAM530AhJqrBuaWQtDhaV8VBIYxMbM9T0QPxqXBjisD47WdbwOqfLcD
 btX6yPD+HBJ+kvsNVjTUi/TOu9Equ1M=
X-Google-Smtp-Source: ABdhPJzfAzDYMX6v4ev0vZ4NwfDy6+V5ZV/LjZoBL5nZ9WR8yjoc/lFBAZaAXMdjE5dIheZTxAtetg==
X-Received: by 2002:a17:902:7402:b0:150:c60:291c with SMTP id
 g2-20020a170902740200b001500c60291cmr23451737pll.77.1646112151449; 
 Mon, 28 Feb 2022 21:22:31 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 63-20020a630942000000b00372a99c1821sm11433111pgj.21.2022.02.28.21.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 21:22:31 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v9 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Tue,  1 Mar 2022 14:21:55 +0900
Message-Id: <bbe7d170810736b0b086890843ac1d5030607269.1646109817.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646109817.git.Takahiro.Kuwano@infineon.com>
References: <cover.1646109817.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_212232_485958_EE5AB30F 
X-CRM114-Status: GOOD (  20.76  )
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

 drivers/mtd/spi-nor/spansion.c | 84 ++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index db027cb92cf5..0cc432f492bf 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -168,6 +168,74 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
 	return 0;
 }
 
+static int s25hx_t_quad_enable(struct spi_nor *nor)
+{
+	int ret = cypress_nor_quad_enable_volatile(nor, 0);
+
+	/* Reset WEL bit in any error cases */
+	if (ret)
+		spi_nor_write_disable(nor);
+
+	return ret;
+}
+
+static int
+s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt)
+{
+	struct spi_mem_op op;
+	int ret;
+
+	/*
+	 * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
+	 * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
+	 * Read Any Reg op is called in this hook and SMPT parse, we would sync
+	 * Flash's addr mode and nor->addr_width here.
+	 */
+	ret = spi_nor_set_4byte_addr_mode(nor, true);
+	if (ret)
+		return ret;
+	nor->addr_width = 4;
+
+	/* Replace Quad Enable with volatile version */
+	nor->params->quad_enable = s25hx_t_quad_enable;
+
+	/*
+	 * From BFPT, the page_size is set to 512B(s25hs512t) or 256B(others),
+	 * but it actually depends on the configuration register. Look up the
+	 * CFR3V and determine the page_size.
+	 */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width,
+					  SPINOR_REG_CYPRESS_CFR3V, 0, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
+		nor->params->page_size = 512;
+	else
+		nor->params->page_size = 256;
+
+	return 0;
+}
+
+void s25hx_t_late_init(struct spi_nor *nor)
+{
+	/* Fast Read 4B requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
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
@@ -365,6 +433,22 @@ static const struct flash_info spansion_nor_parts[] = {
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
