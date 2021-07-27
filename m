Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9976EC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:05:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFE260FE3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BFE260FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9LlfiXKBkzq3Vv2s1l/Cmup/wBtz9OsC6/VkitK2mY=; b=bAV2r2qZ5HsEhO
	unJhv3O8W4I0CM5GZ0EABjjt6lqUy7eqD/xByxVt3s9t2xomuxykOME+Pi9XXU9Zfyco/rqzuU5Fm
	CObjEFPLgAWUOb9AR2CU2N1vBBOeqNc0tRaoMjXjfs6X1ZEPKspbaH4Fiswotb3/uP8uPPvzYyUOE
	n/6kdP6ZxnoNTe+66BkQNQxIhDz84YT20oxG3YySW7uFXtjuN6IKtQkwLV/7xDHDz04NSn3hIB8qK
	qxtiG1i4AqdEh5hIYn8n79Pg7kbGPrucVT2EnX6tNP/aEr9Omct3QCklWByoelXSBtjm20wbsDGfy
	PyBe783WAlnJJXoTbBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GD3-00DXT9-MW; Tue, 27 Jul 2021 06:04:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6g-00DHp7-4I; Tue, 27 Jul 2021 04:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361658; x=1658897658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OQeQ2rKKd/hcEVSPOXJJh3XAVaCs3IGWXsqePC50tlk=;
 b=uKJiNXUbMtrhsJiyxH0XhdRplKlynwijxeRy6OkXAFJBx1LRjdW+GV36
 4ZOA3TTMW3W3D6nBOaMn1EHh7ThNGiBqUzr+bLkc0s9nZ0xPcrdyZU38v
 aKoU4ZOLaWCwkCvG2KRoSmWjJ/S0PAzmal6/cp+XwmfeLZfTHpe3X1H4d
 pONfePD1p+NUNPytZV0RAq4E0uoTiyx2RSU8yKthERajcJCOk/u9VsTe+
 i+SM2DM0O+Akk9Ayx9Do/M1x5IFwcK4v30ezDCK+aEx8W9qFpOfK3IByc
 e3Y5S5t8NohVnBZSjSUCelBDu2CMoOcowuKjK+pDKqDaU0i6XdGHh4I0z g==;
IronPort-SDR: 8gTCAuo7Ngm4K7EpFK72yAc/ythNoSqLFsqUTBHe6nIj2TqcE3CoXFHC2cNW+XI+bNpd7Ve/u7
 LvUGzUCmjuRxF1e3lgcT64QNEt22B+x/Yskai0X/9D/vqtfyFSX+zey9db+rDM/bBWtgICuJUm
 vt3nDNT5JpUb4dSOXE6GXRFpn3HYs6nsJ4IVN4y0MuHX4ntgAZ5fSJGD80leRkC2y+ZPE3pLiH
 tuXpH8LbOy4HWka5WnjvigcnLOPLAF+9tknQ3lM4FhWV9tdPB4fGkeoJ1C2mjUDPmWFdVbqBSD
 Wb0F8ZL0PndsJdhINt/M3Hny
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935478"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:16 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:11 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 21/35] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Date: Tue, 27 Jul 2021 07:52:08 +0300
Message-ID: <20210727045222.905056-22-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215418_273876_5618DB9A 
X-CRM114-Status: GOOD (  11.00  )
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

Used to init all the mtd_info fields. Move the mtd_info init
the last thing in the spi_nor_scan(), so that we avoid superfluous
initialization of the mtd_info fields in case of errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 55 +++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5c8cffb5e6f2..26acfc9901db 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3124,6 +3124,36 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	return info;
 }
 
+static void spi_nor_set_mtd_info(struct spi_nor *nor)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	struct device *dev = nor->dev;
+
+	spi_nor_register_locking_ops(nor);
+
+	/* Configure OTP parameters and ops */
+	spi_nor_otp_init(nor);
+
+	mtd->dev.parent = dev;
+	if (!mtd->name)
+		mtd->name = dev_name(dev);
+	mtd->priv = nor;
+	mtd->type = MTD_NORFLASH;
+	mtd->flags = MTD_CAP_NORFLASH;
+	if (nor->info->flags & SPI_NOR_NO_ERASE)
+		mtd->flags |= MTD_NO_ERASE;
+	mtd->writesize = nor->params->writesize;
+	mtd->writebufsize = nor->page_size;
+	mtd->size = nor->params->size;
+	mtd->_erase = spi_nor_erase;
+	mtd->_read = spi_nor_read;
+	mtd->_write = spi_nor_write;
+	mtd->_suspend = spi_nor_suspend;
+	mtd->_resume = spi_nor_resume;
+	mtd->_get_device = spi_nor_get_device;
+	mtd->_put_device = spi_nor_put_device;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -3166,32 +3196,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	mutex_init(&nor->lock);
 
-	mtd->_write = spi_nor_write;
-
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
 	if (ret)
 		return ret;
 
-	if (!mtd->name)
-		mtd->name = dev_name(dev);
-	mtd->type = MTD_NORFLASH;
-	mtd->writesize = nor->params->writesize;
-	mtd->flags = MTD_CAP_NORFLASH;
-	mtd->size = nor->params->size;
-	mtd->_erase = spi_nor_erase;
-	mtd->_read = spi_nor_read;
-	mtd->_suspend = spi_nor_suspend;
-	mtd->_resume = spi_nor_resume;
-	mtd->_get_device = spi_nor_get_device;
-	mtd->_put_device = spi_nor_put_device;
-
-	if (info->flags & SPI_NOR_NO_ERASE)
-		mtd->flags |= MTD_NO_ERASE;
-
-	mtd->dev.parent = dev;
 	nor->page_size = nor->params->page_size;
-	mtd->writebufsize = nor->page_size;
 
 	/*
 	 * Configure the SPI memory:
@@ -3207,15 +3217,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	spi_nor_register_locking_ops(nor);
-
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
 		return ret;
 
-	/* Configure OTP parameters and ops */
-	spi_nor_otp_init(nor);
+	spi_nor_set_mtd_info(nor);
 
 	if (!nor->name)
 		nor->name = info->name;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
