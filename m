Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44403C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4D9PZziAGo60Xlsakbz1JFFf/06bPoS7bSRPbOoN9E=; b=kDutls405MrUxl
	nAxyAEEP/zqS1KSPelzwAwget4NHdxbspRkQYFnBKQFjIcRW/xMjFVj7ux4yOIaVlf+9yPeFnMq6j
	7FqS6yZuUksE5L0N/OORg7gubYToAM2gkxSX4SFuCWg2HNzilCcnf58e25q9tpMsx8FiblYMLsgva
	dvSnzxPAJBRq7/3hGrlTTjxEv/q+gIgEWmKipBw+ORnsWxMgy9xYQIcWwXEY2X8M/qpLM+MyoOlAl
	+QDPLz+aH8Yfl7E+AmEovHlZUsbpOflUlKl9swJf4XAqC7xSvghioQIcXruU79MmOF7xPiQSBuTkh
	u0+exF72m9tik2kS7eJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPr-000000030DX-0dwH;
	Fri, 04 Sep 2026 18:13:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPj-0000000304c-2Q5C
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:13:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E7241A19BF;
	Fri,  4 Sep 2026 18:13:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEECB6057F;
	Fri,  4 Sep 2026 18:13:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08EAF11C78158;
	Fri,  4 Sep 2026 20:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DoJhcIuLmh6+sKg9z8bWeXpiDy/4jMYORUyQ4GnfyQc=;
	b=XXy7kRDdZ51ij+7oMP1JnHSomUw5oVZNxAA92gQavqOK+x+evtmcFt+oN3osUONZIoVyO5
	fPAIrh+tjqvQ/x0lf98ZDodgedC1Tmf+X73X+zJHEhjhD4XPv9asmOu7G86frqupKMWoFo
	v3WLJpVIQEpHri19Qvxoh5jNRzO9wy7JDmEylyWqTXauu0p8oYeKkk3K6XVlSgFeyXBaHx
	9YKHdAfUl54QIKy+H5SwTz2lJOnUT20G4irwBVlg5cEwBXnS2eN7x8xliui6sAObzR4OF6
	+7Icr1ZbI9uA6uDbIsRlUmyKwvyfZdLpazhTYlBVDzAf6Zwr/Uk6NQ9b592BNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:42 +0200
Subject: [PATCH v5 05/25] mtd: spi-nor: Create the concept of fixup table
 with match function
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-5-2909a45fe4fa@bootlin.com>
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
X-CRM114-CacheID: sfid-20260904_111324_157743_2F1792D9 
X-CRM114-Status: GOOD (  23.05  )
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

Manufacturer ID tables increase and fixup() hooks proliferate. Having
one possible structure per chip was fine until the fixups started being
more and more common and needed, to some extend due to ID reuses. Mixing
fixups and chips becomes hard and requires extra helpers to sort which
ones are needed for a given chip, which every time this happens requires
a lot of rework.

Replace the two-level fixup association (a manufacturer wide hook and a
per flash_info hook) with a per-manufacturer list of fixups that can be
looked up by flash ID and/or match function.

The match logic works as follows:
- If there is an ID, it must match
- If there is a match function, it must match (cumulative)
- If there is no identifier (no ID nor any match function), it's a
  catch-all entry typically used for flagging manufacturer fixups.

