Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F06C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7164020897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L50Sv+BH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7164020897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NP1522MQYs3BoG9QeAQgS9083JniUM13diV/q5dRIgo=; b=L50Sv+BH/QS85tB2EmfFfrYcW
	7szQT0FPYkuXQX5lJ+Gks3MD1rD0EkNa4CnnqgIjNbwRoFOV0fK4m/XBSUeuTt/N7v6Cuzi2FdCVF
	FvnIYGg8b505GuRWMzTlg5GV5Ar1Xk/hDVRO0ozvYe2k5ZxEfYx6Gwr+AObSXTmOsaUx/xnz1f2M8
	5v75oBrsQBalm4PSaEHu//Y5cfClzI2nBb5/eHkv6quIz7vEmfCbC+ot6X3GwtPTp1/0FbTAY1XY/
	mnatyp+ek6z2IITx2CB+Wa9SqWmAF5und2ud2XTBlQiHx9kVV/Vj8gPOB2BEOdOCTlD92wIqw7RwB
	fHDWzwUqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOct-0001Dc-Ew; Tue, 29 Sep 2020 23:01:39 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcm-0001AP-Jd
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:34 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E13CE200005;
 Tue, 29 Sep 2020 23:01:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/20] mtd: nand: ecc-bch: Move BCH code to the generic NAND
 layer
Date: Wed, 30 Sep 2020 01:01:06 +0200
Message-Id: <20200929230124.31491-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190132_870167_85A72BFE 
X-CRM114-Status: GOOD (  16.15  )
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

BCH ECC code might be later re-used by the SPI NAND layer.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/Kconfig                            | 11 +++++++++++
 drivers/mtd/nand/Makefile                           |  1 +
 drivers/mtd/nand/{raw/nand_bch.c => ecc-sw-bch.c}   |  2 +-
 drivers/mtd/nand/raw/Kconfig                        | 10 ----------
 drivers/mtd/nand/raw/Makefile                       |  1 -
 drivers/mtd/nand/raw/nand_base.c                    |  2 +-
 drivers/mtd/nand/raw/nandsim.c                      |  2 +-
 drivers/mtd/nand/raw/omap2.c                        |  2 +-
 include/linux/mtd/{nand_bch.h => nand-ecc-sw-bch.h} |  6 +++---
 9 files changed, 19 insertions(+), 18 deletions(-)
 rename drivers/mtd/nand/{raw/nand_bch.c => ecc-sw-bch.c} (99%)
 rename include/linux/mtd/{nand_bch.h => nand-ecc-sw-bch.h} (92%)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4a9aed4f0104..55c17fb0dee1 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -15,6 +15,17 @@ config MTD_NAND_ECC
        bool
        depends on MTD_NAND_CORE
 
+config MTD_NAND_ECC_SW_BCH
+	bool "Software BCH ECC engine"
+	select BCH
+	select MTD_NAND_ECC
+	default n
+	help
+	  This enables support for software BCH error correction. Binary BCH
+	  codes are more powerful and cpu intensive than traditional Hamming
+	  ECC codes. They are used with NAND devices requiring more than 1 bit
+	  of error correction.
+
 endmenu
 
 endmenu
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 981372953b56..c7179ff23753 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -8,3 +8,4 @@ obj-y	+= raw/
 obj-y	+= spi/
 
 nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
+nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
diff --git a/drivers/mtd/nand/raw/nand_bch.c b/drivers/mtd/nand/ecc-sw-bch.c
similarity index 99%
rename from drivers/mtd/nand/raw/nand_bch.c
rename to drivers/mtd/nand/ecc-sw-bch.c
index d5af8c5fd02f..d0dc84cfdbdc 100644
--- a/drivers/mtd/nand/raw/nand_bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -13,7 +13,7 @@
 #include <linux/bitops.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/bch.h>
 
 /**
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 6c46f25b57e2..b73860aa77c6 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -22,16 +22,6 @@ menuconfig MTD_RAW_NAND
 
 if MTD_RAW_NAND
 
-config MTD_NAND_ECC_SW_BCH
-	bool "Support software BCH ECC"
-	select BCH
-	default n
-	help
-	  This enables support for software BCH error correction. Binary BCH
-	  codes are more powerful and cpu intensive than traditional Hamming
-	  ECC codes. They are used with NAND devices requiring more than 1 bit
-	  of error correction.
-
 comment "Raw/parallel NAND flash controllers"
 
 config MTD_NAND_DENALI
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2930f5b9015d..76904305d091 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -2,7 +2,6 @@
 
 obj-$(CONFIG_MTD_RAW_NAND)		+= nand.o
 obj-$(CONFIG_MTD_NAND_ECC_SW_HAMMING)	+= nand_ecc.o
-nand-$(CONFIG_MTD_NAND_ECC_SW_BCH)	+= nand_bch.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 0b8f4e41bc9b..189d3a301a38 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -36,7 +36,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/io.h>
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index a8048cb8d220..9c940ead66fd 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -23,7 +23,7 @@
 #include <linux/string.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
 #include <linux/list.h>
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 512f60780a50..0ef209e1cd87 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -23,7 +23,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/platform_data/elm.h>
 
 #include <linux/omap-gpmc.h>
diff --git a/include/linux/mtd/nand_bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
similarity index 92%
rename from include/linux/mtd/nand_bch.h
rename to include/linux/mtd/nand-ecc-sw-bch.h
index d5956cc48ba9..1e1ee3af82b1 100644
--- a/include/linux/mtd/nand_bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -5,8 +5,8 @@
  * This file is the header for the NAND BCH ECC implementation.
  */
 
-#ifndef __MTD_NAND_BCH_H__
-#define __MTD_NAND_BCH_H__
+#ifndef __MTD_NAND_ECC_SW_BCH_H__
+#define __MTD_NAND_ECC_SW_BCH_H__
 
 struct mtd_info;
 struct nand_chip;
@@ -63,4 +63,4 @@ static inline void nand_bch_free(struct nand_bch_control *nbc) {}
 
 #endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
 
-#endif /* __MTD_NAND_BCH_H__ */
+#endif /* __MTD_NAND_ECC_SW_BCH_H__ */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
