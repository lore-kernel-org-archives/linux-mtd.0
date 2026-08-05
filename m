Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890B4C55822
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0od26ZJsUUvMKNfhQ2npKGPo0ROwCd6OEKG0GOxbf4=; b=APv1y+vTL9s8g/
	rTgHAXOWjRqvPndtrjZFPXElSerdyMJ+623/vrvOxbyeYhvPyEtutIryj+gpwgsnE+InhwrE/lDol
	ekUcQTsFRmXaHnDcnta5ps9UjlYcxR5DTfsvnezyM5TA78TkpbMmQQYMyBvq6+Z/LRs0cfHOajUXv
	OwZXaRZzXc0Y9Nh94kngmqxE8W2lD1QUdGNlgb32XhqLQZqb0ANa7QIFh6h7Opjog++nYc1Z8DS6z
	fpvS+O3hTmhsEK/RN4Ug9Ffin0KUVleTm2ENifQMp1CA0yVJzPO/QYKpcwd2kYTDrpZGudlAwPuJU
	W6/nIcs5ZJWo7c+iJsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWas-00000003Sya-3kig;
	Wed, 05 Aug 2026 08:03:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWan-00000003Ss6-13ir
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BEBFB4E410C9;
	Wed,  5 Aug 2026 08:03:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CECE602AB;
	Wed,  5 Aug 2026 08:03:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8BB111C3436B;
	Wed,  5 Aug 2026 10:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2efJBaCayTywqP4Hq/HYu2FRsCV5fb1DWh4ZIBYfC1k=;
	b=Ymn2SGc/u2V2Q0JzNXjkGnVcodmo5QMZUikR2jJnKPmOX59zZLFbHqY7T8rWPmH7DTNu49
	I/TlhP6+cJUV4AHk103ynZ7LEBe1H4SN7+Nas728hQnBm5gFK7Oqm55Y1uRIBeCj9IItkd
	R0Z9oFTSxqnoZPeIcrcdXc9RYjmMd7NuBJnquCR/XT1TT9v1TEJ/zxOFt25pH3i0HLB8kH
	R9jnkFEoKz9U/HIghCTboTfWprm+Eh6InKdF4vwEDE3kU787exE7dxPRFxT5sFe6VGhPZd
	8mZx7im4IlXvCf4PXnJCZD78I8qqYxw/zaOafRAtj6u1ZqQist598GQihzdezA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:37 +0200
Subject: [PATCH v5 12/28] mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-12-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010313_486841_F0A048E0 
X-CRM114-Status: GOOD (  13.02  )
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

The benefit is not massive @25MHz, yet this feature is not advertized
because these chips do not implement the 4BAIT table. Flag the quad page
program capability manually and earn a few % of write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 536 KiB/s
page write speed is 532 KiB/s
2 page write speed is 532 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 552 KiB/s
page write speed is 547 KiB/s
2 page write speed is 549 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
+ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_read
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
c2712b5617a588f8bba4b8fc7af62f6ca5e2356577681b23544d1a93540ecd1d  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 15df3cc26fbc..f7cdbf1a56a5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -217,7 +217,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* Flavors w/ and w/o SFDP. */
 		.name = "w25q128",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &w25q128_fixups,
 	}, {

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
