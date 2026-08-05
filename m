Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8914FC55822
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbtIf7OytCLlWcTWJ+5KOuD51YqMvAEzH6IdIWDlD90=; b=mpJ/c2XhOJEvgs
	fSpop7tlaWe95xrWBji2xpBZC/Ba9hIRrxipy1mqdGl3EHvCnKq7KDRSf13Pn2Oslvczn294g6nbC
	dQoI6nYK92fEU80n2Itv9XOOp2um8Jy4NcIgJOkmmA7P7WLjBuYq7XOC0KhBGmDqocVYfVXchbJg1
	tx6GJotZwdCzWpppCVlbzKBbfmW/f5dHQXPTctmOYPWuOH/vJblVK1lL7+bAt7oMixFP0s+ZVoylb
	/VP7vDYP69jvx4ftaa2y+dmGKnmImFgVQjmJ8VvJaH65O2jR8GxdGNkgdIZDbTVok7wbEEnruvmeq
	Xy7BtrKNiVBpJ7gNdMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWao-00000003Stl-0Jmm;
	Wed, 05 Aug 2026 08:03:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWai-00000003Sm5-0Sp1
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 779654E4104C;
	Wed,  5 Aug 2026 08:03:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C820602AB;
	Wed,  5 Aug 2026 08:03:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8708C11C34367;
	Wed,  5 Aug 2026 10:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oT9UsdMBoSCH8EdPRd3AtilnbGSrgQJAdMC909jiPHE=;
	b=zvk1+6l0R9xovBZOykn/spy73RrKwlP8fHpbDFATVjpvX4cZ8GAUmDfdFlbqfR4gNwCVsw
	jn0V8GZW51Ud5uTmzCUHPrPrux9R5iJetKw7omZ4cj0yl/xmiUwjFHhdL0Aq4dgv3CZDPs
	eY3vwmCmZN+Juq0n2uRRV2xp3HIGs90tbHgRdBeWTHU8SiX/YKKqim6TCoUov02M/M8yZl
	Z1aB/ddT/Fr1DHG2NnVfUX7DEIPtsMNOQBLaZRetOTtsOoqHmkjZZeGb5Sx814ceEn4qb1
	aF86qI0q0q56axhcwzUoAhOtPrQEnCmOiH5ZV2PZKI6xgNHx8uCq6+TUw/Zjdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:36 +0200
Subject: [PATCH v5 11/28] mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-11-87238e577794@bootlin.com>
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
X-CRM114-CacheID: sfid-20260805_010308_332665_92446006 
X-CRM114-Status: GOOD (  11.85  )
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

The benefit is not massive @25MHz, yet it is a supported feature
of the chip which is already handled by a flag, so let's enable it and
earn that little 1% write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 539 KiB/s
page write speed is 535 KiB/s
2 page write speed is 536 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 556 KiB/s
page write speed is 549 KiB/s
2 page write speed is 552 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 40 17 00 00 00
size		8.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_16BIT_SR | SOFT_RESET | NO_WP

opcodes
 read		0xeb
  dummy cycles	6
 erase		0xd8
 program	0x32
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (8.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-007fffff |     [   3] | no
$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug erase /dev/mtd0 0 2097152
mtd_debug read /dev/mtd0 0 2097152 spi_readErased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
$ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_read
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 2e53f16a9f93..15df3cc26fbc 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -210,6 +210,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q64",
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q128JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x18),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
