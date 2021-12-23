Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A40C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 00:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zo9xG5KEK2Cr5xm5T5CX+g5ZnnLZ+KSdF2+BvBxYyXI=; b=bHXMkoz6+RiBmk
	yybQLwLHK/PtWg+GpI+Q4hhYF119pTJ10oZR0QF4kRItWPFiIneMA5EzXxA3aFLnzAV5qOF6Wuz+1
	pxwQOuKG6OrONprjapzi4dpt50SUlckpiBbn8Z9IBvN5L261fjLXt361QG7gnzpy66WSGwzwSKHtz
	ugcPWDNA29OjXJsWqvPj8riWX/WLfggsew93Y80XgU5JUl/yxhgW/LfMdMKjS6Mnc6DPAXzz2XK1x
	nqRWmgNIioaZ38n3mcB3q0jjl211IyMrkhXalxfQxlDA8rWIAd8XIXbCPAgDbtxlvA5aLnZT+dzuo
	qA53fHh09C7d/Hj52R3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Buj-00BYXp-Sq; Thu, 23 Dec 2021 00:24:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0BsZ-00BXgk-7W
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 00:22:45 +0000
Received: by mail-pf1-x429.google.com with SMTP id m1so3715504pfk.8
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 16:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WrwpWLxiWx6mZCJiyoZtcTWmNjs4loZOAYfkmQ38gh0=;
 b=B5ylfhV86Rh/vvH/mHcn/Ip2WU2wGp+wP2S70p2/h9wG9kF5AtkOfIc/o12mAJyBEa
 ditS8hsoUaFat25XFpsKemcKqZGs6ibOjam+Gi79vx9oec1ghP2AGwDIO8PUT5odGuo6
 Vw4M3zAySgvCIaqfvVQnp6qnhCi67jVY/vF61g8pScetURs0GF7OM8IAMPEQjzbfH3oc
 lRjYUMOwO1kEWp+roPQx2QdCSJBZKS/H7tf8Oh8x1SQQoArAU+SeoaBjhcQwhq5zz2KD
 Zq17T3kkoHy1Ww3H0kMLS1hKKPnubuuja3aKm5baG8hRxG1ri1MQNZxWuYMhGBLuWCOF
 JRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WrwpWLxiWx6mZCJiyoZtcTWmNjs4loZOAYfkmQ38gh0=;
 b=UCidRerqEIrnwfmTx8CLC84weGmv4vYO7i8GPYm3hvR5Jgkvh+2367EXa7SqEuTF2U
 cAuzTznKhUhEACZdSOICHwhceFy6Ha7ICmmolNfQgrGYWvwjFCbA+6yPNuFORKnLeram
 c2W7F9ZNw+dqRWMDfRHxupC1b4R+0UH6BNr42L3KHkoxxrwHBUmvH1dfSUdWgxwPIA5K
 Km79Q71MBPYdESjRrpvIPZD5mqijmSEOZQVQwJF4P2MvGWAb39uNoTRPiGpJHY9zF++E
 g8orj6ACtU9lx9orw3NKtdjVunhAacp62oevn0Zydo9QcDZX/oZq27e0d3Nzf2YAIs8M
 Mthg==
X-Gm-Message-State: AOAM5321D6rn+YGYONopDvoalD6fuVTPoxGw0Ahqqrbegj/x4fon3cce
 7Qzn604KPf50fypnHTTJMh1fxxE/+cY=
X-Google-Smtp-Source: ABdhPJyOPmJ6pH73MHEOBhkp5drVGU20fMMShEKfzZx4cNcOOCFlptto5aYiO766wpa+qFlf4BkCDw==
X-Received: by 2002:a63:416:: with SMTP id 22mr89208pge.133.1640218962033;
 Wed, 22 Dec 2021 16:22:42 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e24sm6720703pjt.45.2021.12.22.16.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 16:22:41 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER
 (BCMA)), 
 bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM STB NAND FLASH
 DRIVER)
Subject: [PATCH 6/9] mtd: rawnand: brcmnand: Add platform data structure for
 BCMA
Date: Wed, 22 Dec 2021 16:22:22 -0800
Message-Id: <20211223002225.3738385-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223002225.3738385-1-f.fainelli@gmail.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_162243_304707_DF50F1FA 
X-CRM114-Status: GOOD (  25.92  )
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

