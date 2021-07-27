Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E256C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:54:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181B261078
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 181B261078
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4py8lFh+WnpTz8kJYjlT750Cq/fqdpS2/Uwkt5SAfs=; b=PhRtOOVIP3Poi3
	EGxL/t3rq/cUTOzNsUe0eFyUYRKrbdCOP0/+ZfRIT8ScYteX0GKA+ielD86oeubeFtSgqChJC5zG/
	hMkV+yD902YmLUmy/YygnyJ0GaVMLv4rTyUFf18hMWQydiUIIWs8Ff0BGfhElX3wvv/kqckdz+ePr
	VUpxnao0UvUg/K52Kd7ew833ojvpJoNBYtEXILh2aCCdfVgSKDpTXuNGkOgstw9Yp3xJK8C/ccYe1
	Vlcy+IvAJppAB/OmxIBDXFqNYWB0s6MAceI8QWi/gTWy3cy0KKce9aHCyD8xqqjRHzevjXvEWH1wC
	UMu0zYNR6jOlSmzhH6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8F63-00DHdv-C6; Tue, 27 Jul 2021 04:53:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F52-00DHNg-Jz; Tue, 27 Jul 2021 04:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361556; x=1658897556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KwrvnfvQjSCqvGkjRSxIvckxcUAqvwi0R3Sjw3cBkmA=;
 b=0kp2l65Y0boveiRhiZoUPpjQxBwHpsVWrXLkr7GoC10X0b9gScrh9jm6
 frBDV0MeOiqj4irL2GBW+AL5NLFpUIhJMeFKLJnlB6hE2uCYHZPdOd+6o
 7GFdSO2r9CGZ59p7LEAp4vjeTZs4+nduBmFjyaUAMOJOW4F57UxV+eDPV
 7pvFVvxJU78nQ2CnhT9cTECWA79CLtT9hfu2mvtU1DwDNusvX562NPDrZ
 x3nowW13Q32tKMrjZ7kxb/RZ7/vvk9POywRrpnjuIdhAjb3ZOJVJr8ll/
 XehhnKRVGyCQRr3jPqRCvnY25ZdFlbn8z57Hwvbf3KgjVdDDtfagqWInl w==;
IronPort-SDR: Z7MS2DBj/xIkjNIyZTrpX3VUbANjjKTb9NtmnAh0LlOiIN0ipBI/oxkYeIi7hT+vlV7yHK/1tv
 mt2Now9S812k3RfwwaSo5F1/tpaa5cXFCb3SzRqXio+umaak2uJCI5muBeR0HSGRdbEy1IQG+Q
 rcSMItm9bHlXEpN6Bg0XsAhEDDen716txL9/kPKqX16oNwZjI1z6EP6liHqbqtpbXGoIzxixcr
 IgyGjIWi0D1sACGoe0i8K9wTuTGJuFhU0+e3XMW90dlUaFzonuuSPRMgkcLF66LcSc9IKCfKjk
 7hsTga5YkW/zsiPb5iu/JiZT
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="130482096"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:52:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:52:35 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:52:30 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 01/35] mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
Date: Tue, 27 Jul 2021 07:51:48 +0300
Message-ID: <20210727045222.905056-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215236_750272_2D5B6FFA 
X-CRM114-Status: GOOD (  15.37  )
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
