Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B601EE57F0
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IblPhn72qRIUKq5+tKnSdgE5/CIIeL5M1YWVdDEmuw=; b=ioF0IsUXpyvHkh
	5fFar/v/+XReI9mcqJNRZhQUz4jhNB0I6bcHlKNhURrtNktzNtqmBNePbhU6uMHl6euj8q2KEUmKu
	+kkESHMr3b4L4KeXE7d5gxBNYgQXzHt8wFan042RVaky1UfHo/7WnbuhK9sXMuPjOcUgVhZWakPRF
	ervlQ3YussZfuOTlEHDR8S2lel9W+a6REnJmFvggiYx6QF7FzNOJFB0fQh1ZqU8mAG8X/oDJBtzDh
	upPz2KIS6pqedmqjQg7b0KS68f9hnBc5cMSGgbpONjx+PMvUAXMlKmbIO7ZqloZ/beRKDtFje0J+D
	1WGAq4harLX4mILCeUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXT-00DSoK-2m;
	Fri, 08 Sep 2023 10:16:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXR-00DSm0-1T
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:16:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A4DD60FB6;
	Fri,  8 Sep 2023 10:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC98C433CB;
	Fri,  8 Sep 2023 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168190;
	bh=2WkrOnHvWlXDPA215PL8w6ZJpKmJU2RCQJ+cnSW9WS8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W6+hRF+gmLirffpZE2RAPsWo8cvz56NBQO+mBhEUl6b+9m2yhivF74aUj5Xzrt03b
	 SVsRHwlv+nkBEtzCOVBsYOLtlsOHYqysexLPehJMBGXXbzRdLk89WOZVS1AkwyXhNQ
	 MEhnEuEuhzDAkcIrx2Qirz/q1tcTwbCQCNPHUZYMh1n1txbs6KEnGCSdijilBdG7Mm
	 VdqL8TFo+PJWyp5Ac4N1u+PyXysvoIttAilq1zl1SuEJWQB6Yi25KzmHblBIFL+Ji0
	 bE2cGwizw0y2pOlUS4ySUV4p5OyclDmRMk4b/vmcQoK4wmgChe/IikfVXSBI75LpXW
	 4fJ/KLCz1g2Kg==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:19 +0200
Subject: [PATCH v3 01/41] mtd: spi-nor: remove catalyst 'flashes'
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-1-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031633_595774_DF735CEE 
X-CRM114-Status: GOOD (  13.64  )
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
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
