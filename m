Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB67C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:27:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1366A60FC1
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1366A60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zpr3wClp3ELXcL1j2/ee3TchdgWZ+aYCr2ln4qn1RAo=; b=t+T/CBiglATQ6k
	A7bPGBee46ALtB84DUKrfY/W+eXVCNmjxA94EMDAQ/ZAhQetW3NSSxeeo8XCyrpjNgJZggxgcmJ4p
	327qkrmBXwByYwliTZEmIAKnva/QPgDsuCc+swaoJrMlOZx8YLZIhWLUXO0YVjOYqkkoxJaNVz8Pe
	EGaOjRQu03IWFL2yDJZD5OyS2VYxy+f0FSGosz1bt5dF8g171bZod90TmRe5jIz92vS39lp2zUioH
	O5tfwloYBHY/1Z3DZDQMcvZBCV7mjgqqrkeFLv74+ci2dgkVvjkhSx0pC7IFwYBB1LMGveDAyFhvw
	KuO8/94Z1IlPa7wApjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWad-00BmUX-EO; Fri, 29 Oct 2021 18:26:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVg5-00BZZx-6W; Fri, 29 Oct 2021 17:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528509; x=1667064509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wG3NkI0GhaAk/lr+OC7acrcY54TCs47nk8D9tUplmhI=;
 b=g7QXGnervSrtBTe1A/i/yFScLarvQTkADWXIFbtfHRsB9T5ECmkY03na
 JkuxZnV4+d5a6i4YD1Miiwna6timzMiCx8LFevmjxxTuhjio8vZLcqj4G
 PkVJjF+wmksUBNIz+KpLytVeHod4mw8QODpf3kmd8sZ5hDQZu94kfr0vh
 ndSyFMv6xHjXKNBqZNkTrg8uLbJr6RnIW5KTKP+iXrLwp/owsOR1o8Eyc
 4hXK3tKH0XTWO+7lVfcMUGJk0wG2dd00GJ+ZcYlH5RTO9xA6NP2jSOTza
 A+4g1R0cwt0l9u1/Y5pvob3SLGZZvTSt9N6WlYspV3qSlD95GxUMiMWww w==;
IronPort-SDR: nWJSYXiYoc+RGdWxycZGzyokATNTWO7V6tRdF8bZrz0FgAqicDFTg1zdt0hS/ZMGz2lmR+kc84
 6iE0rpNFcE/lf7EHozWCmErmbCLzF88nKKpR7DGY0lNyNskyRhavSLnuzMVF4wu/v9N9F5P352
 9ZaPulZWbcS/37Npvcx02heTzh6oYZ7k1cpdk6buXjq1HL2XOKueD+7tdMj/BZ7npnXHqJkWOB
 jFwYvvKQoQW3lGlJ2MZpFKJeAajzotL/zV9VC6Z+P7aC5f3n4FENJySn1a04S38u1bLnwY0k4J
 Z9C9+7Ddxv3qj4zEe8n172k0
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142183733"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:28:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:28:19 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:28:15 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 20/25] mtd: spi-nor: sst: sst26vf064b: Init flash based on
 SFDP
Date: Fri, 29 Oct 2021 20:26:28 +0300
Message-ID: <20211029172633.886453-21-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102829_313827_00E20C0F 
X-CRM114-Status: GOOD (  10.57  )
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
 drivers/mtd/spi-nor/sst.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 40e55b531edb..b3fd54b24e25 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -199,8 +199,9 @@ static const struct flash_info sst_parts[] = {
 	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
 			      SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
-			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+			      SPI_NOR_PARSE_SFDP |
+			      NON_SFDP_FLAGS(SPI_NOR_HAS_LOCK |
+					     SPI_NOR_SWP_IS_VOLATILE))
 		.fixups = &sst26vf_fixups },
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
