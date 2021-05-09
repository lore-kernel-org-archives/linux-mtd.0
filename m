Return-Path: <SRS0=AvPp=KE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254E9C433ED
	for <linux-mtd@archiver.kernel.org>; Sun,  9 May 2021 14:49:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46843613F0
	for <linux-mtd@archiver.kernel.org>; Sun,  9 May 2021 14:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46843613F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kdhSiE+9xZ95at+1ENLxybDLBmEt1UE6+Xts9+5qtxA=; b=JIEXSuBGud4RFc
	G9IhRrPfQPA3PcspJ1xGQ1cFNmhaXvJzeBMBMhng9Ch5Yof99mHc9NV4Tcdzm6RyO0qt6vcqCdNiQ
	qhP/p0FTHx5iINRXc5+F7YfOWfSHEupkQlrInpfYfW+RIsqx/2vRWF4aWv2vtpf1gVm+4AZj36Pmp
	wptUaMf2Nas9Vw1IDRdhqn6r3Qak4nWpG3+n2fcd/tPipQtKcWAA2eE7etxkAE/Pus3om8fiGLpJc
	d5jSuszwtF5f+niP3vaNPf3TA3X+o16EulPM6SJcUgYUyRGr0HqaEi+bn2YiFk8tWAh/Pt8ZBXkyl
	Utgqr/rTNILgsI/cTi9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfkjI-00BlYC-FS; Sun, 09 May 2021 14:48:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfkiX-00BlP4-1q
 for linux-mtd@desiato.infradead.org; Sun, 09 May 2021 14:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CLo2UWuFOpHDpg1iqHdQKyMJd4A9l//Ls6EMacZmHhQ=; b=LpUAX6HuUa4tXfuESD7TzckZiO
 mUkxngMK/pwSO1saNLfZir5nU4AcdvBLG967gbilhIzLbKQWTuJLz4LPIYgJBIRSFGggAVYe/8YJk
 g/K/j7WTD8bHI+zNB4npKe+AY6aG123kd6kkxDdqnIns+Ru47zIMBSy8tuzjuWzLDsfgOn9DBgNwV
 FnpZ77B7VgOroisCps5iLSTT6UYhRqCZiVd6stPQXqGOe7FqgkTGX0pyp9KAwMI3IsemPpkSW7kp+
 voCS65Yfh6eGnXbysdm6r3OBO2lwBqh5toKbY5rtBSNBAeFtLVoEPyRcaIsiv8x8352I3nrWtb48l
 eoUFLTVw==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfkiT-0080Eo-Tk
 for linux-mtd@lists.infradead.org; Sun, 09 May 2021 14:47:35 +0000
Received: (qmail 7422 invoked from network); 9 May 2021 14:47:23 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 9 May 2021 14:47:23 -0000
From: David Bauer <mail@david-bauer.net>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
Date: Sun,  9 May 2021 16:47:16 +0200
Message-Id: <20210509144716.431650-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210509_074734_266733_AEEEAAAF 
X-CRM114-Status: GOOD (  14.66  )
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

Add MTD support for the BoHong bh25q128as SPI NOR chip.
The chip has 16MB of total capacity, divided into a total of 256
sectors, each 64KB sized. The chip also supports 4KB sectors.
Additionally, it supports dual and quad read modes.

Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/bohong.c | 21 +++++++++++++++++++++
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 4 files changed, 24 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/bohong.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 653923896205..de0b2d3bcb1c 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -2,6 +2,7 @@
 
 spi-nor-objs			:= core.o sfdp.o
 spi-nor-objs			+= atmel.o
+spi-nor-objs			+= bohong.o
 spi-nor-objs			+= catalyst.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
diff --git a/drivers/mtd/spi-nor/bohong.c b/drivers/mtd/spi-nor/bohong.c
new file mode 100644
index 000000000000..20aeceb1b2d1
--- /dev/null
+++ b/drivers/mtd/spi-nor/bohong.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info bohong_parts[] = {
+	/* BoHong Microelectronics */
+	{ "bh25q128as", INFO(0x684018, 0, 64 * 1024, 256,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+};
+
+const struct spi_nor_manufacturer spi_nor_bohong = {
+	.name = "bohong",
+	.parts = bohong_parts,
+	.nparts = ARRAY_SIZE(bohong_parts),
+};
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..03a05bce6231 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2199,6 +2199,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
+	&spi_nor_bohong,
 	&spi_nor_catalyst,
 	&spi_nor_eon,
 	&spi_nor_esmt,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4a3f7f150b5d..b71323317235 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -409,6 +409,7 @@ struct spi_nor_manufacturer {
 
 /* Manufacturer drivers. */
 extern const struct spi_nor_manufacturer spi_nor_atmel;
+extern const struct spi_nor_manufacturer spi_nor_bohong;
 extern const struct spi_nor_manufacturer spi_nor_catalyst;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
