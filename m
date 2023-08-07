Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135BC04FDF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/yAyuQarBS6mzkvBir0AgiI6pS5IJwVmbTo1TLKmR4=; b=2aXD2RCYPlv96+
	/mHDCADD1vgJuatGmiRPcEzcK4/hZmOT/RDzEKVlklCnMeJ1BxARmxVzjyELlH47Ei65gBSdnNQ2U
	89kj7RaH40KENVeNhMb3ohpT/2QRf2l0Knyx5HC/mDHWgnAL7KYuqEDa0ajPdSfDVIKRxypkjh3nk
	NKJ5AlOWu00WGoq7O3GWqBD+GnZg3xJG89BtqQ/XkPpl7sodKeogdilWWWf64u2Am79hSp/2ZpMt3
	IQc/qfWvQsArLFV0UuefSGGiS6EtAfTfLfIzceKz8/eKfl5/PKvnMGG2LmbJ91nHreTWMtj+vVQ1f
	X9aAQ7jD/vXUmCqF3t2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0BO-00HKii-0W;
	Mon, 07 Aug 2023 13:22:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0BK-00HKh0-0e
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:21:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 836AF61AD8;
	Mon,  7 Aug 2023 13:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CBAC433CB;
	Mon,  7 Aug 2023 13:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414516;
	bh=STumF2jMsmMQs/u4xKVFJG5rdn3FbACDuOxzTY6McdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A6jw1DWkL1XRwjkzsFQQed2z4amOdfyxiI6nE6Chb1jk8m9Wf0redWf6B8PRSwkH/
	 njtC+XxwJUWgUSTFlkEs+JqbWTnQVEs3itCYvKrCw7Ue/Mi2YC+dwPpqyjT2Lp8BxE
	 twCciWXrZKkQJiqC9R4sef/PSTMuNjl1aIG8s1DdtYI9sKXw4JNKSE3/c8amY3Ssy8
	 meZeWmH6OY9yXU6wsQubc2svPlIo7VSK82h/3NffKrkUL4I2q3NQfVCwYh+5gcS4b4
	 JpVivunn1tLR9jM6Qf8+YDbiD6FvAz4JFLjV5iLT22zVDR3TxulxXF/lyRddL6HVrE
	 Jjsyz4c68cG6Q==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:20:56 +0200
Subject: [PATCH 02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-2-3d3d5bef4ba4@kernel.org>
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
X-CRM114-CacheID: sfid-20230807_062158_323492_56EE805E 
X-CRM114-Status: GOOD (  12.35  )
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
 drivers/mtd/spi-nor/core.c    |  1 -
 drivers/mtd/spi-nor/core.h    |  1 -
 drivers/mtd/spi-nor/fujitsu.c | 21 ---------------------
 3 files changed, 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8e43d171ffd0..a9ad55aab821 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2001,7 +2001,6 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
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
