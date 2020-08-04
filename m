Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4D6C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 08:50:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 642542075D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 08:50:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJA/TBhz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRY9t7uZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 642542075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TrPXJeMN4xaRdiJKzdrlI5KZ2j3o+T3z0+ttxBbQ+C4=; b=RJA/TBhzBckGR/3fI5dgJR6NpL
	zjxVK8tYfm3pS6/e6mZJPKTiAef87FibRwBKr3RyGwD0xuhQxOXMhCEAZvoznq6hQm38B+0lZtLo6
	pAiinMCl2X0nvSNrBPE2dBD9cXaNhAymuw5Myc7S8d/5RErYvi5myl8rDlOtD/MTervR7AUiRJ/G1
	JJSDyLN4VJRe8j35d2d7zG6eIuhd1a5QuN2fhD5CF+INj2I5AmNf3wbsblxYlDrvjy8OW3uepkY8v
	OfBH22jYWUyFqJCit7NN2EW3Kv6NeDPvvtilmJoIApfoGVVhWPmk0d/P42+QBMb9xjULAEM22YtHK
	9n//hD8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2sdj-0006AW-Fl; Tue, 04 Aug 2020 08:49:43 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2sdf-0006A8-S5
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 08:49:41 +0000
Received: by mail-pl1-x643.google.com with SMTP id t10so17130270plz.10
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=w8eCaQ0buEaqCOvdzZ/4P9kW7Xt9z0wbmw1BoQuhb3g=;
 b=WRY9t7uZZkmSrbc1eVljbNfjkmnlEcCHbQwbsfB3k09fMBwyIPUt6CPyzLJSLuGIZs
 NiruRX/Rqfnj1ePF0kxPCFolwUuViyv23zBw9AaEdzuvmbq6xJ0+CKjGhhSZu/MSjDic
 Cu4EGkUx2NSdAkOPDcOIQS9a8RXyVN6WZOYYwEE6p1kSIkFhR6720pOjySKeGF2o01tj
 mcnyZYxYt8Xd8zW6BwJkm6uJ5erCUUVenycWyYmbvGWivvbnW7DlskIChmIMHVc+nNNk
 7UvK24Awbq/VAWAkkYktVXVIN1SnmYGtGCQOMwj1Zifs0vL6jIo4LF4k8XrFttai7l5Q
 QqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=w8eCaQ0buEaqCOvdzZ/4P9kW7Xt9z0wbmw1BoQuhb3g=;
 b=cBOMskQ+IvPPebfqNNYK9yHiygZHHsbmKLo29KXKEirmypwpkt7Nirp0Bv/IxPjhFl
 xTYLNRWG4K3Ald+BeBgHSOzi/QkwkGJqmNJu/mqy5nKAIRgW1o31SDKcnQXgIzue5F6e
 GSrPQvlBI1Pevx50mex+ybNNjHE/ISYcIgYI7q7CGHNZqEnMj9GRBsifWccBhB+yMAzt
 nHMicFzWcUdBMxPbrFoyPmT8xmYP5szBt23vtHE8BExLQF3n+SC7Jk2p2H2cSvYZjW0I
 QnaJHMzZvALXukwD+bKUdfoSPe87e2J/HARndU6rtLTMFHGwVYdUrEfNKHvgKWwlOHzv
 SSyA==
X-Gm-Message-State: AOAM531kdzItW89XXtoHzRa4CGCfPqRZfk+uogp0dbnK3SPQ+ujUhXzc
 MksYY9h864bNjcYCy76ABEaSUulMvTs=
X-Google-Smtp-Source: ABdhPJwUk2K+jv/V8QcSRtmhXN37oJHF1G5hEvVgCPAcKYx/d3wEZqNyqG2GL+A2CSsF2BjDGRhsww==
X-Received: by 2002:a17:902:322:: with SMTP id
 31mr18042179pld.33.1596530975451; 
 Tue, 04 Aug 2020 01:49:35 -0700 (PDT)
