Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69268C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 07:00:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF9F64F69
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF9F64F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Kp/b1gumh39RW2CtxXNYB44znD9JhAC7hPpudqyvF8=; b=XkVlVuzg1vOSt1X+8W6GIfv8Y
	W8f0WxYyclheKkr1k9ZZhTUGJEVAJldrIXgfsMQM5qcC/Gac9nbNJESdeiPnGxQgoIapgfFoyHVCP
	ajzvdSGhEdmz/PyuX3xTImEveS8N40orFoLjv/CrBJS3GrUwqRKXNIDVOkdZOKg08hjp8KXh/4r7g
	nPLS3oIzbTGGHBsWptbL4iSJ4ViYsiLwcRKUCfTfuWhwd67I2s6Pjo3HtSsWPvPB/nChNcdwGTdrQ
	rSnOeFcjENfXgIVbJecQgvECzhuuAyUgyW5272Cq4Ev5YmuZP2cQMnV/iaylZeQN33E3CL/APdOYh
	UTvZZlnvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN96b-006kWj-EK; Fri, 19 Mar 2021 06:59:34 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN965-006kNn-TE
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 06:59:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id h3so5220248pfr.12
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 23:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHwkrvgQnotmq3yDwvCGVU4YeoM/kdXawY4oQr8aKFQ=;
 b=LqTkTUHrxjBoBnDSt4uU9YGzu2V9A8TKsaXitFu8hlYWdi30nBDsf4h8zVS+DOhqwf
 uZZ0hKdDn0EBu86YOQA0b/zpa/ush+egTFmGS71MOyXky5T5XUE/c/K/YEyAog8zCVRm
 G0lMrRU6vR1tcyGU3AvASxm7ur50bSeYOL1JOjgk6AurgKDyFGF36b43DiV0F6qDZdCE
 IbF3EBEtV1cVT0qBBqjpZ82MQ2sDUhanHN03pZ7ed8oND62455W99WueV/86fvZ5Z+uL
 vJVEhmA9F3fsVr4yt9xMH5asRX2e8+xPhagz7Uui4nae1XE6z4AaW/wD6X65OPUY28VC
 AIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHwkrvgQnotmq3yDwvCGVU4YeoM/kdXawY4oQr8aKFQ=;
 b=ib7I0UwH3O7iji0BzBrQ5InIF6S3Lks0G6DWOnUGa6kCEuqkuN+lJZWTc0/1ihgzlf
 y8R/RKDQ/qGJ/hMsq7ntF8KZwUcfdaTgsG3ANlNDp/HZdCH08XwlPClTzih5/7rQsVvj
 fhtH1rjVCYXNUs2c88Usrf1ZFxkWPcuPCoSeCJVCrz/Swc1yQJYhrFj9A5HInvrPDNKD
 pm0ztwG2HKvrT9HDTfqdao9z9hUseYPbq+4LhF7jxdL2OQ8eiatV8MHCBGl2wGZOgGlM
 054+Je8iWzBbvLirmnbvHYcCNm5P9UGLM/dmhMNHSUCmOxQXFdILduwRD6E6QCtjTBQ1
 DpTw==
X-Gm-Message-State: AOAM530hbsiqaAuaX4pEAu56AKoy4muv9gnRPfMF4SyGhAA+AG6R0Fo+
 ryZ6RgHshPprVgZNcWzMV5K5D5nwTcs4FQ==
X-Google-Smtp-Source: ABdhPJxnUGJsWNy1p+d6XFNF/Mb+PKLsWHCQTmbNZkMxmgMHGw2hO3q/iiHJZ+6C04/7ZTGY2z9ixA==
X-Received: by 2002:a63:5a50:: with SMTP id k16mr10192529pgm.155.1616137140243; 
 Thu, 18 Mar 2021 23:59:00 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id y7sm4424859pfq.70.2021.03.18.23.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 23:58:59 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Fri, 19 Mar 2021 15:58:46 +0900
Message-Id: <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_065903_193353_53DDB081 
X-CRM114-Status: GOOD (  24.17  )
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
uniform sector sizes are supported. For the multi-die package parts (2Gb),
only uniform sector sizes is supprted. This is due to missing or incorrect
entries in SMPT. Fixup for other sector sizes configurations will be
followed up as needed.

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
Changes in v4:
  - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
  - Remove USE_CLSR flags from S25HL02GT and S25HS02GT

Changes in v3:
  - Remove S25HL256T and S25HS256T
  - Add S25HL02GT and S25HS02GT 
  - Add support for multi-die package parts support
  - Remove erase_map fix for top/split sector layout
  - Set ECC data unit size (16B) to writesize 

 drivers/mtd/spi-nor/spansion.c | 115 +++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 04ad8f83dae0..63a10ba28fc1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -229,6 +229,103 @@ static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
 	return 1;
 }
 
+static int s25hx_t_quad_enable(struct spi_nor *nor)
+{
+	return spansion_quad_enable_volatile(nor, 0, SZ_128M);
+}
+
+static int s25hx_t_mdp_ready(struct spi_nor *nor)
+{
+	return spansion_mdp_ready(nor, 0, SZ_128M);
+}
+
+static int
+s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params)
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
+	params->quad_enable = s25hx_t_quad_enable;
+
+	/*
+	 * The page_size is set to 512B from BFPT, but it actually depends on
+	 * the configuration register. Look up the CFR3V and determine the
+	 * page_size. For multi-die package parts, use 512B only when the all
+	 * dies are configured to 512B buffer.
+	 */
+	for (addr = 0; addr < params->size; addr += SZ_128M) {
+		ret = spansion_read_any_reg(nor,
+					    addr + SPINOR_REG_CYPRESS_CFR3V, 0,
+					    &cfr3v);
+		if (ret)
+			return ret;
+
+		if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ)) {
+			params->page_size = 256;
+			return 0;
+		}
+	}
+	params->page_size = 512;
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
+	 *
+	 * For the dual-die package parts (2Gb), SMPT parse fails due to
+	 * incorrect SMPT entries and the erase map is populated as 4K uniform
+	 * that does not supported the parts. So it needs to be rolled back to
+	 * 256K uniform that is the factory default of multi-die package parts.
+	 */
+	if (nor->params->size > SZ_128M) {
+		spi_nor_init_uniform_erase_map(&nor->params->erase_map,
+					       BIT(SNOR_ERASE_TYPE_MAX - 1),
+					       nor->params->size);
+
+		/* Need to check status of each die via RDAR command */
+		nor->params->ready = s25hx_t_mdp_ready;
+	}
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
@@ -479,6 +576,24 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			     SPI_NOR_4B_OPCODES) },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hl02gt",  INFO6(0x342a1c, 0x0f0090, 256 * 1024, 1024,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 256 * 1024, 1024,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	  .fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
