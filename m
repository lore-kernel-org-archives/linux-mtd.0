Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A94C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHGxOXxP3Yfi0Qz1cxaoFb7fGyA6FuDK0HxUv/v9MbI=; b=EImZx276t6FJ4c
	DlihUn/zKlBRlI2p4WL3qNE5d29I2XR/yLkcGhAfVUy8+lfd1NsnhZ4xA5tLOh51OYM9y65Ke62wC
	epkFHkORsaxcOce80lmFOjSYiUVb6pI1QSX+hmTrAJHlBIddQPByom30rK3qCkmwSavbIekia6IYv
	qw8v5WKcLecAXSEG7gf1BuYHtnL/Jw8HTehvKtEOnxb78m1EsWng6FdqQ5RNFvJswDJDidELBBRbB
	xqxyhpprVcqkwOMFuXH8MsHdV0a5Bk99lMJqZNgxNkfvU4NmXC/HnrytJZTvfNsu0Lm4z/3nz7Qas
	8yKQeQsNHTj1U3XmOhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgLN-00Ceg0-If; Mon, 28 Feb 2022 13:45:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgKz-00Ceag-F2; Mon, 28 Feb 2022 13:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646055917; x=1677591917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VrrZ+KGenArnCpqI9TOTAE/3rDVOVu2isEdcFVmKnR4=;
 b=H1w1nRpAk2+7h6Nfd2DDNlI2REZ/zstklwaWxwajTjF/vaICt5LIWcHG
 z/drykqOCTzFACxwEw99IgE9oxZTt6Q+5WpBgve1DxTfUOUt35Z6jS0pE
 /zOHyyLcnXAt+FWlJFD+zuM1KCp/RKFgcP0PdkFl8zzAM5Fje+kod8Ev3
 UBWzsdAuN3zwvAJYfUx5T5RHuDA+I8xIB5HcB3MtMeJr7YlP4KmD8jSsa
 xH7dmiorty3Ik1rXK1CPQ7feuNjzEeVxchtM/RY7KuoMHe2DbChCF7ik4
 EFEHK2+YC14/WnA8XY3Nd949oslVlemVa7nhSQ/ExFCH+KDMWhS2JDXhj g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155113048"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 06:45:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 06:45:16 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 06:45:12 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <esben@geanix.com>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>
CC: <vigneshr@ti.com>, <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 1/6] mtd: spi-nor: core: Report correct name in case of ID
 collisions
Date: Mon, 28 Feb 2022 15:45:00 +0200
Message-ID: <20220228134505.203270-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228134505.203270-1-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054517_550104_A77F402E 
X-CRM114-Status: GOOD (  13.54  )
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
 drivers/mtd/spi-nor/core.c  | 5 ++++-
 drivers/mtd/spi-nor/sysfs.c | 2 +-
 include/linux/mtd/spi-nor.h | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9014008e60b3..fbf3278ba29a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3026,7 +3026,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* No mtd_info fields should be used up to this point. */
 	spi_nor_set_mtd_info(nor);
 
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
index 5e25a7b75ae2..449496b57acb 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -351,6 +351,7 @@ struct spi_nor_flash_parameter;
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
+ * @name:		used to point to correct name in case of ID collisions.
  * @info:		SPI NOR part JEDEC MFR ID and other info
  * @manufacturer:	SPI NOR manufacturer
  * @addr_width:		number of address bytes
@@ -380,6 +381,7 @@ struct spi_nor {
 	struct spi_mem		*spimem;
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
+	const char *name;
 	const struct flash_info	*info;
 	const struct spi_nor_manufacturer *manufacturer;
 	u8			addr_width;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
