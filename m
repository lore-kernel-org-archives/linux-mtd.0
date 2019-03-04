Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4CCC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFDFC20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ELxz4KKs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T0DBLjTc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFDFC20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+H7P7dGKg0DVYrg1gVtc2nBTpVxgVhnDsQ3LypK0xc=; b=ELxz4KKsfcgz4C
	wLwVBL9cnhUl5lvlz/NjLdmBlLOzhxnHbmABfwoJY9LaR8joFkap1vSRxA0YOM5n8uTfoFbEbCDsC
	Z95MqlnUbwW9gkFvqXSNfCfhwwJYTalFvPNk93LyswA7tZj9Bct2Npmltk68Wa1yaR20/VYWSkddW
	mTxpiZ7WFs7/+gR11Tx9G2UJSrwP2bycUD56xjbQL+kduyzIRwJWfA0BxlJt5EbBIFKnuDIup/lT7
	PR+zGAcEn2iZCow3NYJmdKYa+uz1SLzALw/eDvLCgxjNNVW42rccdX3IdDsobxfBg+c+deO4r8j13
	XIVp8qYUb3V8v5Ekf/sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wmn-00039K-3j; Mon, 04 Mar 2019 23:14:17 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjc-0007DE-82; Mon, 04 Mar 2019 23:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ozCC6rMdXvAAS8+zt691iz0G5MDdJo4LHNxuV1fxOjQ=; b=T0DBLjTck0KzlZunRBYiyvfBiQ
 48+dhMMCcgNFc3aff1yfObKTxQnsMMnKOK6THgpbwWyPIeQz3XIjP3yb5tZE/Wvf7yYV7T6TQOSo1
 p4yQZpnaQvMQATBHxSgKotzahbDy0iWjAoSH8EbvK6Asi5oQ/CEzUcG/RcpdFDaPcIke2eayQOzVl
 8I4Dma8H9IPEm0FM494+5jvxC9iaT0Xvm0mnZccZ5192v2sxYdYT2kFQiG80cWEYyQdMKhs84IEg+
 piWMTceeljAT4kR9wRaukgQ8l+LOW08XPa6bYdepnQmjOYWKpqeVphSd1cIF2dCjAWKDwrr6MIRPj
 /rA/ETrQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w6j-00018t-F3; Mon, 04 Mar 2019 22:30:51 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 084D5240006;
 Mon,  4 Mar 2019 22:30:22 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 18/36] mtd: nand: ecc: Move Hamming code into the ecc/
 directory
Date: Mon,  4 Mar 2019 23:28:23 +0100
Message-Id: <20190304222841.13899-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173050_316379_689C4707 
X-CRM114-Status: GOOD (  14.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Move software Hamming ECC code in the ecc/ sub-directory for later
re-use by the SPI NAND layer.

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
 drivers/mtd/nand/ecc/Kconfig                          | 11 +++++++++++
 drivers/mtd/nand/ecc/Makefile                         |  1 +
 drivers/mtd/nand/{raw/nand_ecc.c => ecc/sw-hamming.c} |  2 +-
 drivers/mtd/nand/raw/Kconfig                          | 11 -----------
 drivers/mtd/nand/raw/Makefile                         |  1 -
 drivers/mtd/nand/raw/cs553x_nand.c                    |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c                  |  2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                   |  2 +-
 drivers/mtd/nand/raw/fsl_upm.c                        |  2 +-
 drivers/mtd/nand/raw/fsmc_nand.c                      |  2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                    |  2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                    |  2 +-
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
 34 files changed, 44 insertions(+), 44 deletions(-)
 rename drivers/mtd/nand/{raw/nand_ecc.c => ecc/sw-hamming.c} (99%)
 rename include/linux/mtd/{nand_ecc.h => nand-ecc-sw-hamming.h} (90%)

diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 58e30cad386c..ffe34a5a3174 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -19,7 +19,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 072966dcad78..83472294191b 100644
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
index 58c5ef3cf1d7..c841b90695b9 100644
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
index a7c3955ae8f6..4f3d3e819a2a 100644
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
index 594901f3b8e5..1c6f11216c0c 100644
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
index 885e8f12e4b9..b2afb4099ab4 100644
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
index 9035f868fb34..8c173a6f1bdc 100644
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
index ee3630cb236a..0dd72072aa3d 100644
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
index 5d48e5b6e738..19f2e12130ec 100644
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
index 529c6faf862f..05aac6499d82 100644
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
index d76b28b65e65..e0218ae0040e 100644
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
 
diff --git a/drivers/mtd/nand/ecc/Kconfig b/drivers/mtd/nand/ecc/Kconfig
index 75a37f48e126..7be48a7efda0 100644
--- a/drivers/mtd/nand/ecc/Kconfig
+++ b/drivers/mtd/nand/ecc/Kconfig
@@ -3,6 +3,17 @@ menu "ECC engine support"
 config MTD_NAND_ECC
 	tristate
 
+config MTD_NAND_ECC_SW_HAMMING
+	tristate
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
diff --git a/drivers/mtd/nand/ecc/Makefile b/drivers/mtd/nand/ecc/Makefile
index 36b6ee57ad61..353277fecb38 100644
--- a/drivers/mtd/nand/ecc/Makefile
+++ b/drivers/mtd/nand/ecc/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MTD_NAND_ECC)		+= engine.o
+obj-$(CONFIG_MTD_NAND_ECC_SW_HAMMING)	+= sw-hamming.o
 obj-$(CONFIG_MTD_NAND_ECC_SW_BCH)	+= sw-bch.o
