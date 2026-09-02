Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CF3C624D6
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbVURVLNOcC55aw6fpiKx0hxSHK5xgMYul2mLw4fW+g=; b=LKFTXXs1j5Ezeg
	bfOgJ7OkDMGJZApDpJPCk1jOmfsg6FXHcE6ffcDkqz0BtKF1H6QUS28U6at+mpWfxgkxGl1Jj6bXi
	CFWG4Lby1JEux8rgWEEsUIsTMgFuPBNGvSARYPokJuBFU7CoZ7Xm48Zshtr0Pj5kTzvkQJiFYyHy+
	NyPRK6FGAhaVgYBE48MwYQgruXWzNH9V7E/4lczlhd4sK02yhSO8VmGRZ8jXxGBL6k81KGuwWxC5j
	m4K910XBlcojluxvw2lJj6MxsjwMrw72Qf0Y5PQs0A7xs9zmcUbZJDN6/SL2LKnqhBm22nYX0ZSWj
	Xwp4K17UUNDSgaMhdX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJP-0000000FKFX-3FXP;
	Wed, 02 Sep 2026 16:59:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJL-0000000FKCa-2Yke
	for linux-mtd@lists.infradead.org;
	Wed, 02 Sep 2026 16:59:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1CBAE1A1968;
	Wed,  2 Sep 2026 16:59:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3D2C6053C;
	Wed,  2 Sep 2026 16:59:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0940D11C798E5;
	Wed,  2 Sep 2026 18:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aI8zX4gCXAqLNE3WArET0YJfq+liXSSkiVbLeqHam0E=;
	b=Xd17MQZAPvIVbZE1/Loy/a1KlRpV8LMjWd1cMxPLOjrxHazZVK5piFBN8BSIk5bTG0pAqG
	NyMlILm924rpZjA7NtuRD492HYv/4PWJ70nZRLfuiQgWym2jLt1CUKXzx6uzkeJkuYlL5E
	fwHC76x65PKBK2w9PmYJ7CrDxO7m8JrrNBDrmctRQx3joqaHq4JoPBkf2F4tkMODOlyyO3
	EKQRD0aL4VDyeSvMsU+r9u7WVoDUDNzSu19GLptF9bU0XuKTj8unZ6WixV/LFhqZMlJP3n
	kBBWAUoP7mRkmcvL9xVnGLTChU0y3u5IRa468GHe9Me2vhi0y3hn3oswZSXf8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:16 +0200
Subject: [PATCH v4 02/25] mtd: spi-nor: Create a structure containing the
 flash opcodes
MIME-Version: 1.0
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-2-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_095943_819412_B1B6EB68 
X-CRM114-Status: GOOD (  16.85  )
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

Create a structure named opcodes in the flash parameters structures to
store all the flash specific opcodes. They are typically discovered
dynamically through SFDP parsing. Move the die_erase opcode
inside. Later on we will add new fields there, like the supported
opcodes for accessing the status registers, which are almost vendor
specific.

No fonctional change.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c      |  6 +++---
 drivers/mtd/spi-nor/core.h      | 14 +++++++++++---
 drivers/mtd/spi-nor/debugfs.c   |  2 +-
 drivers/mtd/spi-nor/micron-st.c |  4 ++--
 drivers/mtd/spi-nor/spansion.c  |  4 ++--
 5 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fef7f426a3a2..29b8fe3d1c65 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1140,7 +1140,7 @@ static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t die_size)
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_NOR_DIE_ERASE_OP(nor->params->die_erase_opcode,
+			SPI_NOR_DIE_ERASE_OP(nor->params->opcodes.die_erase,
 					     nor->addr_nbytes, addr, multi_die);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
@@ -3030,8 +3030,8 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 			return ret;
 	}
 
-	if (!nor->params->die_erase_opcode)
-		nor->params->die_erase_opcode = SPINOR_OP_CHIP_ERASE;
+	if (!nor->params->opcodes.die_erase)
+		nor->params->opcodes.die_erase = SPINOR_OP_CHIP_ERASE;
 
 	/* Default method kept for backward compatibility. */
 	if (!params->set_4byte_addr_mode)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ba2d1a862c9d..2cc0c80da3fa 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -340,6 +340,16 @@ struct spi_nor_otp {
 	const struct spi_nor_otp_ops *ops;
 };
 
+/**
+ * struct spi_nor_opcodes - SPI NOR flash specific opcodes.
+ * List of variable opcodes used by the chip.
+ *
+ * @die_erase: opcode for erasing a die, defaults to SPINOR_OP_CHIP_ERASE
+ */
+struct spi_nor_opcodes {
+	u8 die_erase;
+};
+
 /**
  * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
  * Includes legacy flash parameters and settings that can be overwritten
@@ -362,7 +372,6 @@ struct spi_nor_otp {
  *			command in octal DTR mode.
  * @n_banks:		number of banks.
  * @n_dice:		number of dice in the flash memory.
- * @die_erase_opcode:	die erase opcode. Defaults to SPINOR_OP_CHIP_ERASE.
  * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
@@ -393,13 +402,12 @@ struct spi_nor_flash_parameter {
 	u8				rdsr_addr_nbytes;
 	u8				n_banks;
 	u8				n_dice;
-	u8				die_erase_opcode;
 	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
 	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
-
+	struct spi_nor_opcodes		opcodes;
 	struct spi_nor_erase_map        erase_map;
 	struct spi_nor_otp		otp;
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 288e2866daed..ef6f0ffcd6bb 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -146,7 +146,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
+		seq_printf(s, " %02x (%s)\n", params->opcodes.die_erase, buf);
 	}
 
 	seq_puts(s, "\nsector map\n");
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c75b0a1cd567..031cf887318c 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -131,7 +131,7 @@ static int micron_st_nor_four_die_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->opcodes.die_erase = SPINOR_OP_MT_DIE_ERASE;
 	params->n_dice = 4;
 
 	/*
@@ -147,7 +147,7 @@ static int micron_st_nor_two_die_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
-	params->die_erase_opcode = SPINOR_OP_MT_DIE_ERASE;
+	params->opcodes.die_erase = SPINOR_OP_MT_DIE_ERASE;
 	params->n_dice = 2;
 
 	/*
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 15dcec09332a..2a8238c707e1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -675,7 +675,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	cypress_nor_ecc_init(nor);
 
 	if (params->n_dice > 1)
-		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+		params->opcodes.die_erase = SPINOR_OP_CYPRESS_DIE_ERASE;
 
 	return 0;
 }
@@ -763,7 +763,7 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 	cypress_nor_ecc_init(nor);
 
 	if (params->n_dice > 1)
-		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+		params->opcodes.die_erase = SPINOR_OP_CYPRESS_DIE_ERASE;
 
 	return 0;
 }

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
