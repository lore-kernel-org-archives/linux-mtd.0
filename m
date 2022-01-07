Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F34C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8HAy1RisBQu1lCHx4h1+DSlItmFPirpnxu9931w0hA=; b=dZ2flrtptQwlZL
	XNy4bnG+B4GXCePZOGuw9oJWGSxBtzFyukUfn0Lv1dHq5C0KLdgmXtZy3oI8lVThMO/FGYjuXg/Af
	+kRb3G3GDUYjtFivO+vam5s2rqd70j/nLTEarNcgNn9JOUM8ArZIT67cP87A8MQASKUKSG+CYIUUh
	nC1ygzU1iCpa86s6QW/SgfJTZmyiEp4YnyagVwsrb/qrIFwgQ/hCPG+YkghyW+sXFdWVe2/LA4Tp8
	evQE36cj8l//YGwGWvp8fXmlTYVLvqjYbqX3F3LpNcWzWH71BOAPUpPSXB4mm/e92amnXANYJABiv
	QlkXcbMbkAiUUtHuuBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5uIQ-004xAQ-RW; Fri, 07 Jan 2022 18:49:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5uG5-004w20-5c
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 18:46:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id x15so5534432plg.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jan 2022 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZ1NPwHOAF/AQNPHH9LVwlD3kjQZoYIgqFFS0X9ueYI=;
 b=gdwYPVJj5AL9Sro58YVyH5wWqFz92B5ufSDbADqzyl+1QEh7J6G6D8FP3/k4xBYjj6
 RlWrd1MdXQ3rZPIvr/UHiMxNh3ztIIQ/0TZ6sMRJRe5uV4NPdtNmQJcWYmMhDC3Xyocy
 sznclV/UHl4z2OoaOo4UdXg1FV/NGdo2K3K9TtpslCZNqLFJ/gSqS2Qdh4S4pT9nqmlG
 b3KLCtcyutltvBA8gxKP/38Wmgj/wGlahwds2aljXrCWCJ8QIgybIU9T1K7ITYBYEaNj
 5vScfjerqGNn89/mr1bOKpg4ijTWXRKWLcejNB0dPKe44M7CaoWhydzblgqi2S+mlq0c
 KV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZ1NPwHOAF/AQNPHH9LVwlD3kjQZoYIgqFFS0X9ueYI=;
 b=2DN3NuzeL10IVq/X/FbWd3GymSkFzxGHAuLlNt0RauQM6j0kaOfw1dvXdsjFe277ux
 WG/n2azZ5lLGYAggRMYt9CvKEB5cLXhrL1mEg6MUoCYjBn/J6EaeWnRvpE23fmzRGlPu
 hRfIa0R0zUp0QLv+xprPdmtG5rdnjlMqTnJqIFEKxQHF58tW+eM3BG3c1M3zpsSxTmYt
 GbhpwtUg5GQGwEDCNcIwwdPX9nLh31NJPoy9PCV8NJ7cPLjVYmt0z6LlutuMsz8aJGLd
 HbdYpYw7L/VMnEVMU+gm48t6a0TpJlKn2wfKndv9iH41j833LLh3DX9t/yMIKhZBbYBR
 Ox8w==
X-Gm-Message-State: AOAM531DDS0LajhP9KlzuKJ85iEYmFaHJ5y18+nm3iDnshjj/5FSEp1S
 mawotc8PlJ1fYuv6TAIAfuV9SHA662I=
X-Google-Smtp-Source: ABdhPJyd1JMd6wKyQckUfHPUOYjmtP2LGWi0nKuIB0jRuzX3Xe/zyMQGEc933uGXxW11tKhYKKPWXA==
X-Received: by 2002:a17:902:9001:b0:149:f2ae:6491 with SMTP id
 a1-20020a170902900100b00149f2ae6491mr8598993plp.39.1641581196338; 
 Fri, 07 Jan 2022 10:46:36 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x33sm7219417pfh.212.2022.01.07.10.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:46:35 -0800 (PST)
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
Subject: [PATCH v3 6/9] mtd: rawnand: brcmnand: Add platform data structure
 for BCMA
Date: Fri,  7 Jan 2022 10:46:11 -0800
Message-Id: <20220107184614.2670254-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_104637_249482_2FD2B45A 
X-CRM114-Status: GOOD (  26.70  )
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
 drivers/bcma/driver_chipcommon_nflash.c     | 20 +++++++++++++++++++-
 include/linux/bcma/bcma_driver_chipcommon.h |  5 +++++
 include/linux/platform_data/brcmnand.h      | 12 ++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/platform_data/brcmnand.h

diff --git a/MAINTAINERS b/MAINTAINERS
index dd36acc87ce6..404f3eb8ff18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3966,6 +3966,7 @@ L:	linux-mtd@lists.infradead.org
 L:	bcm-kernel-feedback-list@broadcom.com
 S:	Maintained
 F:	drivers/mtd/nand/raw/brcmnand/
+F:	include/linux/platform_data/brcmnand.h
 
 BROADCOM STB PCIE DRIVER
 M:	Jim Quinlan <jim2101024@gmail.com>
diff --git a/drivers/bcma/driver_chipcommon_nflash.c b/drivers/bcma/driver_chipcommon_nflash.c
index d4f699aef8c4..a1a814750b4a 100644
--- a/drivers/bcma/driver_chipcommon_nflash.c
+++ b/drivers/bcma/driver_chipcommon_nflash.c
@@ -7,18 +7,28 @@
 
 #include "bcma_private.h"
 
+#include <linux/bitops.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/brcmnand.h>
 #include <linux/bcma/bcma.h>
 
+/* Alternate NAND controller driver name in order to allow both bcm47xxnflash
+ * and bcma_brcmnand to be built into the same kernel image.
+ */
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
@@ -33,8 +43,16 @@ int bcma_nflash_init(struct bcma_drv_cc *cc)
 
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
