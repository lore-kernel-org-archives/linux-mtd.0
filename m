Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95188C04A6A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFpT4A+yGuHjrzwVfyYmhsf+Vm3V6dpqVYDwehMuNJ8=; b=RNqxwlZMkpPRvl
	m5pLHohgUiV1uangluWy7OweEHuFWNdpg/MHaWV2yaF1ogmXZuPmqYjRo1ECdah/AzX9iSa7bhhJF
	oxvRG0FtUiZ2IPNw6mlwx9Oyo5Y1WwjaVe66TSKjTc0r8Truw89ygA+Vpxk4jRJjCUjSiyU7GWNfz
	92vXr7u179Cli7chjjcs8Jn1B05V6+su6anE9juZgGx9rbn0rNvlQ+eeKA6hBauf2i1ffAJZL/L0D
	LtKl7zsWyUgkCPhU1SLwLCAnje6LtVdXG61Y690zTrUMREm5nMOxdHfB6wspa/o+3hKnVg5EWOWri
	i298cMZ71ttSFwnXUCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0BK-00HKhP-1Q;
	Mon, 07 Aug 2023 13:21:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0BH-00HKg3-2s
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:21:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 690AC61ACC;
	Mon,  7 Aug 2023 13:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2537AC433C8;
	Mon,  7 Aug 2023 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414514;
	bh=cmN7UAt71pD0oHRQkFHh8Nu11a8Q9bJn8d0evMSd854=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S2pVJfzgrAtteE4DQlj+Iz+ClPiAd9ZaQGs9pPkDJ8vlNL5prK6H0YteObW2SFaQr
	 v+P42S1XmCuQpHdcnCLrep4eWBxzGwgFSRzzmdZ0U4GHCSm75YZ0izSxR9l9/JeZos
	 NF5DhF6ZReaU8jNzjjC8m1f9l9+dT38FHLgDyQtsm9L7PEAFzE2HkTNzY1slqUjkCt
	 PVMz3peXFgtnNbmw5GC9D+mpq8O8Rjh63lZUS0r0gq6IlAROkBst0IiPvQtTXjTabF
	 Y5MjTz7YyMVbxh2Fl8bni+9kEcDJ39OcuqH+R04StAsStXEjf1gsun2R+f1ahYrFTk
	 h+1o+Dw/07stg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:20:55 +0200
Subject: [PATCH 01/41] mtd: spi-nor: remove catalyst 'flashes'
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-1-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_062156_024086_23316BAE 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/mtd/spi-nor/catalyst.c | 24 ------------------------
 drivers/mtd/spi-nor/core.c     |  1 -
 drivers/mtd/spi-nor/core.h     |  1 -
 3 files changed, 26 deletions(-)

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
index 614960c7d22c..8e43d171ffd0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1998,7 +1998,6 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 
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
