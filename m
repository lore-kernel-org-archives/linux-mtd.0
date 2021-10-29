Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742E0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:15:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD5960FC3
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DD5960FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klrghhaa6bwZfYtOu1quL9Tdngs33iXR/wdP7rFXJpQ=; b=RXpVZjoXvlCAYp
	vJYEbbW3X9zUeH8cnffl8bzuGoABQKDKQAeYDG4egOgQWodDHkdYqb5SgyiyoH/pKRy8mEgxkBbr9
	LlmlrCjS1uiltMhLbpc7rgtRU1Av+0rT0bDYZPwBPoU68O2AObpuG0ZLHjO0fpSx7oFYuHcoFQ4UI
	GsLtHufFiztr7pSLJPBnLML99ma7zuU5U+zT5eWJ8/Az8uPMjZLt1Bbx+WTvRr4egc/7HEZTGvFS9
	noqhin5SIVFiafW8lGiV5jeEaoDRKxifFA39eid2is038TjiCLfjxTahCNPJ7eZ2lN3WK8upbCkTx
	1J7KBzMdxnHONm90Zt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWOf-00BkBJ-OS; Fri, 29 Oct 2021 18:14:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVfj-00BZRy-0s; Fri, 29 Oct 2021 17:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528486; x=1667064486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KwnX7jqluatCC2YzmoEJwQeYhXk47D5Mn7NQ5pTF3VM=;
 b=J95P7wbWFoPTGZaV33FLpyhUIX/OvSOlZ5jBAiJKiWRt9kARFUBZTGXS
 qOlcs46cSdV2NzhbPMTDoicIcZwzpRJYbXA3wihwBwL6hpV7q4vJ2/RiD
 ZvyA1Tp9lSTOr4t1eFhtV4DKZ93CKDgD2VB73K6aStwm9ssgh4FWDubo2
 M9NIhwRQTEwTuLuLRgvOUrkEiUxfXrW0oUh9pqlRHW76oBrTjnzu7iyT0
 59r6gLu8PY5IQ5yUGR3CDoOkW8Xxu8nGZ8k5kG46aAnjUVg/bj5kNEoLl
 xRaw97DCWr4Mb0pO1AwmP7+/uJA0Hv57FhdLEDmG4kFhsvPLl6/svFLV/ Q==;
IronPort-SDR: df8ut26ug8afTvTCibQK+3MJZueh4bjiu30aoAX4bGL/hV8sWh1HLqpsBW5MWGYAtPdOedjF+q
 X6iQM6xG7IE3XRscL6Q/xH+d2jmCiAqZr25g1bDjGpyjSljC4LBIRBCDrB4zTJgFWyTYtQ9KJu
 cQqL8i4HXj3j0c2Q0Pf7HCL0mHCOGHOgmCiJpAoa3YiZtJnXVywKPks/NR89l9sryyNZNdLo+w
 zrwUrqh5kQT2PCNzMYUWG3ByoL4pXgUjZsqfUL1XxiVzY66XieycxFQ1RY9K/BCKCVdOWhz8TI
 ncAkg+NMcr63bPmgG3LHTVWy
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183657"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:00 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 17/25] mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
Date: Fri, 29 Oct 2021 20:26:25 +0300
Message-ID: <20211029172633.886453-18-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102807_159213_4E242A74 
X-CRM114-Status: GOOD (  15.20  )
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

SPI NOR flashes that statically declare one of the
SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags and do not support
the RDSFDP command are gratuiously receiving the RDSFDP command
in the attempt of parsing the SFDP tables. It is not desirable to issue
commands that are not supported, so introduce a flag to help on this
situation.

New flash additions that support the SFDP standard should be declared
using SPI_NOR_PARSE_SFDP. Support that can be discovered when parsing
SFDP should not be duplicated by explicit flags at flash declaration.
All the flash parameters will be discovered when parsing SFDP.
Sometimes manufacturers wrongly define some fields in the SFDP tables.
If that's the case, SFDP data can be amended with the fixups() hooks.
It is not common, but if the SFDP tables are entirely wrong, and it
does not worth the hassle to tweak the SFDP parameters by using the
fixups hooks, or if the flash does not define the SFDP tables at all,
then statically init the flash with the SPI_NOR_SKIP_SFDP flag and
specify the rest of flash capabilities with the flash info flags.

With time, we want to convert all flashes to SPI_NOR_PARSE_SFDP and
stop triggering the SFDP parsing with the
SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easily achievable, the rest
are a long term goal.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6f7978e7a46a..40d98ae300ca 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2805,7 +2805,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
 
 	spi_nor_manufacturer_init_params(nor);
 
-	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+	if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
+				 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
 	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 1fadd0e74103..9dd8ada65f0c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -334,6 +334,7 @@ struct flash_info {
 	u16		addr_width;
 
 	u32		flags;
+#define SPI_NOR_PARSE_SFDP	BIT(0)	/* Flash initialized based on SFDP. */
 #define SPI_NOR_SKIP_SFDP	BIT(1)	/* Skip parsing of SFDP tables */
 
 /*
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
