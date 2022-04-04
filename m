Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B26C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 04:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YgkMWbJRalhN3OA8weQy/m4bg+yPvRgihcObKSlux0=; b=ntfCyjvtt5Dyb8
	zNYMdstmhkOfnO1SKzUFkf/uVHY9mmlFkZkgyEFG4WNYp3eLwoLCwOZCR527egClUZ54fYLPZEIGy
	nKLNmTKW3GM9zFqJlgEBNZGzGX3OEyo2bSpxPrsoRxPuhivvV+Xv2ClyMxiKgrQISKnFQXaUxtfmS
	NNXnRuroXEPi76qLiu8Z9in6I7UOksmfJXyQ1tYRH6sDOAN8YlViGWUHS0D/wLIoUX19mSbKbLwdZ
	PVv/+GVuteTHCOixTFhtGsGnjB9WnuZ/ARUDScMjfkOieGAjNb7soEWWozMoHCwapQeO1HyJe7LNA
	qfD5HdSbJxd3OAfF4Wjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDvT-00Cwui-0a; Mon, 04 Apr 2022 04:02:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDuz-00CwkK-6W; Mon, 04 Apr 2022 04:02:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 g15-20020a17090adb0f00b001caa9a230c7so445740pjv.5; 
 Sun, 03 Apr 2022 21:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Oa+8byNWNKKPzQUi9Ts2CajVA6iBJj5SCfhXQT0Kjo=;
 b=X/Y5YHGZW9tWJ+B9jlEAAJWG+dmynG23Ldbowkbt071qsod4+Nod/haYkCzrENf8Ar
 sEhtn5BucB36zCep41qVSWZHCOTktzTgx3RBuwizi3SW73tQMnmBLXHeP8AycXUUJcZj
 wUHWlOBVW0s27lHlormQyPUchXW5ys5Tc7AaAeqyyNy7/AO+xcqWgp90yTCJUH3qCiYx
 Q/2pOM4bTnbqyA+KICTsySdkiZrki207AcDjqeZAxJUqZrs81BnOrcMy8/3LMYNVZ6zA
 k5rwuVGdtbLZUv9qv/gObf6yAOiW+yvqP3oEStnV2t/Hk2KmonD0TFsaExVHpkJ8Ko4s
 sQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Oa+8byNWNKKPzQUi9Ts2CajVA6iBJj5SCfhXQT0Kjo=;
 b=4oA2aQxhUvkygo2qssgDl83bR3AoEZ9ekHrYxzg2QQuM+Tj8QdT3WTET08bUNbIIg6
 bQsNX96WCkVStyGDB6gXlTJx94TnhCAL9Xu+RO3iGI3qe5b0LF6T6AGo+5N1sy3RXBwU
 tQgl16QJyeYfQtYvDj4U/hMNoRPIWcK+FSElvDJ9BPDN50EouCyjc4DpfRSLUMFRLeEA
 HIxjZqLWnuINmHv0BxsH4qNoibO42MmIZ5OwhTfTxD4ULD1mZ1f4bu/x+UgK2cg9YW/6
 xKAO9RdxSXZNX+JwA/5BWpJNRnXrrz48H0gv3sk1d1QLp8rZ3HQxfaE2+gIPzAnY5sL5
 SOaw==
X-Gm-Message-State: AOAM533U81XfxyT5nrJDiynkhFzwlFgoNlJnk6omohYAXkhdwrBF9lyZ
 yirQYXgUD3LVRha9rU66cFc=
X-Google-Smtp-Source: ABdhPJyez1j8M8EU8wBC4daK2EdE3R5g7YnIA5VP3b4jqFeO/EPK99JHzzzxw9a6LhitJTZtxqAtlw==
X-Received: by 2002:a17:90b:1bc9:b0:1c7:228a:95ce with SMTP id
 oa9-20020a17090b1bc900b001c7228a95cemr24273683pjb.3.1649044935542; 
 Sun, 03 Apr 2022 21:02:15 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 j70-20020a638b49000000b003985b5ddaa1sm8756191pge.49.2022.04.03.21.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 21:02:15 -0700 (PDT)
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
Subject: [PATCH v2 1/5] mtd: nand: make mtk_ecc.c a separated module
Date: Mon,  4 Apr 2022 12:01:49 +0800
Message-Id: <20220404040153.1509966-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404040153.1509966-1-gch981213@gmail.com>
References: <20220404040153.1509966-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_210217_283767_03CA9041 
X-CRM114-Status: GOOD (  13.14  )
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
