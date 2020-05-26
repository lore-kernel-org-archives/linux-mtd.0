Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D106CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94582205CB
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DQR7a1Cm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NC0LhcBA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94582205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBberbQeYjw3UEcIPAjt7XBDtrsIXNBasbrSFsTKuOg=; b=DQR7a1CmP/BvJ4
	eTy+r8LrNNcJ4lrCHS0QHPvtQr8hIjPmcwikJcZejftLSB3JDxQpe8tUIVJUp5bb867ZVyb3ScRlE
	F0CK9TC9C2ZmYNLRUKo29/Wa//rz0LO1iO99mgZqOC/Zj8XUKrqNW6jemLONB4v187dRTjvpq2jIX
	mWUg7XyIshWUVWWQvqLCSNgZg7+suPJCXZ1fXYx5swprv5Emf9EWBTHxnqkjQ/XL5vaxV1QqUgMrH
	NNL9Xj2d+TcXThrBV/hLo3eKPCcUk2TphvlG/tkiQ6D5uNAKGk37zPFK+AVitrV93wDie/oNPeuar
	IiMiEc9pD/MzBc1qWi9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdW3E-0006vt-Um; Tue, 26 May 2020 09:39:12 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdW1u-0005Yj-7A
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 09:37:52 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04Q9bivF097440;
 Tue, 26 May 2020 04:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590485864;
 bh=tO6NCt0Ul17AwB1fqX5PvzK5VWUW+MRp8Lj/CkrzcBo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NC0LhcBA2UgYYbohKRvSjt1BBFlx5DzA/r3LnAo8PKJa3w3+LbJuM961VJD3qtNdr
 GjShzPJvq1T+J+5he9l+FhWocEbJzGwLFxrbBhy2FgsfzAzVFtu33gozBlCCyuUfL4
 8JsbcM1Ws4nlojfW+3mRKqL07rLfjHINN89P3eXg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04Q9biZb081598
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 May 2020 04:37:44 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 04:37:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 04:37:44 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04Q9b9hP066907;
 Tue, 26 May 2020 04:37:39 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v2 6/6] spi: Move cadence-quadspi driver to drivers/spi/
Date: Tue, 26 May 2020 15:06:04 +0530
Message-ID: <20200526093604.11846-7-vigneshr@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526093604.11846-1-vigneshr@ti.com>
References: <20200526093604.11846-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_023750_505902_5DE46E61 
X-CRM114-Status: GOOD (  14.55  )
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
Cc: marex@denx.de, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Now that cadence-quadspi has been converted to use spi-mem framework,
move it under drivers/spi/

Update license header to match SPI subsystem style

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/controllers/Kconfig            | 11 -----------
 drivers/mtd/spi-nor/controllers/Makefile           |  1 -
 drivers/spi/Kconfig                                | 11 +++++++++++
 drivers/spi/Makefile                               |  1 +
 .../spi-cadence-quadspi.c}                         | 14 +++++++-------
 5 files changed, 19 insertions(+), 19 deletions(-)
 rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (99%)

diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
index 10b86660b821..95fcd4b435be 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -9,17 +9,6 @@ config SPI_ASPEED_SMC
 	  and support for the SPI flash memory controller (SPI) for
 	  the host firmware. The implementation only supports SPI NOR.
 
-config SPI_CADENCE_QUADSPI
-	tristate "Cadence Quad SPI controller"
-	depends on OF && (ARM || ARM64 || COMPILE_TEST)
-	help
-	  Enable support for the Cadence Quad SPI Flash controller.
-
-	  Cadence QSPI is a specialized controller for connecting an SPI
-	  Flash over 1/2/4-bit wide bus. Enable this option if you have a
-	  device with a Cadence QSPI controller and want to access the
-	  Flash as an MTD device.
-
 config SPI_HISI_SFC
 	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
 	depends on ARCH_HISI || COMPILE_TEST
diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-nor/controllers/Makefile
index 46e6fbe586e3..e7abba491d98 100644
--- a/drivers/mtd/spi-nor/controllers/Makefile
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
-obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
 obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 099d6a75a371..2de8098b26c1 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -200,6 +200,17 @@ config SPI_CADENCE
 	  This selects the Cadence SPI controller master driver
 	  used by Xilinx Zynq and ZynqMP.
 
+config SPI_CADENCE_QUADSPI
+	tristate "Cadence Quad SPI controller"
+	depends on OF && (ARM || ARM64 || COMPILE_TEST)
+	help
+	  Enable support for the Cadence Quad SPI Flash controller.
+
+	  Cadence QSPI is a specialized controller for connecting an SPI
+	  Flash over 1/2/4-bit wide bus. Enable this option if you have a
+	  device with a Cadence QSPI controller and want to access the
+	  Flash as an MTD device.
+
 config SPI_CLPS711X
 	tristate "CLPS711X host SPI controller"
 	depends on ARCH_CLPS711X || COMPILE_TEST
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 889368f4ad53..f03834d1d312 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_SPI_BCM_QSPI)		+= spi-iproc-qspi.o spi-brcmstb-qspi.o spi-bcm-qspi.
 obj-$(CONFIG_SPI_BITBANG)		+= spi-bitbang.o
 obj-$(CONFIG_SPI_BUTTERFLY)		+= spi-butterfly.o
 obj-$(CONFIG_SPI_CADENCE)		+= spi-cadence.o
+obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= spi-cadence-quadspi.o
 obj-$(CONFIG_SPI_CLPS711X)		+= spi-clps711x.o
 obj-$(CONFIG_SPI_COLDFIRE_QSPI)		+= spi-coldfire-qspi.o
 obj-$(CONFIG_SPI_DAVINCI)		+= spi-davinci.o
diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
similarity index 99%
rename from drivers/mtd/spi-nor/controllers/cadence-quadspi.c
rename to drivers/spi/spi-cadence-quadspi.c
index c1df4b221889..8e8937ec5b1b 100644
--- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for Cadence QSPI Controller
- *
- * Copyright Altera Corporation (C) 2012-2014. All rights reserved.
- * Copyright Intel Corporation (C) 2019-2020. All rights reserved.
- * Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
- */
+//
+// Driver for Cadence QSPI Controller
+//
+// Copyright Altera Corporation (C) 2012-2014. All rights reserved.
+// Copyright Intel Corporation (C) 2019-2020. All rights reserved.
+// Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
+
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
