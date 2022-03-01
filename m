Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A2EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jGc1pIsrchGaoxUDU+TFt8fWwHa8GrtaDLp/oNSGuM=; b=QAQlFa/7eKYr1Y
	Bsp7L263MD7hKHGtWiikjdK/uqLTU2HqJfpYgQgyQcM1IwhOlRRXcFUx+h7f2KYV94zWZHKhwAwr1
	ra2lb8eHYbqP2zdHQZemeYTKk1Zs1D+u01TRsO+c93URySiZberwq+TbAhtaY2OHoWITwV5Moq0F5
	anq6iOASyOG+CmM8CJZ3xgTAckA2ZeAg/HEPUJe60lDAzV6IdFIvkt+PDX7ERlcDBX4toIy4XSZiA
	UYOV219//9OMijw4cXJU2j0XDKhFO8jymQdxSfFRl1mj+P8T2dXSk/0xezZ77om6HOPnyzYxm/VFq
	E8fI7u+RsiKjJpT7mrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzFn-00Fwjg-4C; Tue, 01 Mar 2022 09:57:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzFP-00Fwdc-Co; Tue, 01 Mar 2022 09:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646128607; x=1677664607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gNF6iFjoLOMY/ds4qm6GXd4VBaZIAxXwG6j9UeqFsj0=;
 b=sZvJkGpugMuq6cpj3p6QQiiUVoZLL/rbZLs1lIgfv2nqe+FAAou6yoIF
 DyHSZUA57e2eunfaU/FfluUZ4b20WFzOi7+fRJCJJGGBjHpOP9CD/pAXR
 N3d/Fe1TWr4bMlnRYdhBQSTzVfJJq1SFEflYj0ECrG9KNm1p13pToVmaD
 UcyNJG27i4XMlCLQx2Bg3J0sJN4FnQ41S7LIuIXkTsvsipy9CmCQ0KDp+
 K6rouUlSLSnUNb164iCTm4iVRxM4MM3suOeYX7IA4R4Xl3Xa+aLlx8a3C
 ZZm8HtW4dh/z27BtrSLx+xJzLQmdjZ0FOV91ZRlZs1IXfHTB05sHo0t7w w==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="155241280"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 02:56:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 02:56:46 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 1 Mar 2022 02:56:44 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <heiko.thiery@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <Nicolas.Ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] mtd: spi-nor: macronix: Move set_4byte_addr_mode() to
 late_init()
Date: Tue, 1 Mar 2022 11:56:39 +0200
Message-ID: <20220301095640.313852-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301095640.313852-1-tudor.ambarus@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_015647_462442_72189141 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

We'd like to get rid of the default_init() hooks to remove the spaghetti
way of initializing the flash. set_4byte_addr_mode() is called after
late_init(), it's safe to move where this method is set.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/macronix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 45c2f2c50e56..3d0e34c9410c 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -147,11 +147,16 @@ static const struct flash_info macronix_nor_parts[] = {
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static void macronix_nor_late_init(struct spi_nor *nor)
+{
 	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
 	.default_init = macronix_nor_default_init,
+	.late_init = macronix_nor_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_macronix = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
