Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C5AC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:47:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B469C64F00
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B469C64F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nJLLz9qkQhGejtmXxMy2IvOEMS9yFqXNJo1XXtYsW8E=; b=py2Wk2FYvgcLezS29w7xeqUsr
	sElc3Dqgid+x74YDGeNjph9mS36atRITA4KTn/UzB68G9sjSLIs1sTyp0EXUKAAJMmx8AlIXOe6MP
	/e4GyB3LGwH/dueito22clc+GTQWAu350beVgQaqnD0F2PLY7CcTD/i9S8PJBnnN8asC3vrGymj6b
	DU2WrHtxvMYgm+wtZAmwD93GEPUItpC+G+f2NsmD5ElVNCSRUof44wDim/9fyvEGqY34LHuYS9USR
	843RgmpWrTlSbRu+/tvnFWC5lgH9hLAa6EFEsKgbnZoAEW4whmwG0BpbB/SrMz6eB104mCrsZCXqr
	UJHT9v04Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeN3-00B406-Eb; Fri, 12 Mar 2021 09:46:16 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeMT-00B3tC-EH
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:45:42 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3026628pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3oyb3xUPUE/PB4D67x6atHi/VEp23aG50PmIkSeIBg=;
 b=L4m91WtyaHshFu6tA2m4cXYGRNegL5GMYp4QFQAhuYgDLj4UFqF2OvtV7oSQgjFcZp
 +pm727Zfpl5l69ZhMjvsY48CRP/DKEVUXkF33FXt0A65yrzrIzb0G4pXU6axaEBi37f8
 YdZYRbpSiIqTFxfeR/d3T7Ix61yhLtBGvpgAA0T2KAnTFruStLLnOs8S0oZ4UriaoH5+
 83P5DAMIfqMXxKePPL9utKG1LYN/H2uDhf+YkVUjWM6zefxnu93VphOyJFUalMdHeY/0
 d6m0QlSxg08FFHYy/afbzfAjS1Wa5+GXD322Ys/9SXoCzQgQ/LhRoa8MTDiA7tEECoiX
 hiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3oyb3xUPUE/PB4D67x6atHi/VEp23aG50PmIkSeIBg=;
 b=aIA2nC6nXzoadE1B2o+a8/9nka/85BAHCNESsjRBGqP/NfxJfPRGwFrIfD+2c9p7oJ
 KF9xdqmLbAhvuaJHyTgJ4BQIbeTyYdNkxzv21soh1n8S2IfHjceNuya5U7TOIekIj/x9
 xGrz84fJgHlokYKWMBGiJ18h3cmVcvEYkIALnJ3PTzCz5DfK7BrfKz1WTajj3D38qnp9
 JZ6KpEGWFHpZvPx6/vggznULVcnU9b0GFq5ex/3WA1uuc9yakPDZlMw/4SZKK4K3JUSg
 MngcYKdJyWxBm/Ntmr6v2tW2VEYNtaSQHTCHxjU4Xwov/ZGYtrJlKV3aIQX39No4hxuQ
 kPmw==
X-Gm-Message-State: AOAM532lO3lfO9Yr/mrTx0K9kz9bqTBsPHe7ttsTTMCYDMeQhWO0xgkm
 E0CfJnRLMdL18SVbYK5QFKsvSUHRLWAQTA==
X-Google-Smtp-Source: ABdhPJwOlRtarU4ybaz43TcoykLogwQEh1K5n2SfpzpwCIq/Si8OhD8J9+8F+b4k+IJQcrmAoPgwjQ==
X-Received: by 2002:a17:90a:7c4b:: with SMTP id
 e11mr13203074pjl.151.1615542335604; 
 Fri, 12 Mar 2021 01:45:35 -0800 (PST)
Received: from ISCNPF1JZGWX.tyo.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id p17sm1731471pjv.49.2021.03.12.01.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:45:35 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, tkuw584924@gmail.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and
 fixups
Date: Fri, 12 Mar 2021 18:45:24 +0900
Message-Id: <b971b6a9378260368b287d64092ec75edc9eb9bb.1615523176.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_094538_059745_456ACDD7 
X-CRM114-Status: GOOD (  23.92  )
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
---
Changes in v3:
  - Remove S25HL256T and S25HS256T
  - Add S25HL02GT and S25HS02GT 
  - Add support for multi-die package parts support
  - Remove erase_map fix for top/split sector layout
  - Set ECC data unit size (16B) to writesize 

 drivers/mtd/spi-nor/spansion.c | 119 +++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 5742212fde2e..05a4ea00acfc 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -225,6 +225,107 @@ static int spansion_mdp_ready(struct spi_nor *nor, u8 reg_dummy, u32 die_size)
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
+	/*
+	 * For the signle-die package parts (512Mb and 1Gb), bottom 4KB and
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
+
+	/* Fast Read 4B requires mode cycles */
+	nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
+
+	/* The writesize should be ECC data unit size */
+	nor->params->writesize = 16;
+
+	/* Fixup for multi-die package parts */
+	if (nor->params->size > SZ_128M) {
+		/*
+		 * For the dual-die package parts (2Gb), SMPT parse fails due to
+		 * incorrect SMPT entries and the erase map is populated as 4K
+		 * uniform that does not supported the parts. So it needs to be
+		 * rolled back to 256K uniform that is the factory default of
+		 * multi-die package parts.
+		 */
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
@@ -475,6 +576,24 @@ static const struct flash_info spansion_parts[] = {
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
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs02gt",  INFO6(0x342b1c, 0x0f0090, 256 * 1024, 1024,
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
