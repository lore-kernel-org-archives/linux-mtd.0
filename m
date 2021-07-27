Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2E2C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:05:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5CF610A1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D5CF610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ks4dIpSk7A37rWPYE6CceSdob/wSUY79KFjj8Zg8TXA=; b=CFOWFIn4PDDr4a
	47PVzeM+UXMtGK9+ZfG7dXOX/hjmaWdSD9CMQ2bQQf2Gys0M1TYVIALvBNp2uNGOQ16eUsILE9TYS
	qvi5Cjqj/E14Ne8B1LonbkRKUsWfUKSMUTDcEbWMFQqUfe+8dLg8LLc/5dkgnZMDU6pUXS/DCY4vp
	GYrQHpH24phnl4k2DLheGIN5//tfW+7LDY9AlPORuDNR4uKgUo67RVrUW22s5OlevaHoucY9Civnr
	q3/zSY0x9Qa4WYhyPvtzKgbNg5wcwJe38/jVbssBhpwg74uskw3MrDaKtzdCoGxSHvXvnc6m6qg+c
	bDO1A4RPgLUzQW0MzwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FH7-00DLSu-DH; Tue, 27 Jul 2021 05:05:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5X-00DHVh-9v; Tue, 27 Jul 2021 04:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361587; x=1658897587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FnW9fxzApB6BxAtUcw3xQI1N0ia6iSLV+WDV+VjMt9o=;
 b=wmDfMyA8WYM4bqHl9gOMhygMw20X+BLq1WWYAj1ZGxPzlB9b5Zhh6n5X
 Lba4uTFYSBoxtG9lIkcwZ1CfthHRCflF6u9G5Oz9S+wIR5NbkQhrf27+d
 Wq7i1MHeeRzhVAz7xRQN7UcmwmMiLPjzUAvDbEJooCHaRA7qIfxtOo8aY
 eW6QaLvGYm7DGnA1FFYmy5fxjaeIOEN/Dw8pSOlGUuBy5QyvqrVxazp5Z
 snkBko9rcv6bUI5yH6kzeMII8nqYBklrEpq+bu/k4kB/RMXbJsDzQ+kbL
 oBOpmM6q8cbtSfsw4EGCL0XNLEYOZoPQjDEhX8H26EID5u39LVGOT3ZAg w==;
IronPort-SDR: dndfBDwKSBX5Dp6qJbekKs8oANBVVxVtZR9UicEtlf09Dq3ZrdaHCgoXCWwcAuXPPOL2dG/6Zy
 9zJSAUBi5oSVhed1LMjng5SthYzu+PBsk78Mu7iTrwaltE2KpOI/YnUB1TpUo5eJmkuibGmE4J
 Se98teMqTnVChSXAtxqGRtGUNvEqx9c8yk1pq+XFb2pa62DJmIt4B9UtZvQ7mGYWQHVbPQ5FkP
 +hiHNFZxPwq5gV1AfcQFHdl7Ow1vc69NnDUrumghHrshlWMguuMh8QD38by+wuh1LLni8RS1qe
 YJUrmSh90+WjQ7aMXXTTEt2L
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="126054976"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:53:00 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 07/35] mtd: spi-nor: manuf-id-collisions: Add support for
 xm25qh64c
Date: Tue, 27 Jul 2021 07:51:54 +0300
Message-ID: <20210727045222.905056-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215307_459512_D9DA939B 
X-CRM114-Status: UNSURE (   9.25  )
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

Flash ignores the manufacturer continuation codes and is likely to
collide with other manufacturers flashes.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Do not apply without the SFDP tables hexdump.

 drivers/mtd/spi-nor/manuf-id-collisions.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index db31470ebf6a..f3ba00d17c68 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -14,6 +14,9 @@ static const struct flash_info id_collision_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 
+	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
+	{ "xm25qh64c", INFO(0x204017, 0, 64 * 1024, 128, SPI_NOR_PARSE_SFDP) },
+
 	/* XTX (XTX Technology Limited) */
 	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
 			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
