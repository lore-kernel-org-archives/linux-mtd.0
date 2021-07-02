Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629FAC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:44:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D7C613DC
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D7C613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnNI+egZJzJGf5wHK73d7LQsJFttkWXy1p4iPC9FTd8=; b=ng/AM60rnIoLzg
	M/ADTm1i2pYga59jZkEpf1o495fo5PyRJm6YWV0YGMPPhoNoyBRpaJ4bEgvJh5EWXreLjjSVIGbkz
	MioMCi17ZlRQW4w0p/itC4cLr/OY/ARnIULKtuaomgqV/g8Y0oURTnc2Eedn0Ov0izWlUgLFlxq+d
	0cXXlqY3GHg/Hr+0YMYLcMEhclQ2QA68swBqarfEnozQ7/EUOGTTPK/xFQsjSwzErdpgR8vXO96uU
	3/CLUxQBEiM5tvpN6rfDirgTMcxwOtdA+Q1WMBZix3ImgaemPZoGHU8JXXgJQH3ouUbhZHHuiSnXM
	/ZZKFT4qQLKxSpdv1JEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKOw-003IRf-JY; Fri, 02 Jul 2021 14:44:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKMZ-003HcN-3K
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625236911; x=1656772911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2UAtD8ntgMYYRa7miQJwveO3Z4av6kKZh8pk/C1MR0=;
 b=MIiKO/wqmOun2+czof+NJQvKukSUYO0mm5ql70vEZZqUtUlvKp3Ljedn
 KOzNLxLjwTVv34p13TMCmRoGzCMZASHEcqcJc4NYFsmzY+PS7RB98mF/w
 bVKquEZzf/YFs7b92fI9hb1C3sa8E/+FjJmTV9VREA8fNym6FLcOudanI
 /kH7+fzgXZYw1Xp4Di4n6w7Tg8fuTv0malYUnowdA5f3VdSQ8co091TTF
 U+//H+VSKf0/dEiZz92Q6ftktRqUaQNTx1GDmOLhFPG5SntHpHbAhq+5A
 lZjt7KJg5j+RgwgH+1KsqFMZO/foiAkv6m4miBHkDzrCTw0Umy4xYsUP4 Q==;
IronPort-SDR: nDc3FhO0P4bjyRFGSYi0mzcDRuxCRdMWfTMUvuUoo2Tkp4FyRhlKWOhnlNqgBl3kFk9kmo5yg2
 5nJs1Pq+ikxzEV9QsrLt3ap4fOZppXgy86WMZ4S/R6R+D70ePmDYlpisKEnblUC4zyYBP1TOA9
 o9z6wthHEm5oHaHmkUf9H1907F0f8860ZsetIWzo69HVVHDx2qL7gpnTyEGpthrABBHXWrsKDV
 K7Vh7NYNuDESiSUE2pxWlzdyNmdUh7kJ2eTndTz371m/OL+XLPwH5jG4VJAsTJqj0TdY8aIeWq
 qss=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="126910369"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:41:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:41:48 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 2 Jul 2021 07:41:44 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>
CC: <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 7/7] mtd: spi-nor: manuf-id-collisions: Add support for
 xm25qh64c
Date: Fri, 2 Jul 2021 17:41:10 +0300
Message-ID: <20210702144110.250481-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702144110.250481-1-tudor.ambarus@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_074151_200378_16EEEB4B 
X-CRM114-Status: GOOD (  11.37  )
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

Do not apply! SFDP needs to be dumped.
mw:
'''
NB. XMC ignores the continuation codes and this particular device will
collide with M25PE64/M45PE64. Although I couldn't find any datasheet,
so I don't know if these devices actually exist.
'''

The data sheets can be found here:
http://xmcwh.com/Uploads/2020-12-17/XM25QH64C_Ver1.1.pdf

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/manuf-id-collisions.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
index c473c7d40d09..c41d6e8f2f95 100644
--- a/drivers/mtd/spi-nor/manuf-id-collisions.c
+++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
@@ -9,6 +9,9 @@ static const struct flash_info id_collision_parts[] = {
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
