Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FFC55184
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCba6JFxzxKb4URxV5vKtOMErL+BIsid3oOkZkVtV5w=; b=XYp3CLSxtJFFtw
	E5W0mimd7ANv0mABosUBbHX5Dtcifi2xI8FSDDzj1PHidVVDkUG8ZUUJ7WKXKJWWryg9RoKyoJ037
	qJe/69GMSE0u0sA+/85iO0yb6Fj/iaQ0MIQ42SWnptXBtIMyaVtoE7bxqwjgYPtdFa8MKvGBG4KJh
	sFhJCNIHMuS0kbkJChDTF6FFeKBKTkuiEFuATQ7f7B2Yu7gAX7CcgIVBjLS6VYTR7TNEPL2CU2Cdy
	jY2o3kafD2E7sHIgsmOMgOl5z4L6McIQZbr0yl5k+fXu0EI47k6Jau7ORSP5Oy4QRszATC3oGbutU
	twIRH2IewXknHwUZMPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFla-000000020RJ-3KVh;
	Tue, 04 Aug 2026 14:05:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFla-000000020Q6-0XBs
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E5QPse2lkWC/wOtvK0UJ5oLsVwxAuCt35ua4zancMaA=; b=P4L52+a7aP9qIO2kTur6RDPQja
	ppPYlT1bUxXahARNZuoDm4bnAF6at+VNYiN4vPPIJFeElAkFrjc7rZE333SfZAYmRKgx4/LQaAmwL
	f0cqrBSoyks90FF7rX2b+c5cy9JGcO1TaJHPax0hdzt4Cby5pzQfEYunuGq3qihVFt1QKhh91CS7f
	Pt7GMQ64pgPtV0ZQgIOJTbfLs9jTAVg+4gv7Vu/KYiDbUI/SYyjapNl52dCchRc1B3Lv0Ma47eafw
	4BwjEyO5pejORxHe2e7U898m/BKM1cod2W4VmtfWQXhKv8KxAAjfx4J7Z5BoMlAiYSEmCRoChzmlK
	b9UEmc/Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFlX-00000009ySG-02HQ
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:05:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5999E4E410DB;
	Tue,  4 Aug 2026 14:05:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B6B86029E;
	Tue,  4 Aug 2026 14:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 997CD11C32D27;
	Tue,  4 Aug 2026 16:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E5QPse2lkWC/wOtvK0UJ5oLsVwxAuCt35ua4zancMaA=;
	b=0B0gFeDwq/7mP0o9F+R9pf4aYH+hhjnuu2EEu/WwdUSeX/x3wGyA3nwjGQ4Zg2p1RqlIQI
	aaWxR1D97YE3WrCSdM4LDLTuhApyqNny4BWD7PYIBENzC/Lyb+Gzh5r8qmf9NdPKpAV75i
	RGN2MYAlONdJMIIovmwgBb9iinStB6kPBE30Lu4pWr+Ez0WFUdKNsad+uHu2e7Fmnaa5Ok
	9yPKrE2U/AuM8rACbI+fGJFgN6NWTT7Jc6pSXgCp4G2dnxCBZMzpExEk1t88qThJ67S1SG
	sx/8EHj6YGN2+fvHu9OHoH1G5dDiDf6qJi3WhevSFxODomilFKaPwjAr0dlLSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:37 +0200
Subject: [PATCH v4 15/28] mtd: spi-nor: winbond: W25Q128JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-15-ee3445066e4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20260804_150511_253732_A8B1C8A1 
X-CRM114-Status: GOOD (  12.27  )
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs, add the flag manually:

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 553 KiB/s
page write speed is 548 KiB/s
2 page write speed is 550 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 1628 KiB/s
page write speed is 1600 KiB/s
2 page write speed is 1612 KiB/s

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
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 41c9b620f26b..2cdb4acd9ecf 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -321,8 +321,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
 		.name = "w25q128jv",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
