Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34536C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B48E420897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xQLL3hrf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B48E420897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z8IVtS+3BP036EO2UFxIbaIEjssXTaxu7mvDhaX3jzo=; b=xQLL3hrfBWbSIIwdVWHpDg0bN
	FpSLzuSD+dRpdA7AHByOIsKGLOUcpLMEpN+RujbPlYTJmlTjqe+mpWclzsR3en/5kpekmsPA8oIKz
	GH2wuz7ZonDseRPByPeObGuJZ74Xd8fdVQvvNraPFRiwMwL+CKI/sdH0Mze2enAlB/6iVDC8L30WI
	ZHH6la91CVBbWrzwe4cbAT/2WzgbHwFlOrE7fSGJHXoz0tlXqsgprfUIEkkVWnkZYNJ4qZi0tLVGk
	j/2nqQDlynpFfubX8m9qaRz57mlO5Ow+0E0O3tL+c5wRznmA1kAjvMtNxOlJFFVzv0ThB6CEvAVs4
	gqKxf3PUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdf-0001Uc-7z; Tue, 29 Sep 2020 23:02:27 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcv-0001EG-UU
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:45 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 14FF1200012;
 Tue, 29 Sep 2020 23:01:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/20] mtd: nand: ecc-hamming: Move Hamming code to the
 generic NAND layer
Date: Wed, 30 Sep 2020 01:01:15 +0200
Message-Id: <20200929230124.31491-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190142_188639_449763C0 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hamming ECC code might be later re-used by the SPI NAND layer.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/mach-s3c24xx/common-smdk.c                   |  2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c                   |  2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c                |  2 +-
 arch/arm/mach-s3c24xx/mach-bast.c                     |  2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c                    |  2 +-
 arch/arm/mach-s3c24xx/mach-jive.c                     |  2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c                 |  2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c                   |  2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c                   |  2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c                   |  2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c                    |  2 +-
 drivers/mtd/nand/Kconfig                              | 11 +++++++++++
 drivers/mtd/nand/Makefile                             |  1 +
 drivers/mtd/nand/{raw/nand_ecc.c => ecc-sw-hamming.c} |  2 +-
 drivers/mtd/nand/raw/Kconfig                          | 11 -----------
 drivers/mtd/nand/raw/Makefile                         |  1 -
 drivers/mtd/nand/raw/cs553x_nand.c                    |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c                  |  2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                   |  2 +-
 drivers/mtd/nand/raw/fsl_upm.c                        |  2 +-
 drivers/mtd/nand/raw/fsmc_nand.c                      |  2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                    |  2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                    |  2 +-
 drivers/mtd/nand/raw/mxic_nand.c                      |  2 +-
 drivers/mtd/nand/raw/nand_base.c                      |  2 +-
 drivers/mtd/nand/raw/ndfc.c                           |  2 +-
 drivers/mtd/nand/raw/pasemi_nand.c                    |  2 +-
 drivers/mtd/nand/raw/s3c2410.c                        |  2 +-
 drivers/mtd/nand/raw/sharpsl.c                        |  2 +-
 drivers/mtd/nand/raw/tmio_nand.c                      |  2 +-
 drivers/mtd/nand/raw/txx9ndfmc.c                      |  2 +-
 drivers/mtd/sm_ftl.c                                  |  2 +-
 drivers/mtd/tests/mtd_nandecctest.c                   |  2 +-
 .../linux/mtd/{nand_ecc.h => nand-ecc-sw-hamming.h}   |  6 +++---
 include/linux/mtd/sharpsl.h                           |  2 +-
 35 files changed, 45 insertions(+), 45 deletions(-)
 rename drivers/mtd/nand/{raw/nand_ecc.c => ecc-sw-hamming.c} (99%)
 rename include/linux/mtd/{nand_ecc.h => nand-ecc-sw-hamming.h} (88%)

diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 121646ad1bb1..72e9b87acbc6 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -20,7 +20,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 28326241e360..190f22574cff 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -36,7 +36,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <net/ax88796.h>
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index 04dedebdb57c..87257c54140d 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -37,7 +37,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 6465eab0ab3a..fa947bf881fe 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -24,7 +24,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index db1b64f6e0a5..ef23402fdef5 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -36,7 +36,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index 8233dcff19e7..49c3ea18b88f 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -40,7 +40,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/gpio-cfg.h>
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 057dcbaf1b22..0d18fea49004 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -46,7 +46,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/gpio-cfg.h>
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index 157448827f61..592fc67b9ffe 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -33,7 +33,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index f3131d94e90b..d75d03cf6623 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -21,7 +21,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index 017010d67e01..9daf78d963ee 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -22,7 +22,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index c5fa215a527e..df30ebc02b38 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -16,7 +16,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/memblock.h>
 
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 55c17fb0dee1..306c33ca3448 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -15,6 +15,17 @@ config MTD_NAND_ECC
        bool
        depends on MTD_NAND_CORE
 
