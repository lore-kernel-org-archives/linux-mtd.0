Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912A7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:11:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E796023F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50E796023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9wUgQTj6k4CRAe5b5ukaZvSUJX6vwmD7+lmC/psOuQ=; b=PjEFouDV+8k+Oi
	lOoAHLtaYs3mLLqsHEzB4YYUIVK4ePeevpnlCOo2G5EVdLtdt9HtzC6x4JzT60IphNFrrfgkqDcN1
	jNaO+hv/LiFIp/fdv17UJcNWuatnd6UlBRcFdZDukQlYQFHdEwBkPbh0+HiGRE7qpePs2w0wto6bk
	fKLozSnLLHqlEaaTmhHQj+H1etF8fOfi59cnoQFYdXKu3lsuug3iVfOf47aQAn4i+/unOJxh+Zzdb
	kd47PxHBaYnZwUD1gEgUPfaDYLveEAY4Af/Dj4Dl2P8+hNHLrD56DDEhV856dW6kT0ESOVKCXFuzR
	kFxoCutBebGAB44gFDpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWL8-00BjUq-Up; Fri, 29 Oct 2021 18:10:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfd-00BZOV-Q3; Fri, 29 Oct 2021 17:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528481; x=1667064481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Md5IuXa2TOebocdWioNlhUz669evRgw5JSfq2gSnlng=;
 b=nExO9ABUQVxjEAqAp3sVnhnW6I8wReMxfeCwy41OV4mJNLpfGNs9ktp3
 2zCgvRbhqdPEMtYZjcZPxEiCVNF+ndNs6RLTwln4yEvsnlZIr7UH1JJXT
 B9rVFsr0HggjiDfGBzm4gYIvRDrvAshraWB/Mv12B9udFbuKZlCX//oGP
 hza2Pp89gXOxvSwwhwir7qavn2R1ZpszdZGh9CV8rukh8Lhpo+DLkVCkq
 uodLFQGZYYwyCrRZmVh0dBk7m2rFLNuHHZQJt0eOtETBd+3ry3908DcL3
 L/hR1qE178snPDBPvIgfmQaY3Y1QwQl26QZivsYAybN4XedAzNsC39XcJ A==;
IronPort-SDR: AGU6tCW8idyw3F4JIYCMWTuT775FHwxF+IZ+7uLrLmPO7z4WXFlpH8PFZ92ifg6i6yndV0IHM8
 9NidsAooWjJobpi9MyRikYxccQ+ycnBEkuMLMuiU6KovfPqrnC084QHI43eOEzTMQPavdOfc5d
 jSoMI9cgFV3oQUlZKsRkE9WImERpRSR4KvG0/bKEwApIJzQBN9yoBCewGZ4umX13lvP9wN/f/x
 6X2q4moDUYiUo2ZcTtI1fu+6Py8XKap1WOLdOKU5gviBo3C0toTN73MXwtD9zoLi6LFvVvhesf
 02Ab3Km8tYKfGsSeYR2F1CXT
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="150063459"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:00 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:55 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 16/25] mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
Date: Fri, 29 Oct 2021 20:26:24 +0300
Message-ID: <20211029172633.886453-17-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102801_908393_BEB0F7C9 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Initialize NOR flags for settings that can not be discovered by SFDP
for this particular flash because the SFDP table that indicates this
support is not defined in the flash. In case the table for his support
is defined but has wrong values, one should instead use a post_sfdp()
hook to set the SNOR_F equivalent flag.
Update all flash_info entries that use SPI_NOR_4B_OPCODES or
SPI_NOR_IO_MODE_EN_VOLATILE to also use the FIXUP_FLAGS() macro. This
should highlight to developers that those flags should be used only
as fixups, where flashes miss to define the SFDP tables that describe
those settings.
No functional change intended in this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c       | 26 ++++++++++++++++++++------
 drivers/mtd/spi-nor/gigadevice.c |  5 +++--
 drivers/mtd/spi-nor/issi.c       |  4 ++--
 drivers/mtd/spi-nor/macronix.c   | 13 ++++++++-----
 drivers/mtd/spi-nor/micron-st.c  | 20 ++++++++++++--------
 drivers/mtd/spi-nor/spansion.c   |  6 +++---
 6 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0e31f8a2457d..6f7978e7a46a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2713,6 +2713,25 @@ static void spi_nor_nonsfdp_init_flags(struct spi_nor *nor)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 }
 
