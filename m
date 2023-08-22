Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F55EE49AC
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 07:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCtUNFPe4/uPHpwv215BlbWXhFwQG67Td+vfLO8xAhw=; b=QzSxswWlzOVauN
	4Dhqe2Wl1qp2/0kTmmxTCwZCwsH7n1v+I55kCZWTto5NgOhzfFpILS7Bg3uaDQPP/DpxlivCr20SV
	g97pKN1JmQfTsfktHLIy1+fqYZwQhEWkSvPIsWsujyLk29LRjYl6sRvROKA5gxMD1Q8bTcZMBgKZ+
	o+EUO0TCBAzI2mJ4VY9oP9Cy8B6YzGKQgJ5pWPasyoWoPJ7Pf9Tr29loEzZOdZKQ6qWfnLUT78T+A
	mU6hBeSOuRbVbKIp3Keh4svSNZxy5QqgR3Pt3dagH6V2MlSWK6xcQEVeH2QypElj/HV9R/Ieyk5RL
	B41gbhMZfi3XXGqWGudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWL-00FHom-1a;
	Tue, 22 Aug 2023 07:09:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYLWH-00FHnM-2J
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 07:09:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B7ED649DF;
	Tue, 22 Aug 2023 07:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E254DC433CB;
	Tue, 22 Aug 2023 07:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692688180;
	bh=c/YUDEImvGBPGu1w7v7S2H4wM+XOOkWFgbu7J+r0IB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kxw4iepq2kMmcPeZL4bDGlKpzuL/qBwEJnOP6pmJ5Yo/8tXsD/kFIGeocLtUf7+Pj
	 n7v1WxkmKkl0wa4pOqoHRJDPMpOR0z50wMhGUlZH2WkSiEghvhAYTerjwm4i7CSCn9
	 iJifgt4A9WRPNTpnBLTxtuaCnuRriqrIUJvsTnPbE4e2pHNZSPqlsXr0AEhwBtQbnY
	 WtkAp8+VGNnmYLhuNtqdkvBcxzC4gW1Hzoc1E+UIZlhVrnJx/azaz4md/VLkP9ca2z
	 koksrBYaePQKo9c/Cw6iN3tMi32Le44MiJINSvIskLWHmLNzmWocL64vwskiQEK2cp
	 NLgZAAXGJVT/A==
From: Michael Walle <mwalle@kernel.org>
Date: Tue, 22 Aug 2023 09:09:18 +0200
Subject: [PATCH v2 02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v2-2-291a0f39f8d8@kernel.org>
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
X-CRM114-CacheID: sfid-20230822_000941_852114_0380FC2A 
X-CRM114-Status: GOOD (  12.74  )
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

This part is not a flash but an EEPROM like FRAM. It is even has a DT
binding for the (correct) driver (at25), see
Documentation/devicetree/bindings/eeprom/at25.yaml. Just remove it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/Makefile  |  1 -
 drivers/mtd/spi-nor/core.c    |  1 -
 drivers/mtd/spi-nor/core.h    |  1 -
 drivers/mtd/spi-nor/fujitsu.c | 21 ---------------------
 4 files changed, 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 496dae9ca0f3..5e68468b72fc 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -5,7 +5,6 @@ spi-nor-objs			+= atmel.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
-spi-nor-objs			+= fujitsu.o
 spi-nor-objs			+= gigadevice.o
 spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c44de69c4353..286155002cdc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2002,7 +2002,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
-	&spi_nor_fujitsu,
 	&spi_nor_gigadevice,
 	&spi_nor_intel,
 	&spi_nor_issi,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 6d31af6c39ed..dfc20a3296fb 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -634,7 +634,6 @@ extern const struct spi_nor_manufacturer spi_nor_atmel;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
-extern const struct spi_nor_manufacturer spi_nor_fujitsu;
 extern const struct spi_nor_manufacturer spi_nor_gigadevice;
 extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
deleted file mode 100644
index 69cffc5c73ef..000000000000
--- a/drivers/mtd/spi-nor/fujitsu.c
+++ /dev/null
@@ -1,21 +0,0 @@
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
-static const struct flash_info fujitsu_nor_parts[] = {
-	/* Fujitsu */
-	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
-		FLAGS(SPI_NOR_NO_ERASE) },
-};
-
-const struct spi_nor_manufacturer spi_nor_fujitsu = {
-	.name = "fujitsu",
-	.parts = fujitsu_nor_parts,
-	.nparts = ARRAY_SIZE(fujitsu_nor_parts),
-};

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
