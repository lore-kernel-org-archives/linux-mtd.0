Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA249C48BC4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Feb 2024 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J7hJ/iNubFJhccmo4lR1KY0RybnF3SqLeLrrrjXaTao=; b=35T/BszpMo2+fP
	BOcAFvUAuMMZ/qss1EP9iTZ/3TWuFbSbBif+FlwvM4XurBP+TOq8mUmsnLF9YzN574Ww3m+Gvj1hj
	Xi+4Lh/gjEAkHeOoDgHBzrFnlJFdmhNQBxXryDuxWNbljMZr24EHPbqb4yMtzpncZJ65HQ7uvpuuW
	66yeLMbJabwqRETueSBEcVcuykPBE+OkZjDwlgiSNwdA83rmEILUe8o9IcQKTD19xlVyiB4tTatXV
	MffDymNSDfKLPp8MpD9OI8/Ml/pBm4D/E6Q0Q7nq2JnnIr4pORYPCbiFGqt1TqD9LQzW/Fwp5hKpT
	KNAdkLH6WDoOwO1rBxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbJgX-00000005dTn-3aaE;
	Sat, 17 Feb 2024 12:20:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbJgU-00000005dT8-3bwV
	for linux-mtd@lists.infradead.org;
	Sat, 17 Feb 2024 12:20:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4125296400cso8607185e9.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Feb 2024 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708172443; x=1708777243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mNrI/k5QCja8EvIn+nI1FFHhVVQ40ZahQzJY3VQjKM=;
        b=YOq2E5D0m3eYm6yvMg6dGfLU0tcE2dGuSSYrNNGQp0cAphyzeZ3xTKeZ3T0S59iobq
         QVf0PEdnobtebK4iY7dTTmO7fB4jmXFUnOIKFkYzRKLO6WX+j7BZbgF2jwkpnjv86MTl
         1JUcvGRTsPU5m2Y+VU1+VuXb13MXex+Ra0YZPCli7Ero01gtP8a8cXB0NmN/Ly/5Akxl
         ksGsnW7fDQ+7h45d5BysOYmHVA5nM4y3gZv3UtdKC8whMuLK+qMkP+VyGg+8vSRQ/GYj
         zuVvtdRiG/6aKZ1bDKTh683/xQ7XxKuayXrVzNK8CIhc+6NIGHbQMNhxry5/d2VWp8Vt
         6qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708172443; x=1708777243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mNrI/k5QCja8EvIn+nI1FFHhVVQ40ZahQzJY3VQjKM=;
        b=mgRzb+twokoh15AGDfWZyHJ1k/lM+8oqv8pQnrvEsCy5SmYysq5gGusvOLtRVM7iGQ
         YEZvrWTabzYVr8tOoRLZgWEfSwBXbVokSHuZ72OCQTIIeaqgxIjbDmlGc3m8r+HBg+sq
         nkVdwG0N53Wy6i6RywgXjLhQF999PjCCObOB/J8D4NDeHfOxg9qFSIjr1CPB3fLDQ5wl
         c/sivLoXj+5kDOwEbadkHOXsOW+QZbr3/bp99Zk2CJ+iJrISWfkJnbAn/euzwJnkKHop
         VNgz98T7x9NqEYnY4DnJGO1BSDFjWDpy6fYSjrn0TqB5xuFSMXCL1a2mgWPkdt/qe3Ma
         xIcg==
X-Forwarded-Encrypted: i=1; AJvYcCWavl7aJQsmKA/f11O5sx67b0AEAUG17FwtYljaibgGuV0K9YKY5fBqIjv+cpEfWIT8Z1rHURBFeen6ZsYWF5ZyjCdv2mewVY61pwwjrg==
X-Gm-Message-State: AOJu0YzEyaHKVThVfkCPa8V5lcj40zmq5oBarxHPfx2BgpCOGHz+xtuD
	vnO+o8T3NNsW9UAUyBA7TF/nhMONYMq/05PtNbEbr+XhlPmSJF1Q
X-Google-Smtp-Source: AGHT+IEaYydFzZj86yy02sJAY3W0hS6m0uQKa8C/F2YRxJXILvcI9FUuldxlvRHNzSnwpPSKvZB0Dg==
X-Received: by 2002:a05:600c:2184:b0:411:c9c0:eddf with SMTP id e4-20020a05600c218400b00411c9c0eddfmr6002720wme.36.1708172442564;
        Sat, 17 Feb 2024 04:20:42 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id n11-20020a7bcbcb000000b00410bc833c2csm1800172wmi.1.2024.02.17.04.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 04:20:42 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: David Bauer <mail@david-bauer.net>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
Date: Sat, 17 Feb 2024 13:20:22 +0100
Message-ID: <20240217122029.3278-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_042046_931286_FF084C1F 
X-CRM114-Status: GOOD (  17.23  )
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

From: David Bauer <mail@david-bauer.net>

Add MTD support for the BoHong bh25q128as SPI NOR chip.
The chip has 16MB of total capacity, divided into a total of 256
sectors, each 64KB sized. The chip also supports 4KB sectors.
Additionally, it supports dual and quad read modes.

Datasheet is public and can be found here [1].

Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.

[1] https://www.e-interlink.com.tw/userUpload/files/BH25Q128AS_v1_0.pdf

Signed-off-by: David Bauer <mail@david-bauer.net>
[ reworked to new flash_info format ]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/bohong.c | 24 ++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 4 files changed, 27 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/bohong.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 5e68468b72fc..c8849cf5124f 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -2,6 +2,7 @@
 
 spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
 spi-nor-objs			+= atmel.o
+spi-nor-objs			+= bohong.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
diff --git a/drivers/mtd/spi-nor/bohong.c b/drivers/mtd/spi-nor/bohong.c
new file mode 100644
index 000000000000..26988c139262
--- /dev/null
+++ b/drivers/mtd/spi-nor/bohong.c
@@ -0,0 +1,24 @@
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
+	{
+		.id = SNOR_ID(0x68, 0x40, 0x18),
+		.name = "bh25q128as",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	},
+};
+
+const struct spi_nor_manufacturer spi_nor_bohong = {
+	.name = "bohong",
+	.parts = bohong_parts,
+	.nparts = ARRAY_SIZE(bohong_parts),
+};
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4129764fad8c..29c28ee683a1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2037,6 +2037,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
+	&spi_nor_bohong,
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d36c0e072954..c293568ae827 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -601,6 +601,7 @@ struct sfdp {
 
 /* Manufacturer drivers. */
 extern const struct spi_nor_manufacturer spi_nor_atmel;
+extern const struct spi_nor_manufacturer spi_nor_bohong;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
