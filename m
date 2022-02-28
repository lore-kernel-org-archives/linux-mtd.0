Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9359BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRbG4P1QlMjL0UM7eUoZ+xeGczaCbWw5to+zoh4zvyg=; b=cR1UXysrxC4fnj
	En+7MPP8dhoakJisY0PfTaPVawA/r3HVVdBIM5IXueKJ+JjGc2b72Q80OVc3FFDu9g782KXOPNbAh
	HyWADCUZJCEIMWIr2Zg3Em8oNH/ne6REEeAXabDRlF6cjQtSdWCYxxy16TLTjQ6pEEOq/GdxGzihX
	VV1fJMXwwH8yIasRmgwkg4iS9zNv9RB9Ic6SkeCZNn4pjX5jJJYhAnxU4l7VHTOqfpNBT+Ri7Dja9
	6LBQHUAdZxGooDadDCbo83w5pRUNLZShP044/X8NMv5EQWBe7LJIz8zN+AU+UfUFUl1QbR3gN4s9g
	jVaYNgwy7LXUZHbg+N/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgMB-00CezH-LW; Mon, 28 Feb 2022 13:46:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgL3-00Ceag-ND; Mon, 28 Feb 2022 13:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646055921; x=1677591921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J/WuqtnG33l8BdsT5MMNAXqtTubyZUv6CjU6g24KWa0=;
 b=U8HBg+I/UeTP/A9IcLCJrO5kAjQjiSdvpyj8paayGbOl+dkKnU7qEL3U
 N7IPVfNH/Dz5Pmlv1nLVHymxdyOXC3fFonxGsoIl7V2t5R/lXygOFpSuT
 fnmrMV+xBaW75CyCzZT/Wghz/cIhvRhi0CRwqkxSyIgqckjiokvKGgMle
 nAWhWxm9MTE8sfjO+2mY81ls9Yoi3SkzX6vjDRKQkZaTgB6ZLM/TmOKQn
 /M5ub/UBf8tM7b4XPAdSC1Qt47cXQenWxIVxXUXGY0E6fCSZDZDJqQ+ft
 zhXhlUBC6uQDIRldaOgIzPFgrubr/N2PS4Um3T+CV7pMcKv7530j7fMZa w==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="155113054"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 06:45:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 06:45:20 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 06:45:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <esben@geanix.com>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>
CC: <vigneshr@ti.com>, <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <nicolas.ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between SFDP
 & non-SFDP flashes
Date: Mon, 28 Feb 2022 15:45:01 +0200
Message-ID: <20220228134505.203270-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228134505.203270-1-tudor.ambarus@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_054521_798417_443F856A 
X-CRM114-Status: GOOD (  13.09  )
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

A typical differentiator between flashes whose ID collide is whether they
support SFDP or not. For such a collision there will be a single
flash_info entry where the developer should specify:
1/ PARSE_SFDP - so that the flash that supports SFDP to initialize its
   parameters by parsing the SFDP tables
2/ any of the no_sfdp_flags less SPI_NOR_SKIP_SFDP, to initialize the
   flash parameters via the static no_sfdp_flags for the flash that
   doesn't support SFDP.
Use the logic the above to handle ID collisions between SFDP & non-SFDP
flashes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fbf3278ba29a..aef00151c116 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2639,8 +2639,17 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	if (nor->info->parse_sfdp) {
 		ret = spi_nor_parse_sfdp(nor);
 		if (ret) {
-			dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
-			return ret;
+			/*
+			 * Handle ID collisions between flashes that support
+			 * SFDP and flashes that don't. Initialize parameters
+			 * for the flash that doesn't support SFDP.
+			 */
+			if (nor->info->no_sfdp_flags & ~SPI_NOR_SKIP_SFDP) {
+				spi_nor_no_sfdp_init_params(nor);
+			} else {
+				dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
+				return ret;
+			}
 		}
 	} else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
 		spi_nor_no_sfdp_init_params(nor);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
