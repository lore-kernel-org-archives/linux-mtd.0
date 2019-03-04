Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C6DC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6C220823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQtQL/h8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kWWuzeCm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6C220823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6p4+hLBKbX8oR3gSS+BAXqW8hgQAPQS/gZmIXV6JoI=; b=mQtQL/h85ZQqW/
	t90VOvl8njrsLGvrT+b6P0EvqDKf4wMeHhevfyNN06XBkRPRgNdMLj3pYUYadH5qUEeAIrVBha9RE
	abi+7lT+uupOhuVOzcR6KaHM7IpPj++/hfyXz3F8Quf9gmvE24RBCtJQWftsnXrbTqb7cH8NgPaYG
	n1nRTkSlnvA/dswwfb9bwEvf4uAuE4A16R4kXTtLnngavWpKcL6l9p5Z3zGh6Et8CcCo7Kz+KrUCj
	S1Ysmp7erdLMHCXlb2BePxJj/KsbuB2fmhKYSzeqCONHuaF2aEcRQS0ROq6nlHu8IeF0biRFITucW
	pkr5R70Ao2/tTj0PH+PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wm4-0002Cs-1T; Mon, 04 Mar 2019 23:13:32 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjZ-0007DE-0g; Mon, 04 Mar 2019 23:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f5QdVFht8DSXD9ES0sdh4+lmfJJ8qJPKZFoxAMtakBI=; b=kWWuzeCmJcRVi39tZZVmSlO/n8
 ZLaYDxhVk+oIljaY+DdJ+hRaEvFVE4vCjPHKumGIqRBtBUoQ4rs66XgZIzOnwBZLChSBNmfnKiOqc
 dBSL6iTD84ao1WB+3nLLNm71WhN5ujr9Bak/cj7EfatgwoJvRScSA0L3D+kk20h1QKkCWiOtOtgGh
 HOw2F8qPHmekErMz947ABlkOKGI4LS4t4w4Of8bfXCWFRlzqOQLhOwwqLmIDsKURFMumzbcEfV1al
 lXipqUm25piLhKtOlOnswx/dVehyi0pCkAcyNUqw1O7SqjoJcD/bhxgqw4vBbsk3U3TQhpcSjMpgF
 o1W0kx4A==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w73-0001AR-1j; Mon, 04 Mar 2019 22:31:09 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AF783240005;
 Mon,  4 Mar 2019 22:30:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 22/36] mtd: nand: Remove useless include about software
 Hamming ECC
Date: Mon,  4 Mar 2019 23:28:27 +0100
Message-Id: <20190304222841.13899-23-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173109_343903_644527A9 
X-CRM114-Status: GOOD (  10.34  )
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

Most of the includes are simply useless, drop them.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/mach-s3c24xx/common-smdk.c    | 1 -
 arch/arm/mach-s3c24xx/mach-anubis.c    | 1 -
 arch/arm/mach-s3c24xx/mach-at2440evb.c | 1 -
 arch/arm/mach-s3c24xx/mach-bast.c      | 1 -
 arch/arm/mach-s3c24xx/mach-gta02.c     | 1 -
 arch/arm/mach-s3c24xx/mach-jive.c      | 1 -
 arch/arm/mach-s3c24xx/mach-mini2440.c  | 1 -
 arch/arm/mach-s3c24xx/mach-osiris.c    | 1 -
 arch/arm/mach-s3c24xx/mach-qt2410.c    | 1 -
 arch/arm/mach-s3c24xx/mach-rx3715.c    | 1 -
 arch/arm/mach-s3c24xx/mach-vstms.c     | 1 -
 drivers/mtd/nand/raw/fsl_elbc_nand.c   | 1 -
 drivers/mtd/nand/raw/fsl_ifc_nand.c    | 1 -
 drivers/mtd/nand/raw/fsl_upm.c         | 1 -
 drivers/mtd/nand/raw/fsmc_nand.c       | 1 -
 drivers/mtd/nand/raw/lpc32xx_mlc.c     | 1 -
 drivers/mtd/nand/raw/lpc32xx_slc.c     | 1 -
 drivers/mtd/nand/raw/pasemi_nand.c     | 1 -
 drivers/mtd/nand/raw/s3c2410.c         | 1 -
 drivers/mtd/nand/raw/sharpsl.c         | 1 -
 drivers/mtd/nand/raw/tmio_nand.c       | 1 -
 drivers/mtd/nand/raw/txx9ndfmc.c       | 1 -
 include/linux/mtd/sharpsl.h            | 1 -
 23 files changed, 23 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index ffe34a5a3174..7cab64bea951 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -19,7 +19,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 83472294191b..8e4410d1bfa1 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -36,7 +36,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <net/ax88796.h>
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index c841b90695b9..35dc86805dce 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -37,7 +37,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 4f3d3e819a2a..3f8e2e7a2dff 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -24,7 +24,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 1c6f11216c0c..b63f5c2aeac7 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -36,7 +36,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index b2afb4099ab4..d9b920ad444e 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -40,7 +40,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/gpio-cfg.h>
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 8c173a6f1bdc..cdc305bbb74f 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -46,7 +46,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/gpio-cfg.h>
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index 0dd72072aa3d..025a7678b5cc 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -33,7 +33,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 19f2e12130ec..a1835139a6a6 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -21,7 +21,6 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index 05aac6499d82..13c73f6063bb 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -22,7 +22,6 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index e0218ae0040e..c1db572d2513 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/memblock.h>
 
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index a43f9373ce22..ed84b25e8e6e 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -35,7 +35,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/io.h>
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 7f7e1ecf612c..ac85e9dd1318 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -28,7 +28,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/fsl_ifc.h>
 #include <linux/iopoll.h>
 
diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 80dc210f05cf..224ba9449fc2 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -15,7 +15,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
 #include <linux/of_address.h>
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 0e0585bec837..797028037f78 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -26,7 +26,6 @@
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/mtd/partitions.h>
diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 0ae7ab7dbc68..af75eabddc6f 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -41,7 +41,6 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 
 #define DRV_NAME "lpc32xx_mlc"
 
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 8b000c783ba6..5629ef7750aa 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -32,7 +32,6 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 49c503a1d8ec..3b6f51a31e7d 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -26,7 +26,6 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 7f40cc85782d..b8462b9b4276 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -43,7 +43,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 31786044ba3c..df542d77b1db 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -16,7 +16,6 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sharpsl.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index efee3c3acd12..6fac98df3a92 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -35,7 +35,6 @@
 #include <linux/ioport.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
 
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4174d0012f0f..afdb947253bf 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -17,7 +17,6 @@
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 #include <linux/platform_data/txx9/ndfmc.h>
diff --git a/include/linux/mtd/sharpsl.h b/include/linux/mtd/sharpsl.h
index ccd952f27e00..3375a9958cfe 100644
--- a/include/linux/mtd/sharpsl.h
+++ b/include/linux/mtd/sharpsl.h
@@ -9,7 +9,6 @@
  */
 
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 struct sharpsl_nand_platform_data {
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
