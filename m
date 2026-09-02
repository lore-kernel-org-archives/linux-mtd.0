Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5DFC624D4
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLR4SOOEC0F8z9R+ovNtBrfpkVWHyAqS4N23RDLHR1A=; b=p6H/LzqpEIl7nf
	3zcl7YzzajjxLEm20e9lww+t1iKB+o/NwfNA7UcdS/IGCSmHiYRdO9h77LjQjj9hR3oas4PM2qWFa
	u1Wi4f6A+rCM0RE1C0ptgqzeiiGBOGegt5PZpVYuYP1XfrQTmWoT8xCi6nfYUH4Tvnp6qmh5pwq5l
	VzLYrEUvUvAQmkQHVgFeSIK9Si8l9eRm8elj9491FP96hZqBtcie2F2Lr4ZySKNCu1lHIVAT5M23R
	KbakqCWk8i9B9vaRlQM5RVs2S4xrCTRu4F6cwfRDcf01UTH8hAOh6/EDSTC61eZdQm/+TYzliQFEo
	bfTy1mBIAxQZXPmqiIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oK6-0000000FL0K-2ecW;
	Wed, 02 Sep 2026 17:00:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJz-0000000FKsV-4AuL;
	Wed, 02 Sep 2026 17:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9Tecc3lQIKN0K3LRzH2AlzBhyqwFHt3ICutJHGbXQZ0=; b=m5vRNzWP5SbMCsqK0W7+afzLIr
	iYi8LiizMZk4zBura08nlZCc61YdMIvJvfsfAcge2w1l4dbOb0/HTNViq+ekwqS+PCPTpJdh70SSE
	ImDaoXVhwGXyHrR/nEKLAU0hzYCF8bV/pipESxaipdjOkhWaZVF3l4D6xaXde7KW8Eq9Rigw/xKZs
	O37kRBzR6xzEKgJATaey6itD5aM780tNyp7CMM6ubO+Kbqp1/D3VHdlAvfgpg556l4eTFGLVspupE
	9sJq1GXDRHW+UTArRA/mk3fym+BIw+nyP8goVohNbVHrAJPG/AClt3tUwx+216UF01q8HyfumC0pl
	bhhYBt5w==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1oJt-0000000CEfn-3r2T;
	Wed, 02 Sep 2026 17:00:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 773FD1A1968;
	Wed,  2 Sep 2026 17:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43A016053C;
	Wed,  2 Sep 2026 17:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C97211C798E5;
	Wed,  2 Sep 2026 18:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Tecc3lQIKN0K3LRzH2AlzBhyqwFHt3ICutJHGbXQZ0=;
	b=zoXiIQQZJfVaEmZz+d1TvymlW4piF4Vox1rtYWnBZ36d+jsyCUBc3J1Tl/J4/cMHHxaG6w
	eErXxyqh3X7ueCbqHnKFkF+xLi2jd5MNpCR3jrsG1ZWHI6sUsKw8tT1UEMxfnToKHp+54/
	ZE7xIstnI5+0yRPXmVWyIsDHyyuKHDnDya53RTv7L1ZmdTHXm9aCnJQH+Pg4lE13MGp9zi
	fu+0X/IyQy1uuMKbK0+OBhqC4k8wFqYfxeYQKCiB2ekaKfdC9CH68cMCZBs91h/lt+xOj5
	Lc9WKCFb8bVN+fOclRmnm4BBvzNNKAXyvaJ1qfM1X0qJP2UO+9PAWm8EOxym3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:20 +0200
Subject: [PATCH v4 06/25] mtd: spi-nor: Move the fixup flags into the fixup
 list
MIME-Version: 1.0
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-6-779d35303dff@bootlin.com>
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
X-CRM114-CacheID: sfid-20260902_180018_153112_9F26A23D 
X-CRM114-Status: GOOD (  26.71  )
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

The idea of the fixup flags is to enable fixups without having to repeat
the same fixup function over and over again. It overall reduces the
boilerplate with a similar intent: fixing our knowledge of the flash.

Move the fixup_flags field as well as the associated flag definitions to
the spi_nor_fixup structure and enable them based on the IDs.

