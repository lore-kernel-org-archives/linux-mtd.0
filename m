Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D4DC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9735610E9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 06:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9735610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fa/oYpVj+3dFGW5hIVhD2FdfsmnPLmO7ilBnvECu7A0=; b=TKJhiGmSDYl2dp
	zQx77hW9cQPqkiOcajcV47RMxVo2Y5GTzSC//zgQK27upHUEd9ciML6vCB29IXF5nijjKfqSO61Sh
	csjKu/YYsjIAaQBaEFpRrExtb3Qdg3N5Myo74HpCflhtoi8yykum1bbySZ9zBFXtwIMKLweQGhaiO
	9A3JjPRp0FKo9E/uuyvcYqbMe4ZEzgaZ/bbAu6D2xLuej04WN7CJI4SIXRz1i9+rqVB7IVVpvqKv9
	Q/S6zb2m5Pg2yz8dJ5J0z2qMIM2oxV75yTZn5zYejV4o2UVJHexCYS8l9fG721PdnIzcGhoDR14JX
	YnUnsRhm6HCWmFcDuQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GGF-00DYDn-2a; Tue, 27 Jul 2021 06:08:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F6k-00DHp7-Q8; Tue, 27 Jul 2021 04:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361663; x=1658897663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=veVf62Z8aiUAdiv6mgEpUSiaV4PssLJCIenAVWy7Py0=;
 b=rrIkFAShoEaNzrMgzszEGPfSElZj55FuCr1psahJf7YmUzFFA9/WYui3
 ZYz21jw6GfR7jp1oOXnO96VopzkcE6cFxqKqOoHNptr9JIg0OqOxJWWKm
 RKnh5NXomSIpBdNHtCEl/AGJO8XJXrMuYd+Ce/svuhRSjkkzMacS0IE9d
 ieJNRqSTFr0Il3i27CS3l1EbLRiJ6jU5Pe7LvMGygB98Q7u0jy8fO2K6q
 dFv46FAgYq3/4haN8qe7TrKG+ISzEJssiVk7cLWJoB31DV1P8pv3a/PqT
 JEKXYELDixZN/ojIdqR9GUp3J4VdABmG3dY082K0/lM7musEw+VtZIHEP w==;
IronPort-SDR: n0hEuQ63hg1LhGthVeuVM3rqpKGMoCBlku2ZZPhsAXPjwIdc6MKCATpeyEFMDZgF2JkyXrvFWk
 URM52TQzqrb40jo67OraXMz0NOxFqnKtdvDLg9j5uShktB2+3hW9vILlRbn85jG8e2dJ09rsPa
 4kbGDcIBPOPe4YjK+mO25uBdMluch5e7bH6WHx9kWBO+JqFv2Yy/ubULuSfJAJrDYnMwEk5EII
 joN60GyU6c2aGq+8YYXWmG6pyjr4XlI+iUSSRkUlFGtD1WPdh7p/LwtDL1H4FELld+E9p5Mgop
 E7i/xFIBiYAANdOigRkod72S
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="129935490"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:54:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:54:21 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:54:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme for
 setting mtd_info fields
Date: Tue, 27 Jul 2021 07:52:09 +0300
Message-ID: <20210727045222.905056-23-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215422_921136_2D574E46 
X-CRM114-Status: GOOD (  12.82  )
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

The functions names are self explanatory, get rid of the comment
for the OTP function.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 6 ++----
 drivers/mtd/spi-nor/core.h | 4 ++--
 drivers/mtd/spi-nor/otp.c  | 2 +-
 drivers/mtd/spi-nor/swp.c  | 2 +-
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 26acfc9901db..72dfe6274041 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3129,10 +3129,8 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	struct mtd_info *mtd = &nor->mtd;
 	struct device *dev = nor->dev;
 
-	spi_nor_register_locking_ops(nor);
-
-	/* Configure OTP parameters and ops */
-	spi_nor_otp_init(nor);
+	spi_nor_set_mtd_locking_ops(nor);
+	spi_nor_set_mtd_otp_ops(nor);
 
 	mtd->dev.parent = dev;
 	if (!mtd->name)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8fddc685d2d3..7fb0cfabe85a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -552,8 +552,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
-void spi_nor_register_locking_ops(struct spi_nor *nor);
-void spi_nor_otp_init(struct spi_nor *nor);
+void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
+void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
 
 static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
 {
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 983e40b19134..fa63d8571218 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -480,7 +480,7 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 	return ret;
 }
 
-void spi_nor_otp_init(struct spi_nor *nor)
+void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 8594bcbb7dbe..1f178313ba8f 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -414,7 +414,7 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
 		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
 }
 
-void spi_nor_register_locking_ops(struct spi_nor *nor)
+void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
 {
 	struct mtd_info *mtd = &nor->mtd;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