Update the BCMA's chipcommon nand flash driver to detect which
chip-select is used and pass that information via platform data to the
brcmnand driver. Make sure that the brcmnand platform data structure is
always at the beginning of the platform data of the "nflash" device
created by BCMA to allow brcmnand to safely de-reference it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS                                 |  1 +
 drivers/bcma/driver_chipcommon_nflash.c     | 17 ++++++++++++++++-
 include/linux/bcma/bcma_driver_chipcommon.h |  5 +++++
 include/linux/platform_data/brcmnand.h      | 12 ++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/platform_data/brcmnand.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8912b2c1260c..37062172083c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3965,6 +3965,7 @@ L:	linux-mtd@lists.infradead.org
 L:	bcm-kernel-feedback-list@broadcom.com
 S:	Maintained
 F:	drivers/mtd/nand/raw/brcmnand/
+F:	include/linux/platform_data/brcmnand.h
 
 BROADCOM STB PCIE DRIVER
 M:	Jim Quinlan <jim2101024@gmail.com>
diff --git a/drivers/bcma/driver_chipcommon_nflash.c b/drivers/bcma/driver_chipcommon_nflash.c
index d4f699aef8c4..9457f4b7ea9d 100644
--- a/drivers/bcma/driver_chipcommon_nflash.c
+++ b/drivers/bcma/driver_chipcommon_nflash.c
@@ -7,18 +7,25 @@
 
 #include "bcma_private.h"
 
+#include <linux/bitops.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/brcmnand.h>
 #include <linux/bcma/bcma.h>
 
+static const char *bcma_nflash_alt_name = "bcma_brcmnand";
+
 struct platform_device bcma_nflash_dev = {
 	.name		= "bcma_nflash",
 	.num_resources	= 0,
 };
 
+static const char *probes[] = { "bcm47xxpart", NULL };
+
 /* Initialize NAND flash access */
 int bcma_nflash_init(struct bcma_drv_cc *cc)
 {
 	struct bcma_bus *bus = cc->core->bus;
+	u32 reg;
 
 	if (bus->chipinfo.id != BCMA_CHIP_ID_BCM4706 &&
 	    cc->core->id.rev != 38) {
@@ -33,8 +40,16 @@ int bcma_nflash_init(struct bcma_drv_cc *cc)
 
 	cc->nflash.present = true;
 	if (cc->core->id.rev == 38 &&
-	    (cc->status & BCMA_CC_CHIPST_5357_NAND_BOOT))
+	    (cc->status & BCMA_CC_CHIPST_5357_NAND_BOOT)) {
 		cc->nflash.boot = true;
+		/* Determine the chip select that is being used */
+		reg = bcma_cc_read32(cc, BCMA_CC_NAND_CS_NAND_SELECT) & 0xff;
+		cc->nflash.brcmnand_info.chip_select = ffs(reg) - 1;
+		cc->nflash.brcmnand_info.part_probe_types = probes;
+		cc->nflash.brcmnand_info.ecc_stepsize = 512;
+		cc->nflash.brcmnand_info.ecc_strength = 1;
+		bcma_nflash_dev.name = bcma_nflash_alt_name;
+	}
 
 	/* Prepare platform device, but don't register it yet. It's too early,
 	 * malloc (required by device_private_init) is not available yet. */
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index d35b9206096d..e3314f746bfa 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -3,6 +3,7 @@
 #define LINUX_BCMA_DRIVER_CC_H_
 
 #include <linux/platform_device.h>
+#include <linux/platform_data/brcmnand.h>
 #include <linux/gpio.h>
 
 /** ChipCommon core registers. **/
@@ -599,6 +600,10 @@ struct bcma_sflash {
 
 #ifdef CONFIG_BCMA_NFLASH
 struct bcma_nflash {
+	/* Must be the fist member for the brcmnand driver to
+	 * de-reference that structure.
+	 */
+	struct brcmnand_platform_data brcmnand_info;
 	bool present;
 	bool boot;		/* This is the flash the SoC boots from */
 };
diff --git a/include/linux/platform_data/brcmnand.h b/include/linux/platform_data/brcmnand.h
new file mode 100644
index 000000000000..8b8777985dce
--- /dev/null
+++ b/include/linux/platform_data/brcmnand.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef BRCMNAND_PLAT_DATA_H
+#define BRCMNAND_PLAT_DATA_H
+
+struct brcmnand_platform_data {
+	int	chip_select;
+	const char * const *part_probe_types;
+	unsigned int ecc_stepsize;
+	unsigned int ecc_strength;
+};
+
+#endif /* BRCMNAND_PLAT_DATA_H */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