Suggested-by: Michael Walle <mwalle@kernel.org>
Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/atmel.c      | 23 +++++++-----
 drivers/mtd/spi-nor/core.c       | 59 ++++++++++++++++++++++--------
 drivers/mtd/spi-nor/core.h       | 23 ++++++++++--
 drivers/mtd/spi-nor/everspin.c   |  7 +++-
 drivers/mtd/spi-nor/gigadevice.c |  7 +++-
 drivers/mtd/spi-nor/issi.c       | 22 ++++++++---
 drivers/mtd/spi-nor/macronix.c   | 25 ++++++++-----
 drivers/mtd/spi-nor/micron-st.c  | 43 ++++++++++++++++------
 drivers/mtd/spi-nor/sfdp.c       | 79 ++++++++++++++++++++++++++--------------
 drivers/mtd/spi-nor/spansion.c   | 41 ++++++++++++---------
 drivers/mtd/spi-nor/sst.c        | 11 ++++--
 drivers/mtd/spi-nor/winbond.c    | 17 ++++++---
 12 files changed, 248 insertions(+), 109 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 8741c0bda497..bccc702a2c4a 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -194,47 +194,40 @@ static const struct flash_info atmel_nor_parts[] = {
 		.size = SZ_512K,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups,
 	}, {
 		.id = SNOR_ID(0x1f, 0x45, 0x01),
 		.name = "at26df081a",
 		.size = SZ_1M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x46, 0x01),
 		.name = "at26df161a",
 		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x47, 0x00),
 		.name = "at25df321",
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x47, 0x01),
 		.name = "at25df321a",
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x47, 0x08),
 		.name = "at25ff321a",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x48, 0x00),
 		.name = "at25df641",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &atmel_nor_global_protection_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x66, 0x01),
 		.name = "at25fs010",
@@ -242,14 +235,12 @@ static const struct flash_info atmel_nor_parts[] = {
 		.size = SZ_128K,
 		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &at25fs_nor_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x66, 0x04),
 		.name = "at25fs040",
 		.size = SZ_512K,
 		.flags = SPI_NOR_HAS_LOCK,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &at25fs_nor_fixups
 	}, {
 		.id = SNOR_ID(0x1f, 0x87, 0x01),
 		.size = SZ_4M,
@@ -257,8 +248,22 @@ static const struct flash_info atmel_nor_parts[] = {
 	},
 };
 
