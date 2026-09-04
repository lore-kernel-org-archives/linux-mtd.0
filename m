Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691E4C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vnShOYlLlI15D4PuwLDeedQ9GYGvBoUaPkOGigkk9k=; b=IpW8uy5p3Sa993
	UbAy4+yteqwPHOohikNw7Fni4GGp4Lb0vSXgNwRDmEl6PlRYQ6G9cAHiF5ioBU69cu42RzOVBrB3n
	aDDmqNfmw13SfhPhXL2w0svc9ZodYCifZ3vRWJ5Sk/2e17rHA6Keu+WkawPGBc6RM+w+jrTMKswng
	Iwrwb+Rr/0V/hx+xqzrdQPPtoGObyjxzsSiSRuUQ2lVKhn/6M1yO2VqbHug6PphmUWfpU0BKU8zOD
	KtAsXrf0N5YwDGLNCeh8I2Br1hQ6DuB5eM28fjDG1jwTw84BviE0CEJKemiDamuSnkjHYdIGYjBZr
	9j6na+BZACktPvIRFW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XaF-00000002rph-3HzJ;
	Fri, 04 Sep 2026 17:20:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XaD-00000002rlg-1Q0k
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8y3wDy5Auv41vfyZ3Wt92i5VJGIC85xpG+xgIFNaYhc=; b=LEDB0RxeXM+xnIoNwMI/UTmEtM
	QFdxRRBj/H7Qi+5rpb9yh5iysWl1dlXpjLqfamEhgeeXcIYopY4FFbAbaq690SmaNncWlCFe5CgyH
	Z9YRwg6WPOcoa9DaUY/PrfOcrLufUFNU8bMJOD+5RRsno8gBJtG4feFCvSh6A71swpIODoK+IOTqD
	HXACwQAJCwQWzB/aE9NUtRZKG4Bp+atDkuf5FIeRsl5mKqi/T+eTPvj4sAzIbtnafHWSJ1hMFTS2W
	/Nnx8NIx1nV819six2GP3xDvm1/C0BUjHXbZNHJj4Dpfjy92E3FUwrnmO6JiEisU8NCAT4BD9TYIt
	a9WKrTlw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xa9-0000000DX6N-0UgN
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:20:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12ABE1A19B5;
	Fri,  4 Sep 2026 17:19:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB1EB6057F;
	Fri,  4 Sep 2026 17:19:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8640511C79FA6;
	Fri,  4 Sep 2026 19:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542394; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8y3wDy5Auv41vfyZ3Wt92i5VJGIC85xpG+xgIFNaYhc=;
	b=z2ksCtZEC6dcnbYRBWjmKsz84aJ4lAE25JrdPpEjt284CDMH1lpFoQ9y2Utv8UM3d99dq2
	50ocDhNJ9L8ehjTXGHPtCghkLIagB73k+C+3+J+TJFQe7x+HuslV2rI7jeZmVkq5K6eQkq
	3pPSbqvxp8HG9q1cMNL+1qDi9ZjNK+c0OICO5Oh9GT1cSZoy/tf6YFlrwC39sk60Hqp+hE
	Tpl588ZRDjyX2eXsvwETt/In5PFyN9jIEBA8GMdy7Fub22sU88kMSLNxZS3oJLm5BlWJYp
	cRlvPNheFfLPnbYNCiRANRhR9O4s6YsT6R47PF1KItsAqRRSquxxAjXFXNKTXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:18 +0200
Subject: [PATCH v6 25/26] mtd: spi-nor: winbond: W25Q512JV-M: New chip
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-25-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_182005_230163_B16BC07C 
X-CRM114-Status: GOOD (  15.35  )
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

Add support for W25Q512JV-M. It is a 3.3V chip with usual dual/quad
capabilities.

The SFDP table is pretty complete except for the locking capabilities
which must be filled manually.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
cat: can't open '/sys/bus/spi/devices/spi0.0/spi-nor/partname': No such file or directory
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef7020
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ff03000102f000
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff1f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
f41674a6c3742a42d31d3007d4d4b725c166ddb4e4566d1c347d29ed29855ef0  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3c
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbc
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6c
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	0

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 70 20 00 00 00
size		64.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-03ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[   53.198369] random: crng init done
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
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_read
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_read
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_read
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_read
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_read2
f27c6b54ce92a46104f2fd43fc2d6d1353099a6a125591b47a615d3d61171a86  spi_test
44db7586d798437868d29ea31ac1fa1e64d1b81337721d0d811776dad47110f3  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff |   locked | 1024
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=67108864
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=1024
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 66977792 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff | unlocked | 1022
 03fe0000-03ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 66977792 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff | unlocked | 1023
 03ff0000-03ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 58720256 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-037fffff | unlocked | 896
 03800000-03ffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-03ffffff | unlocked | 1023
+ all_but_one=1023
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 1023
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-03ffffff |   locked | 1023
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-03ffffff |   locked | 1022
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 1023
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff |   locked | 1023
 03ff0000-03ffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 66977792 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff |   locked | 1022
 03fe0000-03ffffff | unlocked | 2
+ flash_speed /dev/mtd0 -dc10
not NAND flash, assume page size is 512 bytes.
scanning for bad eraseblocks
scanned 10 eraseblocks, 0 are bad
testing eraseblock write speed
eraseblock write speed is 437 KiB/s
testing eraseblock read speed
eraseblock read speed is 1560 KiB/s
testing page write speed
page write speed is 434 KiB/s
testing page read speed
page read speed is 1457 KiB/s
testing 2 page write speed
2 page write speed is 435 KiB/s
testing 2 page read speed
2 page read speed is 1498 KiB/s
Testing erase speed
erase speed is 257 KiB/s
Testing 2x multi-block erase speed
2x multi-block erase speed is 257 KiB/s
Testing 4x multi-block erase speed
4x multi-block erase speed is 257 KiB/s
Testing 8x multi-block erase speed
8x multi-block erase speed is 254 KiB/s
Testing 16x multi-block erase speed
16x multi-block erase speed is 255 KiB/s
Testing 32x multi-block erase speed
32x multi-block erase speed is 255 KiB/s
Testing 64x multi-block erase speed
64x multi-block erase speed is 253 KiB/s
finished
---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 90fe9617d784..5b81de305d8e 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -335,6 +335,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q256jvm",
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+	}, {
+		/* W25Q512JV-M */
+		.id = SNOR_ID(0xef, 0x70, 0x20),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