diff --git a/drivers/mtd/nand/raw/nand_ecc.c b/drivers/mtd/nand/ecc/sw-hamming.c
similarity index 99%
rename from drivers/mtd/nand/raw/nand_ecc.c
rename to drivers/mtd/nand/ecc/sw-hamming.c
index 4f4347533058..b6931cd9f401 100644
--- a/drivers/mtd/nand/raw/nand_ecc.c
+++ b/drivers/mtd/nand/ecc/sw-hamming.c
@@ -33,7 +33,7 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <asm/byteorder.h>
 
 /*
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 44dcac13fc0b..770c73c1bb7d 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -1,14 +1,3 @@
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
index 18ae42077b05..a5ce9cec8dd3 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MTD_RAW_NAND)		+= nand.o
-obj-$(CONFIG_MTD_NAND_ECC_SW_HAMMING)	+= nand_ecc.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index c6f578aff5d9..98cc55df27b1 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -23,7 +23,7 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/msr.h>
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index 293a5b71833a..a43f9373ce22 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -35,7 +35,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/io.h>
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 04a3dcd675bf..7f7e1ecf612c 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -28,7 +28,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/fsl_ifc.h>
 #include <linux/iopoll.h>
 
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 5ccc28ec0985..80dc210f05cf 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
 #include <linux/of_address.h>
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 325b4414dccc..e1bd8b7a0bf5 100644
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
index 086964f8d424..0ae7ab7dbc68 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -41,7 +41,7 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 
 #define DRV_NAME "lpc32xx_mlc"
 
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index a2c5fdc875bd..eabd1fd9d2de 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -32,7 +32,7 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d6dd0ef42585..4d7877408b82 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -39,7 +39,7 @@
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index 9857e0e5acd4..0d79bbe89a4f 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -23,7 +23,7 @@
  */
 #include <linux/module.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/ndfc.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 643cd22af009..49c503a1d8ec 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -26,7 +26,7 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index adc7a196e383..7f40cc85782d 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -43,7 +43,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index c82f26c8b58c..c352fd040ead 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -16,7 +16,7 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sharpsl.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index f3b59e649b7d..7422fea7777c 100644
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
index ddf0420c0997..d264b3588ac4 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -17,7 +17,7 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 #include <linux/platform_data/txx9/ndfmc.h>
diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index e0955a98a0f4..e48114739668 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -16,7 +16,7 @@
 #include <linux/sysfs.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include "nand/raw/sm_common.h"
 #include "sm_ftl.h"
 
diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index 73b06304c975..49824d2ae11a 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -7,7 +7,7 @@
 #include <linux/string.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 
 #include "mtd_test.h"
 
diff --git a/include/linux/mtd/nand_ecc.h b/include/linux/mtd/nand-ecc-sw-hamming.h
similarity index 90%
rename from include/linux/mtd/nand_ecc.h
rename to include/linux/mtd/nand-ecc-sw-hamming.h
index 0b3bb156c344..c0f015b1a077 100644
--- a/include/linux/mtd/nand_ecc.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -10,8 +10,8 @@
  * This file is the header for the ECC algorithm.
  */
 
-#ifndef __MTD_NAND_ECC_H__
-#define __MTD_NAND_ECC_H__
+#ifndef __MTD_NAND_ECC_SW_HAMMING_H__
+#define __MTD_NAND_ECC_SW_HAMMING_H__
 
 struct nand_chip;
 
@@ -39,4 +39,4 @@ int __nand_correct_data(u_char *dat, u_char *read_ecc, u_char *calc_ecc,
 int nand_correct_data(struct nand_chip *chip, u_char *dat, u_char *read_ecc,
 		      u_char *calc_ecc);
 
-#endif /* __MTD_NAND_ECC_H__ */
+#endif /* __MTD_NAND_ECC_SW_HAMMING_H__ */
diff --git a/include/linux/mtd/sharpsl.h b/include/linux/mtd/sharpsl.h
index e1845fc4afbd..ccd952f27e00 100644
--- a/include/linux/mtd/sharpsl.h
+++ b/include/linux/mtd/sharpsl.h
@@ -9,7 +9,7 @@
  */
 
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 struct sharpsl_nand_platform_data {
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
