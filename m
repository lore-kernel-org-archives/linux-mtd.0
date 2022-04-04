Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6609BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+G/EFkekkmqrIydrflc2sIRxaDZo4B4Gkejqs5GlNd4=; b=eoP5SawSX/xeHV
	fQ8ExLhqAWZyOc4C77lzk+ZL175K4mzpjrLg+B34+GhKpN03jWL3qBChIhhNRrOelxza55Y3feJVg
	Kuah3aIrciDp0Sji/cOcRKUu736WtaWuJ0Eu7GwKN1nlVvE6q6paxf8y1KVuyaUcwdD86qnd4YENE
	EmkvSWE5+3P+eadtf0BIhG+olCbc8tSMZGNxngXmXh/LYMvd7vuf22ca66lhPeTdAxDowd/SmTEPc
	30XKU/ogskM+naREkOD/eKJNiSMEVxebgiItb782Pk/gj7pFOAgeybmiAgj5ATijsiULkF9B6Jtkz
	TTg+kVhhKgvbRSnmojvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMbx-00F3OW-Tt; Mon, 04 Apr 2022 13:19:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMbY-00F3G0-Qj; Mon, 04 Apr 2022 13:18:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so8983500pjk.4; 
 Mon, 04 Apr 2022 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P6+c78n98WoqJ0xcOEG7TbVsPz8eysqz2CPg0JCMWtM=;
 b=GgDh6ugA1uShmcpnLzreY6O9wiAhOlkLaJDOkFNQXttT4wCsRjZNOxPvXBnzCQ9VI7
 ER56yIrb0rJVWpEaGuxIclFr3Kha84XNiuj96py5X7yBD+/BEJKlQAMJWBpgnCUg14mj
 AlWgVbcErGtHlBDBs0pM0bBbd2L2uCP/1YMyNSQTyr2sX/krzV7a5QUcDjwO81Y/QUBw
 JQfEJln6zHNIXqS5F8F5Wf8N6ZKBAL1OvrJDfxpELGb34KF3wRMB5iOYo3VKbIrBT6D5
 K9lY8zq4e7NBX4SwPwmT3cOZWWc1XXqu8RBRYaVEJ05Q49dSTkfx/9bhziIbhL7jG1dI
 KrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P6+c78n98WoqJ0xcOEG7TbVsPz8eysqz2CPg0JCMWtM=;
 b=gZnpnt8qFqK/IjJMKB3nYr24Snqv4L4EY4Uu0EH2cgf4ijnyrak57ITsp3xayClkpr
 neLfCOkj4jSP5lHgRSYSUwI3Pw3el30R2ADbfDMqxW+IGS3QSP0Tb46QI98BdZsLKEUo
 QNSIYiq+Sk7KvrILnfPMV6pvZnXeuoA/KA88rdh8q5eX2jPzFdPaYozE0w2n7BP6wT+W
 opcKZXhRzROdaXYGhkWSZd1VXCXSEXo7CX1mLTuyG07Yt8FO4xwkQIONptAXH0eWcMHl
 NgYlEEcRs3Nab6R6tqRy1usvrbpSvgZxrF2U/IMhpXMg24aqHvROk3LgRaLKP7uZY7/i
 Vpow==
X-Gm-Message-State: AOAM533OTcEFgKEEzjJaZ4V1pvkwTqgvAR20PYygUr0kPZfovjXkLh7m
 il0LSx7cgCBkmr9b5BnD61A=
X-Google-Smtp-Source: ABdhPJzBtEGjqNYOSoKgcSU6GKa5x611zKCIDRs5ttXp4o2M13OM7vT2LKJKdIAm253x5VCx1zoy+w==
X-Received: by 2002:a17:90b:3504:b0:1c6:8569:c28d with SMTP id
 ls4-20020a17090b350400b001c68569c28dmr25935842pjb.92.1649078326718; 
 Mon, 04 Apr 2022 06:18:46 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm12475705pfj.43.2022.04.04.06.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:18:46 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH v3 1/5] mtd: nand: make mtk_ecc.c a separated module
Date: Mon,  4 Apr 2022 21:18:14 +0800
Message-Id: <20220404131818.1817794-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404131818.1817794-1-gch981213@gmail.com>
References: <20220404131818.1817794-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_061848_913340_58FC5121 
X-CRM114-Status: GOOD (  13.23  )
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

this code will be used in mediatek snfi spi-mem controller with
pipelined ECC engine.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---

Change since v1:
  actually make it a module instead of a part of nandcore.o
    (ECC_MXIC probablly needs a similar fix.)

Change since v2: None

 drivers/mtd/nand/Kconfig                                   | 7 +++++++
 drivers/mtd/nand/Makefile                                  | 1 +
 drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c}              | 3 +--
 drivers/mtd/nand/raw/Kconfig                               | 1 +
 drivers/mtd/nand/raw/Makefile                              | 2 +-
 drivers/mtd/nand/raw/mtk_nand.c                            | 2 +-
 .../nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h | 0
 7 files changed, 12 insertions(+), 4 deletions(-)
 rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (99%)
 rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 9b249826ef93..2f3e02ab72ed 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -53,6 +53,13 @@ config MTD_NAND_ECC_MXIC
 	help
 	  This enables support for the hardware ECC engine from Macronix.
 
+config MTD_NAND_ECC_MEDIATEK
+	tristate "Mediatek hardware ECC engine"
+	depends on HAS_IOMEM
+	select MTD_NAND_ECC
+	help
+	  This enables support for the hardware ECC engine from Mediatek.
+
 endmenu
 
 endmenu
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index a4e6b7ae0614..19e1291ac4d5 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -2,6 +2,7 @@
 
 nandcore-objs := core.o bbt.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
+obj-$(CONFIG_MTD_NAND_ECC_MEDIATEK) += ecc-mtk.o
 
 obj-y	+= onenand/
 obj-y	+= raw/
diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/ecc-mtk.c
similarity index 99%
rename from drivers/mtd/nand/raw/mtk_ecc.c
rename to drivers/mtd/nand/ecc-mtk.c
index 49ab3448b9b1..74ddaa46ba7c 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -15,8 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/mutex.h>
-
-#include "mtk_ecc.h"
+#include <linux/mtd/nand-ecc-mtk.h>
 
 #define ECC_IDLE_MASK		BIT(0)
 #define ECC_IRQ_EN		BIT(0)
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 9b078e78f3fa..8b6d7a515445 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -374,6 +374,7 @@ config MTD_NAND_QCOM
 
 config MTD_NAND_MTK
 	tristate "MTK NAND controller"
+	depends on MTD_NAND_ECC_MEDIATEK
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 88a566513c56..fa1d00120310 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -48,7 +48,7 @@ obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
 obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
-obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_ecc.o mtk_nand.o
+obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o
 obj-$(CONFIG_MTD_NAND_MXIC)		+= mxic_nand.o
 obj-$(CONFIG_MTD_NAND_TEGRA)		+= tegra_nand.o
 obj-$(CONFIG_MTD_NAND_STM32_FMC2)	+= stm32_fmc2_nand.o
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 66f04c693c87..d540454cbbdf 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -17,7 +17,7 @@
 #include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include "mtk_ecc.h"
+#include <linux/mtd/nand-ecc-mtk.h>
 
 /* NAND controller register definition */
 #define NFI_CNFG		(0x00)
diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/include/linux/mtd/nand-ecc-mtk.h
similarity index 100%
rename from drivers/mtd/nand/raw/mtk_ecc.h
rename to include/linux/mtd/nand-ecc-mtk.h
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
