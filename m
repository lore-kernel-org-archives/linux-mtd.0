Return-Path: <SRS0=EgaJ=JY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F8FC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:18:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE31961076
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Apr 2021 07:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE31961076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XYZPQLGsCvEUL9oLJGVPkkkv+jiVdaVo3GcBLuV9xRs=; b=HNImj98oLxmLqPDLbnPuluOF0
	WqSOZfIKP1SkfX+p3CrgOCPOeU7wiNNsOwp/CuKtH0FC2uyEaZvv2YOovrJxiizV9xwRujupHo3+d
	TyBpcMIJKpnVUokL28TwiVk6VRGgIHVwl8gwyovIPeWWk1seCxs5aci2/Np0UUNUxtqOEJhDRbdyR
	a3E9EaUkYZw519GXuJ2qLkRfXESR6jIr9wRJyvtHw568wHRyQ7DvlsTSkDzbpFQlyjuBrlP7vKV/T
	6tuAy75wbuHoQ09bcvtFeshYmwlqGEBSdQ3DIFwJ0aAS4qMcOvlvmE/uGxi/5ZVn5eJOV1OUT/8Jf
	Nrkz/XItg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbHy3-000wYv-3x; Tue, 27 Apr 2021 07:17:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqn-000vV6-CV
 for linux-mtd@desiato.infradead.org; Tue, 27 Apr 2021 07:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1c9USNyud8PJeEJI49mh7QL/r1WaYoN5sOTMDFWn1zM=; b=S/VQ3CcBSu1XxWgTmlpb2L75j1
 Pj72SvYZC8JigWN04yFJVfKY0c4k44ormigCN/QssLy/xPMvvE2JwESNdrWlAaOtLUvAsJq9JnlpE
 NRbI2Y+spbWyLOSRVz/9YbhrKhrz7+UA7JdG91xYcmA3S2AJoGD3ZDPnSD940mJhIVVtWGYvUuICi
 1lfd8YcLGpGb0mTqndhBmi2lqKD00lWx6sdaCbOUQ1ncfZPKBWQFa8rQqGZGCTCoKfHVtSB4b/g8g
 jvudHkQy5xzjK2hrvCvC43+nVzReo133xk1/6HpkRvTlgNV6JzR4xDc3zuVOfQCwUE+1GFoK2o2yK
 73i4bA0Q==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbHqk-00GUhO-K2
 for linux-mtd@lists.infradead.org; Tue, 27 Apr 2021 07:09:40 +0000
Received: by mail-pg1-x532.google.com with SMTP id d10so3342598pgf.12
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1c9USNyud8PJeEJI49mh7QL/r1WaYoN5sOTMDFWn1zM=;
 b=m6W2L3WalvuzzwUycUn8J7jRR5UAh+JO8xHPy3AOmNDpv7NAy/jus4AdMWsd/NiXyU
 Jj22Sh+H5y79w4uBCBM7bOdxHiLLiJRFGgWNrkhcWYQlXzZ7P5upWSBjG8rTP7nCMSo5
 Rk4oW2xv+svNPiqMSXtvCqWvr1o4rwCLPA0dt5s5ubhD6mgt+h25VUHxHAiHWPjp8tle
 Rs4pkXTwdleCcExhpfIIERo9RhQ7wPQsA3C2Ho9ht6NuTgpSG2rgBtHBb+xn7p2yLzKP
 hRShpBlLR+FRf/8uFk7yLvd669gSD6fuaqdSOKDPLXBhXhuigQcF/4fNcjhXUh8rnTyN
 oF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1c9USNyud8PJeEJI49mh7QL/r1WaYoN5sOTMDFWn1zM=;
 b=QVJrYREYVmmmMmazZsr8Mj4YmFmcFmC7g2xShYWNd9Oal+umRPHi7M0wO8DtSyY9aL
 BDUxqDq4x0WeYFACu+RRQehc1KL3YfqumFIc0Jlkuj6kS/0Q9MJgvAJrFtIjrmSgALnq
 IvqW6q4BMs1VPuqfGI3+PkE41DD9u4dM9FRGQv59Zdbd03uD0TGGzK1aGHeWSY99e6er
 cJ0bQpGMqZzaKXswS+CVQzCTWCLQ6oVFy9ccdSIqkFMfHMvCK3V88rniN7Js2bO1D5bC
 ULwdNfp4P5MBoITPykk3Cl5FbUaz5FxcEwkUltydmNng0GzzqvN3gbZAWqfkexBaN4ML
 Wv5w==
X-Gm-Message-State: AOAM530VqoGw473Y0ELdiA1tuODdwnXMLuNPxHRsFnr5k4s2ERMdLewv
 4m372vAHof4vHiaAPu7/j4y3Qi3z4BQ=
X-Google-Smtp-Source: ABdhPJy+w373HkVYWADbiiB7QH9HOqtOm05ZoNTveV1qbc5JatqRm6EvBmDQMO6U5PWZ6R6f1BkU+A==
X-Received: by 2002:a63:be08:: with SMTP id l8mr9478205pgf.438.1619507377342; 
 Tue, 27 Apr 2021 00:09:37 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id u189sm1589803pfb.151.2021.04.27.00.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 00:09:37 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v5 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Tue, 27 Apr 2021 16:09:01 +0900
Message-Id: <28d1a4015f37156a8bebe88959ea643e64b030f8.1619504535.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
References: <cover.1619504535.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_000938_686126_D7CBB0D5 
X-CRM114-Status: GOOD (  24.97  )
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

 drivers/mtd/spi-nor/spansion.c | 117 +++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 79d3249ed0aa..b3b006874b4f 100644
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
@@ -479,6 +576,26 @@ static const struct flash_info spansion_parts[] = {
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
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     NO_CHIP_ERASE)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 256 * 1024, 1024,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     NO_CHIP_ERASE)
+	  .fixups = &s25hx_t_fixups },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