+static const struct spi_nor_fixup atmel_fixups[] = {
+	{ .id = SNOR_ID(0x1f, 0x44, 0x01), .fixups = &atmel_nor_global_protection_fixups },
+	{ .id = SNOR_ID(0x1f, 0x45, 0x01), .fixups = &atmel_nor_global_protection_fixups },
+	{ .id = SNOR_ID(0x1f, 0x46, 0x01), .fixups = &atmel_nor_global_protection_fixups },
+	{ .id = SNOR_ID(0x1f, 0x47, 0x00), .fixups = &atmel_nor_global_protection_fixups },
+	{ .id = SNOR_ID(0x1f, 0x47, 0x01), .fixups = &atmel_nor_global_protection_fixups },
+	{ .id = SNOR_ID(0x1f, 0x47, 0x08), .fixups = &atmel_nor_global_protection_fixups },
+	{ .id = SNOR_ID(0x1f, 0x48, 0x00), .fixups = &atmel_nor_global_protection_fixups },
+	{ .id = SNOR_ID(0x1f, 0x66, 0x01), .fixups = &at25fs_nor_fixups },
+	{ .id = SNOR_ID(0x1f, 0x66, 0x04), .fixups = &at25fs_nor_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_atmel = {
 	.name = "atmel",
 	.parts = atmel_nor_parts,
 	.nparts = ARRAY_SIZE(atmel_nor_parts),
+	.fixups = atmel_fixups,
+	.nfixups = ARRAY_SIZE(atmel_fixups),
 };
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1f2a58acae1e..322683738ef1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2618,6 +2618,26 @@ static int spi_nor_setup(struct spi_nor *nor,
 	return spi_nor_set_addr_nbytes(nor);
 }
 
+bool spi_nor_fixup_match(const struct spi_nor *nor,
+			 const struct spi_nor_fixup *fixup)
+{
+	const struct spi_nor_id *id = nor->info ? nor->info->id : NULL;
+
+	/* Filter by ID first, if available */
+	if (fixup->id) {
+		if (!id || fixup->id->len > id->len ||
+		    memcmp(id->bytes, fixup->id->bytes, fixup->id->len))
+			return false;
+	}
+
+	/* Further filter with the match callback, if provided */
+	if (fixup->match)
+		return fixup->match(nor);
+
+	/* Either there was an ID and it matched, or it is a catch-all entry */
+	return true;
+}
+
 /**
  * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
  * settings based on MFR register and ->default_init() hook.
@@ -2625,12 +2645,19 @@ static int spi_nor_setup(struct spi_nor *nor,
  */
 static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 {
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->default_init)
-		nor->manufacturer->fixups->default_init(nor);
+	const struct spi_nor_fixup *fixups;
+	unsigned int i;
 
-	if (nor->info->fixups && nor->info->fixups->default_init)
-		nor->info->fixups->default_init(nor);
+	if (!nor->manufacturer || !nor->manufacturer->fixups)
+		return;
+
+	fixups = nor->manufacturer->fixups;
+
+	for (i = 0; i < nor->manufacturer->nfixups; i++) {
+		if (fixups[i].fixups->default_init &&
+		    spi_nor_fixup_match(nor, &fixups[i]))
+			fixups[i].fixups->default_init(nor);
+	}
 }
 
 /**
@@ -2780,22 +2807,24 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 static int spi_nor_late_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
+	const struct spi_nor_fixup *fixups;
+	unsigned int i;
 	int ret;
 
 	/* Needed by some late_init hooks */
 	spi_nor_init_flags(nor);
 
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->late_init) {
-		ret = nor->manufacturer->fixups->late_init(nor);
-		if (ret)
-			return ret;
-	}
+	if (nor->manufacturer && nor->manufacturer->fixups) {
+		fixups = nor->manufacturer->fixups;
 
-	if (nor->info->fixups && nor->info->fixups->late_init) {
-		ret = nor->info->fixups->late_init(nor);
-		if (ret)
-			return ret;
+		for (i = 0; i < nor->manufacturer->nfixups; i++) {
+			if (fixups[i].fixups->late_init &&
+			    spi_nor_fixup_match(nor, &fixups[i])) {
+				ret = fixups[i].fixups->late_init(nor);
+				if (ret)
+					return ret;
+			}
+		}
 	}
 
 	if (!nor->params->opcodes.die_erase)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index b8a0db02e0f1..28069f62429c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -452,6 +452,19 @@ struct spi_nor_fixups {
 	int (*late_init)(struct spi_nor *nor);
 };
 
+/**
+ * struct spi_nor_fixup - SPI NOR fixup registration.
+ * @id:		(optional) flash ID this fixup applies to, may only match the
+ *		ID prefix, eg. just the first few bytes to match a whole family
+ * @match:	(optional) custom match function (can be used together with @id)
+ * @fixups:	the fixup hooks to apply when this entry matches
+ */
+struct spi_nor_fixup {
+	const struct spi_nor_id *id;
+	bool (*match)(const struct spi_nor *nor);
+	const struct spi_nor_fixups *fixups;
+};
+
 /**
  * struct spi_nor_id - SPI NOR flash ID.
  *
@@ -564,7 +577,6 @@ struct flash_info {
 	u8 mfr_flags;
 
 	const struct spi_nor_otp_organization *otp;
-	const struct spi_nor_fixups *fixups;
 };
 
 #define SNOR_ID(...)							\
@@ -586,13 +598,16 @@ struct flash_info {
  * @name: manufacturer name
  * @parts: array of parts supported by this manufacturer
  * @nparts: number of entries in the parts array
- * @fixups: hooks called at various points in time during spi_nor_scan()
+ * @fixups: list of fixups, each matched by ID (or a custom match function),
+ *          applied to any part of this manufacturer.
+ * @nfixups: number of entries in the fixups array
  */
 struct spi_nor_manufacturer {
 	const char *name;
 	const struct flash_info *parts;
 	unsigned int nparts;
-	const struct spi_nor_fixups *fixups;
+	const struct spi_nor_fixup *fixups;
+	unsigned int nfixups;
 };
 
 /**
@@ -623,6 +638,8 @@ extern const struct spi_nor_manufacturer spi_nor_xmc;
 
 extern const struct attribute_group *spi_nor_sysfs_groups[];
 
+bool spi_nor_fixup_match(const struct spi_nor *nor,
+			 const struct spi_nor_fixup *fixup);
 void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     struct spi_mem_op *op,
 			     const enum spi_nor_protocol proto);
diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index add37104d673..864dffba0e9c 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -44,9 +44,14 @@ static const struct spi_nor_fixups everspin_nor_fixups = {
 	.default_init = everspin_nor_default_init,
 };
 
+static const struct spi_nor_fixup everspin_fixups[] = {
+	{ .fixups = &everspin_nor_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_everspin = {
 	.name = "everspin",
 	.parts = everspin_nor_parts,
 	.nparts = ARRAY_SIZE(everspin_nor_parts),
-	.fixups = &everspin_nor_fixups,
+	.fixups = everspin_fixups,
+	.nfixups = ARRAY_SIZE(everspin_fixups),
 };
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 4070a692e968..f76fd0dedd0a 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,7 +64,6 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
-		.fixups = &gd25q256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
@@ -87,8 +86,14 @@ static const struct flash_info gigadevice_nor_parts[] = {
 	},
 };
 
+static const struct spi_nor_fixup gigadevice_fixups[] = {
+	{ .id = SNOR_ID(0xc8, 0x40, 0x19), .fixups = &gd25q256_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
 	.name = "gigadevice",
 	.parts = gigadevice_nor_parts,
 	.nparts = ARRAY_SIZE(gigadevice_nor_parts),
+	.fixups = gigadevice_fixups,
+	.nfixups = ARRAY_SIZE(gigadevice_fixups),
 };
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 04db42b5141e..7af850eea9ff 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -52,13 +52,11 @@ static const struct flash_info issi_nor_parts[] = {
 		.sector_size = SZ_32K,
 		.size = SZ_64K,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &pm25lv_nor_fixups
 	}, {
 		.name = "pm25lv010",
 		.sector_size = SZ_32K,
 		.size = SZ_128K,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &pm25lv_nor_fixups
 	}, {
 		.id = SNOR_ID(0x7f, 0x9d, 0x20),
 		.name = "is25cd512",
@@ -103,7 +101,6 @@ static const struct flash_info issi_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x19),
 		.name = "is25lp256",
-		.fixups = &is25lp256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x16),
@@ -124,7 +121,6 @@ static const struct flash_info issi_nor_parts[] = {
 		.id = SNOR_ID(0x9d, 0x70, 0x19),
 		.name = "is25wp256",
 		.flags = SPI_NOR_QUAD_PP,
-		.fixups = &is25lp256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}
 };
@@ -139,9 +135,25 @@ static const struct spi_nor_fixups issi_fixups = {
 	.default_init = issi_nor_default_init,
 };
 
+/* PM25LV parts have no JEDEC ID and are likely matched by name */
+static bool issi_pm25lv_match(const struct spi_nor *nor)
+{
+	const char *name = nor->info ? nor->info->name : NULL;
+
+	return name && strstarts(name, "pm25lv");
+}
+
+static const struct spi_nor_fixup issi_fixup_list[] = {
+	{ .fixups = &issi_fixups },
+	{ .match = issi_pm25lv_match, .fixups = &pm25lv_nor_fixups },
+	{ .id = SNOR_ID(0x9d, 0x60, 0x19), .fixups = &is25lp256_fixups },
+	{ .id = SNOR_ID(0x9d, 0x70, 0x19), .fixups = &is25lp256_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_issi = {
 	.name = "issi",
 	.parts = issi_nor_parts,
 	.nparts = ARRAY_SIZE(issi_nor_parts),
-	.fixups = &issi_fixups,
+	.fixups = issi_fixup_list,
+	.nfixups = ARRAY_SIZE(issi_fixup_list),
 };
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 954e7df21ff9..a96bd0d7c2ec 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -159,24 +159,19 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K,
-		.fixups = &mx25l12805d_4pp3b_fixups,
 	}, {
 		/* MX25L25635E, MX25L25645G */
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
-		.fixups = &mx25l25635_fixups
 	}, {
 		/* MX25L51245G, MX25L51273G, MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
 		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66L1G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66L2G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1c),
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
@@ -215,15 +210,12 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25U51245G, MX25U51293G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66U1G45G, MX66U1G93G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3b),
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66U2G45G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x18),
 		.name = "mx25l12855e",
@@ -255,7 +247,6 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25L3255E */
 		.id = SNOR_ID(0xc2, 0x9e, 0x16),
-		.fixups = &mx25l3255e_fixups,
 	},
 	/*
 	 * This spares us of adding new flash entries for flashes that can be
@@ -359,9 +350,23 @@ static const struct spi_nor_fixups macronix_nor_fixups = {
 	.late_init = macronix_nor_late_init,
 };
 
+static const struct spi_nor_fixup macronix_fixups[] = {
+	{ .fixups = &macronix_nor_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x18), .fixups = &mx25l12805d_4pp3b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3a), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3b), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x25, 0x3c), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x9e, 0x16), .fixups = &mx25l3255e_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_macronix = {
 	.name = "macronix",
 	.parts = macronix_nor_parts,
 	.nparts = ARRAY_SIZE(macronix_nor_parts),
-	.fixups = &macronix_nor_fixups,
+	.fixups = macronix_fixups,
+	.nfixups = ARRAY_SIZE(macronix_fixups),
 };
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 21d0ceac1ed7..dc1b52bd34df 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -206,13 +206,11 @@ static const struct flash_info micron_nor_parts[] = {
 		.id = SNOR_ID(0x2c, 0x5b, 0x1a),
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
-		.fixups = &mt35xu512aba_fixups,
 	}, {
 		/* MT35XU01GBBA */
 		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
-		.fixups = &mt35_two_die_fixups,
 	}, {
 		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
 		.name = "mt35xu02g",
@@ -221,7 +219,6 @@ static const struct flash_info micron_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
-		.fixups = &mt35_two_die_fixups,
 	},
 };
 
