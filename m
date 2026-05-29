Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B92CD6E54
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ct50TH2U8ThgOU7Q8TTFhNDbV5z2XkOi0mK7xJqul6Y=; b=irtmOk5p/gWO5a
	spePdzLwq3ZD0xLVbDuHxfyJVxmybq92qvLDzGGdFRW3kqwsGcWp4OxjwoE2eiYfs77EDq6Mn6GHL
	w9lfatL7G15mkOnSeGj1jtZaSL+S3SRd8L4aPj2gH+7//+iaBVkB9equyF0EM5FSeE+qOYJ1a7k7O
	V98LtYzGq5f17ZSZH1NCe3c7QaS6DEvkpgJtd6toDljN0RNLXhF+Cpsg7mXtDxphTZqFWWfVSu7DF
	V8j4xDAcB+X0L0u0vXpZfN92Rwpg2YXsOyUZk/CS1N0JEWnyWFGMjR4mom576crWeWMrtgP7G8ItY
	GbzJ8pJVRYCMfx9DN0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2x-00000007fDo-2tRf;
	Fri, 29 May 2026 15:22:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz2t-00000007fB4-0xRo
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:22:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0FF01A373D;
	Fri, 29 May 2026 15:22:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A72C5601FA;
	Fri, 29 May 2026 15:22:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC09F10888CC6;
	Fri, 29 May 2026 17:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4603I4ihlZsGX1G8Lhkbss5U3n9JjlCt8i/a76TLe2k=;
	b=fxl2prEZX6WbQQFwYPr1N1BY20iVXB8q3TmqlsQucOWQjJSUJAA6z2m35hrq34ZCzkhSt4
	vhBP6H0nzj3A99/7Sn3Misl6vwTP+QfQjFtkVXvVYygz7vh9pG7HKyb8Pq4YlmW4DLqoGc
	91v8niHLJQnnfvA6/SU59iLdZkE58fkMsHplHkavd4gEicLeuU2yciJRQqe9roL5H7WLS8
	OqATvCg2mzyfzEi08tbMi4v+bHbw9rB99FNv27cP3Zqvvwnddoh580sW33MvEPzp7jYNsJ
	qy4GRlFtoQ5/fQwBnHhFay3xkITHG0ne3TJgTLiqJ8qNwbI7IXB/JtuKjOEqTw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:23 +0200
Subject: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name entry
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082247_439003_030C32C8 
X-CRM114-Status: GOOD (  10.33  )
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

This is a legacy field, it is often incorrectly filled and will soon
become very incorrect due to IDs being reused.

Replace the names with a comment above the entry with the newly instated
naming scheme to indicate what chips are covered by each entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
I've been focusing on several chip families, but not all of them. I do
not have enough information about the oldest chips at the moment to
cleanup *all* IDs, but I am nevertheless trying to make a major cleaning
step here.
---
 drivers/mtd/spi-nor/winbond.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 03e59ff3228f..b4088fc5fde9 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -218,36 +218,36 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_1M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q32JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x16),
-		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
-		.name = "w25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x18),
 		/* Flavors w/ and w/o SFDP. */
-		.name = "w25q128",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q128_fixups,
 	}, {
+		/* W25Q256JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x19),
-		.name = "w25q256",
 		.size = SZ_32M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q256_fixups,
 	}, {
+		/* W25Q512JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x20),
-		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* W25Q01JV */
+		/* W25Q01JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x21),
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
@@ -285,54 +285,54 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128FW-G/Q, W25Q128JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x18),
-		.name = "w25q128fw",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x19),
-		.name = "w25q256jw",
 		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q512NW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x20),
-		.name = "w25q512nwq",
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
-		.name = "w25q16jv-im/jm",
 		.size = SZ_2M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
-		.name = "w25q32jv",
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),
-		.name = "w25q64jvm",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* W25Q128JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),
-		.name = "w25q128jv",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),
-		.name = "w25q256jvm",
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
@@ -343,33 +343,33 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x16),
-		.name = "w25q32jwm",
 		.size = SZ_4M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
+		/* W25Q64JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x17),
-		.name = "w25q64jwm",
 		.size = SZ_8M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q128JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x18),
-		.name = "w25q128jwm",
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q256JW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x19),
-		.name = "w25q256jwm",
 		.size = SZ_32M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q512NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x20),
-		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
 		/* W25Q01NW-M */

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
