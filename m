Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54992C55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0od26ZJsUUvMKNfhQ2npKGPo0ROwCd6OEKG0GOxbf4=; b=TYemQW09f0655R
	Obpb6eTSoOe4/0jxEObNqnk8z6K7raD7gwmTiZam1STru5w3NRnduW0YgUHzx1wr9DY4hROMGLpjQ
	tkMtIRK5dnDLUNVsrn4NGWz5Pj6qT54cVqfzsbFSn0A5n8NGFcnEbyM6ZAK8bklmBUET2u3k4n9Ou
	X2fsLHV0RTCUaFiRCDkf72oPDksJKdWQT05G0uNwa6tcxrKpgV0y/uuZ+TGTrZQ+kdia4TCOTz8s8
	RlFBwKFFPRjcJ0WbEht+UJc2nPFTdaNchpxcfpQ77SXBAhSCwXdtOchl2dcrC660tVXbuKtR64xQ8
	loQxJuobVVVWLoYI4VWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlJ-0000000208r-08wU;
	Tue, 04 Aug 2026 14:04:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlH-0000000206y-1Eq3
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2efJBaCayTywqP4Hq/HYu2FRsCV5fb1DWh4ZIBYfC1k=; b=WSEmaoVwc6D0q+sDZQCyEY9+PH
	HK9VQFRl4H9GjS1Z+8caN8M9tUc5yfnp2rF2qOeCYzwpybVX1c+2rrEkCzmhGvJac/j9G0s7kehAT
	0N2T1m2Du3KvFvBdu1n1kAmnR6gP9MOSDx2/rSdEdJI0s3c/IUxgrIaxR5bdrupKNmmN3jrEoeDl4
	U3HB7b9sGWOz0MrzrVC0Vr0MllXh6IXhYv5+GXzOb2JvKQRQehNLvv/DWvHYbUZaAikP5IqgTnXQl
	UZLm94jBwDrIUi3o09SKb4cGyPly5vg5cIqS796VSSA2bZyEPWmp2VKJTwiSt6xAOncqkbX9eULMV
	/Qgc4l1w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFlD-00000009yKg-2CUw
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD4BE4E410DB;
	Tue,  4 Aug 2026 14:04:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A84736029E;
	Tue,  4 Aug 2026 14:04:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B20AA11C32D32;
	Tue,  4 Aug 2026 16:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2efJBaCayTywqP4Hq/HYu2FRsCV5fb1DWh4ZIBYfC1k=;
	b=lsUKPXJclC9JoiIZNE/F+qnPpVDSdXOkUaKoidVBYmQ2hAOeHsuDaygE+4Q/eF/BiKJckG
	MpjvIFN2MUlSCs+sOPLTQ0iJWsLaTo0zMxU+ODO05XHVSFT5zsYTWf+QRgiuZmN6lbzOBu
	QpdX5UqSyVlyhaOOzbRkVv9QMbNWEiB2PYL1/a2+MbwKRkYpSu7CCBBOHKW8Mftek8nwMu
	iewz2ij0s8CllthBXr36LSizgr7DVdqJFLq9s+AVjjLqv4O/uv5FpcuEd9UOX6a1+WOIDL
	PtmOE5vA9SRSOj1NMbi5oDuxFa6c1YuJEQCgPAexkYkc/GEfqv8/YR3zhkq/Zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:34 +0200
Subject: [PATCH v4 12/28] mtd: spi-nor: winbond: W25Q128JV-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-12-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150451_624188_229F5C92 
X-CRM114-Status: GOOD (  12.83  )
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
