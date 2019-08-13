Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4016C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 12:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C324E20578
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 12:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6xzZMq7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GPOVDj34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C324E20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IC/JnP6LDjCSh1FIBc6eCSVoyCafTfEOcyH2JYNqp+I=; b=A6xzZMq7GCroH/3qiVapu/iMsh
	d93CFJydQ4NPLbhGRpNfKmtn43TigXActbiJHPyPO1CGYjdI2XyKXvVi3XXcxqqidOEDYTAwbIict
	HGmX84w6/JB8zqstj/OMNJJD5NIipL+lmNXweveThZx58+VIYpZUD6tIAegjKLU0OsNDMig28KiHk
	BNbZ4bpYpPWhPlNc4gokwhRpIN6xp0RZIMM/VPopcIC3qxj+ahX4qIAg77GVfycx88C5pvUTR2rxR
	1AzV74/X183SOQMq33/tgAH7Kz++8D3WX86dRq9ExlOpyklmWdVJJqDN0gG1jNa61vEggjTsmUs/b
	1W3zmCaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxW6l-0002ik-8k; Tue, 13 Aug 2019 12:40:59 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxW6J-0002Az-DD
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 12:40:34 +0000
Received: by mail-pg1-x543.google.com with SMTP id i18so51207637pgl.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DzNi+RYLzS7cSoFg3QeO081QMsDPMsr4nbFVCqNdpOU=;
 b=GPOVDj34QoeqxOPABel7oG1Ha6tkpTjAKY1Y5q/P1KAEOFvi/4r7eF0KlT7GxL8qUU
 TT5mKGgKaIhLxxdmBPqQw6wGbURZ2v/RTWNUOJJqp5ZiFTKu+eKFFR5FoFVsrTireI6l
 4ZGasRBUfcnEN2N2BQhnkwm2b/mI+e6aZI1WoRh7wCS6UhAn/ZSDYt1dldb34gsPM36B
 oDGyibHGf0eNTp3cbb1MF5A1gw4/c1lrd7zaHlRyex11ALAU2OlO31LYJK8aakMUq4RD
 lrJvSuqWaGLtTcupFOHKgOAslKnOPlkeLZuOtF3yres2AzloFYmEmyeOU6TiUy2p2oHc
 jEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DzNi+RYLzS7cSoFg3QeO081QMsDPMsr4nbFVCqNdpOU=;
 b=LnDyvG5XLBmZ9uEbb/i0Reun8DwjZzkciqVkxJWxNdyJJBWM3x16hU7ObZAAtRxcd/
 psrVtbtvfvt7IJ/Mpn+DBsBTVumlJXmR0sgtiYwlpkn/XWfgV3gjCVPfk+w6ACQ+w4XZ
 MYKXvVr3VsvRQgtePHx9bVdWgcJ+k8bHu6+oflwy24kwx232RQoMZnfXJQVhxljXK3S3
 gtZkav1Q7osCBSRAD2s5bvDJ5MTEt4u3ER2/tMvICHEWU7BUd1Hcwnir4LW7Iju/p6I/
 Xrb+Hced8t7kHimL61hEn2Eifj3lhHZ3+h75vQpGKs4m1YejNnxPYiGRSYVA6nKrXIsq
 83lg==
X-Gm-Message-State: APjAAAUdOwPqWLj3uG4RGHoV/qZSpqVDOY0pSPFiYHk2PmvjIPIFHkLf
 nY6OAtkGnyH+hnsd1wqs69ZGmQ==
X-Google-Smtp-Source: APXvYqz5oRzULFqCuYucnOnNkq7YqxJAMseEiOpICA/J6UzoGY0ukNh/JtZVmJLekvWF3sH4WMoZ8w==
X-Received: by 2002:aa7:9e0a:: with SMTP id y10mr16916831pfq.93.1565700030489; 
 Tue, 13 Aug 2019 05:40:30 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 v145sm14758467pfc.31.2019.08.13.05.40.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Aug 2019 05:40:30 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v8 3/4] mtd: spi-nor: add support to unlock the flash device
Date: Tue, 13 Aug 2019 18:08:14 +0530
Message-Id: <1565699895-4770-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565699895-4770-1-git-send-email-sagar.kadam@sifive.com>
References: <1565699895-4770-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_054031_532533_2535A15F 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Nor device (is25wp256 mounted on HiFive unleashed Rev A00 board) from ISSI
have memory blocks guarded by block protection bits BP[0,1,2,3].
Add an identifier within the flash info structure to indicate that a
particular flash device has the fourth block protect bit (SPI_NOR_HAS_BP3).

Increase size of flash_info flags from u16 to u32 to avoid flag overflow
due SPI_NOR_HAS_BP3.
Clear block protection bits unlocks the flash memory regions.

Based on code developed by Wesley Terpstra <wesley@sifive.com>
and/or Palmer Dabbelt <palmer@sifive.com>.
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

spell correction: "Configuration" in spansion_quad_enable function
description.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 72 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cb40b1b..24c1c11 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -250,7 +250,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -279,6 +279,13 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BP3		BIT(16)	/*
+					 * Flash SR has block protect bits
+					 * for lock/unlock purpose, few support
+					 * BP0-BP2 while few support BP0-BP3.
+					 * This flag identifies devices that
+					 * support BP3 bit.
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1461,7 +1468,55 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spansion_quad_enable() - set QE bit in Configuraiton Register.
+ * issi_unlock() - clear BP[0123] write-protection.
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to unlock memory.
+ * @len: number of bytes to unlock.
+ *
+ * Bits [2345] of the Status Register are BP[0123].
+ * ISSI chips use a different block protection scheme than other chips.
+ * Just disable the write-protect unilaterally.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int issi_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int ret, val;
+	u8 mask;
+
+	if (nor->flags & SNOR_F_HAS_BP3)
+		mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	val = read_sr(nor);
+	if (val < 0)
+		return val;
+	if (!(val & mask))
+		return 0;
+
+	write_enable(nor);
+
+	write_sr(nor, val & ~mask);
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (ret > 0 && !(ret & mask)) {
+		dev_info(nor->dev, "ISSI block protect bits cleared SR: 0x%x\n",
+			 ret);
+		ret = 0;
+	} else {
+		dev_err(nor->dev, "ISSI block protect bits not cleared\n");
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
+/**
+ * spansion_quad_enable() - set QE bit in Configuration Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Configuration Register.
@@ -1948,8 +2003,10 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_4B_OPCODES)
-			.fixups = &is25lp256_fixups },
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			SPI_NOR_HAS_BP3)
+			.fixups = &is25lp256_fixups
+	},
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
@@ -4207,6 +4264,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flash_is_locked = stm_is_locked;
 	}
 
+	/* NOR protection support for ISSI chips */
+	if (JEDEC_MFR(info) == SNOR_MFR_ISSI &&
+	    info->flags & SPI_NOR_HAS_LOCK &&
+	    info->flags & SPI_NOR_HAS_BP3) {
+		nor->flash_unlock = issi_unlock;
+	}
+
 	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
 		mtd->_lock = spi_nor_lock;
 		mtd->_unlock = spi_nor_unlock;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5d6583e..4f92dbb 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,6 +127,7 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
+#define SR_BP3			BIT(5)	/* Block protect 3 */
 #define SR_TB			BIT(5)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
@@ -244,6 +245,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
 	SNOR_F_HAS_4BAIT	= BIT(8),
+	SNOR_F_HAS_BP3		= BIT(9),
 };
 
 /**
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
