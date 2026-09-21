Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009EDC982ED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIpV3CIdyBGIiqHoIoeDJBhAU1C+xPwUv5Bip+Rnsjw=; b=waLk/vqhFPRCZN
	CRlq+H8ka33mD4wC5jouXJcsrVhvdDFW8Con+iNM5XTGN+sesJYJQ/bcj6NIrlLOB9PLY06RGoqSv
	89v8PZA12Cp/fMBDdTTStI6juyWrOQ+SqHCuWUaFrj0Dk78egVlJSqg1YWNUlcALj+hHlMo6zieGy
	Ts6abW9RAyUZRfjlHAMB7SGVDP538Y087eDe+l2l/KUOzaJvwHWK6W1k9Lo3gxxQlf2J5CqrTWSbP
	gzVjR0o0VBreTpVNvtGOlXLGJ68Xn/0ehPYlotLSic6+AjfUTELoduRI1xyvfjCfrZOC2mO+F+mP2
	cxutAXlC8j94s9mweUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlT-000000015ni-2WOU;
	Mon, 21 Sep 2026 06:44:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlE-000000015R5-01BR
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:44:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A4EC3C2F4C1;
	Mon, 21 Sep 2026 06:45:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A477760339;
	Mon, 21 Sep 2026 06:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ED35103290D7;
	Mon, 21 Sep 2026 08:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PXci8XI4BcqffpBZZ8K5SWpioisIgZlS4XtUgIADrk=;
	b=btWDyza4Cvb6s6LOcPTy5LSbe9E8xROmQzR9asbozj3S5OoaQ7ldmcx9qpUOwviMvcAaML
	edxj2vG8xrtTG8Dyv+nbwodprpnXhH2BwtOYqOzsOZg8y7RcFq3izHNQXyViPX1I5uGbi+
	9MlHUnExsdggvHDyZaR9RZsi+lMbrIBwRBJiSv9pMvOm8EyJwIKZNzprS6ivc58uiSODFD
	LmtQdZZmo8F4IX7Y0rxpArnA+rDObEFF4OlnuHGxmcWs0W3ogIqTnYYSenPDiA2K1FwpEi
	cQWC8DOHWV9xvXinjPhPDZl70J3JCoxGECQlP6P2A8wwF7/J6UvpmeiRc1t4ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:51 +0200
Subject: [PATCH v3 20/25] mtd: spi-nor: winbond: Add support for
 W25Q25PW-Q/N
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-20-38eef3b6a7db@bootlin.com>
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
X-CRM114-CacheID: sfid-20260920_234420_236317_C61C676C 
X-CRM114-Status: GOOD (  14.32  )
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

16 bytes chunks are protected against single errors. In case a
non-aligned write happens, ECC is locally disabled until the next erase.

Another significant difference is that PW chips identify themselves as
supporting the new SFDP (rev F) QER field which forces an alternate
write SR2 opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef6019
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0101ff00080117800000ff84010102e00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff0f44eb086b083b42bbfeffffffffff
0000ffff44eb0c200f5210d80000142a010186e114c4e96376337a757a75
f7a4d55c39f66dffe970f9a50000000000002c0000000000f7f5ffff0f00
0000060d44bd27ed080dffffffffff0a00fe21ffdcff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
55268b59c742e7b0fde6cf6c5601676e9e4666daec41316171feb82f0d2d5352  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 60 19 00 00 00
size		32.0 MiB
write size	16
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | ECC | NO_WP | HAS_SR2_CMP_BIT6

opcodes
 read		0xec
  dummy cycles	6
 erase		0xdc
 program	0x34
 8D extension	repeat

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-01ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff | unlocked | 512
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'

[   16.617667] random: crng init done
2+0 records in
2+0 records out
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
[   18.720786] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
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
[   22.127861] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_read
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
[   26.680043] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x2000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_rea[   30.654003] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
d
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_read
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff | unlocked | 512
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x2000000
Lock status: locked
[   32.326253] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0

+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_read
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug[   34.766835] spi_nor_read [1882] [ret: 0] SR3 0x4 @ offset 0x0
 read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_read
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_read2
fa35f237917a2785516d21e010b8422cbe5e49ba88b962696f188ce807c1857e  spi_test
63bfc5b2f0f156a1a4551d6511d4d20b5b6d5cd12b825a6ceb66d167f1223ef8  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01ffffff |   locked | 512
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=33554432
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=512
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 33423360 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01fdffff | unlocked | 510
 01fe0000-01ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 33423360 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01feffff | unlocked | 511
 01ff0000-01ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 25165824 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-017fffff | unlocked | 384
 01800000-01ffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-01ffffff | unlocked | 510
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-01ffffff | unlocked | 511
+ all_but_one=511
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 511
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-01ffffff |   locked | 511
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-01ffffff |   locked | 510
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 511
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01feffff |   locked | 511
 01ff0000-01ffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 33423360 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-01fdffff |   locked | 510
 01fe0000-01ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 75cca5ab1d8c..4c9cbe0240d8 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -395,7 +395,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* W25Q256JW-Q/N */
+		/* W25Q256JW-Q/N, W25Q25PW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
