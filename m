Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58E7C636CD
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 08:06:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 733F160FE4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 08:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 733F160FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or6idj+B3O12Ma5Z58ZrvrNvRwdxCxuhPrf51px0eUs=; b=0UmW2hDnzhS62i
	eMHHJL/J1yNibpoDSTEPdt/gTGsEKTpnTConAu7xZa1/LHaD7/hE5puVQOCFzaveQGtDzvsh/Qg2S
	ZsChGihwOeRCBnnBl9MJM+ADQVuleTE/Ro1kgdoeUUBb0G0eP8U/K4xS/IKzmoEMAoFrxgHbSD0yW
	y+QdU8HxvGNaRRUCsHpnj3lsdQMPrdFn8uAF4xNJ4OciF8Kc52Uwm29g7YqnOTRdaUCoVDhFadaDZ
	IYoHkzWUff5ihyHAN3RLRfQw/mGiOKG/WSBoGSW/vNr/Au523f4p+7WdaxHuS2FhqOTiSW/reybCE
	EpUK1mPThNqe0MD2ANBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5OHY-008jWC-Mf; Mon, 19 Jul 2021 08:05:44 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5OG8-008ixg-Fz
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 08:04:18 +0000
Received: by mail-oo1-xc32.google.com with SMTP id
 t46-20020a4a96f10000b02902618ad2ea55so4240663ooi.4
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03oS2Ve1O1D9Ww84GqjamVHyHXq5li/iC6k5UReTBc8=;
 b=NgaRcYCKlUNLafV1a/A6ceQdIh9R5fca/Ket/HhdOdGBwzTQdWuuqsG4rEyJ2b2tJ/
 GOfVYj/OYaWOzrLVqSc3tD9WzSb8IoujQMIgcT+cbH7Ni5zMp2k6qP2JtWSWbjBkYgbz
 XiX5+t+v82oKRe9lFrbP0dEA1x58kobMdpbV95TwhMyPPEUZDg76WzcM8ESKU8BoeIQq
 NQVF2otZuZrGpOToKEHK05gNzwJeAF7D+mfFXg1qUNUHAeEbTH4OPMJmYBhboGWjnBQ7
 W95Z1ntxkgikGXsNX8TAEFgXPuXXPY8Y8uNGTW/3zb8xLNn2UX4kqV2DN8E1yl4Uvv7/
 av3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03oS2Ve1O1D9Ww84GqjamVHyHXq5li/iC6k5UReTBc8=;
 b=ON+c0e/6LsjjRAN6hJ5T1oEewcZZsN4Bt8Rv6EKqE9ZyGuAGg+dgT3i8yzUvCs2MfT
 vTk0XzXzMYO3r7MfppYKsM0MCiVSUbtW4w0YET+wWOU4VOIT9BvhTxYyaHBxf37cUs66
 4kV6SZzYTWiN6WjpCDptnGxgTrnJk2voHvk/FdsTOhsIm0+6iHDsKtoO4VxZD/0W30I2
 T7gjPhVxQWXO6+ZZMoY/u6G3WmenGeeowcyePOjIyhkWu7fOzOgfLOQb8yDlkq75JX7K
 gpSC9Jw81wWAQFxFyH/zEsfSnrMqU9sZZpMikjI4kOUPr7Q0Pim4/SXPegKg7kisWFzY
 ROXQ==
X-Gm-Message-State: AOAM533PpBmVrFCNKgYscFnBGxKKPkPaXKUBOOet1jroOKyvVgSNCXTr
 JvhviHY3eOkuRfpikDqyB1SNWNxH1PM=
X-Google-Smtp-Source: ABdhPJxPuPBB/g3uzbuKn9PaTp8p03STif/igmRDNVxIXPqjk98bROaqY1gilk+EV5LHtnYrzsxbIg==
X-Received: by 2002:a4a:a542:: with SMTP id s2mr13265340oom.78.1626681855303; 
 Mon, 19 Jul 2021 01:04:15 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id w24sm3533935otp.28.2021.07.19.01.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 01:04:15 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v7 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Mon, 19 Jul 2021 17:03:47 +0900
Message-Id: <51eb0f45c2d03cc12ad5959410c88c69aa856df7.1626677855.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_010416_604407_A1E06449 
X-CRM114-Status: GOOD (  21.66  )
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

The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.

For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
uniform sector sizes are supported. This is due to missing or incorrect
entries in SMPT. Fixup for other sector sizes configurations will be
followed up as needed.

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
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

 drivers/mtd/spi-nor/spansion.c | 90 ++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ca50e77b4220..c7170477e706 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -220,6 +220,84 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
 	return 0;
 }
 
+static int s25hx_t_quad_enable(struct spi_nor *nor)
+{
+	int ret = spansion_quad_enable_volatile(nor, 0);
+
+	/* Reset WEL bit in any error cases */
+	spi_nor_write_disable(nor);
+
+	return ret;
+}
+
+static int
+s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt)
+{
+	int ret;
+	u32 addr;
+	u8 cfr3v;
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
+	 * The page_size is set to 512B from BFPT, but it actually depends on
+	 * the configuration register. Look up the CFR3V and determine the
+	 * page_size.
+	 */
+	ret = spansion_read_any_reg(nor, addr + SPINOR_REG_CYPRESS_CFR3V,
+				    nor->addr_width, 0, &cfr3v);
+	if (ret)
+		return ret;
+
+	if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ))
+		nor->params->page_size = 256;
+	else
+		nor->params->page_size = 512;
+
+	return 0;
+}
+
+void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* Fast Read 4B requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
+
+	/*
+	 * For the single-die package parts (512Mb and 1Gb), bottom 4KB and
+	 * uniform sector maps are correctly populated in the erase_map
+	 * structure. The table below shows all possible combinations of related
+	 * register bits and its availability in SMPT.
+	 *
+	 *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
+	 *  -------------------------------------------------------------------
+	 *      0    |    0    |    0    | Bottom     | YES
+	 *      0    |    0    |    1    | Top        | NO (decoded as Split)
+	 *      0    |    1    |    0    | Split      | NO
+	 *      0    |    1    |    1    | Split      | NO (decoded as Top)
+	 *      1    |    0    |    0    | Uniform    | YES
+	 *      1    |    0    |    1    | Uniform    | NO
+	 *      1    |    1    |    0    | Uniform    | NO
+	 *      1    |    1    |    1    | Uniform    | NO
+	 *  -------------------------------------------------------------------
+	 */
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
@@ -468,6 +546,18 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			     SPI_NOR_4B_OPCODES) },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
