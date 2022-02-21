Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545C4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Feb 2022 07:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmeofXvZEsXWctnoZ+MHL0h9n4p6qvBxIJf9OdZLer0=; b=dWvPl1zdT7ZvMb
	Clj9qorK5u247od9rGjyp46aLfAhRWIATNZyO2qYRpD3+sc22OjUA0kOn2miul9t9AfryMxHpjFnQ
	7IY+3Zb9aCbMHCTeLoiBlJIJVgjmtHYqeEHgdOyxKtIr7asYUSi4TEFdLLx6hod1wd/LLe5MY+tq6
	1DeGKt63TwoQKGKiZ1u2vvila+ip6lEnVTnKHYDtvjiebPGCu7hMBSc/dIS7DNNZwKWWDq+85ovtg
	wbfmK2C3er6XQ1OuVwlDsHOKMTFKUVvOgc5Ipa56j/uZWEIUxnAmsSx1wIG9+byAPBeN5cwaEq1/9
	MClV1spLi10aFfapyEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2wA-003x4W-1g; Mon, 21 Feb 2022 07:16:46 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2ve-003x03-OC
 for linux-mtd@lists.infradead.org; Mon, 21 Feb 2022 07:16:16 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 ci24-20020a17090afc9800b001bc3071f921so2194995pjb.5
 for <linux-mtd@lists.infradead.org>; Sun, 20 Feb 2022 23:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9jToeV5xkOiR/qR0gyaC+okDBrOcEmrotpRmkgwtAo=;
 b=U9CDTbsXfwhhcOJ/9zqRPh53lPJRiu3/81kQWp0J53F2nAawdMWACiM1YLnwF/6LsO
 8smoPQMnFHr/O8qWOG+aWyLOkKEYWPsyDyPuk1YPnrBH3JOREdfZSe3BO7iww1aNG9Ii
 vUFIMo/PhhdNo5RHZwqi9yp+Ax6Z6fXwWW6FR8Zy6Ct7XCpR/6NiGZB3FRqhUzhjOFe3
 7qqWzn8Sq7kHelfB3MW/vjl79zsejhlOB9byoJvK2d0YS5aSOVp7T27/5JOyyXoaAtmm
 Oe87IvBpuugby81a4szVQSvglp5KT8XnkLvAYXfdjEuSO2Oa8+BwZamJ+61gis+AhruS
 sixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9jToeV5xkOiR/qR0gyaC+okDBrOcEmrotpRmkgwtAo=;
 b=RTSaZKv+xQBZYlm8SITjx72rOL/TE/iYXXFrlN8f8BVsKjMeX7o0jeJY63OTr/4Z3S
 GW5LDEC+7FPSi/TAbeN/D3yFNqNXvDR/Ku3icVDNphEnFvwD1pSfLIOHzf2z7WrNDkbv
 Hlx2aESc/ULqyBBf1pZmPyOmf2lTyKoj1Yn34NeCwQfQ74orlMr0lVxaEY6MUmDsHm48
 REcgMmkWj7GyjOEmAyY+tPBPUZ/EuXOq7rj6/7tE/hZrHkwgpKKJZ6D3JguwU47iG8AV
 i9/uNnBZQtQKwIys76Dgid2W4yW7N2Hl6YULRtydS09wNZCKQoG9hm3rKz5/fSpL32ni
 rSiA==
X-Gm-Message-State: AOAM531U704QmUhTylaQrj1Cqzt8AwmFQwZzv0uDBn/LtsrAktvywPOH
 HUHK1X+UE7fPpbNaqFPcku1xkyJo+qg=
X-Google-Smtp-Source: ABdhPJw8sn/zOa+tfUYMIIXswCMakCrXq73mMEVajUWJxM38K6y8mXfJfkGLpDEYtgUVdP6pRbbNcg==
X-Received: by 2002:a17:902:e0cd:b0:14f:c388:891a with SMTP id
 e13-20020a170902e0cd00b0014fc388891amr2353242pla.70.1645427773638; 
 Sun, 20 Feb 2022 23:16:13 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id f16sm12323326pfa.147.2022.02.20.23.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:16:13 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v8 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Mon, 21 Feb 2022 16:14:12 +0900
Message-Id: <3a795886130b006d5d93591d1d08269f076cc3e4.1645426789.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
References: <cover.1645426789.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_231614_827812_887F0544 
X-CRM114-Status: GOOD (  22.29  )
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

 drivers/mtd/spi-nor/spansion.c | 103 +++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 5453b89a1c22..4511c0cfd090 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -166,6 +166,93 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
 	return 0;
 }
 
+static int s25hx_t_quad_enable(struct spi_nor *nor)
+{
+	int ret = spansion_quad_enable_volatile(nor, 0);
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
+		SPI_NOR_SPANSION_RD_ANY_REG_OP(nor->addr_width,
+					       SPINOR_REG_CYPRESS_CFR3V, 0, 1,
+					       nor->bouncebuf);
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
+/**
+ * s25hx_t_post_sfdp_fixups() - post SFDP fixups for S25HL-T and S25HS-T
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * For the single-die package parts (512Mb and 1Gb), only bottom and uniform
+ * sector maps are correctly populated in the erase_map structure. This is due
+ * to missing or incorrect entries in SMPT. The table below shows all possible
+ * combinations of related register bits and its availability in SMPT. Since
+ * bottom (factorly default) and uniform are commonly used, we don't fix the
+ * erase_map for top and split.
+ *
+ *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
+ *  -------------------------------------------------------------------
+ *      0    |    0    |    0    | Bottom     | YES
+ *      0    |    0    |    1    | Top        | NO (decoded as Split)
+ *      0    |    1    |    0    | Split      | NO
+ *      0    |    1    |    1    | Split      | NO (decoded as Top)
+ *      1    |    0    |    0    | Uniform    | YES
+ *      1    |    0    |    1    | Uniform    | NO
+ *      1    |    1    |    0    | Uniform    | NO
+ *      1    |    1    |    1    | Uniform    | NO
+ *  -------------------------------------------------------------------
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* Fast Read 4B requires mode cycles but SFDP does not advertise it */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
+}
+
+static struct spi_nor_fixups s25hx_t_fixups = {
+	.post_bfpt = s25hx_t_post_bfpt_fixups,
+	.post_sfdp = s25hx_t_post_sfdp_fixups
+};
+
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -353,6 +440,22 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
+		FLAGS(USE_CLSR)
+		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
