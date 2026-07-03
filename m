Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F151C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XHV4Nej15VAKbT+AwTb8p+36fKBddXFEuXl19zcztk=; b=c5UPcTF9niJ6Rw
	LWzaUDh7gxZEbaRjAbGWurrE25ofOTQYUclYttCc5marKA5YLHwJ5yGeQL7oy+vvHqVJRT5Vm8bOa
	iISRxMiFZjI6YrKb5VHPpA0IcPJMonS8Rrt08fdnh1VfFOiQTXVAh5cQ43lntOrkiJxCWpyYmn+PZ
	sm/h2nRncd/HnS3unVxic1Fx+6jbwU3UGHWt7DHJhJoY20bQxusxN5Udr6Rv/lSekOXVK0YDIX2Dw
	nAVu16oGOgjHjkrAQ8XjugUgqVN/jU8aCitrZ8JwpKQp4HjejpZRic+legpDExPNjIDIiF2i6ccs3
	R4RlJvvaxxqMHe0rv54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuZ-00000007Gbu-0G0D;
	Fri, 03 Jul 2026 14:30:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuY-00000007Gb9-1H2M
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 14:30:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1316343989;
	Fri,  3 Jul 2026 14:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB9A1F00A3E;
	Fri,  3 Jul 2026 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089034;
	bh=D79U8ouhxrJ9b/5FAGodXurBCaeBDtbAkRsK15/qS8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KP0984FaxK3HN3oIUkmTTMPESmXSo8EThTWI9PPSQtFJHoxvkUskDKsSEHftoontm
	 igb3mglPeBIuH8YS+3VN/Vl/a/EdMH4BG4IYwVS5gfTD6VqYyV3KgGnreD2a1LiTyu
	 2RPFKeHiVq8ZbJv+J9jilVRgQfay9L8hFL1yHa8nQYoHK6nvHKx7Y7QIzqapTnzMq5
	 j0W7qO6u3NdP1geEpcwJEooz8bdNL9UYyXbq0d7WhLoPWgfslrNVhNh1OOtbRcG6ov
	 wmMiisQRbHxzmw23IfkQyHmfnXwpWDXh5G7Y2PFLzIeiD1RR42Oq2owB0bChw4U5/y
	 O348KAgLyRf3g==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v1 4/8] mtd: spi-nor: move flags into spi_nor_flash_parameter
Date: Fri,  3 Jul 2026 16:29:15 +0200
Message-ID: <20260703143003.1809579-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143003.1809579-1-mwalle@kernel.org>
References: <20260703143003.1809579-1-mwalle@kernel.org>
MIME-Version: 1.0
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

Right now the SFDP parsing code is modifying both members of
struct spi_nor_flash_parameter and struct spi_nor. This may lead to
inconsistencies if the parsing fails because only the flash parameters
are rolled back.

To fix this, move the flags into the struct spi_nor_flash_parameter.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260601125438.3481722-1-mwalle%40kernel.org?part=3
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/core.c      | 83 ++++++++++++++++++---------------
 drivers/mtd/spi-nor/core.h      |  2 +
 drivers/mtd/spi-nor/debugfs.c   |  4 +-
 drivers/mtd/spi-nor/macronix.c  |  2 +-
 drivers/mtd/spi-nor/micron-st.c |  6 +--
 drivers/mtd/spi-nor/sfdp.c      | 16 +++----
 drivers/mtd/spi-nor/spansion.c  |  4 +-
 drivers/mtd/spi-nor/swp.c       | 52 +++++++++++++--------
 drivers/mtd/spi-nor/winbond.c   |  4 +-
 include/linux/mtd/spi-nor.h     |  2 -
 10 files changed, 98 insertions(+), 77 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8ccd7d520791..d5f37b6cd76b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -83,6 +83,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     struct spi_mem_op *op,
 			     const enum spi_nor_protocol proto)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u8 ext;
 
 	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
@@ -116,7 +117,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->cmd.nbytes = 2;
 	}
 
-	if (proto == SNOR_PROTO_8_8_8_DTR && nor->flags & SNOR_F_SWAP16)
+	if (proto == SNOR_PROTO_8_8_8_DTR && params->flags & SNOR_F_SWAP16)
 		op->data.swap16 = true;
 }
 
@@ -633,7 +634,7 @@ int spi_nor_sr_ready(struct spi_nor *nor)
  */
 static bool spi_nor_use_parallel_locking(struct spi_nor *nor)
 {
-	return nor->flags & SNOR_F_RWW;
+	return nor->params->flags & SNOR_F_RWW;
 }
 
 /* Locking helpers for status read operations */