+/**
+ * spi_nor_init_fixup_flags() - Initialize NOR flags for settings that can not
+ * be discovered by SFDP for this particular flash because the SFDP table that
+ * indicates this support is not defined in the flash. In case the table for
+ * this support is defined but has wrong values, one should instead use a
+ * post_sfdp() hook to set the SNOR_F equivalent flag.
+ * @nor:	pointer to a 'struct spi_nor'
+ */
+static void spi_nor_init_fixup_flags(struct spi_nor *nor)
+{
+	const u32 info_flags = nor->info->flags & FIXUP_FLAGS_MASK;
+
+	if (info_flags & SPI_NOR_4B_OPCODES)
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+	if (info_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2731,6 +2750,7 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		nor->info->fixups->late_init(nor);
 
 	spi_nor_nonsfdp_init_flags(nor);
+	spi_nor_init_fixup_flags(nor);
 
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
@@ -3214,12 +3234,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (info->flags & SPI_NOR_4B_OPCODES)
-		nor->flags |= SNOR_F_4B_OPCODES;
-
-	if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-
 	ret = spi_nor_set_addr_width(nor);
 	if (ret)
 		return ret;
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 447d84bb2128..59053f419642 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -47,8 +47,9 @@ static const struct flash_info gigadevice_parts[] = {
 			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
-			   SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
+			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			   SPI_NOR_TB_SR_BIT6 |
+			   FIXUP_FLAGS(SPI_NOR_4B_OPCODES))
 		.fixups = &gd25q256_fixups },
 };
 
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 1e5bb5408b68..b2abe8202143 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -46,7 +46,7 @@ static const struct flash_info issi_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES)
+			     FIXUP_FLAGS(SPI_NOR_4B_OPCODES))
 		.fixups = &is25lp256_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
@@ -56,7 +56,7 @@ static const struct flash_info issi_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512,
 			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_4B_OPCODES)
+			    FIXUP_FLAGS(SPI_NOR_4B_OPCODES))
 		.fixups = &is25lp256_fixups },
 
 	/* PMC */
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..d0285e60092e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -65,20 +65,22 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
-			      SECT_4K | SPI_NOR_4B_OPCODES) },
+			      SECT_4K | FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ |
+			      FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
+			      FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ |
+			      FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
@@ -86,7 +88,8 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ |
+			      FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index f3d19b716b7b..c982458d5e31 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -121,13 +121,13 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
 static const struct flash_info micron_parts[] = {
 	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
 			       SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
-			       SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
-			       SPI_NOR_OCTAL_DTR_PP |
-			       SPI_NOR_IO_MODE_EN_VOLATILE)
+			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
+			       FIXUP_FLAGS(SPI_NOR_4B_OPCODES |
+					   SPI_NOR_IO_MODE_EN_VOLATILE))
 	  .fixups = &mt35xu512aba_fixups},
 	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
 			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
-			    SPI_NOR_4B_OPCODES) },
+			    FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 };
 
 static const struct flash_info st_parts[] = {
@@ -151,25 +151,29 @@ static const struct flash_info st_parts[] = {
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ |
+			       FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
 			      USE_FSR | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ |
+			       FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ |
+			       FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			       SPI_NOR_QUAD_READ |
+			       FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index a3ea0135f7b1..3ee1cd3b8fb5 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -260,13 +260,13 @@ static const struct flash_info spansion_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
