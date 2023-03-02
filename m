Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621BFC7EE2F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyCnaxfowRANqksISl/FvvXtM1AveUv08ozSUN21doo=; b=Lkcr0BVjZtBSqc
	2o7g4OHGTpH/JXNo5Xo58ZObVuk3cn1kEeghs8C/Kk/foSJWbnGM3yEZbvyF0U8nB4eWIawC5IS+J
	glAQsGsDHCBzHqoa6Oe4unmOpl0zojJHkIbUT16jiFqQxlmsvyyuXiT24O106Dei5CHnsLzzcq7KG
	J5JjjlHNoT1II6wL+2xwTgSb3vVWEJHQe2EMVTeKW4dE2GPOPqTUziUtz9wyQgXaYN150GOpyUwEw
	YYkGvrY8kAHrLTIf+No7zK5HHVhjMZ25DVqQgul+zBIyerlKTggxAaCkO61dbY9DZQOXaonstkhzl
	keJ17NASsahr/Fio3WgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdTN-0019Af-RV; Thu, 02 Mar 2023 07:35:29 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdTK-00199i-HR
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 07:35:28 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s17so9272294pgv.4
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 23:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KDHzeB9uc/l49VsYgi257Or69Bw9U5YVQkiaw+HUdw=;
        b=ePFLAvHZXdcOE9BbeMWUkZhRE7HLeyOWa/jXw+K5O83ILqV37mxVgVvPdxZ+5oaMS0
         xS4ZqtPYX7+0hq4V5fU67pSsojM3DOW3d3rZjtCCYndyoCGOxUOKL4JheGJaO7IdM+5u
         ILuMbQBHtHfzRa1cLWR/nP73VKzBnWE/i9QHro2twVm7S0h1WbKhYGotYuz5vXnoQlyL
         kWnMoOeyhYLCRPEe1IxF26LDN5F3hdqTF9uV7t+/2U2mfi6DvofHfznJiklipFV51MpN
         f+pYEjGyyHiWF9V6QzlQc8hXTXya1aowJle/on8I33y9slazjOTeUdmcDRW1x0Ox/OWX
         onzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KDHzeB9uc/l49VsYgi257Or69Bw9U5YVQkiaw+HUdw=;
        b=lMYzIuOLxdigpZEr9SmJ+tD4pUoMTQTT2TOf4VUcAk0eJxL0YneHT3RLagIb71L6+A
         JEYiJ6GAHwHyKl60/DCwwUuJNY3mQtSbfHgUtLWTLvfekBl3ArNAsCaESMEYzY/OWnGq
         lXmbvc4isrb9KwWOL+NPVB80M5VGR46gZFbBCWYG3Lv3lSlLBd/JjDYHk0QAE4XH1c/A
         5z/505zL9C2Iy2lIMGoZyCnoZVuH2cZXqXORNlwswPsB9cLJ4GVabyXXPXR/cKncQ8Mu
         sIemf1ZDX1AzIGoE6llnHM53XbGDAhmPlvV3lUElFVJ1D6qZrcYUikBroZ/paku5tK6Z
         ci5Q==
X-Gm-Message-State: AO0yUKX30TxBIGIevBUHCM/YLsDLz2vACuiNSgPxzTz6C2tRqikSlO3l
	c1y0zpbUbPGzYs1Nww5rVLeCnLVDK2xrwA==
X-Google-Smtp-Source: AK7set/Hc0x+HkNWZsDQlaYpqLrfxj3MV17MSmwKjQcHh2MpMSp2qYFUayG9Pa8DXG7U1Ftle3sBKA==
X-Received: by 2002:aa7:960d:0:b0:5ce:ef1b:a8b with SMTP id q13-20020aa7960d000000b005ceef1b0a8bmr8014513pfg.30.1677742524488;
        Wed, 01 Mar 2023 23:35:24 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v26-20020a62a51a000000b005a8e9e2f1c5sm9085898pfm.187.2023.03.01.23.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 23:35:24 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 2/2] mtd: spi-nor: spansion: Add support for Infineon S25FS256T
