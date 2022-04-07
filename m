Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1966FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1O2hoDWtXWrFdWlLxmI/RUHLHt2eCHcxb3c8PLDjnpE=; b=Ty9fLQ4V5FhoDD
	/B05f6VQuYruXsIKKXlRhTiJbXTt8SrcDmWHZKopc1wb7eA3fpVwlnXwBiw/pBigBIDRHNFhqPI4s
	MUbeDNy+AWQUg7iTopWX3aGZDpb2mAcYx7c2GzJ/UG8SSyiYf+yog+u4+dKrrjjczA4U62P/34u1/
	yPGTjDShQNjCBQ1TwGzKarKzI+TFTFhvEZR+QNIbirdWFl+PrgMQyvwWB9Rgjg+TWXGODYFelDgxm
	8s1g1z6ZShQ/ozF1Lt233sGLudQktpxPbbF+vMgw216hgkfPm9eoH33aUoDOUnWIRXw2L7+vZkjaR
	73qGdPSBWTKudpG37GWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTjg-00CZM3-5L; Thu, 07 Apr 2022 15:07:48 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTjF-00CZ9t-JQ; Thu, 07 Apr 2022 15:07:23 +0000
Received: by mail-pg1-x536.google.com with SMTP id z128so5196863pgz.2;
 Thu, 07 Apr 2022 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mGH5xnhdPLR3rdztXJZoJ5J2yhaEr42Rk1zHYPZDixQ=;
 b=KpNSzqedxIOz5ELn4/BmV5Dfe/fZt6S2tlFYES8RdNNR16lFR8GXf8GJptPpUFZlA4
 17/wKM7SjhuMkZiNrbFh6tj9J/ysdkI7/vTHa4LZF0q2G+dGNkUsZSIkT/18otHMM31l
 MLmo5GSvskz+rI9++jXLpG7nxQWNQSFSW+Qlg7RwIJLLeq/tO6lAZKmR+5kOti7E84HU
 Gk+/Kku+W6VWWTW4sYT8SLSBdezCYDv4A1BCUU5/PTzsFR+lYJCcfW5t+kIOWvKUkNBz
 zuOJvpuB5agXi9nqxX9mPYpWS37gKb23y37zANFpK+4sRn/wCwAy76EePYSr/SxvL/WN
 8hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mGH5xnhdPLR3rdztXJZoJ5J2yhaEr42Rk1zHYPZDixQ=;
 b=ILUL+xWYfu5NYXaV8qPkwjJA3nGVAY5iGKU+qKsb4mmiZVKhovLxJDeY/h8lZp/KjA
 L/u6ZHM0BI7FYCTEIUvfX7u7C8sKDVFXowXWqs0WqZeok25MEG7l4fb6J+1+5YbUI61x
 EPIV22JUs1Z6slVRmEyK/13jAAjJL4ctXMbhbBf1puzmhQT4FgKt3NVTEpPNZFwHFe5C
 n9n1ld7Zqg8FehZb77gXD3w9nQdMM+Y3pyc8sDaHGbL93CL+kdETsZ/bZfPtvNnnES6s
 LT1u9D4IReM51bestPnUgfxAiTNRwSJmd0Aui3/Ycb02qhwtcJKEk/BulO/0cV4z5YbQ
 HTuQ==
X-Gm-Message-State: AOAM530VLNyVencBFAHpolCo1r4zHx66o4+Vjr+N+5OMw3Hf+5cqgC7q
 uG5bR4RaYq7JJD5q9zTt5pE=
X-Google-Smtp-Source: ABdhPJw/5y/SnuEiawU0ID2WFKdBl8XVuHuQ/KDtAfqO0U2fw+QgH1ubMmidvSqjzer9teGDIlMt6w==
X-Received: by 2002:a05:6a00:18a5:b0:4fa:e6f0:d410 with SMTP id
 x37-20020a056a0018a500b004fae6f0d410mr14716311pfh.28.1649344036065; 
 Thu, 07 Apr 2022 08:07:16 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a63aa42000000b0038265eb2495sm19329908pgo.88.2022.04.07.08.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 08:07:15 -0700 (PDT)
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
Subject: [PATCH v4 1/5] mtd: nand: make mtk_ecc.c a separated module
Date: Thu,  7 Apr 2022 23:06:48 +0800
Message-Id: <20220407150652.21885-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407150652.21885-1-gch981213@gmail.com>
References: <20220407150652.21885-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_080721_698019_6DC4FFA8 
X-CRM114-Status: GOOD (  13.03  )
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
Change since v3: None
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
