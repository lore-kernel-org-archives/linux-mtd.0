Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5407FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 05:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7HlfMAX9egc/ifLp3RkyX9zhFQvFTseC8ffOOv1Xp4=; b=EJ5SgbDo10jS/g
	kzX782qY3UpFpati717orlIuVPk5LyRKvPZFUzBOPNA8/1iduNdtiZUoKH13W5fW2fB4AGCfUiNX6
	NJ4rHfsxQBVBmPDhULMeUMMoQS+x+UeXZuQ73jvMCCDeSV8A958hlwxhksO0C2t5hHShq6ViSPYMM
	bFSTOSjoUoJaWvdCOEaORDTKHI8MwsXQbj5y5ZfGvjNLgt4nEDMijOqynbc3A0rbl1GrK9bCmVYVg
	13dXH9ZsTL39Tkfz8Aw9ZlTm8bHJjTT44644pmy4FXYf8TEa8OUzwvgk4ly6bTXxDgRYGEg4OQBy5
	CXxPntAK3z2Q3FobxIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngK8z-00FhwL-LC; Mon, 18 Apr 2022 05:41:49 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngK8v-00Fhv6-EU
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 05:41:46 +0000
Received: by mail-pg1-x529.google.com with SMTP id t184so4008652pgd.4
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2022 22:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emaA8ssr+l9McjXIGmLyvxFAdViFZdvTmg2A9UtSR8c=;
 b=Od9b1QEVtEdr0xs7D9iaWIlh2pcYqkNL4IhEHWhfFykPq4Y0Aa58SqkOfMAZGhK1TD
 hXZUEPbpl9Zalhet1HbYAzDHjB7MUqTMAXwr0q4ocRazLJwdjRcyQa/mOi2xcljnt649
 +b0cfuF7zpmc8i4c9dca8ZrIkOqISJKrEguYH3k53dwHNWgp3cSy9DxAT/lOOBW6tZbd
 TCTNiNuLjRgOmo7bsOxRL/G65DxpOX51fzXMjLRCRKJFEV0lS5iEef4w0G8hJQyFHpoc
 qdt8SGOcP4wTnIGvs13tnXU2vKpMZ/Po7Tti2nrM1urJinQBpC5A9H+i4qn1Zn6svMNe
 Wdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emaA8ssr+l9McjXIGmLyvxFAdViFZdvTmg2A9UtSR8c=;
 b=z1dbtIjrzfr8lu1rTl3AVaIrygdeg7l5kZy9Dg5vCihacnDN4FVlECv//j+7FHJKce
 0G9PBLip9LGCajDrgbI3c+jTJrND++6I05cy9WXArD7ath7Se1qx22MhQtS1a/xjyH9V
 0gfWcHPs+3fBiguZtnN5Xyfn5jSo4OWEoD9dapcIMAnM2Kabo0gbgBF5tbq3XewQG96s
 +hqLSivbv8rofqpsZxGjtS5UcvCkbfpsI2qmBX9bVD/JfNOGIgjFaUL9yEYRiVWaRKbe
 eZQzgPZC8APO4qP6EvDZ/XOkSAS3zIPw2tnxl6gT23Msde0yZy93iGlfS7zgKJS3TjRp
 7Otw==
X-Gm-Message-State: AOAM533kqz4F4MTAJpp1S92YVU7VccT2XqygPmj+1MPB6acVAMTZCMCV
 O+era9WpF3tEudRRUImYUmDV1b4sfBg=
X-Google-Smtp-Source: ABdhPJw65Waa9hk39Sq/DLVl3KPlTUEAdbuIywwGAcr/sQQgSikpd5FeriU2fjC3cXMvkyUx8g94AQ==
X-Received: by 2002:a05:6a00:1a55:b0:50a:7c6d:6c8c with SMTP id
 h21-20020a056a001a5500b0050a7c6d6c8cmr1716683pfv.64.1650260504453; 
 Sun, 17 Apr 2022 22:41:44 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 f12-20020a056a001acc00b004fb37ecc6b2sm10810873pfv.29.2022.04.17.22.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 22:41:44 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Mon, 18 Apr 2022 14:41:16 +0900
Message-Id: <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_224145_553510_D891145C 
X-CRM114-Status: GOOD (  17.45  )
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

 drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 493240ebfd70..dd37b829efbc 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
 	return 0;
 }
 
+static int
+s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt)
+{
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
+	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
+
+	return cypress_nor_set_page_size(nor, nor->addr_width);
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
@@ -384,6 +422,22 @@ static const struct flash_info spansion_nor_parts[] = {
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
