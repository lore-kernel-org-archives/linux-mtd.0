Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38FDC982D8
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AJyOwWZtHRX0+BJnxoWUfty9cHefl6v/XYh1WS9WhI=; b=lV1EsKWnYSQKoj
	TVABDWg0/4RMpJ4pE0L9MZc9PtSNP1LUkCWHHfjuvMDyJGkdem95u/c8/oBX83xaP6oXy6HTSfliW
	ZvFX8paPUToCTAr0mAFDtIhqcwru3woC5EgnFG7UxnYWmezo8aTPQYRwuO+XzSYwgn1i7myYbZIAi
	l23JyEeKK8Btr28iyZxKHfSVYfGKRZJVSy6Jj4Aon9ZxSlodqQC4MeAKUswwCcVG6wIHn1h+rm7pw
	4xWluHMSSoyBsXqEIT1Ip2NK5CGxknh70jdDQsiVACEK7imxsLllH/MRds9VWJvKGqfSLX+xsFfmh
	6FT3EnYX38BDogHNmTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6Z-0000000HXnk-0Alq;
	Sun, 20 Sep 2026 14:01:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6U-0000000HXju-0fdw
	for linux-mtd@bombadil.infradead.org;
	Sun, 20 Sep 2026 14:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zrordzHJ+Hm9G4+D6z7BJUku8Qa3cmh36QTR22d12E4=; b=h7EdBnNhx5GPZKOz7DtmV34gK3
	Y1hb0S6yNCHF8oXb3WVxWrBedNokvSt78QXvhfjZB5BvRbj0u0a/8vh5nVt5bpG6zgP8kAghd5xx7
	CLP7RhvstxCf2oJOJkkej6VArB39hBpy0RkctV82LlJWOrgrpItZk3T9BZ1nJWtIEqTS6U84mJIYF
	aUGrYeUTmfiQeXA+SlVnK5kilTr5PEWpQhLOVjmZQNT086QH0ml5Tgv4lOmjje1QpVpYjE5Nhq2ze
	fegITWJ8QnOcS9RD79LOGXF+FSBLLurX+XamhMJv8sVCxG8C6gl2lko9OzqQBXqJTP9GaEzUrcfij
	In3/THoA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6Q-00000008NUK-3h5N
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:01:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 882D5C5CD5C;
	Sun, 20 Sep 2026 14:01:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC5346033F;
	Sun, 20 Sep 2026 14:01:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFD401032906F;
	Sun, 20 Sep 2026 16:00:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zrordzHJ+Hm9G4+D6z7BJUku8Qa3cmh36QTR22d12E4=;
	b=DDkEPMbBybYch+ZBCDezRZJc0/OePb7GgSvNCRFAxy5GpJ38sr+bdeDvzspUw0yzBf88tf
	PtehtEAfWEH/JhnO1Yog+h9mZpVZrqLg5p/aKcVnbBYYfampJcM/v4V5u3ENHRylZcI1Qx
	+ADmW34qqrrJr8qT2F5aiJ+GY4erIGVY2d+qXOuNifbmrEu9uH/w9Tfgmb9TKSn9xNGrQk
	WFIbsIRwZYAM2Rh4vj545clkQzaEDcIdz4TM7+UoFXqeGaTGAcxJrUSijNgsnDtydZHvIX
	8sikBxTbI0476CD9s7xsUEWWjvmVLPMDUFvFuMUS7gnQv4h0XXCEH4+AUBnuNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:21 +0200
Subject: [PATCH v2 12/25] mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-12-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_150111_074739_8726887E 
X-CRM114-Status: GOOD (  14.24  )
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
earn a few % write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 378 KiB/s
page write speed is 375 KiB/s
2 page write speed is 375 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 386 KiB/s
page write speed is 382 KiB/s
2 page write speed is 384 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef6018
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0744eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14c9e96376337a757a75
f7bdd55c19f75dffe930f880ffffffffffffffffffffffffffffffff0000
f0ffffffffff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
9f09054bceec22f43966246eb3043944d50cb679d0a56e8579f78ebe4f99b5a1  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x03
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3b
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbb
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6b
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	0

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
 1S-1S-4S
  opcode	0x32
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 60 18 00 00 00
size		16.0 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

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
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-00ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff | unlocked | 64
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
a4fc3a4bd8163710f3a51f6bda131e0146dd7f9e92b7b201e0a8df18e7b89040  spi_read
a4fc3a4bd8163710f3a51f6bda131e0146dd7f9e92b7b201e0a8df18e7b89040  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a4fc3a4bd8163710f3a51f6bda131e0146dd7f9e92b7b201e0a8df18e7b89040  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 7e79a415db4b..a4ac11785d25 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -341,7 +341,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x18),
 		.name = "w25q128fw",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q256JW-Q/N */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
