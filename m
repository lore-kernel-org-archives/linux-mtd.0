Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F302C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLZOBhe8uyUmBJ4rsfXfA3IGNMQhaSpAgtK6Q1jJs50=; b=hAPkx/96o2ZeOt
	bjqk4QGGzLglHF8DGQqqeVfmUy+/rkf7UlG2N5+HDAA5FiNTHNsDml0md6SFDRsSvdo2XG8lHXHCP
	769LVCj3SX/lYo0lpSRBt2vinMyYbqVv4b/Ybw7qxNQQMxYr0u7qimUoj8jE/4JT0FUqBvVdI7G1U
	McO9kPEAmzOOAuJyGVcSCtksVHnPuyq05CMvh6ZIP5N9oJVQpe3CB2uGFDgKc2l6LZq212e01WBlv
	gLNE/D7g8o9yj1Q2iKaZTdPP+cVo8FClfNjvj5gQASoJ+vs4LGnZgml/9fFm8w4YYDIaoxCpjXEUV
	wFfViB3Phr10IYYy9oKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTJ5-00Comc-8G; Thu, 21 Apr 2022 09:40:59 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTIu-00CoiC-Fd
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 09:40:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id r83so4203185pgr.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3yAqQDPXyupuyuw6cXwOS7J25IpD0xEBiK02DWEQp3g=;
 b=Zd9LoyeXbYsMcrWadZ/mVZyE9FbTDW6vHG43eBQSnKJy5Cfy5+YfzIEimtWur8wviE
 lHwVJrWdk87Aw9xuipiwnqBB3BWxBVcpB7vlLYobgGNjcoDUhWpLIBYyBCPwIGfJzhKo
 wq4Jx2/TU6zL6BHvx5oIn7mReSHiOSGanokYCO/9XTtAlE0hfgh13IqwmfRc9+JNElcv
 dZOuWfsJihuhKkKdz7TLgBrDKK9ZgQrvrk1X3OmPLRXZO5BlJmBMw9ty0NBSkXzN+40m
 /vHSDi6+22SdOmjLENNq6jRT/pqJS1s8+o/MnJmWL1om3lEL+fNMe725xEvkilw1tbA0
 QrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3yAqQDPXyupuyuw6cXwOS7J25IpD0xEBiK02DWEQp3g=;
 b=zCEKPu6eODCjS8DfDUdg5T8PBk4fterT/ZzFpeWjiKYs57veHCCn0JwPBkwOao83oM
 sgUX3kFp4QLJJlpfIjsfk5S/NWO/xYgUPnrIvUzzoOFp+sxMO6DaTLpe1hSvjPrZscQS
 lD/khRLubwKKbTMcRJsa9ooaa4sTN7WlRF13WGh+JmBB2sIpAov1EYz2xo8Q2Lj6e/xY
 safi11Y4sMjjEtnJ/CjrDfhfsgsuKk2rd159Y21RnL6LLl6h0m3ELUoCbEcf0FyrbW1x
 WuiOjmeZzkuupP/khY86Bofhl0m+IapesOG09MUW0Tfsm3qIqElNU2nEg+iBnlHHmUCM
 lSvA==
X-Gm-Message-State: AOAM533XsLtv83mCx4s7uaYO5nsGkSJldBneXB3pZCuuK8fWFh9RJUKq
 9gFslLOcvx04oqVKy0LZS/Jdnq/uPEY=
X-Google-Smtp-Source: ABdhPJxLO/Xz5W+ak2jwMq2E1JrYqaiEpyrA57+dBMjPqJiMGdjt+/ziNahtGqys0c2PD5h4rGjHHA==
X-Received: by 2002:a63:5a01:0:b0:3a8:9ab7:3382 with SMTP id
 o1-20020a635a01000000b003a89ab73382mr20514096pgb.272.1650534048019; 
 Thu, 21 Apr 2022 02:40:48 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (fp76ee264d.knge102.ap.nuro.jp.
 [118.238.38.77]) by smtp.gmail.com with ESMTPSA id
 k198-20020a633dcf000000b003aa9116ba17sm1503970pga.35.2022.04.21.02.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:40:47 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v13 4/4] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Thu, 21 Apr 2022 18:40:24 +0900
Message-Id: <5ecc521018a8fe89c5554c7d69a0a9a36eb16737.1650532121.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_024048_622336_C8BCD4E0 
X-CRM114-Status: GOOD (  19.67  )
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
Changes in v13:
  - Remove part specific set_4byte_addr_mode()
  - Revert SNOR_F_4B_OPCODES
  - Add post_sfdp to fix 3 byte erase opcode in 4BAIT 

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

 drivers/mtd/spi-nor/spansion.c | 66 ++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 952d4383f9da..e56c48c3280b 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -203,6 +203,56 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
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
@@ -379,6 +429,22 @@ static const struct flash_info spansion_nor_parts[] = {
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
