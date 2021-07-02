Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D93C11F69
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673F8613FE
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673F8613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDAZvuxH1yn9v+rOpEMMwgfl48nZ1XTzirNLMkqVgFc=; b=iN1C25L1hQJhO8
	QiNdQ0NBo1acH7cTZT1e3cFivG7fnLsAI91z9WJkrS2KkcMeOiXQTGzQ30mk+MaAPG7DbmHggiUEF
	vn4DWawLRGP6i/p/PXzhim6WNZcXDLNfldmpSvz9V8SAPZyL1iyLo+gTKCVITlvxP3JgXEgL6F67a
	vTOj4oq2HFm4UQjpBSu6rKbO/fbEUkfZZNxe44Sesfn0WdK18SeHMNAPq2cazD9Jaa2NzoWWHyvpM
	jHCTjsGYXr8C1kh6uJ67GARdvkiOuCVIySGFsaqaDHfon7zYU2M3LAokTi/t7/7jsTPhyoTwpGhHt
	AkujOGBKNlo1rxxquCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKMM-003HZv-2U; Fri, 02 Jul 2021 14:41:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKM9-003HXs-61
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236885; x=1656772885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/imY89DZLDG1KRu8xotZ6z2LJ1EbbTa5LUuP0kfEfNQ=;
 b=10FtDu1cMZ7tRRT1UNup6/tkYzWc9oZKt2EZIlXUIIerGif6fAfYIXiV
 J9uO/U5USyZPufntUrirllbAru48LFVI1N5USbNQXY0jzwfH1As30oR0A
 C7ItnNjESo6UQns2iKqIoh9j5r+uOM8dUa+d7UEDXb+mlnse33Y4hj3EZ
 iJ5yWybH6Ig3FIxOBwf7hmmH49pkW85cj1wQsXQ7ikY6l8H/3lnNVdSZo
 fKbL0tamceGlf0apOpc4QJTt95pbj6QLLH9Ftd0TE9nEymqjRLxJRMgrT
 /amJnDQMraOVxpMTRoaB1dyQUuyfjk55IFRonKJ/yqOnP4d048T47M53a g==;
IronPort-SDR: Kn+Zrkf1FrFycurQJ/uwqx2cYe8Q0p0t6amgiPo8b3InKa0uypefOhntun4VXCAxP3oxvWCIhU
 VobmFGXXU3J/psmmVUMPtE9oBB1IFKjJZpehujUeLbwJqVnWoiIyUAbkG46R6qvzdhFX41PB5n
 8rLravBii24vpsq+HYFGlzEzaSEKbdG0Akm5SpnTOwu77KQfUmjrGKSZqKiVY3q5FMHtmpsEYy
 r/FUTJbpNE72kyAZ5Xy84k7T+1NJgPA+E1w4R+KOa00rv3P5zfXaov/va5SprSC4jIvgpdXdfa
 COg=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="123330203"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:22 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:18 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 1/7] mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
Date: Fri, 2 Jul 2021 17:41:04 +0300
Message-ID: <20210702144110.250481-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702144110.250481-1-tudor.ambarus@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074125_331830_AE0EECDE 
X-CRM114-Status: GOOD (  14.85  )
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

SPI NOR flashes that statically declare one of the
SPI_NOR_{DUAL, QUAD, OCTAL, OCTAL_DTR}_READ flags, and do not support
the RDSFDP command, are gratuiously receiving the RDSFDP command,
in the attempt of parsing the SFDP tables. It is not desirable to issue
comands that are not supported, so introduce a flag to help on this
situation.

New flash additions that support the SFDP standard should be declared
using SPI_NOR_PARSE_SFDP. Support that can be discovered when parsing
SFDP should not be duplicated by explicit flags at flash declaration.
All the flash parameters will be discovered when parsing SFDP.
Sometimes manufacturers wrongly define some fields in the SFDP tables.
If that's the case, SFDP data can be ammended with the fixups() hooks.
It is not common, but if the SFDP tables are entirely wrong, and it
does not worth the hassle to tweak the SFDP parameters by using the
fixups hooks, or if the flash does not define the SFDP tables at all,
then statically init the flash with the SPI_NOR_SKIP_SFDP flag and
specify the reset of flash capabilities with the flash info flags.

With time, we want to convert all flashes to SPI_NOR_PARSE_SFDP and
stop triggering the SFDP parsing with the
SPI_NOR_{DUAL, QUAD, OCTAL*}_READ flags. Getting rid of the
SPI_NOR_{OCTAL, OCTAL_DTR}_READ trigger is easy achievable, the reset
are a long term goal.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 drivers/mtd/spi-nor/core.h | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index cc08bd707378..3d9f3698fb7b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2726,7 +2726,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
 
 	spi_nor_manufacturer_init_params(nor);
 
-	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+	if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
+				 SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
 	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
 		spi_nor_sfdp_init_params(nor);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 3348e1dd1445..55fceb0ec894 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -382,6 +382,10 @@ struct flash_info {
 					 * protection bits. Usually these will
 					 * power-up in a write-protected state.
 					 */
+#define SPI_NOR_PARSE_SFDP	BIT(23) /*
+					 * Flash initialized based on the SFDP
+					 * tables.
+					 */
 
 	const struct spi_nor_otp_organization otp_org;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