@@ -860,12 +861,13 @@ static int spi_nor_write_sr1_and_check(struct spi_nor *nor, u8 sr1)
  */
 static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
 	u8 *sr_cr = nor->bouncebuf;
 	u8 cr_written;
 
 	/* Make sure we don't overwrite the contents of Status Register 2. */
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+	if (!(params->flags & SNOR_F_NO_READ_CR)) {
 		ret = spi_nor_read_cr(nor, &sr_cr[1]);
 		if (ret)
 			return ret;
@@ -906,7 +908,7 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 		return -EIO;
 	}
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
+	if (params->flags & SNOR_F_NO_READ_CR)
 		return 0;
 
 	cr_written = sr_cr[1];
@@ -961,7 +963,7 @@ int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
 		return -EIO;
 	}
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
+	if (nor->params->flags & SNOR_F_NO_READ_CR)
 		return 0;
 
 	ret = spi_nor_read_cr(nor, &sr_cr[1]);
@@ -1009,7 +1011,7 @@ static int spi_nor_write_16bit_sr_cr_and_check(struct spi_nor *nor, const u8 *re
 		return -EIO;
 	}
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
+	if (nor->params->flags & SNOR_F_NO_READ_CR)
 		return 0;
 
 	ret = spi_nor_read_cr(nor, &nor->bouncebuf[1]);
