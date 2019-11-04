Return-Path: <SRS0=uNk0=Y4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641F6CA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2019 16:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363B820869
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2019 16:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U9PmtBLf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363B820869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HoeN/aT1DjoLg2Nlq/YeyTUwQSKyNESpC30em5rhXg=; b=U9PmtBLfoyeoJr
	W25z+wNkK99P0KgP7Ir/n+qmyW/MjiUQgR+LElCk/5/ZwUEtyYwBLB9FzMvtcCErivNpf077/02HK
	6OZuWyiamOuZbIhCfGzAie+H+dtf9wgZWixlQkOcaPfmAhar9wohiN3fed+9hp2vQlBqA4XqpkChA
	UgHabMvgcpvP9r8+HhUXQPlHW3bJwjDFgAa/Utiet5yTNCZO2IL7LGlQFp+DwzPOOjv7nXgWoyw3N
	82BmJU9Ylanc5CvbTyfq19WrxvZyuUWG/XOqDlGMqK2Rzz6m9atUGBiVqE1AXMYUw3JeVkiwVX59a
	Dqr4ydbMPBGs9v/z+L2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRfdN-0006xd-D8; Mon, 04 Nov 2019 16:55:17 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRfd5-0006h7-7p
 for linux-mtd@lists.infradead.org; Mon, 04 Nov 2019 16:55:01 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 333B7E8E6EA2833A00DB;
 Tue,  5 Nov 2019 00:54:52 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 00:54:42 +0800
From: John Garry <john.garry@huawei.com>
To: <broonie@kernel.org>, <marek.vasut@gmail.com>,
 <tudor.ambarus@microchip.com>
Subject: [PATCH 1/3] mtd: spi-nor: hisi-sfc: Try to provide some clarity on
 which SFC we are
Date: Tue, 5 Nov 2019 00:51:35 +0800
Message-ID: <1572886297-45400-2-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1572886297-45400-1-git-send-email-john.garry@huawei.com>
References: <1572886297-45400-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_085459_469500_3B396DDB 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: linux-kernel@vger.kernel.org, John Garry <john.garry@huawei.com>,
 linuxarm@huawei.com, fengsheng5@huawei.com, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The driver is for the HiSilicon FMC (Flash Memory Controller), which
supports SPI NOR in addition other memory technologies, like SPI NAND.

Indeed, the naming in the driver is a little inappropriate, especially
considering that there is already another HiSilicon SPI NOR flash
controller (which I believe the FMC is derived from).

Since we now want to provide software support for this other HiSilicon
controller, update code comments to at least try to make it clear that
this driver is for the FMC.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/mtd/spi-nor/Kconfig    | 4 ++--
 drivers/mtd/spi-nor/hisi-sfc.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index f237fcdf7f86..c1eda67d1ad2 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -46,11 +46,11 @@ config SPI_CADENCE_QUADSPI
 	  Flash as an MTD device.
 
 config SPI_HISI_SFC
-	tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
+	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
 	depends on ARCH_HISI || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This enables support for hisilicon SPI-NOR flash controller.
+	  This enables support for HiSilicon FMC SPI-NOR flash controller.
 
 config SPI_MTK_QUADSPI
 	tristate "MediaTek Quad SPI controller"
diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index 6dac9dd8bf42..edc0c6164061 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * HiSilicon SPI Nor Flash Controller Driver
+ * HiSilicon FMC SPI-NOR flash controller driver
  *
  * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
  */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
