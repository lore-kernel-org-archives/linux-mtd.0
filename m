Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF534FF8867
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FHUnIzhz5Q/k0DwQ9IIJBmPr8NnzNRJ/vhRxT2xE7LA=; b=bdfclVY5MpLPLk
	KIAzn2IFrPwp2MJOgA4bGmbpEJApvHFlgGU6GujHoE4m2NKoTeDGq6V3phdzac5+HTln+uSCARWEs
	3Bm6InsLPAa3+imaPrh7o9vzTc0cVTILusb73J+el40VRM01vORVlaq2NkxTDw1gbs7C4rMofrG88
	pThuTKfxzIx9N9ODt6dkpPeBxzHkJlXx+ijuh5YwHU5bIiM+nSU/JVOVK+u9r0FDWypudsvXf0nWR
	jtvQzDUc16PjPZJ12m9aoAwGBBEgiMgLu16dj3H330sYjdAKdnC2u/PGbdM89bEPlbs4XYMyuv835
	rlcao3HuIuKYFCIqIRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5RW-00000003ihk-4AIO;
	Wed, 29 Apr 2026 13:59:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5RV-00000003ihc-2ZuV
	for linux-mtd@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=j4jvB3Kacym5aA/GzaVEdwvfeHsV5g63n5kDwQx9gIE=; b=Lrndj1lDiUyQie3XaHkDyQ1Nt4
	+Ozo7PJC3GoLis4Ns71/D8nJBcdtQqz9F7gEHbpEDzlvdnkuSZlL5Nm6oz9HKjOJclZhgSI3ZoYak
	rpCI+24LtFLe695D1jCV6SXeYDHDJKM93eFrzW0/z/3tA6I7ZhVpxAVO0gB/XNq5YzMSWcHHCa9fR
	Oe6Jzx+6siG8C4fRLdyFNXJm4NxGNiHxlN8rmYqjs87mTgiIIFAyN3jqvYK7mn5fEpz/dLnZeIBl5
	C2JG1TuAFTgXDHiUGJRgXe/ho3qOHTLtRHe7Xs9XmcWmPGN6FEu6giT7+JFpDwqzfFfbs1azUMBN/
	VW9+2Taw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5RS-00000005SEI-2Mcr
	for linux-mtd@lists.infradead.org;
	Wed, 29 Apr 2026 13:59:08 +0000
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1wI5RK-0008Q6-UH; Wed, 29 Apr 2026 15:58:58 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Date: Wed, 29 Apr 2026 15:58:45 +0200
Subject: [PATCH] mtd: spi-nor: cypress: Add support for CY15V104QSN
MIME-Version: 1.0
Message-Id: <20260429-v6-18-topic-infineon_fram-v1-1-504d241942a4@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAJQO8mkC/x3MQQqEMAxA0atI1hOopZQ6VxlkqJpoFqbSigji3
 S0u3+L/CwploQLf5oJMhxRJWtF+GhiXqDOhTNVgjfXG2Q4Pj23APW0yoiiLUtI/57hicMYxD5G
 C9VD7LRPL+b5//X0/+TWdWWsAAAA=
X-Change-ID: 20260429-v6-18-topic-infineon_fram-8404ffbae826
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 kernel@pengutronix.de, Fabian Pflug <f.pflug@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_145906_743845_9D69BD80 
X-CRM114-Status: GOOD (  13.90  )
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

Infineon CY15V104QSN is an FRAM Chip with Quad-SPI interface, a size of
4Mb and a nominal Voltage of 1.8V
It should be the same as CY15B104QSN, just with a different Voltage
range. (3.0V)

Cypress is an Infineon company. The FRAM was originally developed by
Cypress.

Link: https://www.infineon.com/assets/row/public/documents/10/49/infineon-cy15b104qsn-cy15v104qsn-4mb-excelon-ultra-ferroelectric-ram-f-ram-serial-quad-spi-512k-8-108-mhz-industrial-datasheet-en.pdf
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 drivers/mtd/spi-nor/Makefile  |  1 +
 drivers/mtd/spi-nor/core.c    |  1 +
 drivers/mtd/spi-nor/core.h    |  1 +
 drivers/mtd/spi-nor/cypress.c | 24 ++++++++++++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 5dd9c35f6b6f8..73267677c22ad 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -2,6 +2,7 @@
 
 spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
 spi-nor-objs			+= atmel.o
+spi-nor-objs			+= cypress.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20ea80450f222..b52219216f872 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1941,6 +1941,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
+	&spi_nor_cypress,
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ceff412f7d65a..95b09ca981c8b 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -585,6 +585,7 @@ struct sfdp {
 
 /* Manufacturer drivers. */
 extern const struct spi_nor_manufacturer spi_nor_atmel;
+extern const struct spi_nor_manufacturer spi_nor_cypress;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
diff --git a/drivers/mtd/spi-nor/cypress.c b/drivers/mtd/spi-nor/cypress.c
new file mode 100644
index 0000000000000..20079d3338e73
--- /dev/null
+++ b/drivers/mtd/spi-nor/cypress.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Pengutronix, Fabian Pflug <kernel@pengutronix.de>
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info cypress_nor_parts[] = {
+	{
+		.id = SNOR_ID(0x50, 0x51, 0x80, 0x06),
+		.name = "cy15x104qs",
+		.size = SZ_512K,
+		.sector_size = SZ_512K,
+		.flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_NO_ERASE,
+	}
+};
+
+const struct spi_nor_manufacturer spi_nor_cypress = {
+	.name = "cypress",
+	.parts = cypress_nor_parts,
+	.nparts = ARRAY_SIZE(cypress_nor_parts),
+};

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260429-v6-18-topic-infineon_fram-8404ffbae826

Best regards,
-- 
Fabian Pflug <f.pflug@pengutronix.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
