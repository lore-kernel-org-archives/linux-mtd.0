Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661EEC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B8761058
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 05:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35B8761058
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSm/jRlgh58MHFSkOfGIldYoth9RVk/3OJabcxuPqVg=; b=48tOMf47GzWalZ
	LT5OwlgnvJZLOGfu+nkGG97fCTIYXPrbtfhW7o/sdDY1Ewiiw37Y0WtrD9ugQ1ZS/vQh4hFsUzT/k
	S/95NR/VsPMeqYuKAdjVpFXiBy2hUduduuZR7Fc/JROWkkLFhtEjxcxHHVClDVdNy9/Vh74IBGOg+
	D+G9Ttk8vF3KIiezqGgSOJ6Ohsaf/mhTmgyOtcX4ewWmppaMPSFivoGAtGt6Rj+W1GRo/jAVjx3yj
	FhymQTidgVPQJq0extHGVLUY2fBTYYSp9reeQY/jH4d8/Lg+OCim7EcfiGX2NKglNmNUzUz7SeQgH
	UB6GP1u/vSaJdEENmrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8FEa-00DKjA-Fy; Tue, 27 Jul 2021 05:02:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F5R-00DHUR-UR; Tue, 27 Jul 2021 04:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361581; x=1658897581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6/0tDN1r+uFRVwM41QCwY7mVuqDSpx5qYOvBSq9SpFQ=;
 b=0wxs4W12Yh6sj7KvhwosuuxwpwFlFjRIU0cUZTbXnYJHrW67nlsS50uo
 4QRNn3JcQMoti0lfQ3sAd85Sy7Wk2ukmsCkn3Z40saJAmGu9h/QRN1sgt
 z+OZKtYJUi3oYLhNyntdDdgaxNx0C+BccKBMiTXqsfGGTF/fL+SWCJRKO
 RbeHbyCWh7H4di4XBXLbHHXTv41D9ljIMu3MZ6hoPxsPDxXRPeZrWBRd7
 iZfihWuKaAwooPk4tjrq/3dZTHqUdgLa2l3SS3CY5QjQ4qcsmQCfLX09i
 OpJbBr0wX3OHXy4KirJ2fhNJ1rulBHto2ZmcOstXKFlqj1csaHIKCRnpy A==;
IronPort-SDR: 2h9VgTU8l0fVWA19nEgNjQJ60QLJ1JjvbEcctfqODSgeXAqOAjKR0gHMG3wfsxt3Plyo8z99kb
 jaJ5zYuqdcosjES/cYwnXydYv5x5bZ7OYS/8aQmmd+aZcGVc0OD5fQCCXaNVdrC0vnaB1V13xa
 g7eLjqAmqgYamPW33LofWdxFwDTWx9Cz1p+KVHHfOaBfy9A7qlMIlsgHqm+cwzD9bSN5BrMQUe
 P5jYipC+rbdEJ8dxEnnzi+57r1E4P6MOuyrKib86SwZmyUqG+zI2oPyMNtRYWc9Kc9vZXLAsNG
 fzQVdhEunHyUlRca//8euPGO
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="137653912"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:53:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:53:00 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:52:55 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 06/35] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Date: Tue, 27 Jul 2021 07:51:53 +0300
Message-ID: <20210727045222.905056-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727045222.905056-1-tudor.ambarus@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215302_063670_8F3DB650 
X-CRM114-Status: UNSURE (   9.06  )
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

Flash does not support continuation codes and may collide with a flash
of other manufacturer, Intersil being an example .

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
0000060 3600 2700 f99f 6477 e8d9 ffff

 drivers/mtd/spi-nor/manuf-id-collisions.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index bf7dba34f018..db31470ebf6a 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -13,6 +13,10 @@ static const struct flash_info id_collision_parts[] = {
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
