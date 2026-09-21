Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CD6C982E6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQ/PYWbrFkzq0NwF5TbKAEAuse3J8fBPWigDmAyYpz4=; b=NPwKcbsFL8Hy4D
	aol/dKvNh7pHzlkTAm3iD+ockWbaEj4IqXffRsftBnnAdfGQPfO298Xs2G+TnitOaeB7+htbuXrml
	rRQOJCfPmQdr+jA9TzmG3z93MGzEeqCvE54bh1UBZuCZSif5ai8l10qKq5Z6PMrCxKLv2lu2mcQ8G
	TfcTR6gH1RO2p8vtLZAkohdmkqJ434Mi7S/doYilyhIWweBO5h6Q8+zC9RYlORe17UeaIiB9RJ04P
	BasAq3MuIwDUA/GqUAdIrdRiiskKhLyY4Nzpb8eUaPQDW6YY2lQJH+G2xtOktFShE9Myk72mMVoJm
	a+GntyrMSeHN9MorItEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlC-000000015SB-3VX3;
	Mon, 21 Sep 2026 06:44:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlA-000000015OO-2pYB
	for linux-mtd@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=00sVMtPHft5JJXJHCtQUBHUeoAZLnZNO2FFBPDusxOY=; b=GSp3ZPJX2y7LpQJldDzRgKsiOk
	I/17csT0xx8KBHXSsamcMo53RPSR5NaFz/nhDj2kIplebHnZa5QmRLNj55gSRafWqTT1NmUwMUvHy
	9UmjJh+OkOomBGI8qiKL6MsNwrznS3YP+TfRupSGW1k+QpBbxaF9hRuNk/raiSiwdS4NQTD70o/XO
	6M/3O7CCRo2DjnB3WwHQudeNKzDwR0UmUDCZN2FLDF81c7C/eFAl2qh3jMljjy4Lq5+nt8ga5DlLq
	Qa3DE+gpQkyMb+Vt85nI/MawlVtKYlk5KZ+tS4/n+GxwvL/nNRZN/MAZDiCCBDW4Qi1eSD2fVSqT1
	1xuuHe2g==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xl7-0000000Ffps-315N
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:44:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A80B81A0DC0;
	Mon, 21 Sep 2026 06:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A71260339;
	Mon, 21 Sep 2026 06:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADC7E103290D2;
	Mon, 21 Sep 2026 08:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=00sVMtPHft5JJXJHCtQUBHUeoAZLnZNO2FFBPDusxOY=;
	b=zdego2wG3s8pwuPEcHIOLLOlHUf+ToHE2XIW3Qr7Vn8jGLiXMeDc9N2oVrVSYc6eNgOrpF
	ERgMh/kgWxUZb+foyVoLJl6ypr2+J+0gQZAoZG+lnadFccmKBv6Ym++l8p14JqfejK/Blo
	hXeKjuIJsaiFA7XRWzwNiiYephsUnSr+4quXDgUoKOb4wCYsmoqm6w06L0ERpcOB2LOY4f
	g7k4oc2rtw6NRetiS0yugLa41QtK6knlUZHT4wETmbaEC4QXBJroWUod1ebihg0UO9p9H8
	2yVr6qQk58KmgOVTuTiGXTGCOna2VZFi+k2RGWYn2rM3Amgeybj7Lw8klXja2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:48 +0200
Subject: [PATCH v3 17/25] mtd: spi-nor: winbond: Add support for
 W25Q33PW-Q/N
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-17-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_074413_876420_E79D2A42 
X-CRM114-Status: GOOD (  15.86  )
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

There is an ID collision with chips of same density from the JW family
(which it self conflicted with yet another family). Chips are very
similar in practice, it is mostly a matter of electrical differences
(mostly power consumption being lower) as well as the addition of inline
ECC capability.

Unlike the other (bigger) densities from the PW family, this part has no
ECC support.

Another significant difference is that PW chips identify themselves as
supporting the new SFDP (rev F) QER field which forces an alternate
write SR2 opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef6016
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p p/sys/us/spi/devices/spi0.0/spi-nor/sfdp
534644500a0100ff00080117800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0144eb086b083b42bbfeffffffffff
0000ffff44eb0c200f5210d800001432010181e314c2e96376337a757a75
f7a9d55c39f66dffe930f880000000000000ac0000000000f7f5ffff0f00
0000060d44bd27ed080d
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
9b4e76b3ab30d374abbf4cc35893b86e3891acd0c86ba4d8deb111b42f890036  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
 1S-1S-4S
  opcode	0x32
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 60 16 00 00 00
size		4.00 MiB
write size	16
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | SOFT_RESET | ECC | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xeb
  dummy cycles	6
 erase		0xd8
 program	0x32
 8D extension	repeat

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (4.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-003fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
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
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_read
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 4194304 (4M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_read
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_read
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_read
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_read2
2fe145f574fac7fcef563647ebaba99ec9226462f5fd520601bbd2cee946529b  spi_test
5a4c95f5e812cf8d0123ddb8fc0cece797e41e0ad76ab35340c5680ebdd54073  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=4194304
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 4063232 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff | unlocked | 62
 003e0000-003fffff |   locked | 2
+ flash_lock -u /dev/mtd0 4063232 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff | unlocked | 63
 003f0000-003fffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-003fffff | unlocked | 62
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-003fffff | unlocked | 63
+ all_but_one=63
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 63
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-003fffff |   locked | 63
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-003fffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 63
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff |   locked | 63
 003f0000-003fffff | unlocked | 1
+ flash_lock -u /dev/mtd0 4063232 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff |   locked | 62
 003e0000-003fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index a2dea77dfc2c..6934f3e10ec3 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -373,7 +373,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* W25Q32DW-P/G, W25Q32FW-G/Q, W25Q32JW-Q/N */
+		/* W25Q32DW-P/G, W25Q32FW-G/Q, W25Q32JW-Q/N, W25Q33PW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x16),
 		.name = "w25q32dw",
 		.size = SZ_4M,

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
