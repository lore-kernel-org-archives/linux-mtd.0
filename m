Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CDEC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:55:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 496F261042
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 496F261042
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2fvnBDAx4r5cD/GGhmyByHPofaTB6xdOKT9bN7TmaQ=; b=MymL5OjUYMPl5m
	zWg2D7TA8JvlrJFjCF08E9lMB82lV9hrGMQ8UtaSd7PYdrSYuGTYMHpkz05B2Y8lPtEubvuXk3iqU
	E+8inUqHODVAB3x1k0Lf6Nj8AGs2thBzORH7j6GhFQ6mDCoBlMWL//Fi35q1mYUx1sHc44TZl/z4z
	HwEPj2RORAM2/sbjD3VQfimBL1zGQFbrxOlALhkpEdsZnYYGsVcKi67Sv7/TEKCi+bHR9L+XsrBht
	AXE29e5ZJCbEieMFKL+mOqH0H4a4vhvk6PM8B17VgjALrIiN2md28XX0xilvDUe4vjiow94h0k/+f
	55r26wBFed0JJKJq632g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8F7f-00DI6w-5D; Tue, 27 Jul 2021 04:55:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F58-00DHPH-En; Tue, 27 Jul 2021 04:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361562; x=1658897562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6roB3jv3+3BTf7v5TlRyzhlr+56Le9mHFNgqovKmH/c=;
 b=Vc+gSu8Rf9M14orQOlCq8X87PfjZ4ja4dBOVVhWXi67VjHMLnzVTt17A
 4mUVgqoE5n6Iu1dIWyomVIiE0h6/6boMGADYEatXjWY4gBDe9nBa90A2o
 KUW7OI0yrUsTxx29pLuWEjT0kCCZ/x8uQiuc2K+rhC8xn86AUOIHwuiSS
 8uaLEH/MSIO1faEae3viBUClURn4yE3tqn3hqwZ2hFVK1zXbeRjkxdeFH
 qX74b52Ef5L5FIby+WODwC5jxhERWM6AQJhXsh1zP+LfLovGUYvyRkIsT
 ylBmNCbCR4W2m/EAZolZRdHAUMG9/jMxnF6x3uGulYqg0psmpod1ibNg6 A==;
IronPort-SDR: BkXF85cxN9O0jv/0vaHEiJW78HkHjyfvEcTt0rHF55X7eZWykQ6bd3tNa+RVY63lozh0L3XkcB
 IsX07uekgCQzYuNYofZwXWK+d/9NezoGwaf4b1vgpxwkcVyDRX4ZABNz7S/R0Gb0QRfT//v3gm
 mI+w2wdWh1npBDANJHYehSa+83JanmR7AYUc1TQ9thj6CGbYLhqAetu7hOD9D8XLFOXIHY3cjw
 Ksxt/Qy+jAZViTodbqHp1SL4UWlhvxfN2ydhREW1oZHvxEd4AnTgBlz0B/qMJ5CFZ0RgAU2j+F
 BRgA1lheJMznzb7lO0pQjepq
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935408"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:52:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:52:40 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:52:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 02/35] mtd: spi-nor: core: Report correct name in case of
 ID collisions
Date: Tue, 27 Jul 2021 07:51:49 +0300
Message-ID: <20210727045222.905056-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215242_582423_2A0076B9 
X-CRM114-Status: GOOD (  14.32  )
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

Provide a way to report the correct flash name in case of ID collisions.
There will be a single flash_info entry when flash IDs collide, and the
differentiation between the flash types will be made at runtime
if possible.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c  | 7 +++++--
 drivers/mtd/spi-nor/sysfs.c | 2 +-
 include/linux/mtd/spi-nor.h | 2 ++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3d9f3698fb7b..1a278d33b02d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3027,7 +3027,7 @@ static void spi_nor_debugfs_init(struct spi_nor *nor,
 {
 	struct mtd_info *mtd = &nor->mtd;
 
-	mtd->dbg.partname = info->name;
+	mtd->dbg.partname = nor->name;
 	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL, "spi-nor:%*phN",
 					 info->id_len, info->id);
 }
@@ -3208,7 +3208,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* Configure OTP parameters and ops */
 	spi_nor_otp_init(nor);
 
-	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
+	if (!nor->name)
+		nor->name = info->name;
+
+	dev_info(dev, "%s (%lld Kbytes)\n", nor->name,
 			(long long)mtd->size >> 10);
 
 	dev_dbg(dev,
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 9aec9d8a98ad..017119768f32 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -25,7 +25,7 @@ static ssize_t partname_show(struct device *dev,
 	struct spi_mem *spimem = spi_get_drvdata(spi);
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	return sysfs_emit(buf, "%s\n", nor->info->name);
+	return sysfs_emit(buf, "%s\n", nor->name);
 }
 static DEVICE_ATTR_RO(partname);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f67457748ed8..bd92acdd1899 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -369,6 +369,7 @@ struct spi_nor_flash_parameter;
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
+ * @name:		used to point to correct name in case of ID collisions.
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
  * @page_size:		the page size of the SPI NOR
@@ -399,6 +400,7 @@ struct spi_nor {
 	struct spi_mem		*spimem;
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
+	const char *name;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
 	u32			page_size;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
