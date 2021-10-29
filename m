Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE3CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:35:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1931F60F38
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1931F60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15Guk2nQpKGAGc6NF/1bg0eLeYkkP0qY51EZ1HFEVM8=; b=EpLfKRKQTrnxrH
	LJ7qjEkpMKTBMJ/H65kpg6QuSdHR3wRzAqmGFaSUk5EQl+bKf8SEqWxAhT0U8V42dDF/a9DU0o+ke
	kLgskfkRkIeNPKcV0CuRJw4fk1jNE68vxJDKuLlUSFp+Uaq4brYTrefgVm1O6vHSi+0ef9+2MnXSU
	l87SIyKlYvIqT+7ApKRE5S+ezcPed2xt/Dx1uaTrqPDTkU6XrPbegYEYlgXQFYHeSrGPbddVnn5tZ
	WRluUfa2IMz3o9ZvSSMAmi2U+HDKrLVp8ZMsBVIXyX4uSM6CYPpHeqsxzUqRhStPHoOgbo/OGN8FA
	SmSCpGySX78GKUSs7N7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWi8-00Bnuw-CJ; Fri, 29 Oct 2021 18:34:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVg8-00BZZx-Vz; Fri, 29 Oct 2021 17:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528512; x=1667064512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lVu3fuD6XHyxx0ZC5r3xltTupTYeSPb0lzeW/eaqSaU=;
 b=JlRzGqWalV38CO//o9RjBsJ25FOMsgrl7YQxymtIXK3jWukHPbnrfunM
 pqi7PtZmlOj3HwsnTzPqkvUP1ew3+3TgiM+GUIhU1muhNlg7EsBoFevJ8
 fPVSRWWIdWXnByzpKozNZ/UPkNNhgkGUZX9626Dm1FBPwlZU4bMk+DMgj
 55sTyp4y8qLQsHG8NcYis7Isq9l+Ppz6ZIwLNLjY6jaTwid1KK4xzALdw
 aAwoU+sgyaoER/eoF8d/1jyza5//91dgz20RmXKHtEg0akpS5SeXIedxB
 EwsFnU1AStKW2nLyAcmJQ8pdPykrWnoaz00qhuRwSy7gzwuFCM4f3prpt w==;
IronPort-SDR: +/WDkadnerL1B+mUJKlI3MNqN2RoYw4rYh+Gihn7VPxw9RMJnd/+pn2DCyKquo8rqogzP2NkYw
 cW+iJJ2KPwSs75UKxuQN1tl+S0dC4HUdccdoTavhsr2oO73GKWgTYEYYvNl4ynu8XizWojj3PJ
 PoSlwlkCmkj5lB/aeL1pTkc8FI3R5xPsX1o6dSj7x0C5gnPRBQiFN1oiA+7Gse1sgWqE8isQYR
 N04TfnGoRC6fTXaCZFc+BXnU+qOFxZFB1/dzv0DcDOrBzlDOTQSYL5HMExSQcyiXHzcTWoEpKh
 3MpqAWizpnXrdUOj5LE1EzQ9
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183742"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:25 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:20 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 21/25] mtd: spi-nor: winbond: w25q256jvm: Init flash based
 on SFDP
Date: Fri, 29 Oct 2021 20:26:29 +0300
Message-ID: <20211029172633.886453-22-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102833_082717_2DDD75B7 
X-CRM114-Status: GOOD (  11.09  )
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

Get rid of the static initialization of the flash parameters and
init them when parsing SFDP.
Generated a 256 Kbyte random data and did an erase, write, read back
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index dd4be0f78e67..fd65fa7a5d94 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -95,7 +95,7 @@ static const struct flash_info winbond_parts[] = {
 			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 	  .fixups = &w25q256_fixups },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+			     SPI_NOR_PARSE_SFDP) },
 	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
