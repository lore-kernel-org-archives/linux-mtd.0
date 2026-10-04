Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF0CA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vY3fIglAfBrLEN6lI5u5lIBxUcZLcpBd2yKt3qE3aCs=; b=fJVEh8frcC/Ilv
	LoLrmNEOUHwavrZ5srL+gqsQZebKWS6Q5V9n0FTky5i72ckwlPZlnA5ny6xHb8mIZw6TUGoz2k858
	3oaHixNyoqjy15ePei92gCTLCws4n9cZHmuzFHGFuKtPe2zDfBYfINsEGbdniHvgx6Q/FBPzjZVTZ
	zB0pJIS+pDqi3/cw9I6l0XHB5uDvCRHfL+oQV1HUqDphan/Qa4iH0z9axHVjhdSD7XV3JnIfFdOxo
	vf5FmFSZzayRT+LgEYwqTSpIIiXwwLSiLnC0tcHrQ5lt67WGFSsQhfwOMhtBEwPoD4nbNzb2SThHd
	HbCg6iAu31mWLrTMNOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTot-0000000FNFU-1hdQ;
	Sun, 04 Oct 2026 21:32:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToo-0000000FNCT-0Q1t
	for linux-mtd@bombadil.infradead.org;
	Sun, 04 Oct 2026 21:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=vKr0WLdVeb/J8plYIr12nURhtOI2tu4K7NWOuJDWCQw=; b=GkI8seEXDNoOPP26Gb3Q9NE6RO
	rYSX4WPRktNIpcxEF39UOTtNwLipG1Rn6hy1fm+2PM9JawPMfoBaL1CD6oU7hSJnjj6qNzk+GRHMJ
	cOS2ElvsUg4tHD38kEa+1kDa4TP2pa0ULnQxDcaWTbf49MB1PCHN5OxgKQ+donWEEBbC3IOIZDdV3
	UAZ4SF1MwYv3vi9gDwGXGRuoNtQkJLLgdHEjyRZoQj+gcRwsxaCzArwwCD46In69fpVb/f8WyTOad
	4xytK0+apmfQsFhev7fEhyMIBcufEbgHxNXBc9Um99OMkoKgCvfIukg81I3+TQTtjQV/CHqNt4JhL
	/62bpbOQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTok-0000000FLDF-2zOH
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:32:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4182F4E4116A;
	Sun,  4 Oct 2026 21:32:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15B9B604FE;
	Sun,  4 Oct 2026 21:32:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25E61103283ED;
	Sun,  4 Oct 2026 23:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vKr0WLdVeb/J8plYIr12nURhtOI2tu4K7NWOuJDWCQw=;
	b=0MHp0zdRs/WfIQsiE3CrZmMTX5SMh/Zbpz/0aa9aBcrRFsf6G4PtqI79XyTWIvs8TDdc/k
	J/XBMPaH/1zCLmunAGtYofJU29Pu5DL3Yo3Gg6xZjtBlxGQfYTyVSK19nmVSs8gAr2rpnj
	xFWgMKuRcdIyGB5wuTWp/NrIUPJK+jjKNaE2C1S/txLXPuRnA1LJOvF2I9VToUFhvfa/OL
	vCW+O2/eeTB0Ge9YndSag0wXfP2m+rEU9mnHnOtgnpio1zrNjg0oLEI4XHlAWYVP3pCjBd
	faIpzVgJLIWUoIFw6KUzXGdOiYN786ond7fXA4ZXrcbFYzTKF+JhpbxRS6ieNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:28 +0200
Subject: [PATCH v2 14/17] mtd: spi-nor: winbond: Add support for
 W35T51NW-C/E
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-14-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_223222_803832_A182B82C 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

W35T devices are Winbond new octal DTR capable SPI-NORs.

16 bytes chunks are protected against single errors. In case a
non-aligned write happens, ECC is locally disabled until the next erase.

These chips may leverage lock CMP support, by using a Winbond specific
register instead of SR2 which is gone. This feature is therefore not
supported nor flagged.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Logs for W35T51NW-C:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef5b1a
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0104ff00080117800000ff84010102e00000ff05010106e800
00ff8701011c000100ff0a000108700100ffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe5208affffffff1f0000000000000000eeffffffffff
0000ffff00000c200f5210d800003452b50082e31458e96376337a757a75
ffc3d55c008070ffe950f8a110cb088b0000ac0000000000ffffff860000
00000000000000000000ffffffff430ef0ff215cdcff000b0016b181b585
00d87b9d580b000030f6de9c10000000000000000000000000feffe300fe
ffe300058880060588a10070888400708885818501f0b1b501f0d8b8cefb
b02e2cd388a489aa00000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000081850310
b1b503100000000000000601000000000000b1050000e700000000000000
00000000000000000000
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
a290fdc72785300e3b6efb4964a0a41524707263735ec4a23009b97324aad7ce  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	22

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 8D-8D-8D
  opcode	0x12
+ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 5b 1a 02 00 00
size		64.0 MiB
write size	16
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | IO_MODE_EN_VOLATILE | SOFT_RESET | ECC | NO_WP

opcodes
 read		0x0b
  dummy cycles	22
 erase		0xdc
 program	0x12
 SR1 read	0x05
 SR1 write	0x01
 8D extension	repeat

protocols
 read		8D-8D-8D
 write		8D-8D-8D
 register	8D-8D-8D

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
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
[   14.761055] random: crng init done
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
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
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
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
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
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_read2
199319e974b9cb046bac51c1cb64a6843c4851127fbf072a4240063d47727177  spi_test
8ff4795e570cf12e4257adf7e9c761c516f0b1d5e1a2a2af68542add3025fc34  spi_test2
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

Logs for W35T51NW-E:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef5b1a
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0102ff00080117800000ff84010102e00000ff05010106e800
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe5208affffffff1f0000000000000000eeffffffffff
0000ffff00000c200f5210d800003452b50082e31458e96376337a757a75
ffc3d55c008070ffe950f8a110cb088b0000ac0000000000ffffff860000
00000000000000000000ffffffff430ef0ff215cdcff000b0016b181b585
00d87b9d580b000030f6de9c10000000
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
4e27c223863fa0982fa54d0b74b0bbfbf370c105f94bc0e49d0d02d8db79cbed  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	22

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 8D-8D-8D
  opcode	0x12
+ cat /sys/kernel/[   54.436903] random: crng init done
debug/spi-nor/spi0.0/params
name		(null)
id		ef 5b 1a 02 00 00
size		64.0 MiB
write size	16
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_SR_TB_BIT6 | HAS_4BIT_BP | IO_MODE_EN_VOLATILE | SOFT_RESET | ECC | NO_WP

opcodes
 read		0x0b
  dummy cycles	22
 erase		0xdc
 program	0x12
 SR1 read	0x05
 SR1 write	0x01
 8D extension	repeat

protocols
 read		8D-8D-8D
 write		8D-8D-8D
 register	8D-8D-8D

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
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
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
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
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
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
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_read2
a4a0c6780d8568c36179c019fcb621ac2b59e98127a16996b3264e6be64cf746  spi_test
496fde2866968c0c852f11ffcd7d1fc9e79f88256bf6f0ebf700d795483eecef  spi_test2
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
---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 55b27bc7e467..a830cad64c1c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -633,6 +633,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x5b, 0x19),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP,
+	}, {
+		/* W35T51NW-C/E */
+		.id = SNOR_ID(0xef, 0x5b, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP,
 	}, {
 		/*
 		 * Catch all entry to make sure all chips solely relying

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
