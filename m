Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC999C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF3060E8C
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDF3060E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uab5apweOEH0znDC3JYnwNsggGHSvxLMwpmNRQHCbeg=; b=lcuthtuLWt1wVv
	TQhzRK2O7zdAOhlCF5UntZeE84dfJVQ+kabEnRRaPSrlRK2UjG8QTtdKnSvNFvZa+cbWIWepfpcn2
	sy1RHK0ngSM4jB6aUJ557OrWMhXJN4L3YoyroPd6ZRi8+KB0Vohnn3r5/odh6POrjWVAMLHeFajFH
	D3KzQLOTJ2SnzQXV9oHQYvo0B50GqeOsoh4hiVXDToOXmTlwqUktO5Feqoh3heMDUtrIFyssjoNnv
	So3jZbGydXfQN1YBVrDMIX+ps1zsr/yvs6803WVI5SXZJnZ1GeGwHFY16NQk3ARdp0z3FKvXXzQrT
	lYSGXTbUnydyFYGYaOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWtf-00BqVF-Ue; Fri, 29 Oct 2021 18:46:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVgP-00BZhJ-79; Fri, 29 Oct 2021 17:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528529; x=1667064529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dgDbJZG4kcdLkHTz1u/R2yd56U45ycmMiFNEwaRnFIE=;
 b=OFQoCiSqjZCfShRDcPw/hr57eYhCqGBu3ZcGcsxqLBRKb1C1sRPjqTAE
 vSamdvou5oopdXvHfZito4wJXRW0ynrgsiKTfYPOjVuQMcfVXnzN6uLGx
 JmzZ8fA3GZLQJTwBRJtYTuhF/MtwjTDHqzZ+JpFuU/XlF8TNwzEX+OFHY
 fX68n2B/7mGlASUBFmNisUiaoPAFavF3laA5i/CIJG8nwX1zRZ4lJ/fV3
 KQWJjdrpZc7gIMnsUdbkxT5ASANYRB08071jqmnWlCKBAu/+uBkeA6hRM
 26yRmxZwleEmjqOZd74FOXwlT+Qj6HDxN7RKhhLKw/5VrhmPg1uvA18UV w==;
IronPort-SDR: rHhQSGgNXYXyq8m1zYnPW87r7yLPSyE0VJEMTj5VAX9sM+oKZlyrgw7Gp5CFqKiSvkivQ0KUXz
 i4FXPkhPCFWqVHUvqRX04RXOG9qTk5PNPpdZjJzizIbMo4NeJDHUgtjwEbkw4SmQ5EbPXek1AQ
 eiOWpWwS2O2H66kbgRuCRNTDkyjhpBQTfl860He1jf2QMCWRpSvcpJo5dWyWPDctELwryhAE+4
 ahYOlNio1rBhxmiRMSvbFz4Fd1LiP9EBQgSZFfw8mXKcsKoqWhdmpSLSvTYnQe532rAdRN+vre
 PjE+frk/1V8UxdrsnXr/M0dZ
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="74733059"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:45 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 25/25] mtd: spi-nor: macronix: mx25l25635e: Init flash
 based on SFDP
Date: Fri, 29 Oct 2021 20:26:33 +0300
Message-ID: <20211029172633.886453-26-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102849_361247_875D657D 
X-CRM114-Status: GOOD (  11.14  )
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
and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_4_4_4B
0x3e.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/macronix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index d0285e60092e..bd7b1d63783e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -62,7 +62,7 @@ static const struct flash_info macronix_parts[] = {
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			      SPI_NOR_PARSE_SFDP)
 		.fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
 			      SECT_4K | FIXUP_FLAGS(SPI_NOR_4B_OPCODES)) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