@@ -233,6 +230,17 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 	return 0;
 }
 
+/*
+ * n25q00a parts share the first same 3 ID bytes with mt25qu01g.
+ * In order to not mix the fixups, further filter out using the part name.
+ */
+static bool n25q00a_match(const struct spi_nor *nor)
+{
+	const char *name = nor->info ? nor->info->name : NULL;
+
+	return name && !strncmp(name, "n25q00a", 7);
+}
+
 static const struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
@@ -426,14 +434,12 @@ static const struct flash_info st_nor_parts[] = {
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
-		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x22),
 		.name = "mt25ql02g",
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
-		.fixups = &mt25q02_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x15),
 		.name = "n25q016a",
@@ -480,7 +486,6 @@ static const struct flash_info st_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
 		.mfr_flags = USE_FSR,
-		.fixups = &mt25qu512a_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x20),
 		.name = "n25q512a",
@@ -493,21 +498,18 @@ static const struct flash_info st_nor_parts[] = {
 		.id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
 		.name = "mt25qu01g",
 		.mfr_flags = USE_FSR,
-		.fixups = &mt25q01_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
 		.size = SZ_128M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
-		.fixups = &n25q00_fixups,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x22),
 		.name = "mt25qu02g",
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
-		.fixups = &mt25q02_fixups,
 	}
 };
 