@@ -1035,7 +1037,7 @@ static int spi_nor_write_16bit_sr_cr_and_check(struct spi_nor *nor, const u8 *re
  */
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
 {
-	if (nor->flags & SNOR_F_HAS_16BIT_SR)
+	if (nor->params->flags & SNOR_F_HAS_16BIT_SR)
 		return spi_nor_write_16bit_sr_and_check(nor, sr1);
 
 	return spi_nor_write_sr1_and_check(nor, sr1);
@@ -1052,7 +1054,7 @@ int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
  */
 int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
 {
-	if (nor->flags & SNOR_F_HAS_16BIT_SR)
+	if (nor->params->flags & SNOR_F_HAS_16BIT_SR)
 		return spi_nor_write_16bit_sr_cr_and_check(nor, regs);
 
 	return spi_nor_write_sr1_and_check(nor, regs[0]);
@@ -1821,6 +1823,7 @@ static int spi_nor_erase_dice(struct spi_nor *nor, loff_t addr,
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct spi_nor_flash_parameter *params = nor->params;
 	u8 n_dice = nor->params->n_dice;
 	bool multi_die_erase = false;
 	u32 addr, len, rem;
@@ -1852,7 +1855,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return ret;
 
 	/* chip (die) erase? */
-	if ((len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) ||
+	if ((len == mtd->size && !(params->flags & SNOR_F_NO_OP_CHIP_ERASE)) ||
 	    multi_die_erase) {
 		ret = spi_nor_erase_dice(nor, addr, len, die_size);
 		if (ret)
@@ -1942,7 +1945,7 @@ int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
 {
 	int ret;
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
+	if (nor->params->flags & SNOR_F_NO_READ_CR)
 		return spi_nor_write_16bit_cr_and_check(nor, SR2_QUAD_EN_BIT1);
 
 	ret = spi_nor_read_cr(nor, nor->bouncebuf);
@@ -2502,7 +2505,7 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 	 * If the reset line is broken, we do not want to enter a stateful
 	 * mode.
 	 */
-	if (nor->flags & SNOR_F_BROKEN_RESET)
+	if (params->flags & SNOR_F_BROKEN_RESET)
 		*hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
 
 	for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
@@ -2526,13 +2529,13 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 	}
 
 	/* Some SPI controllers might not support CR read opcode. */
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+	if (!(params->flags & SNOR_F_NO_READ_CR)) {
 		struct spi_mem_op op = SPI_NOR_RDCR_OP(nor->bouncebuf);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		if (!spi_mem_supports_op(nor->spimem, &op))
-			nor->flags |= SNOR_F_NO_READ_CR;
+			params->flags |= SNOR_F_NO_READ_CR;
 	}
 }
 
@@ -2749,6 +2752,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
+
 	if (nor->params->addr_nbytes) {
 		nor->addr_nbytes = nor->params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
@@ -2783,8 +2788,8 @@ static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 	}
 
 	/* Set 4byte opcodes when possible. */
-	if (nor->addr_nbytes == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
+	if (nor->addr_nbytes == 4 && params->flags & SNOR_F_4B_OPCODES &&
+	    !(params->flags & SNOR_F_HAS_4BAIT))
 		spi_nor_set_4byte_opcodes(nor);
 
 	return 0;
@@ -2947,39 +2952,40 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
  */
 static void spi_nor_init_flags(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	struct device_node *np = spi_nor_get_flash_node(nor);
 	const u16 flags = nor->info->flags;
 
 	if (of_property_read_bool(np, "broken-flash-reset"))
-		nor->flags |= SNOR_F_BROKEN_RESET;
+		params->flags |= SNOR_F_BROKEN_RESET;
 
 	if (of_property_read_bool(np, "no-wp"))
-		nor->flags |= SNOR_F_NO_WP;
+		params->flags |= SNOR_F_NO_WP;
 
 	if (flags & SPI_NOR_SWP_IS_VOLATILE)
-		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
+		params->flags |= SNOR_F_SWP_IS_VOLATILE;
 
 	if (flags & SPI_NOR_HAS_LOCK)
-		nor->flags |= SNOR_F_HAS_LOCK;
+		params->flags |= SNOR_F_HAS_LOCK;
 
 	if (flags & SPI_NOR_HAS_TB) {
-		nor->flags |= SNOR_F_HAS_SR_TB;
+		params->flags |= SNOR_F_HAS_SR_TB;
 		if (flags & SPI_NOR_TB_SR_BIT6)
-			nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
+			params->flags |= SNOR_F_HAS_SR_TB_BIT6;
 	}
 
 	if (flags & SPI_NOR_4BIT_BP) {
-		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		params->flags |= SNOR_F_HAS_4BIT_BP;
 		if (flags & SPI_NOR_BP3_SR_BIT6)
-			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+			params->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
 	if (flags & SPI_NOR_HAS_CMP)
-		nor->flags |= SNOR_F_HAS_SR2_CMP_BIT6;
+		params->flags |= SNOR_F_HAS_SR2_CMP_BIT6;
 
 	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
 	    !nor->controller_ops)
-		nor->flags |= SNOR_F_RWW;
+		params->flags |= SNOR_F_RWW;
 }
 
 /**
@@ -2992,13 +2998,14 @@ static void spi_nor_init_flags(struct spi_nor *nor)
  */
 static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	const u8 fixup_flags = nor->info->fixup_flags;
 
 	if (fixup_flags & SPI_NOR_4B_OPCODES)
-		nor->flags |= SNOR_F_4B_OPCODES;
+		params->flags |= SNOR_F_4B_OPCODES;
 
 	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+		params->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 }
 
 /**
@@ -3043,7 +3050,7 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
 	 */
-	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
+	if (params->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
 
 	if (params->n_banks > 1)
@@ -3108,7 +3115,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	params->otp.org = info->otp;
 
 	/* Default to 16-bit Write Status (01h) Command */
-	nor->flags |= SNOR_F_HAS_16BIT_SR;
+	params->flags |= SNOR_F_HAS_16BIT_SR;
 
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
@@ -3229,7 +3236,7 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
 		return 0;
 
-	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
+	if (!(nor->params->flags & SNOR_F_IO_MODE_EN_VOLATILE))
 		return 0;
 
 	ret = nor->params->set_octal_dtr(nor, enable);
@@ -3282,7 +3289,7 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 		 * reboots (e.g., crashes). Warn the user (or hopefully, system
 		 * designer) that this is bad.
 		 */
-		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
+		WARN_ONCE(nor->params->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
 	}
 
@@ -3303,6 +3310,7 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 
 static int spi_nor_init(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	int err;
 
 	err = spi_nor_set_octal_dtr(nor, true);
@@ -3330,13 +3338,13 @@ static int spi_nor_init(struct spi_nor *nor)
 	spi_nor_cache_sr_lock_bits(nor, NULL);
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE) ||
 	    (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE) &&
-	     nor->flags & SNOR_F_SWP_IS_VOLATILE)) {
+	     params->flags & SNOR_F_SWP_IS_VOLATILE)) {
 		spi_nor_try_unlock_all(nor);
 	}
 
 	if (nor->addr_nbytes == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
-	    !(nor->flags & SNOR_F_4B_OPCODES))
+	    !(params->flags & SNOR_F_4B_OPCODES))
 		return spi_nor_set_4byte_addr_mode(nor, true);
 
 	return 0;
@@ -3451,11 +3459,12 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 
 static void spi_nor_restore(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
 
 	/* restore the addressing mode */
-	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
-	    nor->flags & SNOR_F_BROKEN_RESET) {
+	if (nor->addr_nbytes == 4 && !(params->flags & SNOR_F_4B_OPCODES) &&
+	    params->flags & SNOR_F_BROKEN_RESET) {
 		ret = spi_nor_set_4byte_addr_mode(nor, false);
 		if (ret)
 			/*
@@ -3466,7 +3475,7 @@ static void spi_nor_restore(struct spi_nor *nor)
 			dev_err(nor->dev, "Failed to exit 4-byte address mode, err = %d\n", ret);
 	}
 
-	if (nor->flags & SNOR_F_SOFT_RESET)
+	if (params->flags & SNOR_F_SOFT_RESET)
 		spi_nor_soft_reset(nor);
 }
 
@@ -3590,7 +3599,7 @@ static int spi_nor_set_mtd_info(struct spi_nor *nor)
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_CAP_NORFLASH;
 	/* Unset BIT_WRITEABLE to enable JFFS2 write buffer for ECC'd NOR */
-	if (nor->flags & SNOR_F_ECC)
+	if (nor->params->flags & SNOR_F_ECC)
 		mtd->flags &= ~MTD_BIT_WRITEABLE;
 	if (nor->info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 835076d86e3b..99aa6753149f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -348,6 +348,7 @@ struct spi_nor_otp {
  *
  * @bank_size:		the flash memory bank density in bytes.
  * @size:		the total flash memory density in bytes.
+ * @flags:		flag options for the current SPI NOR (SNOR_F_*)
  * @writesize		Minimal writable flash unit size. Defaults to 1. Set to
  *			ECC unit size for ECC-ed flashes.
  * @page_size:		the page size of the SPI NOR flash memory.
@@ -386,6 +387,7 @@ struct spi_nor_otp {
 struct spi_nor_flash_parameter {
 	u64				bank_size;
 	u64				size;
+	u32				flags;
 	u32				writesize;
 	u32				page_size;
 	u8				addr_nbytes;
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index dc2ed784f519..2bdeba60c286 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -99,7 +99,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	seq_printf(s, "address nbytes\t%u\n", nor->addr_nbytes);
 
 	seq_puts(s, "flags\t\t");
-	spi_nor_print_flags(s, nor->flags, snor_f_names,
+	spi_nor_print_flags(s, params->flags, snor_f_names,
 			    ARRAY_SIZE(snor_f_names));
 	seq_puts(s, "\n");
 
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 		}
 	}
 
-	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
+	if (!(params->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 		seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
 	}
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9aad..53b0fde832e1 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -40,7 +40,7 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	 * its BFPT table.
 	 */
 	if (bfpt->dwords[SFDP_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
-		nor->flags |= SNOR_F_4B_OPCODES;
+		nor->params->flags |= SNOR_F_4B_OPCODES;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 186362066c6b..ca2ce18050df 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -229,7 +229,7 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 				      const struct sfdp_parameter_header *bfpt_header,
 				      const struct sfdp_bfpt *bfpt)
 {
-	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	nor->params->flags &= ~SNOR_F_HAS_16BIT_SR;
 	return 0;
 }
 
@@ -632,8 +632,8 @@ static int micron_st_nor_ready(struct spi_nor *nor)
 
 static void micron_st_nor_default_init(struct spi_nor *nor)
 {
-	nor->flags |= SNOR_F_HAS_LOCK;
-	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	nor->params->flags |= SNOR_F_HAS_LOCK;
+	nor->params->flags &= ~SNOR_F_HAS_16BIT_SR;
 	nor->params->quad_enable = NULL;
 }
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 7e44d3c4d89a..56aa12423603 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -586,17 +586,17 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 * Read Configuration Register (35h) instruction is not
 		 * supported.
 		 */
-		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
+		params->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
 		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR1_BIT6:
-		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+		params->flags &= ~SNOR_F_HAS_16BIT_SR;
 		params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT7:
-		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+		params->flags &= ~SNOR_F_HAS_16BIT_SR;
 		params->quad_enable = spi_nor_sr2_bit7_quad_enable;
 		break;
 
@@ -607,7 +607,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 * Register 2, so let's be cautious and keep the default
 		 * assumption of a 16-bit Write Status (01h) command.
 		 */
-		nor->flags |= SNOR_F_HAS_16BIT_SR;
+		params->flags |= SNOR_F_HAS_16BIT_SR;
 
 		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 		break;
@@ -629,7 +629,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	/* Soft Reset support. */
 	if (bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_SWRST_EN_RST)
-		nor->flags |= SNOR_F_SOFT_RESET;
+		params->flags |= SNOR_F_SOFT_RESET;
 
 	/* Stop here if not JESD216 rev C or later. */
 	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
@@ -682,7 +682,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	/* Byte order in 8D-8D-8D mode */
 	if (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
-		nor->flags |= SNOR_F_SWAP16;
+		params->flags |= SNOR_F_SWAP16;
 
 	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
 }
@@ -1169,7 +1169,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 	 * SFDP compliant memories.
 	 */
 	params->addr_nbytes = 4;
-	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
+	params->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
 
 	/* fall through */
 out:
@@ -1315,7 +1315,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
 		      dwords[SFDP_DWORD(22)]))
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+		params->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 out:
 	kfree(dwords);
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 092450375d4e..fc5da04aff07 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -537,7 +537,7 @@ static void cypress_nor_ecc_init(struct spi_nor *nor)
 	 * same ECC data unit without an erase are not allowed.
 	 */
 	nor->params->writesize = 16;
-	nor->flags |= SNOR_F_ECC;
+	nor->params->flags |= SNOR_F_ECC;
 }
 
 static int
@@ -1139,7 +1139,7 @@ static int spansion_nor_late_init(struct spi_nor *nor)
 	u8 mfr_flags = nor->info->mfr_flags;
 
 	if (params->size > SZ_16M) {
-		nor->flags |= SNOR_F_4B_OPCODES;
+		params->flags |= SNOR_F_4B_OPCODES;
 		/* No small sector erase for 4-byte command set */
 		nor->erase_opcode = SPINOR_OP_SE;
 		nor->mtd.erasesize = nor->info->sector_size ?:
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 235070b215d1..62720045a9ab 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -13,12 +13,13 @@
 
 static u8 spi_nor_get_sr_bp_mask(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 
-	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
+	if (params->flags & SNOR_F_HAS_SR_BP3_BIT6)
 		return mask | SR_BP3_BIT6;
 
-	if (nor->flags & SNOR_F_HAS_4BIT_BP)
+	if (params->flags & SNOR_F_HAS_4BIT_BP)
 		return mask | SR_BP3;
 
 	return mask;
@@ -26,9 +27,11 @@ static u8 spi_nor_get_sr_bp_mask(struct spi_nor *nor)
 
 static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 {
-	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	if (params->flags & SNOR_F_HAS_SR_TB_BIT6)
 		return SR_TB_BIT6;
-	else if (nor->flags & SNOR_F_HAS_SR_TB)
+	else if (params->flags & SNOR_F_HAS_SR_TB)
 		return SR_TB_BIT5;
 	else
 		return 0;
@@ -36,8 +39,10 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 
 static u8 spi_nor_get_sr_cmp_mask(struct spi_nor *nor)
 {
-	if (!(nor->flags & SNOR_F_NO_READ_CR) &&
-	    nor->flags & SNOR_F_HAS_SR2_CMP_BIT6)
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	if (!(params->flags & SNOR_F_NO_READ_CR) &&
+	    params->flags & SNOR_F_HAS_SR2_CMP_BIT6)
 		return SR2_CMP_BIT6;
 	else
 		return 0;
@@ -67,15 +72,16 @@ u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 				 u64 *len)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u64 min_prot_len;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
-	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
+	bool tb = (params->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
 	bool cmp = sr[1] & cmp_mask;
 
-	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
+	if (params->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
 
 	bp = val >> SR_BP_SHIFT;
@@ -153,10 +159,11 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
 
 static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 val = pow << SR_BP_SHIFT;
 
-	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+	if (params->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
 		val = (val & ~SR_BP3) | SR_BP3_BIT6;
 
 	if (val & ~mask)
@@ -200,6 +207,7 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
  */
 void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
@@ -212,7 +220,7 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 
 		sr_cr[0] = nor->bouncebuf[0];
 
-		if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		if (!(params->flags & SNOR_F_NO_READ_CR)) {
 			if (spi_nor_read_cr(nor, nor->bouncebuf))
 				return;
 		}
@@ -261,13 +269,14 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
  */
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	u8 status_old[2] = {}, status_new[2] = {}, status_new_cmp[2] = {};
 	u8 *best_status_new = status_new;
 	loff_t ofs_old, ofs_new, ofs_new_cmp;
 	u64 len_old, len_new, len_new_cmp;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB,
+	bool can_be_top = true, can_be_bottom = params->flags & SNOR_F_HAS_SR_TB,
 		can_be_cmp = spi_nor_get_sr_cmp_mask(nor);
 	bool use_top;
 	int ret;
@@ -279,7 +288,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+	if (!(params->flags & SNOR_F_NO_READ_CR)) {
 		ret = spi_nor_read_cr(nor, nor->bouncebuf);
 		if (ret)
 			return ret;
@@ -313,7 +322,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs + len;
 
 	if (lock_len == nor->params->size)
-		pow = (nor->flags & SNOR_F_HAS_4BIT_BP) ? GENMASK(3, 0) : GENMASK(2, 0);
+		pow = (params->flags & SNOR_F_HAS_4BIT_BP) ? GENMASK(3, 0) : GENMASK(2, 0);
 	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 
@@ -359,7 +368,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	 * wrongly tied to GND (that includes internal pull-downs).
 	 * WP# pin hard strapped to GND can be a valid use case.
 	 */
-	if (!(nor->flags & SNOR_F_NO_WP))
+	if (!(params->flags & SNOR_F_NO_WP))
 		best_status_new[0] |= SR_SRWD;
 
 	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
@@ -378,7 +387,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
+	if (params->flags & SNOR_F_NO_READ_CR)
 		ret = spi_nor_write_sr_and_check(nor, best_status_new[0]);
 	else
 		ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
@@ -397,13 +406,14 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	u8 status_old[2] = {}, status_new[2] = {}, status_new_cmp[2] = {};
 	u8 *best_status_new = status_new;
 	loff_t ofs_old, ofs_new, ofs_new_cmp;
 	u64 len_old, len_new, len_new_cmp;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB,
+	bool can_be_top = true, can_be_bottom = params->flags & SNOR_F_HAS_SR_TB,
 		can_be_cmp = spi_nor_get_sr_cmp_mask(nor);
 	bool use_top;
 	int ret;
@@ -415,7 +425,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+	if (!(params->flags & SNOR_F_NO_READ_CR)) {
 		ret = spi_nor_read_cr(nor, nor->bouncebuf);
 		if (ret)
 			return ret;
@@ -512,7 +522,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
+	if (params->flags & SNOR_F_NO_READ_CR)
 		ret = spi_nor_write_sr_and_check(nor, best_status_new[0]);
 	else
 		ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
@@ -533,6 +543,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	u8 sr_cr[2] = {};
 	int ret;
 
@@ -542,7 +553,7 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	sr_cr[0] = nor->bouncebuf[0];
 
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+	if (!(params->flags & SNOR_F_NO_READ_CR)) {
 		ret = spi_nor_read_cr(nor, nor->bouncebuf);
 		if (ret)
 			return ret;
@@ -628,9 +639,10 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, u64 len)
  */
 void spi_nor_try_unlock_all(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
 
-	if (!(nor->flags & SNOR_F_HAS_LOCK))
+	if (!(params->flags & SNOR_F_HAS_LOCK))
 		return;
 
 	dev_dbg(nor->dev, "Unprotecting entire flash array\n");
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 45f17eb89a45..afb55698f5c3 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -64,7 +64,7 @@ w25q256_post_bfpt_fixups(struct spi_nor *nor,
 	 */
 	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
 	    bfpt_header->minor == SFDP_JESD216A_MINOR)
-		nor->flags |= SNOR_F_4B_OPCODES;
+		nor->params->flags |= SNOR_F_4B_OPCODES;
 
 	return 0;
 }
@@ -84,7 +84,7 @@ winbond_rdcr_post_bfpt_fixup(struct spi_nor *nor,
 	 * both incorrect and impractical, as the chip features a CMP bit for its
 	 * locking scheme that lays in the Control Register, and needs to be read.
 	 */
-	nor->flags &= ~SNOR_F_NO_READ_CR;
+	nor->params->flags &= ~SNOR_F_NO_READ_CR;
 
 	return 0;
 }
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e75c1b4cb4c0..099c5016b485 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -365,7 +365,6 @@ struct spi_nor_flash_parameter;
  * @read_dummy:		the dummy needed by the read operation
  * @program_opcode:	the program opcode
  * @sst_write_second:	used by the SST write operation
- * @flags:		flag options for the current SPI NOR (SNOR_F_*)
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
  * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
@@ -406,7 +405,6 @@ struct spi_nor {
 	enum spi_nor_protocol	write_proto;
 	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
-	u32			flags;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;
 	u8			dfs_sr_cache[2];
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
