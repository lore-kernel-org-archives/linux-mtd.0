Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AEFC79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGvkFLo7lT7mD++WVDGSkvbBXpioKB8PtFXtrrp3ms0=; b=t3JZuPkJA6/WZ2
	Z3Mn8pFOyoDt6S3Op8cFIod5M5ukG+NJuMHP9gHMbzR5saBjwq6hdYgutFzBUBnOnQ5vBgdPxbbMW
	WHXekMucN4JB0OAjX7+YP33mFugfR9D8TGDFUUXeC2qWU0iz1vovwk+zKmeqNq4cpk2tN0owQPxfR
	rEPiTP4vHPMeDHocANI+u9fWdCrQ/PL0hov+pwl4mCDkev3u0J2PFl3a6QDPmWb3RJiefivYIebVn
	KyPYEHpw1fV6NfzLBVYjc/d53yaBkESv44SXxzGGlCoYZcLpEm9tnwk6wTvo7uSzPYq8Z+Pvrkowc
	D4Zp3wro0Bk4FP8WrA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZX-00000002qnJ-2RnS;
	Fri, 04 Sep 2026 17:19:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZW-00000002qlR-0bBc
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=50UwMA2XWptlL2jHfcWAHUQHf2r0cSy636rR4blSvw0=; b=jeQUAvMWOunRXd3EHiJraA9eHs
	PapQqfR7WA+IhGM0ENMB7Ztr8JIinDp1eu679p5wdCR4zVHoNd0FbP5EGKqco9SQ1aPdfmVEAIdbl
	y4WGPEl+iRhEAWuiczJh57B15b2VZF+sSJI5RqG//34duEKiiewTnQosswnu+FP5f24RALr0M0xaJ
	fiNVT9xTtyakhB27/IaoIAxja+L02LtGminqPluQBNcOfq9FoqF9T0v5BDm3yQHPKmhyIE4W05VDj
	yFnoSmzGrfnSeVXxXpPEP0xUAyXvYYOs/zJLfz/uFlg6vOUqsPNEuonmCdXSLluEfclfpAhEIC9la
	d2WyXAEA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZT-0000000EKrP-0tDs
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 995721A199B;
	Fri,  4 Sep 2026 17:19:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66C8A6057F;
	Fri,  4 Sep 2026 17:19:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B20BF11C79AE2;
	Fri,  4 Sep 2026 19:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=50UwMA2XWptlL2jHfcWAHUQHf2r0cSy636rR4blSvw0=;
	b=oO6wqG+OcSPgSlIYjUal1la23IKqsEZYxTbnTSmjIE991+T0LE7m0Cw5xNxgpqalL3V3OC
	nilctXWOlzGXXHw/N5tgy4VSYoz9geHXncTdGQnc+vSm9AaHsli4DNHmJACSPI/hFtYamu
	UG+C2DxXVhe7laftuuhlGh/zmGR4RjvNdGK6mbRcatNrvRsXwk8nvP+iJumhp1Q1RT2r3X
	Ajao3L0E2QH3YFSGsQhL0EhNrAp7jGVMHKo+6rlCzKoX9nHfiq50gCo6ycv4HwBm0nCvz0
	OV3LWjKB4GrF3GDwZx1MoTdUz+boP8L6oJxMrD0AoKyTP10dxw1GuJ2O6U5Otw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:59 +0200
Subject: [PATCH v6 06/26] mtd: spi-nor: winbond: Properly document the chip
 names
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-6-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181923_495725_CCD7FC5E 
X-CRM114-Status: GOOD (  11.95  )
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

While the .name entry is a legacy field, is highly imprecise, and even
wrong sometimes due to ID reuse, it is part of the sysfs ABI, we cannot
remove it for existing chips. However, we can double the entry with the
now usual comment with the newly instated naming scheme to indicate what
chips are covered by each entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
I've been focusing on several chip families, but not all of them. I do
not have enough information about the oldest chips at the moment to
cleanup *all* IDs, but I am nevertheless trying to make a major cleaning
step here.
---
 drivers/mtd/spi-nor/winbond.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ace9e620bfa6..1fd05a3f743d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -218,16 +218,19 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q32JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x16),
 		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
 		.name = "w25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x18),
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
@@ -236,18 +239,20 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q128_fixups,
 	}, {
+		/* W25Q256JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q256_fixups,
 	}, {
+		/* W25Q512JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x20),
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* W25Q01JV */
+		/* W25Q01JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x21),
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
@@ -285,52 +290,60 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128FW-G/Q, W25Q128JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x18),
 		.name = "w25q128fw",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q512NW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x20),
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NW-Q */
+		/* W25Q01NW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_rdcr_fixup,
 	}, {
+		/* W25Q16JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x15),
 		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
 		.name = "w25q32jv",
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),
 		.name = "w25q64jvm",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q128JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 	}, {
@@ -343,6 +356,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x16),
 		.name = "w25q32jwm",
 		.size = SZ_4M,
@@ -350,24 +364,28 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
+		/* W25Q64JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x17),
 		.name = "w25q64jwm",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x18),
 		.name = "w25q128jwm",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q512NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
