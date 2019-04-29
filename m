Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25D1C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FA72063F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 08:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yz2MjD5L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FA72063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffFAxsvVJp2UUysvTtzBCC3WheGiofzVuaYr7qUUu0Q=; b=Yz2MjD5LISexUJ
	1I/wCp1SVxN76yFHxj4LkHcewDHtk9uPZlXHp7tP3ynuk4wrhC7xeZCbwvEvC+jHMiPN4kea3DHq/
	4k28b0PVqP7OY+gyV7azwGkg01vKSNg7pm5kau3qG3hWsdEBdRxGd6kA+xdEqOEjPUfUb6/Bxhoen
	czVcf8CB3Krt73GJjquH/klFCIHuyhSIRHUZat0ARz1p7F9n7YnM9tXuOtYDkitV6JJidn9vLV2hj
	yYUyz5KMF6ugWOPqLyIYhrNtiYK0uC1oTtppO9uuCFda2hFWSXfT+fmfCBUwESWo3sf5pCK7prYjY
	TaJbbIVHleSb5AxRCJ4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL214-0007D3-EQ; Mon, 29 Apr 2019 08:52:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL20w-00070S-39; Mon, 29 Apr 2019 08:51:58 +0000
X-UUID: c38d71cf063b4d2ba9d2613fa9ff3c50-20190429
X-UUID: c38d71cf063b4d2ba9d2613fa9ff3c50-20190429
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 147392293; Mon, 29 Apr 2019 00:51:30 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 01:51:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 16:51:20 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 29 Apr 2019 16:51:20 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [RFC PATCH v3 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver as
 Dual MIT/GPL
Date: Mon, 29 Apr 2019 16:51:16 +0800
Message-ID: <20190429085116.60081-2-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190429085116.60081-1-xiaolei.li@mediatek.com>
References: <20190429085116.60081-1-xiaolei.li@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7543E9F864FA6FADEE5DCA36AAB61F21531C2034102561E29FFAB9E7559BDE432000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_015154_451934_E12DE3DB 
X-CRM114-Status: GOOD (  10.36  )
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
 jorge.ramirez-ortiz@linaro.org, matthias.bgg@gmail.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 yingjoe.chen@mediatek.com, rafal@milecki.pl,
 linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It is allowed to use MTK NAND driver with GPL-2.0 or MIT license.
But now it is only licensed as GPL-2.0.
So re-license it as dual MIT/GPL and replace license text with
SPDX tag.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
Acked-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
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
