Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0F6C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 219C3610C7
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 219C3610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wpj7m+pWieFrp9erfVmn6ogE5sunRRFKmZLRPjk7QB0=; b=NET3hVNLPL7Llp
	uEvDJe4+8EmX0HhaqMTcIRdzlqOowU224dkE4h4aKQZ/NDKyuDFzUd9XCfxJkIq6/CzzGxLvNOPHC
	Wyd5ux7h1NckLKIrlgB1LA8N8gp6l0krRBFqSmO2FTK1pJcNYPoJ3/DGx1b8heeuylacaNKOMKHzX
	s5JRYag6qD3U8AJPUmXXbhjI276FI+7eO10UvuwkXlwmx/Lcvc0E3yhrbL0lgNQTzx1Pa9sOPtOne
	c5yOZV3M3yO2DitAiYlYzz7JRtLAzTssGZ+W8RCl8zBo4icJWKmCxXwwnvLi5JgIZWJcf1AuSpVzA
	3V5Xs7lVta5yVCByLoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVfY-00BZOH-KL; Fri, 29 Oct 2021 17:27:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVeX-00BZ7Y-S0; Fri, 29 Oct 2021 17:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528413; x=1667064413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fTcydzr+XZ4xzyNpxCj2JTCM8iLdC41X1BbtW8dd0fw=;
 b=FkvzHyxYo/1U9FZHKY7HuTNdXivxEO9l3ldeoUXuupE3ym3uUuFBkTYQ
 5FwhydN4LBnIsU0+17OqDOJoS9rX38kidAlABypRMsVyRzGBqJpSNL999
 G83uujXk9bZdzZLK62hPWDOT/8SuqyxFHYI3VQlAfv51jsvzMaxmP57bi
 X84Vv9D0uGTAzppZMggOCuTGekuRWQlRe4ToGDsTCRe534e/9ss/OipI6
 2UFXHZkJEX+v60wHI9geTFgxoUUxC2bPCSGdAIVpjAjbYLa90epmq3I4G
 Aypjz/fFdK0H7Ki9z4IXCa8G3x4mJf7EAIaveFZwxdUJvq73zHKu48GuC Q==;
IronPort-SDR: 1ENxpAd9xDeFc5jlgyzMWXtPrYN+gTBBXYkDHIs2Gd23FT+BhR+luBhD2bTgKZBainnKoIiJy5
 43N9Ngm6ZJlMDbspCY0dX4JJaGsb7AO5G49DiVBEDGp3ujsjhkGNYSQSrg1ib0nqEUbxB3vxr+
 OxMYi6Hlwxv+PmVNV78QeHGuTo7j3B5Z0DO1ZiAur701iy8Wdpfl0QR1npqQlG0z8RGl0ooBa1
 OkCf3Tkz+nf9aRcZNzMFsLyG5gDECmlmTssSt7WXdrMh1T6jVevqp/iMpA2kexBYrJLk0pgWG1
 yS3XwvYxRIc3fuEV5Oh94+6s
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="150063280"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:26:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:26:49 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:26:45 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 02/25] mtd: spi-nor: core: Use container_of to get the
 pointer to struct spi_nor
Date: Fri, 29 Oct 2021 20:26:10 +0300
Message-ID: <20211029172633.886453-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102653_939981_9AD3A243 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

"struct mtd_info mtd" is member of "struct spi_nor", there's no need
to use "mtd->priv". Get the pointer to the containing struct spi_nor
by using container_of. While here, make the function inline and
get rid of the __maybe_unused.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 1 -
 drivers/mtd/spi-nor/core.h | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cc08bd707378..277d1fde84c8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3134,7 +3134,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
-	mtd->priv = nor;
 	mtd->type = MTD_NORFLASH;
 	mtd->writesize = nor->params->writesize;
 	mtd->flags = MTD_CAP_NORFLASH;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index da3fd3636d3c..223a03769950 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -551,9 +551,9 @@ void spi_nor_try_unlock_all(struct spi_nor *nor);
 void spi_nor_register_locking_ops(struct spi_nor *nor);
 void spi_nor_otp_init(struct spi_nor *nor);
 
-static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
+static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
-	return mtd->priv;
+	return container_of(mtd, struct spi_nor, mtd);
 }
 
 #endif /* __LINUX_MTD_SPI_NOR_INTERNAL_H */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