@@ -657,16 +659,35 @@ static const struct spi_nor_fixups micron_st_nor_fixups = {
 	.late_init = micron_st_nor_late_init,
 };
 
+static const struct spi_nor_fixup micron_fixups[] = {
+	{ .fixups = &micron_st_nor_fixups },
+	{ .id = SNOR_ID(0x2c, 0x5b, 0x1a), .fixups = &mt35xu512aba_fixups },
+	{ .id = SNOR_ID(0x2c, 0x5b, 0x1b), .fixups = &mt35_two_die_fixups },
+	{ .id = SNOR_ID(0x2c, 0x5b, 0x1c), .fixups = &mt35_two_die_fixups },
+};
+
+static const struct spi_nor_fixup st_fixups[] = {
+	{ .fixups = &micron_st_nor_fixups },
+	{ .id = SNOR_ID(0x20, 0xba, 0x21), .fixups = &n25q00_fixups },
+	{ .id = SNOR_ID(0x20, 0xba, 0x22), .fixups = &mt25q02_fixups },
+	{ .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00), .fixups = &mt25qu512a_fixups },
+	{ .id = SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00), .fixups = &mt25q01_fixups },
+	{ .id = SNOR_ID(0x20, 0xbb, 0x21), .match = n25q00a_match, .fixups = &n25q00_fixups },
+	{ .id = SNOR_ID(0x20, 0xbb, 0x22), .fixups = &mt25q02_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_micron = {
 	.name = "micron",
 	.parts = micron_nor_parts,
 	.nparts = ARRAY_SIZE(micron_nor_parts),
-	.fixups = &micron_st_nor_fixups,
+	.fixups = micron_fixups,
+	.nfixups = ARRAY_SIZE(micron_fixups),
 };
 
 const struct spi_nor_manufacturer spi_nor_st = {
 	.name = "st",
 	.parts = st_nor_parts,
 	.nparts = ARRAY_SIZE(st_nor_parts),
-	.fixups = &micron_st_nor_fixups,
+	.fixups = st_fixups,
+	.nfixups = ARRAY_SIZE(st_fixups),
 };
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 23c11fbc68c3..b0b753fb2345 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -416,18 +416,23 @@ static int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 				    const struct sfdp_parameter_header *bfpt_header,
 				    const struct sfdp_bfpt *bfpt)
 {
+	const struct spi_nor_fixup *fixups;
+	unsigned int i;
 	int ret;
 
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_bfpt) {
-		ret = nor->manufacturer->fixups->post_bfpt(nor, bfpt_header,
-							   bfpt);
-		if (ret)
-			return ret;
-	}
+	if (!nor->manufacturer || !nor->manufacturer->fixups)
+		return 0;
 
