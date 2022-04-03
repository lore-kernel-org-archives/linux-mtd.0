Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525BFC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3MRcwDHum8BSyRUKXYoRsqPWGVWNd8CRc5hXoOycW4=; b=vrjqTtu9IlWe31
	POZsWO8J+3xTVxfIrQuuDBSyzI6VcJQge5k6O9R71/Co3ceJuYyH+OUw1OuKkMusTan62cQi0p+Pl
	0fagHCFQ5Kmb+znjlj2d6ZWr9zzsXZuQuHrNog20/0dcd8ZbgqkBwi/nl72fuRq2IXY1Pi362FSQi
	0r+g5pxhbvmLOgIJkBadEHj6DVZQ3LU9D22JD7zmOr39ohbEDhW16XGkqGZ1DV0l4cgkzcflxc59K
	QjdQ3C0T6CGykal9UMU4wfiEwiPyzyiZEEKPb+EU8zF1gKUzofAD+7WdLzrc7slZX8x12+RJmlam+
	RHbZDGnrwOO9a7zcbDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb02h-00BQ5c-3v; Sun, 03 Apr 2022 13:13:19 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb02F-00BPxZ-CY; Sun, 03 Apr 2022 13:12:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id b13so6634947pfv.0;
 Sun, 03 Apr 2022 06:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyrqHELlKNXA/M2+zx7CFD/1nfCk80dDQzAqwlfKPhM=;
 b=YF13fRlzzdDeT9fkWpExq0iVWbmI7rlCyz8KJf+E1klDtQ8pmpOAySB8evDcrA7R4T
 pgSLXQ+uQCtqpLDk2sHP19FC+2lZ81TyUGrm4Pw1xj+oIra0j0LuzsapriHk7SjB0anC
 QwH5X3/xqZbXu9Ift/XS2x2At46aUEzi/FRAs0YHCzjdmQXSYuJJgSOaGxSF6QbPPIoH
 tyHyBx77cbj4s0eNJHw5W6s0CdyQCLkQKm77OsOyUK9/67XRGzUTwRnXPfwJcZ/G5Di8
 sU7GH181GNFtpl6OFL50jhRVS5jfIhVrbI3GRmwIRC0RdTYmoiFubzElzPrm2o7E0r3R
 MnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyrqHELlKNXA/M2+zx7CFD/1nfCk80dDQzAqwlfKPhM=;
 b=FjipH3/1fGXjjgEs5D0wz57RZavIeJOe/WJsi1xxeOXhUDzJ6bUIAhFKCgnC4kvOyg
 tovk8LURStcRHjp02lO/GcQkwsXFFRJSo846bVJLad+JJAi7mEBW2hI9JKThn6l3RBJK
 bX7RCfCqcafp4GnnLOVDdVBPN2WsdcwhRn+vixqN175kBoRfLwOKQGyNEV9pfOC1xZzo
 wo9DK2Rw9ojkJyOIUnuBmqSRhy1C+NRXC7cEZ7LvOhCfDd8mF1vnwPQdOaOfTiTTwSZe
 9ay0tq9nRA0tJdJicIzxm9+2HjOu5Ovud/ow9fkscgG2gjoQp11zUnBrQRdY4okQdEUN
 PkBg==
X-Gm-Message-State: AOAM533BVRG/LericeLbWToDI4KUFObxS8rEqDJnrgIV6NG5BUk2HSnr
 IZfSjN9TCg9AR53Zu4baIbQ1FY4yH8H4GBgInmM=
X-Google-Smtp-Source: ABdhPJwRjpSsj1u9PFtBOF35AuSVlw2bOGyM7KVVe2fi9Is42cJgTW5tEizeKtOkVncwyX08j1N7Qg==
X-Received: by 2002:a05:6a00:e0b:b0:4fa:a167:5b35 with SMTP id
 bq11-20020a056a000e0b00b004faa1675b35mr19448085pfb.69.1648991569527; 
 Sun, 03 Apr 2022 06:12:49 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 x123-20020a623181000000b004fdf99d25f6sm1554857pfx.80.2022.04.03.06.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 06:12:49 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@lists.infradead.org
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
 linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH 1/4] mtd: nand: make mtk_ecc.c a separated module
Date: Sun,  3 Apr 2022 21:11:51 +0800
Message-Id: <20220403131154.1267887-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403131154.1267887-1-gch981213@gmail.com>
References: <20220403131154.1267887-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_061251_463164_BDF5011A 
X-CRM114-Status: GOOD (  12.75  )
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
index 9b249826ef93..39df4621ac25 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -53,6 +53,13 @@ config MTD_NAND_ECC_MXIC
 	help
 	  This enables support for the hardware ECC engine from Macronix.
 
+config MTD_NAND_ECC_MEDIATEK
+	bool "Mediatek hardware ECC engine"
+	depends on HAS_IOMEM
+	select MTD_NAND_ECC
+	help
+	  This enables support for the hardware ECC engine from Mediatek.
+
 endmenu
 
 endmenu
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index a4e6b7ae0614..e5f40ed9300f 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -11,3 +11,4 @@ nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
 nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
 nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
 nandcore-$(CONFIG_MTD_NAND_ECC_MXIC) += ecc-mxic.o
+nandcore-$(CONFIG_MTD_NAND_ECC_MEDIATEK) += ecc-mtk.o
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
