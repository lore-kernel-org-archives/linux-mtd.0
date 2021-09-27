Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D75C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:44:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A0D610A2
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65A0D610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeBE7Oq9/lP4Bk7XXY13si0dAP+rszFaXpPSA8HFI+4=; b=FdQ6EzxkVyLxyG
	atPMM0glNOYbU2HdbYiFE09+SzJmLc5m6NxoSLcl9k6H9xw//HpVq5HfVtIJGfY3ATZTlMOiwEofh
	UnTuPhsMohiBFfz8vcdsxAW8dfDCt1b1+aGOYo6omprRa/PFPXm7IOlYwdSaYKwNQAP4ZVpA5A+RB
	t/aahZJJPDpaZFjBiTu2ZSR1o/vQVhqrmFCjJukvzzdzvWRsQgyCFcGs466QFQ1a2xqd5dDgequ3d
	PqKdNCkGaUidDnWcdqzZKBN/vmF0P4IhVPFfJdVppohi1HY38q98s+QKTDgBTuMpGCAat7hXVMf6/
	vMy/55ovjnf65P8bCHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUjQk-001c5S-8y; Mon, 27 Sep 2021 05:43:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUjQ2-001bnE-FP; Mon, 27 Sep 2021 05:43:17 +0000
X-UUID: ded15de51aec4df9bde567795771f4ae-20210926
X-UUID: ded15de51aec4df9bde567795771f4ae-20210926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1529679428; Sun, 26 Sep 2021 22:43:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 22:36:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 13:36:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 13:36:45 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <info@bootlin.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v1 1/4] mtd: ecc: move mediatek HW ECC driver
Date: Mon, 27 Sep 2021 13:36:26 +0800
Message-ID: <20210927053629.17847-2-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
References: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_224314_545743_DDFE59FF 
X-CRM114-Status: GOOD (  12.55  )
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

Move Mediatek HW ECC source driver to mtd nand folder and the header
file to include linux mtd folder.
The HW ECC driver can be used by Mediatek raw nand and spi nand
controller.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/mtd/nand/Kconfig                              | 9 +++++++++
 drivers/mtd/nand/Makefile                             | 1 +
 drivers/mtd/nand/{raw => }/mtk_ecc.c                  | 2 +-
 drivers/mtd/nand/raw/Kconfig                          | 1 +
 drivers/mtd/nand/raw/Makefile                         | 2 +-
 drivers/mtd/nand/raw/mtk_nand.c                       | 2 +-
 {drivers/mtd/nand/raw => include/linux/mtd}/mtk_ecc.h | 0
 7 files changed, 14 insertions(+), 3 deletions(-)
 rename drivers/mtd/nand/{raw => }/mtk_ecc.c (99%)
 rename {drivers/mtd/nand/raw => include/linux/mtd}/mtk_ecc.h (100%)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index b40455234cbd..e657823329d2 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -46,6 +46,15 @@ config MTD_NAND_ECC_SW_BCH
 	  ECC codes. They are used with NAND devices requiring more than 1 bit
 	  of error correction.
 
+config MTD_NAND_ECC_MTK
+	bool "Mediatek hardware ECC engine"
+	select MTD_NAND_ECC
+	help
+	  This enables support for Mediatek hardware ECC engine which
+	  used for error correction. This correction strength depends
+	  on different project. The ECC engine can be used with Mediatek
+	  raw nand and spi nand controller driver.
+
 endmenu
 
 endmenu
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 1c0b46960eb1..66d1741fe7ff 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -10,3 +10,4 @@ obj-y	+= spi/
 nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
 nandcore-$(CONFIG_MTD_NAND_ECC_SW_HAMMING) += ecc-sw-hamming.o
 nandcore-$(CONFIG_MTD_NAND_ECC_SW_BCH) += ecc-sw-bch.o
+nandcore-$(CONFIG_MTD_NAND_ECC_MTK) += mtk_ecc.o
diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
similarity index 99%
rename from drivers/mtd/nand/raw/mtk_ecc.c
rename to drivers/mtd/nand/mtk_ecc.c
index c437d97debb8..ce0f8b491e5d 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -16,7 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/mutex.h>
 
-#include "mtk_ecc.h"
+#include <linux/mtd/mtk_ecc.h>
 
 #define ECC_IDLE_MASK		BIT(0)
 #define ECC_IRQ_EN		BIT(0)
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 67b7cb67c030..c90bc166034b 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -362,6 +362,7 @@ config MTD_NAND_MTK
 	tristate "MTK NAND controller"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on HAS_IOMEM
+	select MTD_NAND_ECC_MTK
 	help
 	  Enables support for NAND controller on MTK SoCs.
 	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2f97958c3a33..49d3946c166b 100644
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
index 5c5c92132287..7d8a6b35c102 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -17,7 +17,7 @@
 #include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include "mtk_ecc.h"
+#include <linux/mtd/mtk_ecc.h>
 
 /* NAND controller register definition */
 #define NFI_CNFG		(0x00)
diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/include/linux/mtd/mtk_ecc.h
similarity index 100%
rename from drivers/mtd/nand/raw/mtk_ecc.h
rename to include/linux/mtd/mtk_ecc.h
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
