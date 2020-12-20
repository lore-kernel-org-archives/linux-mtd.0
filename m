Return-Path: <SRS0=mmHb=FY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EE2C4361B
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 23:06:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD15122D05
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Dec 2020 23:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD15122D05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rammhold.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=at8vQMUWhMDBd0XZY5Zn9McqqulWPTCvbqeZakW3NrY=; b=saAqBffDThddhslQe2Su0WZx3l
	Jpbtw3ZonmfzAuvlnU5KgHXJLKnhUlTJFxlPTr7gCMUlCsep9igMsVOslvJXL4+XNOvAzSE+RikPz
	kbPXPtjCCwkqY3MNOiCfwbTeG3E/cB8DwynVmYLHNVpwgMmC1K51n9jW0pSn3W63jkzaHoVHHKRuz
	SWZDIAtUU1IsE7MoVbPTF9b5b01EycR7DmhhUln1LO1lx6sWFM5Ypz38GT+wCviLcDnMU8lni0vEY
	PU2DmkJxCOgloxNvdkdjm1mJOK7kZde9IdZFKLJm6WN8ppAZ9LMWfGdA4z+ZAN1ekep9kdZa4sM5B
	7N7l6Viw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr7lb-0005m4-Ks; Sun, 20 Dec 2020 23:05:31 +0000
Received: from mx.h4ck.space ([159.69.146.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr7lY-0005li-9h
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2020 23:05:29 +0000
From: Andreas Rammhold <andreas@rammhold.de>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] spi-nor: Add support for xt25f128b
Date: Sun, 20 Dec 2020 23:43:15 +0100
Message-Id: <20201220224314.2659-1-andreas@rammhold.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_180528_441870_E0B7C00D 
X-CRM114-Status: GOOD (  15.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: microcai <microcaicai@gmail.com>, Daniel Golle <daniel@makrotopia.org>,
 Andreas Rammhold <andreas@rammhold.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds support for the xt25f128b as found on the rockpi4b SBC.

Signed-off-by: Andreas Rammhold <andreas@rammhold.de>
---

This continues the efforts done in [1] & [2] that went stale. I've
tested this patch on my RockPi4b which only has the xt25f128b (and not
the xt25f32b as also propsed in [2]). I have tried to obtain a copy of
the datasheets but was unable to find them. Not sure whre you would get
them.

While [1] was already for the new spi-nor layout it was missing the bits
in the core.{c,h} files.


[1]: https://patchwork.ozlabs.org/project/linux-mtd/patch/CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com/
[2]: https://patchwork.ozlabs.org/project/linux-mtd/patch/20200206171941.GA2398@makrotopia.org/

 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/core.c   |  1 +
 drivers/mtd/spi-nor/core.h   |  1 +
 drivers/mtd/spi-nor/xtx.c    | 16 ++++++++++++++++
 4 files changed, 19 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/xtx.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 653923896205..3f7a52d7fa0b 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -17,6 +17,7 @@ spi-nor-objs			+= sst.o
 spi-nor-objs			+= winbond.o
 spi-nor-objs			+= xilinx.o
 spi-nor-objs			+= xmc.o
+spi-nor-objs			+= xtx.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 
 obj-$(CONFIG_MTD_SPI_NOR)	+= controllers/
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f0ae7a01703a..ca1988554945 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2024,6 +2024,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_winbond,
 	&spi_nor_xilinx,
 	&spi_nor_xmc,
+	&spi_nor_xtx,
 };
 
 static const struct flash_info *
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 6f2f6b27173f..cea8c0c25c9f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -398,6 +398,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
 extern const struct spi_nor_manufacturer spi_nor_winbond;
 extern const struct spi_nor_manufacturer spi_nor_xilinx;
 extern const struct spi_nor_manufacturer spi_nor_xmc;
+extern const struct spi_nor_manufacturer spi_nor_xtx;
 
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
new file mode 100644
index 000000000000..a10102d8b3e2
--- /dev/null
+++ b/drivers/mtd/spi-nor/xtx.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info xtx_parts[] = {
+ /* XTX (Shenzhen Xin Tian Xia Tech) */
+ { "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SECT_4K) },
+};
+
+const struct spi_nor_manufacturer spi_nor_xtx = {
+ .name = "xtx",
+ .parts = xtx_parts,
+ .nparts = ARRAY_SIZE(xtx_parts),
+};
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
