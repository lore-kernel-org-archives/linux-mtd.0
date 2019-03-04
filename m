Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E056BC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:15:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0BA20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mAhNBGsC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YAE9PS9l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0BA20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcT0xoiPqVt+HpQGwJMnAMk3RZMBM/jMaGgAK1YDF1M=; b=mAhNBGsC1B2b8e
	9HqpxYaoLN0cNUh6+cx5V/70iQrN//vCM3GCEZwX+ATuQPNze1Q90auhtAjXrUcnR0FA7l8gZ5eR8
	4CV2zjaUnhLTL1Cn9AqYEL63FvZh2iCOA8Be3l8i1jb1efFteMiVIXXGVQE2Xt1q5HzxevsPDtxkL
	E17LpUs8qJF+0xcGVLlk8n7eVFetgYqxhS8f7RkppuSDv+05twbqc3cUDVIyiywMaCX3ZyafL/87B
	AkoEKHCO2PI7JOsBxKKOACUFo2Ut8EugkvjRJZRDJGr/vD+SEkR2rMuSaZimfdYprbI0IA3KlOi6V
	m6AVSxSenHtdqp42z6ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wnR-00040b-Th; Mon, 04 Mar 2019 23:14:57 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjf-0007DE-Pf; Mon, 04 Mar 2019 23:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xbWXqrg0ZB3ED2Re70vaLXwEzgoOaFiRtW2rF/GI2bw=; b=YAE9PS9lMHutnhXIc0xja2rzdL
 6RT+LzrcbV5GoAS4wy09XFR3icYMvg7QMUN+h2IFLUm0oZbqw8w2xQC3Sgm7TZDvq9aeNx8I22svy
 vvK4ZMol7BsiJEEGmSysmNMfuPk6Bbs0ATMu9e7r5ScL6mk3LVddGRHh3vg/Or4XsUGV4tiyYZJnz
 CvacRiA9JtUgbKkcmZvi0ZT7nnRBvkYgfdIsXiyhi9+k0XQ2611MkuqWMK4wg6czY6nflIT3HjFMT
 FRZBhwSLryRqTjHL6DHPJ/sG2jGCElBuekECdjS2DVkc4iwKh0qmgqj3P0TeQGl2lVp2OMOZeknul
 TB+1v/NQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w6H-00016O-Km; Mon, 04 Mar 2019 22:30:22 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5EF5D240006;
 Mon,  4 Mar 2019 22:29:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 14/36] mtd: nand: ecc: Move BCH code into the ecc/ directory
Date: Mon,  4 Mar 2019 23:28:19 +0100
Message-Id: <20190304222841.13899-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173021_921101_91CB7C48 
X-CRM114-Status: GOOD (  16.20  )
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

Move generic ECC code in the ecc/ sub-directory for later re-use by
the SPI NAND layer.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/Kconfig                        | 11 +++++++++++
 drivers/mtd/nand/ecc/Makefile                       |  1 +
 drivers/mtd/nand/{raw/nand_bch.c => ecc/sw-bch.c}   |  2 +-
 drivers/mtd/nand/raw/Kconfig                        | 10 ----------
 drivers/mtd/nand/raw/Makefile                       |  1 -
 drivers/mtd/nand/raw/nand_base.c                    |  2 +-
 drivers/mtd/nand/raw/nandsim.c                      |  2 +-
 drivers/mtd/nand/raw/omap2.c                        |  2 +-
 include/linux/mtd/{nand_bch.h => nand-ecc-sw-bch.h} |  6 +++---
 9 files changed, 19 insertions(+), 18 deletions(-)
 rename drivers/mtd/nand/{raw/nand_bch.c => ecc/sw-bch.c} (99%)
 rename include/linux/mtd/{nand_bch.h => nand-ecc-sw-bch.h} (93%)

diff --git a/drivers/mtd/nand/ecc/Kconfig b/drivers/mtd/nand/ecc/Kconfig
index 01439f66ecbf..75a37f48e126 100644
--- a/drivers/mtd/nand/ecc/Kconfig
+++ b/drivers/mtd/nand/ecc/Kconfig
@@ -3,4 +3,15 @@ menu "ECC engine support"
 config MTD_NAND_ECC
 	tristate
 
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
diff --git a/drivers/mtd/nand/ecc/Makefile b/drivers/mtd/nand/ecc/Makefile
index c7367f834d81..36b6ee57ad61 100644
--- a/drivers/mtd/nand/ecc/Makefile
+++ b/drivers/mtd/nand/ecc/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MTD_NAND_ECC)		+= engine.o
+obj-$(CONFIG_MTD_NAND_ECC_SW_BCH)	+= sw-bch.o
diff --git a/drivers/mtd/nand/raw/nand_bch.c b/drivers/mtd/nand/ecc/sw-bch.c
similarity index 99%
rename from drivers/mtd/nand/raw/nand_bch.c
rename to drivers/mtd/nand/ecc/sw-bch.c
index 574c0ca16160..b640d5771382 100644
--- a/drivers/mtd/nand/raw/nand_bch.c
+++ b/drivers/mtd/nand/ecc/sw-bch.c
@@ -26,7 +26,7 @@
 #include <linux/bitops.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/bch.h>
 
 /**
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 621991a242c1..44dcac13fc0b 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -21,16 +21,6 @@ menuconfig MTD_RAW_NAND
 
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
index ffe95b157131..18ae42077b05 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -2,7 +2,6 @@
 
 obj-$(CONFIG_MTD_RAW_NAND)		+= nand.o
 obj-$(CONFIG_MTD_NAND_ECC_SW_HAMMING)	+= nand_ecc.o
-obj-$(CONFIG_MTD_NAND_ECC_SW_BCH)	+= nand_bch.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+= sm_common.o
 
 obj-$(CONFIG_MTD_NAND_CAFE)		+= cafe_nand.o
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 9efe3dd578b5..8047e4f44601 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -40,7 +40,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/io.h>
diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 670abe8d59ca..ae913f65be45 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -36,7 +36,7 @@
 #include <linux/string.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/mtd/partitions.h>
 #include <linux/delay.h>
 #include <linux/list.h>
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index eaf14813a3ab..3b77c36e43ee 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -26,7 +26,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-#include <linux/mtd/nand_bch.h>
+#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/platform_data/elm.h>
 
 #include <linux/omap-gpmc.h>
diff --git a/include/linux/mtd/nand_bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
similarity index 93%
rename from include/linux/mtd/nand_bch.h
rename to include/linux/mtd/nand-ecc-sw-bch.h
index 06ce2b655c13..a682a15fa165 100644
--- a/include/linux/mtd/nand_bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -8,8 +8,8 @@
  * This file is the header for the NAND BCH ECC implementation.
  */
 
-#ifndef __MTD_NAND_BCH_H__
-#define __MTD_NAND_BCH_H__
+#ifndef __MTD_NAND_ECC_SW_BCH_H__
+#define __MTD_NAND_ECC_SW_BCH_H__
 
 struct mtd_info;
 struct nand_chip;
@@ -66,4 +66,4 @@ static inline void nand_bch_free(struct nand_bch_control *nbc) {}
 
 #endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
 
-#endif /* __MTD_NAND_BCH_H__ */
+#endif /* __MTD_NAND_ECC_SW_BCH_H__ */
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
