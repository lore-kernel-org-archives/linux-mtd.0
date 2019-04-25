Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F1AC10F11
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 01:56:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761B020835
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 01:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMtq2Tig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761B020835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXEGC9MpChW9PbN/U1WHuvknEzd7twW5sfKL4fEo9EY=; b=aMtq2TigOlrv51
	3878ZQo2wqHRhdvLE1R87sjuFBwoKOON870AokKzu/BVRZJZ6J1VVAT2f9CtGqd286dk1V3D63wth
	PJn3J3Qu41u9FperS5mC1ts7Ylbnrrfbz+AxBn7P5gnTJlPzpSfnIromO10rwchcIpv791nqEocxW
	lfEJxitbZvdGcEiX/a82SiGVklIZQsSp5cvI1zacRztWzfhYduw2sJs9Uvin8bfMgS8TR+JdofYDA
	jBqT/5pM56GYd29JD5RvB6UBaAvtKuQAeB3+Of7EiK325mmrqPM634mQO6YgLiTKSKtBOEk7g3hWd
	DFFrLFdGZOFPNhBu+VQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJTcl-0004aP-K2; Thu, 25 Apr 2019 01:56:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJTci-0004a0-S7; Thu, 25 Apr 2019 01:56:30 +0000
X-UUID: aca11a69021848efb7febdf55361e2aa-20190424
X-UUID: aca11a69021848efb7febdf55361e2aa-20190424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 296514583; Wed, 24 Apr 2019 17:56:01 -0800
Received: from mtkmbs03n1.mediatek.inc (172.21.101.181) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 24 Apr 2019 18:56:00 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs03n1.mediatek.inc (172.21.101.181) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 25 Apr 2019 09:55:58 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 25 Apr 2019 09:55:58 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [RFC PATCH v2 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
Date: Thu, 25 Apr 2019 09:55:52 +0800
Message-ID: <20190425015552.42638-2-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190425015552.42638-1-xiaolei.li@mediatek.com>
References: <20190425015552.42638-1-xiaolei.li@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_185628_906031_01546820 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com,
 srv_heupstream@mediatek.com, yellowriver2010@hotmail.com,
 jorge.ramirez-ortiz@linaro.org, boris.brezillon@bootlin.com,
 linux-mtd@lists.infradead.org, yingjoe.chen@mediatek.com, rafal@milecki.pl,
 linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
But now it is only licensed as GPL-2.0.
So re-license it as dual MIT/GPL.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
Acked-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mtd/nand/raw/mtk_ecc.c  | 12 ++----------
 drivers/mtd/nand/raw/mtk_ecc.h  |  4 +---
 drivers/mtd/nand/raw/mtk_nand.c | 12 ++----------
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index 6432bd70c3b3..eea0f903bc24 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * MTK ECC controller driver.
  * Copyright (C) 2016  MediaTek Inc.
  * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
  *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/platform_device.h>
@@ -600,4 +592,4 @@ module_platform_driver(mtk_ecc_driver);
 
 MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
 MODULE_DESCRIPTION("MTK Nand ECC Driver");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/drivers/mtd/nand/raw/mtk_ecc.h b/drivers/mtd/nand/raw/mtk_ecc.h
index a455df080952..0e48c36e6ca0 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.h
+++ b/drivers/mtd/nand/raw/mtk_ecc.h
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * MTK SDG1 ECC controller
  *
  * Copyright (c) 2016 Mediatek
  * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
  *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License version 2 as published
- * by the Free Software Foundation.
  */
 
 #ifndef __DRIVERS_MTD_NAND_MTK_ECC_H__
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index b6b4602f5132..3cbc25793062 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * MTK NAND Flash controller driver.
  * Copyright (C) 2016 MediaTek Inc.
  * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
  *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/platform_device.h>
@@ -1598,6 +1590,6 @@ static struct platform_driver mtk_nfc_driver = {
 
 module_platform_driver(mtk_nfc_driver);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("Dual MIT/GPL");
 MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
 MODULE_DESCRIPTION("MTK Nand Flash Controller Driver");
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