+config MTD_NAND_ECC_SW_HAMMING
+	bool
+
+config MTD_NAND_ECC_SW_HAMMING_SMC
+	bool "NAND ECC Smart Media byte order"
+	depends on MTD_NAND_ECC_SW_HAMMING
+	default n
+	help
+	  Software ECC according to the Smart Media Specification.
+	  The original Linux implementation had byte 0 and 1 swapped.
+
 config MTD_NAND_ECC_SW_BCH
 	bool "Software BCH ECC engine"
 	select BCH
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index c7179ff23753..1c0b46960eb1 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -8,4 +8,5 @@ obj-y	+= raw/
 obj-y	+= spi/
 
 nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
+nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
 nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
diff --git a/drivers/mtd/nand/raw/nand_ecc.c b/drivers/mtd/nand/ecc-sw-hamming.c
similarity index 99%
rename from drivers/mtd/nand/raw/nand_ecc.c
rename to drivers/mtd/nand/ecc-sw-hamming.c
index b6a46b1b7781..76966f5ff13f 100644
--- a/drivers/mtd/nand/raw/nand_ecc.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -19,7 +19,7 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <asm/byteorder.h>
 
 /*
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b73860aa77c6..6149096e32cb 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -1,15 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config MTD_NAND_ECC_SW_HAMMING
-	tristate
-
-config MTD_NAND_ECC_SW_HAMMING_SMC
-	bool "NAND ECC Smart Media byte order"
-	depends on MTD_NAND_ECC_SW_HAMMING
-	default n
-	help
-	  Software ECC according to the Smart Media Specification.
-	  The original Linux implementation had byte 0 and 1 swapped.
-
 menuconfig MTD_RAW_NAND
 	tristate "Raw/Parallel NAND Device Support"
 	select MTD_NAND_CORE
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 76904305d091..dc38c087c693 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MTD_RAW_NAND)		+= nand.o
-obj-$(CONFIG_MTD_NAND_ECC_SW_HAMMING)	+= nand_ecc.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index b7f3f6347761..7c492096426b 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -19,7 +19,7 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/iopoll.h>
 
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index b2af7f81fdf8..eb255cf83e32 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -22,7 +22,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/io.h>
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 0e7a9b64301e..e3e3b2abb6cd 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -15,7 +15,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/fsl_ifc.h>
 #include <linux/iopoll.h>
 
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index d5813b9abc8e..3824361928a1 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 1bc2462efeab..cb41d527bee0 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -26,7 +26,7 @@
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/mtd/partitions.h>
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 4940bb2e3c07..b9ccf6f2f9c6 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -31,7 +31,7 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 
 #define DRV_NAME "lpc32xx_mlc"
 
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 6db9d2ed6881..0f395cc7f101 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -23,7 +23,7 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index d66b5b0971fa..da1070993994 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -12,8 +12,8 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
 #include <linux/platform_device.h>
 
 #include "internals.h"
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f68802bf555a..a8aaedd940cd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -35,7 +35,7 @@
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 0fb4ba93c41e..8cda6633280b 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -18,7 +18,7 @@
  */
 #include <linux/module.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/ndfc.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 2b8f155cc0c5..108e3817737a 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -14,7 +14,7 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index fbd0fa48e063..f7eb3b5fa792 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -30,7 +30,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 1327bfb3d5d3..553ffb61b7e1 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -12,7 +12,7 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sharpsl.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index 235a2f7b1bad..cd3733c3ae04 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -35,7 +35,7 @@
 #include <linux/ioport.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
 
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index ef81dce6b5c4..ade0bfd2648d 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -14,7 +14,7 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 #include <linux/platform_data/txx9/ndfmc.h>
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index b9f272408c4d..db430ae6a1a2 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -13,7 +13,7 @@
 #include <linux/sysfs.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include "nand/raw/sm_common.h"
 #include "sm_ftl.h"
 
diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 13bca9ea0cae..e92e3fb287b6 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -8,7 +8,7 @@
 #include <linux/string.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 
 #include "mtd_test.h"
 
diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand-ecc-sw-hamming.h
similarity index 88%
rename from include/linux/mtd/nand_ecc.h
rename to include/linux/mtd/nand-ecc-sw-hamming.h
index d423916b94f0..30a0cfa50eed 100644
--- a/include/linux/mtd/nand_ecc.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -7,8 +7,8 @@
  * This file is the header for the ECC algorithm.
  */
 
-#ifndef __MTD_NAND_ECC_H__
-#define __MTD_NAND_ECC_H__
+#ifndef __MTD_NAND_ECC_SW_HAMMING_H__
+#define __MTD_NAND_ECC_SW_HAMMING_H__
 
 struct nand_chip;
 
@@ -36,4 +36,4 @@ int __nand_correct_data(u_char *dat, u_char *read_ecc, u_char *calc_ecc,
 int nand_correct_data(struct nand_chip *chip, u_char *dat, u_char *read_ecc,
 		      u_char *calc_ecc);
 
-#endif /* __MTD_NAND_ECC_H__ */
+#endif /* __MTD_NAND_ECC_SW_HAMMING_H__ */
diff --git a/include/linux/mtd/sharpsl.h b/include/linux/mtd/sharpsl.h
index d2c3cf29e0d1..3762a90077d6 100644
--- a/include/linux/mtd/sharpsl.h
+++ b/include/linux/mtd/sharpsl.h
@@ -9,7 +9,7 @@
 #define _MTD_SHARPSL_H
 
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 struct sharpsl_nand_platform_data {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
