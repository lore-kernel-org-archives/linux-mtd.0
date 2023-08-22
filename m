Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B6DEE49A3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMVcESF8ogQH2vuiIGj16qSqxEMuOdxkpMyZhVkrW5g=; b=CKknIjqZpUOAFj
	aqvLnXsfLUZo7I2Q9ubbdTPYhjc61fbUFpMQbGjTjEJ5E1EtJoF8Orj80lx2w3ZLaT2/wShgsqv35
	IuoxB0ia6diDo61SE+mhrauZDm8n8KQIs1iuEKl/jNmYNHP3yC13Bj4CIExqlxVXDkK/sJqp2XH+H
	+kJ0vJrkp/dCh+1pSu/nv2NsFmQQfDaAQCV4qH5FGfCCXLFSJRz9/Tuo9UgC2V5hjLVEMybHWo1Rw
	OrOEWbbspIUiR2HrbpboDY/K2tTf0LgploGNxl3vARUMubBZop1lYyT8y6eWPZ4j6+A1LAu0lXAHL
	ENWYyQJrwE9bdt0Slgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWJ-00FHoA-2n;
	Tue, 22 Aug 2023 07:09:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWF-00FHmt-2q
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:09:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 509D664CC0;
	Tue, 22 Aug 2023 07:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB24EC433C8;
	Tue, 22 Aug 2023 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688178;
	bh=BtFMSSMS+Ge1Ld7dIKb08UtH8RdD+UZ/1ZtM9xiCV4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u0Ol46gEyBfiDsoZFjf0xjhLBjciINSBkapT8D+OLIMHq0jFpBUh/F3NdYHfjHCTq
	 FYzFCw55NrCB7ZHgGqwiC6IXGzaFBqU8NgmeC2e8WnUUcKYyUUdnAv2rOOIl9xptLu
	 NApEGphJdDxQMgyQl4OHCFZ6czMBW4F5Ey2fzmPWLXOA1SfW9VdlZPLrqXBaD10kAh
	 TdyznxQuHDdT0dTvHxr+cpA75Gwyy+x6kNrBqRoTNpSxgkl89UC/cg5iPR7bIvSl1f
	 Lk3KmfZer6CVsjOSliNtFU1HuVZSf3F6E/OGtaZG3Melp48px7UWABWxvw+I1M5en4
	 d2XoZpSxbQBGw==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:17 +0200
Subject: [PATCH v2 01/41] mtd: spi-nor: remove catalyst 'flashes'
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-1-291a0f39f8d8@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_000940_002680_EC7F7C67 
X-CRM114-Status: GOOD (  13.80  )
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

CAT25xx are actually EEPROMs manufactured by Catalyst. The devices are
ancient (DS are from 1998), there are not in-tree users, nor are there
any device tree bindings. Remove it. The correct driver is the at25.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/Makefile   |  1 -
 drivers/mtd/spi-nor/catalyst.c | 24 ------------------------
 drivers/mtd/spi-nor/core.c     |  1 -
 drivers/mtd/spi-nor/core.h     |  1 -
 4 files changed, 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index e347b435a038..496dae9ca0f3 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -2,7 +2,6 @@
 
 spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
 spi-nor-objs			+= atmel.o
-spi-nor-objs			+= catalyst.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
diff --git a/drivers/mtd/spi-nor/catalyst.c b/drivers/mtd/spi-nor/catalyst.c
deleted file mode 100644
index 6d310815fb12..000000000000
--- a/drivers/mtd/spi-nor/catalyst.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2005, Intec Automation Inc.
- * Copyright (C) 2014, Freescale Semiconductor, Inc.
- */
-
-#include <linux/mtd/spi-nor.h>
-
-#include "core.h"
-
-static const struct flash_info catalyst_nor_parts[] = {
-	/* Catalyst / On Semiconductor -- non-JEDEC */
-	{ "cat25c11", CAT25_INFO(16, 8, 16, 1) },
-	{ "cat25c03", CAT25_INFO(32, 8, 16, 2) },
-	{ "cat25c09", CAT25_INFO(128, 8, 32, 2) },
-	{ "cat25c17", CAT25_INFO(256, 8, 32, 2) },
-	{ "cat25128", CAT25_INFO(2048, 8, 64, 2) },
-};
-
-const struct spi_nor_manufacturer spi_nor_catalyst = {
-	.name = "catalyst",
-	.parts = catalyst_nor_parts,
-	.nparts = ARRAY_SIZE(catalyst_nor_parts),
-};
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1b0c6770c14e..c44de69c4353 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1999,7 +1999,6 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
-	&spi_nor_catalyst,
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 9217379b9cfe..6d31af6c39ed 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -631,7 +631,6 @@ struct sfdp {
 
 /* Manufacturer drivers. */
 extern const struct spi_nor_manufacturer spi_nor_atmel;
-extern const struct spi_nor_manufacturer spi_nor_catalyst;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