Received: from JP00894.cysemi.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id q73sm1869757pjc.11.2020.08.04.01.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 01:49:35 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@cypress.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: spansion: Add support for s25hl-t/s25hs-t
Date: Tue,  4 Aug 2020 17:48:37 +0900
Message-Id: <20200804084837.1014-1-Takahiro.Kuwano@cypress.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_044939_949817_13F7852B 
X-CRM114-Status: GOOD (  25.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 tkuw584924@gmail.com, Takahiro Kuwano <Takahiro.Kuwano@cypress.com>,
 miquel.raynal@bootlin.com, Bacem.Daassi@cypress.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>

The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI. 
The datasheet can be found in https://community.cypress.com/docs/DOC-15165

The fixup overwrites setup() and quad_enable(). The setup() sets read,
erase map, and page size settings as substitute for SFDP. It also updates
mtd_info to support transparent ECC feature. The quad_enable() sets the
Quad Enable bit in the volatile register. The Read/Write Any Register
commands are added for these fixup hooks.

Tested on Xilinx Zynq-7000 FPGA board.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
---
 drivers/mtd/spi-nor/core.c     |   4 +-
 drivers/mtd/spi-nor/core.h     |   3 +
 drivers/mtd/spi-nor/spansion.c | 418 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h    |  15 ++
 4 files changed, 438 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0369d98b2d12..cd84f6d2785c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2602,8 +2602,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 	return 0;
 }
 
-static int spi_nor_default_setup(struct spi_nor *nor,
-				 const struct spi_nor_hwcaps *hwcaps)
+int spi_nor_default_setup(struct spi_nor *nor,
+			  const struct spi_nor_hwcaps *hwcaps)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	u32 ignored_mask, shared_mask;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 6f2f6b27173f..1d27b6f2a8d1 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -433,6 +433,9 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 			     const struct sfdp_bfpt *bfpt,
 			     struct spi_nor_flash_parameter *params);
 
