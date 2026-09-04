Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD20C79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgTexP6X1fJu3r/l9UcaKBmqnrn79o2NWEaIalozzqg=; b=j4G36t5mbeovpB
	xofoqd7GELmByNyGLsvSRhU6KKzcvCdOPEQZ6DfvUSrWiSgePaeQSlVUyw4b9tw5Oj1qfzgVqNpUS
	iOA6yZH0crTWsqMg/tDhM+7hc8Yj+3EcoQuFWdDgWHoLfjlyo29PP4RBI2272p4JF9U57he1kM7Nc
	SY71Spw3mpBvSU2qWJuKwgFFsdIR2DHNsnTYs3d/xrhKf0Mz8f2ropcBtuvtjofMY2AJTYg9DIQtr
	lZ/TWuF9KNq5ZkWa8MhAeVP14bXXvUkxp+F6KbaVxeZme85xmZNVdsKZe21arrdhmOFIP23N2MOtl
	3SZR0H3Icbvae5suRPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPf-00000003011-1w9T;
	Fri, 04 Sep 2026 18:13:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPc-00000002zyx-3uLu
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:13:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6FDC21A199C;
	Fri,  4 Sep 2026 18:13:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43A0D6057F;
	Fri,  4 Sep 2026 18:13:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 766CD11C787BD;
	Fri,  4 Sep 2026 20:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I4kegzq08HeRW+Oy3ebXbcHB82GNZUAAxxOPVEO053A=;
	b=xTxWOJvWuDI7zuWB4ASzLg6Hl6+aKhbIIiuHb6QI7R4BZ77DGfgrFnD7UuZvaDb8JURM3H
	/7K3+b2lIuIwUe44GnN3kDLgcaRvXdQXJHXrwwiS/g3iMGwEhIaeyQzB1CQCRXignQtkux
	JdaRgdRhfLxwlMcHRKtzPcSUSea3sl3EGtoW4cnXBu08Fb1NA4GoQl7OgE8+3+RMxwbSrC
	2wtkmLKOayC4LWI2XOr9gdONYu7ILPEUwuDr8RPTEigyz0OeJvmHM1g2guzA9+ublOHRcT
	uxaQ1cB5GVyy+ucpxVT2GE363riUpPnEb+0GfOe9fOfASWmumU6Kb0wc9LKmLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:39 +0200
Subject: [PATCH v5 02/25] mtd: spi-nor: Create a structure containing the
 flash opcodes
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-2-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_111317_116497_5AEFA1C2 
X-CRM114-Status: GOOD (  15.44  )
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
 drivers/mtd/spi-nor/core.h      | 13 +++++++++++--
 drivers/mtd/spi-nor/debugfs.c   |  2 +-
 drivers/mtd/spi-nor/micron-st.c |  4 ++--
 drivers/mtd/spi-nor/spansion.c  |  4 ++--
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d9821620f59b..886f3c956309 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1142,7 +1142,7 @@ static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t die_size)
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_NOR_DIE_ERASE_OP(nor->params->die_erase_opcode,
+			SPI_NOR_DIE_ERASE_OP(nor->params->opcodes.die_erase,
 					     nor->addr_nbytes, addr, multi_die);
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
@@ -3023,8 +3023,8 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 			return ret;
 	}
 
-	if (!nor->params->die_erase_opcode)
-		nor->params->die_erase_opcode = SPINOR_OP_CHIP_ERASE;
+	if (!nor->params->opcodes.die_erase)
+		nor->params->opcodes.die_erase = SPINOR_OP_CHIP_ERASE;
 
 	/* Default method kept for backward compatibility. */
 	if (!params->set_4byte_addr_mode)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d59ec9cad986..4b36d99ce8f6 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -342,6 +342,16 @@ struct spi_nor_otp {
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
@@ -365,7 +375,6 @@ struct spi_nor_otp {
  *			command in octal DTR mode.
  * @n_banks:		number of banks.
  * @n_dice:		number of dice in the flash memory.
- * @die_erase_opcode:	die erase opcode. Defaults to SPINOR_OP_CHIP_ERASE.
  * @vreg_offset:	volatile register offset for each die.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
@@ -398,7 +407,6 @@ struct spi_nor_flash_parameter {
 	u8				rdsr_addr_nbytes;
 	u8				n_banks;
 	u8				n_dice;
-	u8				die_erase_opcode;
 	u32				*vreg_offset;
 
 	struct spi_nor_hwcaps		hwcaps;
@@ -406,6 +414,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
 	enum spi_nor_cmd_ext		cmd_ext_type;
 
+	struct spi_nor_opcodes		opcodes;
 	struct spi_nor_erase_map        erase_map;
 	struct spi_nor_otp		otp;
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 437a0e0cb4dd..5a7372e7f802 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	}
 
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-	seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
+	seq_printf(s, " %02x (%s)\n", params->opcodes.die_erase, buf);
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index ca2ce18050df..3c89bd9b575c 100644
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
index ec494e14ec82..d29a901900f8 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -677,7 +677,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	cypress_nor_ecc_init(nor);
 
 	if (params->n_dice > 1)
-		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+		params->opcodes.die_erase = SPINOR_OP_CYPRESS_DIE_ERASE;
 
 	return 0;
 }
@@ -765,7 +765,7 @@ static int s28hx_t_late_init(struct spi_nor *nor)
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
