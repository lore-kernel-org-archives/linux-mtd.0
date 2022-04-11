Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2763CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 05:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wW0UZast+i56hTE6ir8Hr+a2/n10cVvrI7CDGahpqdM=; b=INp/rSTL9xAoie
	3nEZwCJEVi8KbCX6pGQ/Sh/uRuBmUXsaHyRLXzcCAX5iSqHvRAlHsVa17PoNPi0uyxwubrl8nC7Mw
	GmMkrpWSpqOZcc21SBl49tpGET8Jjz1UvujLQ5zcIj/QS+jVV4R+T4gKiELagK+hIpnAuvgbm7FeK
	J+5gFT3ZI/kpLptuDrDBzYCls13gbadhMYbna29gn99b+FupZGKosaRaWjp8fv+MCk9X8GlJp1MEo
	XTRcF5Ki/AbldMtEzxv4tHxHTTQH5GpO6rdBEBrpjdGjP2Y7ZFqnLNHs2adC4N5riwysTFC1i3o5O
	kDQOftS6zuLp5g7A2jjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndmXa-006k47-69; Mon, 11 Apr 2022 05:24:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndmXB-006jw4-V7
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 05:24:19 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso4295704pjj.1
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2022 22:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sVg7z31jpIusDzTr5G4xksLbWxKA1T1MLuNkptAu4U=;
 b=fnArYG1gqp3fAeMnHAiu4UW0fz42MD7B28QvtaiHeUz1I0hc1fl/tkdxb1UJIp00LG
 cosp6G1hS2uqhuYDIdJlq/KQ8rQDX8VRqGP3T6YtBKht5+ob0E5x+IgFXRnMkr5r3pQK
 x+PgfF8sNXteT6gofKtCx9QcX/WEQIA5kTUVRkYswmVrTjZA/QtDyOg+YymCeu6zcG2Q
 n1BV55LB64NIQF8aXCr5E7IQRql7JMqLCnn/0ePOz5kTc4cPHZvVyXlVMBndpkfLBiQD
 GNznLrJqfLq3p3xNr6KEJ3OGbHX2YOi4jKoXyo6pDbl4XEAbKKmFIjLFY+C6JdgSBbIj
 zJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sVg7z31jpIusDzTr5G4xksLbWxKA1T1MLuNkptAu4U=;
 b=0116XN1JLe4QvlNh74b7Qh0q02YfWDk7ke//aGRPwEpuJSxBPin2RFG1JJmOi0HaBY
 i4AAPTvYFzOC/mY4Za47/LV+1wVJx/McAD622yX8IbERyWmcHCnhQ3HINEQjdJ04gZZJ
 vCYMDZxyaTFcysjECIuUgm8LZyyIeWJ21qwmvgH7oKd25XDCKQoxwimxmD5sLVT6NIVw
 bULG9qlp5pUagcfo75zHjsuddu/oJZ1Ai4BdD6IOFtEQhEMQJ+FlCn5FNESY23ZBYBQn
 aAo/ZNdQLpaNnYVOUvf9l1e331YJR4ZZqTwTTipSnOUZeIG5LIoHEJT0XC6e0OnfEDwJ
 Qdjg==
X-Gm-Message-State: AOAM533vHVs17GQrvTqPA70C8n5IY27kfxkiw0GxnkKkAdNKRQzT/9l6
 Cr2YfHsTGvLqFTULoFZNfdUOvAHa0FU=
X-Google-Smtp-Source: ABdhPJzf1AqZQHbrcejWoANGCOuZxjTQbuw8HtcQL+Q7IKNJsdGd3znW1wr543qaLCjAmvQbbGUORw==
X-Received: by 2002:a17:90b:4f44:b0:1c7:9f03:9b2d with SMTP id
 pj4-20020a17090b4f4400b001c79f039b2dmr34965310pjb.24.1649654655002; 
 Sun, 10 Apr 2022 22:24:15 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 ne24-20020a17090b375800b001cb62235013sm6064261pjb.5.2022.04.10.22.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 22:24:14 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v10 4/4] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Mon, 11 Apr 2022 14:23:25 +0900
Message-Id: <6eaf336b290b42d313d862bafd072cb39e4ebf29.1649641729.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
References: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_222418_070115_1EC700E8 
X-CRM114-Status: GOOD (  17.60  )
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
index e58e864c308d..b78e5180b488 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -125,6 +125,40 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+static int s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
+				   const struct sfdp_parameter_header *bfpt_header,
+				   const struct sfdp_bfpt *bfpt)
+{
+	/* Replace Quad Enable with volatile version */
+	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
+
+	return cypress_nor_set_page_size(nor);
+}
+
+static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
+{
+	/*
+	 * Some of the older versions of flash have 3byte opcodes in 4BAIT.
+	 * Unset the flag so that core can convert to 4byte opcodes.
+	 */
+	nor->flags &= ~SNOR_F_HAS_4BAIT;
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
+	.post_bfpt = s25hx_t_post_bfpt_fixup,
+	.post_sfdp = s25hx_t_post_sfdp_fixup,
+	.late_init = s25hx_t_late_init,
+};
+
 /**
  * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -380,6 +414,26 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.addr_width = 3,
+		.fixups = &s25hx_t_fixups },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.addr_width = 3,
+		.fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.addr_width = 3,
+		.fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512)
+		PARSE_SFDP
+		MFR_FLAGS(USE_CLSR)
+		.addr_width = 3,
+		.fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
 		FLAGS(SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