Date: Thu,  2 Mar 2023 16:35:07 +0900
Message-Id: <097ef04484966593ba1326d0a99462753d7d1073.1677557525.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
References: <cover.1677557525.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_233526_604061_B2A321B6 
X-CRM114-Status: GOOD (  17.00  )
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

Infineon S25FS256T is 256Mbit Quad SPI NOR flash. The key features and
differences comparing to other Spansion/Cypress flash familes are:
  - 4-byte address mode by factory default
  - Quad mode is enabled by factory default
  - OP_READ_FAST_4B(0Ch) is not supported
  - Supports mixture of 128KB and 64KB sectors by OTP configuration
    (this patch supports uniform 128KB only due to complexity of
     non-uniform layout)

Tested on Xilinx Zynq-7000 FPGA board.

Link: https://www.infineon.com/dgdlac/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v12_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
Changes in v3:
  - add params->addr_nbytes = 4 in post_bfpt
  - give 'ndummy' to RD_ANY_REG_OP in post_bfpt
  - s/SFDP/4BAIT in post_sfdp 

Changes in v2:
  - s/EOPNOTSUPP/ENODEV
  - Drop READ_FAST support
  - Amend comment in late_init()
  - sector size and page size as 0 in sizeINFO6()

---
 drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 9faab29aba57..1678b7b2e9f7 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -29,6 +29,7 @@
 	 SPINOR_REG_CYPRESS_CFR5_OPI)
 #define SPINOR_REG_CYPRESS_CFR5_OCT_DTR_DS	SPINOR_REG_CYPRESS_CFR5_BIT6
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define SPINOR_REG_CYPRESS_ARCFN		0x00000006
 
 /* Cypress SPI NOR flash operations. */
 #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)		\
@@ -218,6 +219,62 @@ static int cypress_nor_set_page_size(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
+			  const struct sfdp_parameter_header *bfpt_header,
+			  const struct sfdp_bfpt *bfpt)
+{
+	struct spi_mem_op op;
+	int ret;
+
+	/* 4-byte address mode is enabled by default */
+	nor->params->addr_nbytes = 4;
+	nor->params->addr_mode_nbytes = 4;
+
+	/* Read Architecture Configuration Register (ARCFN) */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_ARCFN, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	/* ARCFN value must be 0 if uniform sector is selected  */
+	if (nor->bouncebuf[0])
+		return -ENODEV;
+
+	return cypress_nor_set_page_size(nor);
+}
+
+static void s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+				SPINOR_OP_PP_1_1_4_4B,
+				SNOR_PROTO_1_1_4);
+}
+
+static void s25fs256t_late_init(struct spi_nor *nor)
+{
+	/*
+	 * Programming is supported only in 16-byte ECC data unit granularity.
+	 * Byte-programming, bit-walking, or multiple program operations to the
+	 * same ECC data unit without an erase are not allowed. See chapter
+	 * 5.3.1 and 5.6 in the datasheet.
+	 */
+	nor->params->writesize = 16;
+}
+
+static struct spi_nor_fixups s25fs256t_fixups = {
+	.post_bfpt = s25fs256t_post_bfpt_fixup,
+	.post_sfdp = s25fs256t_post_sfdp_fixup,
+	.late_init = s25fs256t_late_init,
+};
+
 static int
 s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 			const struct sfdp_parameter_header *bfpt_header,
@@ -446,6 +503,9 @@ static const struct flash_info spansion_nor_parts[] = {
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "s25fs256t",  INFO6(0x342b19, 0x0f0890, 0, 0)
+		PARSE_SFDP
+		.fixups = &s25fs256t_fixups },
 	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
 		PARSE_SFDP
 		MFR_FLAGS(USE_CLSR)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
