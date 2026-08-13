Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B70C5CFEB
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3CVJNOtNkqHSubtyQO/hyfofkI8fmIKutzPP5UCKZ0=; b=SNaDv4fTzH48G7
	UzwtZ3gO+y/UuOwyRV5SDchtYPa47q2ZVRdTotrIbctb3Hs0d8n9nJW+6/lNbHERDF5CEdmEHojWC
	+SCAYbVapaNF2WwQT71uo6w7hBEGs2Ss9s5CotA7AnBYYxErz+8jFac7WcF4e9GfPK0jFU4RDThoK
	RhZoveVt831Kf7JTpE8cFZ7C9mGEjqTcKK6UC6fHRkFnIMJF9TC9K0oiqRLCdY8D1YlUWoWIq9gIJ
	8ns3NrbyFO/V6FgIbeY1gzLbBJY+NAloIlh6k5pVzohi4q2Q9Ftbn+jr88gs7Rzn48LjBGdzr6dFu
	YoXQax9pLlrQjRl2kfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXDX-00000000wtP-2JRi;
	Thu, 13 Aug 2026 15:19:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXDU-00000000wr4-447J;
	Thu, 13 Aug 2026 15:19:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 622B51A15E8;
	Thu, 13 Aug 2026 15:19:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3705A602B8;
	Thu, 13 Aug 2026 15:19:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACFE211C4E060;
	Thu, 13 Aug 2026 17:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zm6Kby57e3VJB20bGEQsK4HWf4vVSVk8tsQGXoBsehk=;
	b=Bk2MUegv3w5OaGt3tgjJJXXtSR/sU6vxjooGhqYAmQnsW8cs9FtY9SXanQ1OlA98VcdrRP
	u+/+1ur/MgfefR8kGqnre+M1aTgVle6sKlXfY6GaaoKEF5acfjdC1OCQcXmAg3Lz2TuRbt
	osjzSZ8HvMwUmJEAOfxL63O/3sMg31jNaGPDfCYUL2U9OC0jGgKOXvDMhMeaAYVuQ8Xy11
	UCYNlCnsGzs0XnAg/gV8YQHMsm2ZSaRYrVaL9QrSp/210I/fVJr3QlBPoY0+wse/CcVwHf
	MdwcuNVRga3nql6qdM+tjUGU3cEUtowcmuts3Nhw2WFoETySKcLwOzhG1j5h3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:02 +0200
Subject: [PATCH v3 02/23] mtd: spi-nor: Create a structure containing the
 flash opcodes
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_081937_157112_E8F06345 
X-CRM114-Status: GOOD (  15.81  )
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