No functional change.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c       | 27 +++++++++++++++++++--------
 drivers/mtd/spi-nor/core.h       | 30 ++++++++++++++----------------
 drivers/mtd/spi-nor/gigadevice.c |  4 ++--
 drivers/mtd/spi-nor/issi.c       |  8 ++++----
 drivers/mtd/spi-nor/macronix.c   |  4 ++--
 drivers/mtd/spi-nor/micron-st.c  | 21 ++++++++++++---------
 drivers/mtd/spi-nor/sfdp.c       |  6 +++---
 drivers/mtd/spi-nor/spansion.c   |  6 +++---
 8 files changed, 59 insertions(+), 47 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a9360998d34b..77d28c99c33b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2367,7 +2367,7 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 	fixups = nor->manufacturer->fixups;
 
 	for (i = 0; i < nor->manufacturer->nfixups; i++) {
-		if (fixups[i].fixups->post_bfpt &&
+		if (fixups[i].fixups && fixups[i].fixups->post_bfpt &&
 		    spi_nor_fixup_match(nor, &fixups[i])) {
 			ret = fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
 			if (ret)
@@ -2667,7 +2667,7 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 	fixups = nor->manufacturer->fixups;
 
 	for (i = 0; i < nor->manufacturer->nfixups; i++) {
-		if (fixups[i].fixups->default_init &&
+		if (fixups[i].fixups && fixups[i].fixups->default_init &&
 		    spi_nor_fixup_match(nor, &fixups[i]))
 			fixups[i].fixups->default_init(nor);
 	}
@@ -2799,13 +2799,24 @@ static void spi_nor_init_flags(struct spi_nor *nor)
  */
 static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 {
-	const u8 fixup_flags = nor->info->fixup_flags;
+	const struct spi_nor_fixup *fixups;
+	unsigned int i;
 
-	if (fixup_flags & SPI_NOR_4B_OPCODES)
-		nor->flags |= SNOR_F_4B_OPCODES;
+	if (!nor->manufacturer || !nor->manufacturer->fixups)
+		return;
 
-	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+	fixups = nor->manufacturer->fixups;
+
+	for (i = 0; i < nor->manufacturer->nfixups; i++) {
+		if (!fixups[i].fixup_flags ||
+		    !spi_nor_fixup_match(nor, &fixups[i]))
+			continue;
+
+		if (fixups[i].fixup_flags & SPI_NOR_4B_OPCODES)
+			nor->flags |= SNOR_F_4B_OPCODES;
+		if (fixups[i].fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+			nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+	}
 }
 
 /**
@@ -2830,7 +2841,7 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 		fixups = nor->manufacturer->fixups;
 
 		for (i = 0; i < nor->manufacturer->nfixups; i++) {
-			if (fixups[i].fixups->late_init &&
+			if (fixups[i].fixups && fixups[i].fixups->late_init &&
 			    spi_nor_fixup_match(nor, &fixups[i])) {
 				ret = fixups[i].fixups->late_init(nor);
 				if (ret)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 32a2d485d31d..1533f79b9039 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -450,11 +450,25 @@ struct spi_nor_fixups {
  * @id:		(optional) flash ID this fixup applies to, may only match the
  *		ID prefix, eg. just the first few bytes to match a whole family
  * @match:	(optional) custom match function (can be used together with @id)
+ * @fixup_flags: flags that indicate support that can be discovered via SFDP
+ *		 ideally, but can not be discovered for this particular flash
+ *		 because the SFDP table that indicates this support is not
+ *		 defined by the flash. In case the table for this support is
+ *		 defined but has wrong values, one should instead use a
+ *		 post_sfdp() hook to set the SNOR_F equivalent flag.
+ *
+ *	SPI_NOR_4B_OPCODES: use dedicated 4byte address op codes to support
+ *			    memory size above 128Mib.
+ *	SPI_NOR_IO_MODE_EN_VOLATILE: flash enables the best available I/O mode
+ *				     via a volatile bit.
  * @fixups:	the fixup hooks to apply when this entry matches
  */
 struct spi_nor_fixup {
 	const struct spi_nor_id *id;
 	bool (*match)(const struct spi_nor *nor);
+	u8 fixup_flags;
+#define SPI_NOR_4B_OPCODES		BIT(0)
+#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
 	const struct spi_nor_fixups *fixups;
 };
 
@@ -519,22 +533,10 @@ struct spi_nor_id {
  *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
  *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
  *
- * @fixup_flags:    flags that indicate support that can be discovered via SFDP
- *                  ideally, but can not be discovered for this particular flash
- *                  because the SFDP table that indicates this support is not
- *                  defined by the flash. In case the table for this support is
- *                  defined but has wrong values, one should instead use a
- *                  post_sfdp() hook to set the SNOR_F equivalent flag.
- *
- *   SPI_NOR_4B_OPCODES:      use dedicated 4byte address op codes to support
- *                            memory size above 128Mib.
- *   SPI_NOR_IO_MODE_EN_VOLATILE: flash enables the best available I/O mode
- *                            via a volatile bit.
  * @mfr_flags:      manufacturer private flags. Used in the manufacturer fixup
  *                  hooks to differentiate support between flashes of the same
  *                  manufacturer.
  * @otp_org:        flash's OTP organization.
- * @fixups:         part specific fixup hooks.
  */
 struct flash_info {
 	char *name;
@@ -566,10 +568,6 @@ struct flash_info {
 #define SPI_NOR_OCTAL_DTR_READ		BIT(6)
 #define SPI_NOR_OCTAL_DTR_PP		BIT(7)
 
-	u8 fixup_flags;
-#define SPI_NOR_4B_OPCODES		BIT(0)
-#define SPI_NOR_IO_MODE_EN_VOLATILE	BIT(1)
-
 	u8 mfr_flags;
 
 	const struct spi_nor_otp_organization *otp;
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index f76fd0dedd0a..6a2e6ebda148 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,7 +64,6 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
 		.name = "gd25lq32",
@@ -87,7 +86,8 @@ static const struct flash_info gigadevice_nor_parts[] = {
 };
 
 static const struct spi_nor_fixup gigadevice_fixups[] = {
-	{ .id = SNOR_ID(0xc8, 0x40, 0x19), .fixups = &gd25q256_fixups },
+	{ .id = SNOR_ID(0xc8, 0x40, 0x19), .fixups = &gd25q256_fixups,
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 7af850eea9ff..2f057d731df2 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -101,7 +101,6 @@ static const struct flash_info issi_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x19),
 		.name = "is25lp256",
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x16),
 		.name = "is25wp032",
@@ -121,7 +120,6 @@ static const struct flash_info issi_nor_parts[] = {
 		.id = SNOR_ID(0x9d, 0x70, 0x19),
 		.name = "is25wp256",
 		.flags = SPI_NOR_QUAD_PP,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}
 };
 
@@ -146,8 +144,10 @@ static bool issi_pm25lv_match(const struct spi_nor *nor)
 static const struct spi_nor_fixup issi_fixup_list[] = {
 	{ .fixups = &issi_fixups },
 	{ .match = issi_pm25lv_match, .fixups = &pm25lv_nor_fixups },
-	{ .id = SNOR_ID(0x9d, 0x60, 0x19), .fixups = &is25lp256_fixups },
-	{ .id = SNOR_ID(0x9d, 0x70, 0x19), .fixups = &is25lp256_fixups },
+	{ .id = SNOR_ID(0x9d, 0x60, 0x19), .fixups = &is25lp256_fixups,
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
+	{ .id = SNOR_ID(0x9d, 0x70, 0x19), .fixups = &is25lp256_fixups,
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
 };
 
 const struct spi_nor_manufacturer spi_nor_issi = {
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 04b431bf5f13..94e553724fc9 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -140,7 +140,6 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		/* MX66L1G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
@@ -328,7 +327,8 @@ static const struct spi_nor_fixups macronix_nor_fixups = {
 static const struct spi_nor_fixup macronix_fixups[] = {
 	{ .fixups = &macronix_nor_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x19), .fixups = &mx25l25635_fixups },
-	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups },
+	{ .id = SNOR_ID(0xc2, 0x20, 0x1a), .fixups = &macronix_qpp4b_fixups,
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1b), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x20, 0x1c), .fixups = &macronix_qpp4b_fixups },
 	{ .id = SNOR_ID(0xc2, 0x25, 0x3a), .fixups = &macronix_qpp4b_fixups },
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 2aabd6d487ba..53ae9533f50f 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -205,12 +205,10 @@ static const struct flash_info micron_nor_parts[] = {
 		/* MT35XU512ABA */
 		.id = SNOR_ID(0x2c, 0x5b, 0x1a),
 		.mfr_flags = USE_FSR,
-		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
 	}, {
 		/* MT35XU01GBBA */
 		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
 		.mfr_flags = USE_FSR,
-		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
 	}, {
 		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
 		.name = "mt35xu02g",
@@ -218,7 +216,6 @@ static const struct flash_info micron_nor_parts[] = {
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
-		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
 	},
 };
 
@@ -403,7 +400,6 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "mt25ql256a",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x19),
@@ -416,7 +412,6 @@ static const struct flash_info st_nor_parts[] = {
 		.name = "mt25ql512a",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xba, 0x20),
@@ -472,7 +467,6 @@ static const struct flash_info st_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
 			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.mfr_flags = USE_FSR,
 	}, {
 		.id = SNOR_ID(0x20, 0xbb, 0x19),
@@ -661,13 +655,22 @@ static const struct spi_nor_fixups micron_st_nor_fixups = {
 
 static const struct spi_nor_fixup micron_fixups[] = {
 	{ .fixups = &micron_st_nor_fixups },
-	{ .id = SNOR_ID(0x2c, 0x5b, 0x1a), .fixups = &mt35xu512aba_fixups },
-	{ .id = SNOR_ID(0x2c, 0x5b, 0x1b), .fixups = &mt35_two_die_fixups },
-	{ .id = SNOR_ID(0x2c, 0x5b, 0x1c), .fixups = &mt35_two_die_fixups },
+	{ .id = SNOR_ID(0x2c, 0x5b, 0x1a), .fixups = &mt35xu512aba_fixups,
+	  .fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE },
+	{ .id = SNOR_ID(0x2c, 0x5b, 0x1b), .fixups = &mt35_two_die_fixups,
+	  .fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE },
+	{ .id = SNOR_ID(0x2c, 0x5b, 0x1c), .fixups = &mt35_two_die_fixups,
+	  .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE },
 };
 
 static const struct spi_nor_fixup st_fixups[] = {
 	{ .fixups = &micron_st_nor_fixups },
+	{ .id = SNOR_ID(0x20, 0xba, 0x19, 0x10, 0x44, 0x00),
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
+	{ .id = SNOR_ID(0x20, 0xba, 0x20, 0x10, 0x44, 0x00),
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
+	{ .id = SNOR_ID(0x20, 0xbb, 0x19, 0x10, 0x44, 0x00),
+	  .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0x20, 0xba, 0x21), .fixups = &n25q00_fixups },
 	{ .id = SNOR_ID(0x20, 0xba, 0x22), .fixups = &mt25q02_fixups },
 	{ .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00), .fixups = &mt25qu512a_fixups },
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 39cb8ac3a037..87b2d0a0e9f4 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -736,7 +736,7 @@ static void spi_nor_smpt_read_dummy_fixups(const struct spi_nor *nor,
 	fixups = nor->manufacturer->fixups;
 
 	for (i = 0; i < nor->manufacturer->nfixups; i++) {
-		if (fixups[i].fixups->smpt_read_dummy &&
+		if (fixups[i].fixups && fixups[i].fixups->smpt_read_dummy &&
 		    spi_nor_fixup_match(nor, &fixups[i]))
 			fixups[i].fixups->smpt_read_dummy(nor, read_dummy);
 	}
@@ -773,7 +773,7 @@ static void spi_nor_smpt_map_id_fixups(const struct spi_nor *nor, u8 *map_id)
 	fixups = nor->manufacturer->fixups;
 
 	for (i = 0; i < nor->manufacturer->nfixups; i++) {
-		if (fixups[i].fixups->smpt_map_id &&
+		if (fixups[i].fixups && fixups[i].fixups->smpt_map_id &&
 		    spi_nor_fixup_match(nor, &fixups[i]))
 			fixups[i].fixups->smpt_map_id(nor, map_id);
 	}
@@ -1430,7 +1430,7 @@ static int spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 	fixups = nor->manufacturer->fixups;
 
 	for (i = 0; i < nor->manufacturer->nfixups; i++) {
-		if (fixups[i].fixups->post_sfdp &&
+		if (fixups[i].fixups && fixups[i].fixups->post_sfdp &&
 		    spi_nor_fixup_match(nor, &fixups[i])) {
 			ret = fixups[i].fixups->post_sfdp(nor);
 			if (ret)
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f3862eb1a23a..5f4ce042ef2c 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -976,19 +976,16 @@ static const struct flash_info spansion_nor_parts[] = {
 		.name = "s25fl064l",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0x01, 0x60, 0x18),
 		.name = "s25fl128l",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0x01, 0x60, 0x19),
 		.name = "s25fl256l",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}, {
 		.id = SNOR_ID(0x04, 0x2c, 0xc2, 0x7f, 0x7f, 0x7f),
 		.name = "cy15x104q",
@@ -1157,6 +1154,9 @@ static const struct spi_nor_fixup spansion_fixups[] = {
 	{ .fixups = &spansion_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x81), .fixups = &s25fs_s_nor_fixups },
 	{ .id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81), .fixups = &s25fs_s_nor_fixups },
+	{ .id = SNOR_ID(0x01, 0x60, 0x17), .fixup_flags = SPI_NOR_4B_OPCODES },
+	{ .id = SNOR_ID(0x01, 0x60, 0x18), .fixup_flags = SPI_NOR_4B_OPCODES },
+	{ .id = SNOR_ID(0x01, 0x60, 0x19), .fixup_flags = SPI_NOR_4B_OPCODES },
 	{ .id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
 	{ .id = SNOR_ID(0x34, 0x2a, 0x1b, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
 	{ .id = SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90), .fixups = &s25hx_t_fixups },

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