-	if (nor->info->fixups && nor->info->fixups->post_bfpt)
-		return nor->info->fixups->post_bfpt(nor, bfpt_header, bfpt);
+	fixups = nor->manufacturer->fixups;
+
+	for (i = 0; i < nor->manufacturer->nfixups; i++) {
+		if (fixups[i].fixups->post_bfpt &&
+		    spi_nor_fixup_match(nor, &fixups[i])) {
+			ret = fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
+			if (ret)
+				return ret;
+		}
+	}
 
 	return 0;
 }
@@ -758,12 +763,19 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 static void spi_nor_smpt_read_dummy_fixups(const struct spi_nor *nor,
 					   u8 *read_dummy)
 {
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->smpt_read_dummy)
-		nor->manufacturer->fixups->smpt_read_dummy(nor, read_dummy);
+	const struct spi_nor_fixup *fixups;
+	unsigned int i;
 
-	if (nor->info->fixups && nor->info->fixups->smpt_read_dummy)
-		nor->info->fixups->smpt_read_dummy(nor, read_dummy);
+	if (!nor->manufacturer || !nor->manufacturer->fixups)
+		return;
+
+	fixups = nor->manufacturer->fixups;
+
+	for (i = 0; i < nor->manufacturer->nfixups; i++) {
+		if (fixups[i].fixups->smpt_read_dummy &&
+		    spi_nor_fixup_match(nor, &fixups[i]))
+			fixups[i].fixups->smpt_read_dummy(nor, read_dummy);
+	}
 }
 
 /**
@@ -788,12 +800,19 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
 
 static void spi_nor_smpt_map_id_fixups(const struct spi_nor *nor, u8 *map_id)
 {
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->smpt_map_id)
-		nor->manufacturer->fixups->smpt_map_id(nor, map_id);
+	const struct spi_nor_fixup *fixups;
+	unsigned int i;
 
-	if (nor->info->fixups && nor->info->fixups->smpt_map_id)
-		nor->info->fixups->smpt_map_id(nor, map_id);
+	if (!nor->manufacturer || !nor->manufacturer->fixups)
+		return;
+
+	fixups = nor->manufacturer->fixups;
+
+	for (i = 0; i < nor->manufacturer->nfixups; i++) {
+		if (fixups[i].fixups->smpt_map_id &&
+		    spi_nor_fixup_match(nor, &fixups[i]))
+			fixups[i].fixups->smpt_map_id(nor, map_id);
+	}
 }
 
 /**
@@ -1445,17 +1464,23 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
  */
 static int spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 {
+	const struct spi_nor_fixup *fixups;
+	unsigned int i;
 	int ret;
 
-	if (nor->manufacturer && nor->manufacturer->fixups &&
-	    nor->manufacturer->fixups->post_sfdp) {
-		ret = nor->manufacturer->fixups->post_sfdp(nor);
-		if (ret)
-			return ret;
-	}
+	if (!nor->manufacturer || !nor->manufacturer->fixups)
+		return 0;
 
-	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		return nor->info->fixups->post_sfdp(nor);
+	fixups = nor->manufacturer->fixups;
+
+	for (i = 0; i < nor->manufacturer->nfixups; i++) {
+		if (fixups[i].fixups->post_sfdp &&
+		    spi_nor_fixup_match(nor, &fixups[i])) {
+			ret = fixups[i].fixups->post_sfdp(nor);
+			if (ret)
+				return ret;
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index ce2e233108c4..52aa31a84fc8 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -907,7 +907,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.sector_size = SZ_256K,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
-		.fixups = &s25fs_s_nor_fixups,
 	}, {
 		.id = SNOR_ID(0x01, 0x20, 0x18, 0x03, 0x00),
 		.name = "s25sl12800",
@@ -943,7 +942,6 @@ static const struct flash_info spansion_nor_parts[] = {
 		.size = SZ_16M,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_CLSR,
-		.fixups = &s25fs_s_nor_fixups,
 	}, {
 		.id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01),
 		.name = "s25fl129p1",
@@ -1003,76 +1001,61 @@ static const struct flash_info spansion_nor_parts[] = {
 		.id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
 		.name = "s25hl512t",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2a, 0x1b, 0x0f, 0x03, 0x90),
 		.name = "s25hl01gt",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90),
 		.name = "s25hl02gt",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90),
 		.name = "s25fs256t",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s25fs256t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2b, 0x1a, 0x0f, 0x03, 0x90),
 		.name = "s25hs512t",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2b, 0x1b, 0x0f, 0x03, 0x90),
 		.name = "s25hs01gt",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s25hx_t_fixups
 	}, {
 		.id = SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90),
 		.name = "s25hs02gt",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s25hx_t_fixups
 	}, {
 		/* S28HL256T */
 		.id = SNOR_ID(0x34, 0x5a, 0x19),
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5a, 0x1a),
 		.name = "s28hl512t",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5a, 0x1b),
 		.name = "s28hl01gt",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		/* S28HL02GT */
 		.id = SNOR_ID(0x34, 0x5a, 0x1c),
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5b, 0x19),
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5b, 0x1a),
 		.name = "s28hs512t",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5b, 0x1b),
 		.name = "s28hs01gt",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0x34, 0x5b, 0x1c),
 		.name = "s28hs02gt",
 		.mfr_flags = USE_CLPEF,
