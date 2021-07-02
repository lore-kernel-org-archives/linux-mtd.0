Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B0EC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4423D613FE
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4423D613FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8N/v0oWH8KJVuqQpRM4IK2VHEptVMsO/CesbG1yj1U=; b=iZrE6FMtdURsq1
	hV3PTA+ShH3KO+FcLaaUxH9iSSipzMjDYBCgxbIse8ZOYH2Rus9GtbVMEXcBd/p1+ZF/aqOqLak0g
	lM/hEGcFyxHIy/g/Q0KpU9vA3dtuAivhkYCIHxtV3UFLUnWAjUA/NlhkD39GHhyC8k/JvDAjrYmUr
	cKAIZQ2FUslQa28Cr/t3ZjmPkl3spXivHyHaatlvzC1U6DzC6VZcZLDlkftn//N7qUia6VyJ0xL+F
	XaxHWTiTP43Mr2TMZ4VQQFa0r91ZbQgbOh5O0qlYt37BylRk6J+9X5EiEDV4kzKv3MJI0dDnp3yNl
	NU5czM/NtBPTO9fnx9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKOC-003IEv-1v; Fri, 02 Jul 2021 14:43:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKMT-003HbG-89
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236905; x=1656772905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OAx1qd5nU8ouZMT7EtkbpXvykcr/bjwHPjPtj238jaM=;
 b=LUX9FT1LDbb04P1VBrAtC6uBPlM/6ZdyK+xQe6nXr5awzkMC2eM2ODbb
 srKKswwaFaAt35FQYkbNhOd0TJ8pqPMn+0yw+i2/yWFFN2TF/m59JGJrL
 tIPK8FSCYYgKQqJ1tf++jZV5Qly1JA+j1fIPM5cuasOgznA8mkoL5+aRF
 rSpX3dM9ZCErGST+EkppgJEc1eIjuzeKlpePkeYn9u78AK0oBKvoBJrij
 d0g8lN4LNALl89YLUDOlCrxXUcDO5jClaz/U053uFgR8MjoYVDdSvu0RN
 Sz2lFR+HKx78OZc8JI6u4W7aRYPkfx7ChUTb2Dbxa8Yt1xmbNt0rjzaNB Q==;
IronPort-SDR: 2Ew+W1nVYpwLyME346VkRKve0HpBixIUWd92tZOIPMkA0m3gWesjS0ygtIQU59/ukys0SPTkQZ
 Xk5uRtqLP47rGvbawAjv+bJBhjtbWqKxEB4rvT/5yZkvHSqK4j2kw0DydIW1F2Je4IacVg0DJg
 HoTzms6RnS+V7xOIJ5LoK7GIjLU6ythx/YrIEStwYdeM3YELi0K96KvFuuvgCUVFoLviXFLFWO
 1qZUhFLsnyP++kt2khHyzCLMpJDPx8xhqgmLMnT0zPpM656haFDHuCFyGFeKCixz+U8rY7382K
 34k=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="134398777"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 6/7] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Date: Fri, 2 Jul 2021 17:41:09 +0300
Message-ID: <20210702144110.250481-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702144110.250481-1-tudor.ambarus@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074145_343098_60C7C86C 
X-CRM114-Status: GOOD (  11.52  )
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

Flash does not support continuation codes and may collide with a flash
of other manufacturer, Intersil being an example .

This flash addition is just for demonstration purposes. As I don't
have the flash, I assumed that it supports SFDP.
If the flash does not define the SFDP tables, it should be statically
initialized with:
        /* XTX (XTX Technology Limited) */
        { "XT25F128B", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
};

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/manuf-id-collisions.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index 9efcba9d18a0..c473c7d40d09 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -8,6 +8,10 @@ static const struct flash_info id_collision_parts[] = {
 	{ "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+
+	/* XTX (XTX Technology Limited) */
+	{ "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 };
 
 const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