+int spi_nor_default_setup(struct spi_nor *nor,
+			  const struct spi_nor_hwcaps *hwcaps);
+
 static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
 {
 	return mtd->priv;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index e550cd5c9d3a..bf19b92410fa 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -8,6 +8,386 @@
 
 #include "core.h"
 
+/**
+ * spansion_read_any_reg() - Read Any Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_addr:	register address
+ * @reg_dummy:	number of dummy cycles for register read
+ * @reg_val:	pointer to a buffer where the register value is copied into
+ *
+ * 1 dummy clock cycle is required to read volatile register when CFR3[7:6]=01,
+ * while the spimem takes number of dummy 'bytes'. Since the Flash repeats
+ * outputting the same register contents as long as clock keeps toggling, we can
+ * restore the original register content by reading two bytes
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
+				 u8 reg_dummy, u8 *reg_val)
+{
+	u8 read_opcode, read_dummy, dummy_rem;
+	enum spi_nor_protocol read_proto;
+	size_t len;
+	ssize_t ret;
+
+	read_opcode = nor->read_opcode;
+	read_dummy = nor->read_dummy;
+	read_proto = nor->read_proto;
+
+	nor->read_opcode = SPINOR_OP_RDAR;
+	nor->read_dummy = reg_dummy & ~7;
+	nor->read_proto = SNOR_PROTO_1_1_1;
+
+	dummy_rem = reg_dummy - nor->read_dummy;
+	len = dummy_rem ? 2 : 1;
+
+	ret = spi_nor_read_data(nor, reg_addr, len, nor->bouncebuf);
+
+	nor->read_opcode = read_opcode;
+	nor->read_dummy = read_dummy;
+	nor->read_proto = read_proto;
+
+	if (ret == len) {
+		if (dummy_rem)
+			*reg_val = (nor->bouncebuf[0] << dummy_rem) |
+				   (nor->bouncebuf[1] >> (8 - dummy_rem));
+		else
+			*reg_val = nor->bouncebuf[0];
+
+		return 0;
+	}
+
+	return ret < 0 ? ret : -EIO;
+}
+
+/**
+ * spansion_write_any_reg() - Write Any Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @reg_addr:	register address
+ * @reg_val:	register value to be written
+ *
+ * Function is for writing volatile registers that will be effective immediately
+ * after the operation (status polling is not needed).
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_write_any_reg(struct spi_nor *nor, u32 reg_addr, u8 reg_val)
+{
+	u8 program_opcode;
+	enum spi_nor_protocol write_proto;
+	ssize_t ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	program_opcode = nor->program_opcode;
+	write_proto = nor->write_proto;
+
+	nor->program_opcode = SPINOR_OP_WRAR;
+	nor->write_proto = SNOR_PROTO_1_1_1;
+
+	nor->bouncebuf[0] = reg_val;
+	ret = spi_nor_write_data(nor, reg_addr, 1, nor->bouncebuf);
+
+	nor->program_opcode = program_opcode;
+	nor->write_proto = write_proto;
+
+	return ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+/**
+ * spansion_init_sp4k_erase_map() - init erase map for split 4KB sectors
+ * @nor:		pointer to a 'struct spi_nor'
+ * @sector_size:	size of the regular sector (typ. 256KB)
+ * @num_4k_sectors:	number of 4KB sectors to split between top and bottom
+ *                      (num_4k_sectors/2 at each top and bottom)
+ *
+ * Return: 0 on success, -ENOMEM if devm_kcalloc() fails.
+ */
+static int spansion_init_sp4k_erase_map(struct spi_nor *nor, u32 sector_size,
+					u8 num_4k_sectors)
+{
+	struct spi_nor_erase_map *map = &nor->params->erase_map;
+	struct spi_nor_erase_region *region;
+	u32 sz_4k_region, rem_size;
+	u64 offset;
+
+	region = devm_kcalloc(nor->dev, 5, sizeof(*region), GFP_KERNEL);
+	if (!region)
+		return -ENOMEM;
+
+	map->regions = region;
+	map->uniform_erase_type = 0;
+	sz_4k_region = (num_4k_sectors * SZ_4K) >> 1;
+	rem_size = sector_size - sz_4k_region;
+
+	spi_nor_set_erase_type(&map->erase_type[0], SZ_4K, SPINOR_OP_BE_4K);
+	spi_nor_set_erase_type(&map->erase_type[1], rem_size, SPINOR_OP_SE);
+	spi_nor_set_erase_type(&map->erase_type[2], sector_size, SPINOR_OP_SE);
+
+	region[0].offset = BIT(0);
+	region[0].size = sz_4k_region;
+	offset = region[0].size;
+
+	region[1].offset = offset | BIT(1);
+	region[1].size = rem_size;
+	offset += region[1].size;
+
+	region[2].offset = offset | BIT(2);
+	region[2].size = nor->params->size - (sector_size << 1);
+	offset += region[2].size;
+
+	region[3].offset = offset | BIT(1);
+	region[3].size = rem_size;
+	offset += region[3].size;
+
+	region[4].offset = offset | BIT(0) | SNOR_LAST_REGION;
+	region[4].size = sz_4k_region;
+
+	return 0;
+}
+
+/**
+ * spansion_init_tb4k_erase_map() - init erase map for top/bottom 4KB sectors
+ * @nor:		pointer to a 'struct spi_nor'
+ * @sector_size:	size of the regular sector (typ. 256KB)
+ * @num_4k_sectors:	number of 4KB sectors at top or bottom
+ * @top:		true  = 4KB sectors at top
+ *                      false = 4KB sectors at bottom
+ *
+ * Return: 0 on success, -ENOMEM if devm_kcalloc() fails.
+ */
+static int spansion_init_tb4k_erase_map(struct spi_nor *nor, u32 sector_size,
+					u8 num_4k_sectors, bool top)
+{
+	struct spi_nor_erase_map *map = &nor->params->erase_map;
+	struct spi_nor_erase_region *region;
+	u32 sz_4k_region, rem_size;
+
+	region = devm_kcalloc(nor->dev, 3, sizeof(*region), GFP_KERNEL);
+	if (!region)
+		return -ENOMEM;
+
+	map->regions = region;
+	map->uniform_erase_type = 0;
+	sz_4k_region = num_4k_sectors * SZ_4K;
+	rem_size = sector_size - sz_4k_region;
+
+	spi_nor_set_erase_type(&map->erase_type[0], SZ_4K, SPINOR_OP_BE_4K);
+	spi_nor_set_erase_type(&map->erase_type[1], rem_size, SPINOR_OP_SE);
+	spi_nor_set_erase_type(&map->erase_type[2], sector_size, SPINOR_OP_SE);
+
+	if (top) {
+		region[0].offset = BIT(2);
+		region[0].size = nor->params->size - sector_size;
+
+		region[1].offset = region[0].size | BIT(1);
+		region[1].size = rem_size;
+
+		region[2].offset = (region[0].size + region[1].size) | BIT(0);
+		region[2].size = sz_4k_region;
+	} else {
+		region[0].offset = BIT(0);
+		region[0].size = sz_4k_region;
+
+		region[1].offset = sz_4k_region | BIT(1);
+		region[1].size = rem_size;
+
+		region[2].offset = nor->info->sector_size | BIT(2);
+		region[2].size = nor->params->size - sector_size;
+	}
+	region[2].offset |= SNOR_LAST_REGION;
+
+	return 0;
+}
+
+/**
+ * spansion_quad_enable_volatile() - enable Quad I/O mode in volatile register.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @reg_addr_base:	base address of register (can be >0 in multi-die parts)
+ * @reg_dummy:		number of dummy cycles for register read
+ *
+ * It is recommended to update volatile registers in the field application due
+ * to a risk of the non-volatile registers corruption by power interrupt. This
+ * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
+ * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
+ * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
+ * also set during Flash power-up.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_quad_enable_volatile(struct spi_nor *nor, u32 reg_addr_base,
+					 u8 reg_dummy)
+{
+	u32 reg_addr = reg_addr_base + SPINOR_REG_ADDR_CFR1V;
+	u8 cfr1v, cfr1v_written;
+	int ret;
+
+	/* Check current Quad Enable bit value. */
+	ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+	if (ret)
+		return ret;
+	if (cfr1v & CFR1_QUAD_EN)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	cfr1v |= CFR1_QUAD_EN;
+
+	ret = spansion_write_any_reg(nor, reg_addr, cfr1v);
+	if (ret)
+		return ret;
+
+	cfr1v_written = cfr1v;
+
+	/* Read back and check it. */
+	ret = spansion_read_any_reg(nor, reg_addr, reg_dummy, &cfr1v);
+	if (ret)
+		return ret;
+
+	if (cfr1v != cfr1v_written) {
+		dev_dbg(nor->dev, "CFR1: Read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * s25hx_t_set_read_settings() - read settings for s25hx-t family
+ * @params:	pointer to the 'struct spi_nor_flash_parameter'
+ *
+ * Function assumes the opcodes will be converted to 4B opcodes
+ */
+static void s25hx_t_set_read_settings(struct spi_nor_flash_parameter *params)
+{
+	struct spi_nor_read_command *read;
+
+	/* Fast Read 4B requires mode cycles */
+	read = &params->reads[SNOR_CMD_READ_FAST];
+	read->num_mode_clocks = 8;
+
+	/* Dual Output Read is not supported */
+	params->hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_2;
+
+	/* Add Dual I/O Read */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
+	read = &params->reads[SNOR_CMD_READ_1_2_2];
+	read->num_mode_clocks = 4;
+	read->num_wait_states = 8;
+	read->opcode = SPINOR_OP_READ_1_2_2;
+	read->proto = SNOR_PROTO_1_2_2;
+
+	/* Add Quad I/O Read */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4;
+	read = &params->reads[SNOR_CMD_READ_1_4_4];
+	read->num_mode_clocks = 2;
+	read->num_wait_states = 8;
+	read->opcode = SPINOR_OP_READ_1_4_4;
+	read->proto = SNOR_PROTO_1_4_4;
+}
+
+/**
+ * s25hx_t_setup() - configure s25hx_t device.
+ * @nor:	pointer to a 'struct spi_nor'
+ * @hwcaps:	pointer to a 'struct spi_nor_hwcaps'
+ *
+ * Read, Program, and Erase settings in place of SFDP
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int s25hx_t_setup(struct spi_nor *nor,
+			 const struct spi_nor_hwcaps *hwcaps)
+{
+	int err;
+	u8 cfr3_written, reg;
+
+	s25hx_t_set_read_settings(nor->params);
+
+	/* Address mode affects Read/Write Any Register operations */
+	nor->addr_width = 4;
+	err = spi_nor_set_4byte_addr_mode(nor, true);
+	if (err)
+		return err;
+
+	/**
+	 * Optimal CFR3V settings
+	 *   CFR3[7:6] = 01: RDAR for v-regs works ~133MHz with 1 dummy cycle
+	 *   CFR3[5] = 1: Erase operation is skipped on already erased sectors
+	 *   CFR3[4] = 1: 512 byte page size (better throughput than 256 byte)
+	 *   CFR3[3] = x: Read-Only for volatile register
+	 *   CFR3[2] = 0: CLSR(30h) is enabled (default)
+	 *   CFR3[1] = 0: Reserved
+	 *   CFR3[0] = 0: Legacy SW reset is disabled (default)
+	 *
+	 * At this point, we don't know the volatile register latency setting in
+	 * CFR3[7:6]. Therefore, just write the optimal settings to CFR3 instead
+	 * of Read-Modify-Write.
+	 */
+	cfr3_written = CFR3_VREG_LTCY_01 | CFR3_BLANK_CHECK_EN |
+		       CFR3_512B_PAGE_SIZE;
+
+	err = spansion_write_any_reg(nor, SPINOR_REG_ADDR_CFR3V, cfr3_written);
+	if (err)
+		return err;
+
+	/* Read back CFR3V with 1 dummy cycle */
+	err = spansion_read_any_reg(nor, SPINOR_REG_ADDR_CFR3V, 1, &reg);
+	if (err)
+		return err;
+	if ((reg & ~CFR3_UNIFORM_SECTORS) != cfr3_written)
+		return -EIO;
+
+	/* Update page size */
+	nor->page_size = 512;
+	nor->mtd.writebufsize = nor->page_size;
+
+	/**
+	 * The s25hx_t family has transparent ECC. To preserve ECC enabled,
+	 * multi-pass programming within the same 16-byte ECC data unit needs
+	 * to be avoided. Setting writesize to the multiples of 16 and removing
+	 * the MTD_BIT_WRITEABLE flags in mtd_info let JFFS2 enable write-
+	 * buffering that prevents multi-pass programming
+	 * (CONFIG_JFFS2_FS_WRITEBUFFER needs to be enabled). To achieve the
+	 * best write throughput, assign 512-byte page size to writesize.
+	 */
+	nor->mtd.writesize = nor->page_size;
+	nor->mtd.flags = MTD_CAP_NORFLASH & ~MTD_BIT_WRITEABLE;
+
+	/* Uniform Sectors: use erase map set in spi_nor_info_init_params() */
+	if (reg & CFR3_UNIFORM_SECTORS)
+		return spi_nor_default_setup(nor, hwcaps);
+
+	/* Hybrid Sectors: check CFR1 bits */
+	err = spansion_read_any_reg(nor, SPINOR_REG_ADDR_CFR1V, 1, &reg);
+	if (err)
+		return err;
+
+	if (reg & CFR1_SPLIT_4K_SECTORS)
+		err = spansion_init_sp4k_erase_map(nor, SZ_256K, 32);
+	else if (reg & CFR1_TOP_4K_SECTORS)
+		err = spansion_init_tb4k_erase_map(nor, SZ_256K, 32, true);
+	else
+		err = spansion_init_tb4k_erase_map(nor, SZ_256K, 32, false);
+
+	return err ? err : spi_nor_default_setup(nor, hwcaps);
+}
+
+static int s25hx_t_quad_enable(struct spi_nor *nor)
+{
+	return spansion_quad_enable_volatile(nor, 0, 1);
+}
+
+static void s25hx_t_default_init(struct spi_nor *nor)
+{
+	nor->params->setup = s25hx_t_setup;
+	nor->params->quad_enable = s25hx_t_quad_enable;
+}
+
+static struct spi_nor_fixups s25hx_t_fixups = {
+	.default_init = s25hx_t_default_init,
+};
+
 static int
 s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -104,6 +484,44 @@ static const struct flash_info spansion_parts[] = {
 			     SPI_NOR_4B_OPCODES) },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
+
+	/**
+	 * S25HL/HS-T (Semper Flash with Quad SPI) Family
+	 *
+	 *   For the faster clock speed than 133MHz (max 166MHz), the Flash
+	 *   requires 2 dummy cycles before data output in RDID(9fh) and
+	 *   RDSR(05h) operations. As complex fixups are needed to handle that,
+	 *   this driver supports up to 133MHz clock speed at this point.
+	 *
+	 *   The Read SFDP operation is supported up to 50MHz. Since most of the
+	 *   modern QSPI controllers are assumed to run at faster clock speed
+	 *   than 50MHz, SFDP parsing is skiped then equivalent setup and some
+	 *   optimization are done by spi_nor_fixups hooks.
+	 */
+	{ "s25hl256t",  INFO6(0x342a19, 0x0f0390, 256 * 1024, 128,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
+			     SPI_NOR_SKIP_SFDP)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
+			     SPI_NOR_SKIP_SFDP)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
+			     SPI_NOR_SKIP_SFDP)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs256t",  INFO6(0x342b19, 0x0f0390, 256 * 1024, 128,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
+			     SPI_NOR_SKIP_SFDP)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
+			     SPI_NOR_SKIP_SFDP)
+	  .fixups = &s25hx_t_fixups },
+	{ "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR |
+			     SPI_NOR_SKIP_SFDP)
+	  .fixups = &s25hx_t_fixups },
 };
 
 static void spansion_post_sfdp_fixups(struct spi_nor *nor)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 60bac2c0ec45..760a1ee14516 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -99,6 +99,21 @@
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
+#define SPINOR_OP_RDAR		0x65	/* Read Any Register */
+#define SPINOR_OP_WRAR		0x71	/* Write Any Register */
+
+#define SPINOR_REG_ADDR_CFR1V	0x00800002	/* Config Reg 1 volatile */
+#define SPINOR_REG_ADDR_CFR3V	0x00800004	/* Config Reg 3 volatile */
+
+#define CFR3_VREG_LTCY_01	BIT(6)	/* 1 dummy for v-reg read at 133MHz */
+#define CFR3_BLANK_CHECK_EN	BIT(5)	/* Skip erase on erased sectors */
+#define CFR3_512B_PAGE_SIZE	BIT(4)	/* 512 byte page size */
+#define CFR3_UNIFORM_SECTORS	BIT(3)	/* Uniform sector is selected */
+
+#define CFR1_SPLIT_4K_SECTORS	BIT(6)	/* 4KB sectors at top and bottom */
+#define CFR1_TOP_4K_SECTORS	BIT(2)	/* 4KB sectors at top */
+#define CFR1_QUAD_EN		BIT(1)	/* Quad Enable */
+
 
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