-		.fixups = &s28hx_t_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x13),
 		.name = "s25fl004k",
@@ -1172,9 +1155,31 @@ static const struct spi_nor_fixups spansion_nor_fixups = {
 	.late_init = spansion_nor_late_init,
 };
 
+static const struct spi_nor_fixup spansion_fixups[] = {
+	{ .fixups = &spansion_nor_fixups },
+	{ .id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x81), .fixups = &s25fs_s_nor_fixups },
+	{ .id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81), .fixups = &s25fs_s_nor_fixups },
+	{ .id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x2a, 0x1b, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90), .fixups = &s25hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90), .fixups = &s25fs256t_fixups },
+	{ .id = SNOR_ID(0x34, 0x2b, 0x1a, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x2b, 0x1b, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90), .fixups = &s25hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5a, 0x19), .fixups = &s28hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5a, 0x1a), .fixups = &s28hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5a, 0x1b), .fixups = &s28hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5a, 0x1c), .fixups = &s28hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5b, 0x19), .fixups = &s28hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5b, 0x1a), .fixups = &s28hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5b, 0x1b), .fixups = &s28hx_t_fixups },
+	{ .id = SNOR_ID(0x34, 0x5b, 0x1c), .fixups = &s28hx_t_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_spansion = {
 	.name = "spansion",
 	.parts = spansion_nor_parts,
 	.nparts = ARRAY_SIZE(spansion_nor_parts),
-	.fixups = &spansion_nor_fixups,
+	.fixups = spansion_fixups,
+	.nfixups = ARRAY_SIZE(spansion_fixups),
 };
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 77a0bc41d4e5..c460803b278b 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -152,14 +152,12 @@ static const struct flash_info sst_nor_parts[] = {
 		.id = SNOR_ID(0xbf, 0x26, 0x42),
 		.name = "sst26vf032b",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
-		.fixups = &sst26vf_nor_fixups,
 	}, {
 		.id = SNOR_ID(0xbf, 0x26, 0x43),
 		.name = "sst26vf064b",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixups = &sst26vf_nor_fixups,
 	}, {
 		.id = SNOR_ID(0xbf, 0x26, 0x51),
 		.name = "sst26wf016b",
@@ -278,9 +276,16 @@ static const struct spi_nor_fixups sst_nor_fixups = {
 	.late_init = sst_nor_late_init,
 };
 
+static const struct spi_nor_fixup sst_fixups[] = {
+	{ .fixups = &sst_nor_fixups },
+	{ .id = SNOR_ID(0xbf, 0x26, 0x42), .fixups = &sst26vf_nor_fixups },
+	{ .id = SNOR_ID(0xbf, 0x26, 0x43), .fixups = &sst26vf_nor_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_sst = {
 	.name = "sst",
 	.parts = sst_nor_parts,
 	.nparts = ARRAY_SIZE(sst_nor_parts),
-	.fixups = &sst_nor_fixups,
+	.fixups = sst_fixups,
+	.nfixups = ARRAY_SIZE(sst_fixups),
 };
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index df4688c637a2..063b85e041cd 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -219,7 +219,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
-		.fixups = &w25q128_fixups,
 	}, {
 		/* W25Q256JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
@@ -228,7 +227,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &w25q256_fixups,
 	}, {
 		/* W25Q512JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x20),
@@ -242,7 +240,6 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x40, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
 		.name = "w25q20bw",
@@ -345,13 +342,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
-		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),
 		.name = "w25m512jv",
@@ -553,9 +548,19 @@ static const struct spi_nor_fixups winbond_nor_fixups = {
 	.late_init = winbond_nor_late_init,
 };
 
+static const struct spi_nor_fixup winbond_fixups[] = {
+	{ .fixups = &winbond_nor_fixups },
+	{ .id = SNOR_ID(0xef, 0x40, 0x18), .fixups = &w25q128_fixups },
+	{ .id = SNOR_ID(0xef, 0x40, 0x19), .fixups = &w25q256_fixups },
+	{ .id = SNOR_ID(0xef, 0x40, 0x21), .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x21), .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70, 0x22), .fixups = &winbond_nor_multi_die_fixups },
+};
+
 const struct spi_nor_manufacturer spi_nor_winbond = {
 	.name = "winbond",
 	.parts = winbond_nor_parts,
 	.nparts = ARRAY_SIZE(winbond_nor_parts),
-	.fixups = &winbond_nor_fixups,
+	.fixups = winbond_fixups,
+	.nfixups = ARRAY_SIZE(winbond_fixups),
 };

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
