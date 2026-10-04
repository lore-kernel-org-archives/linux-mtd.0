Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61CCCA5FFE
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJ+7795td2HWZExqzGiwiYu3o7PoFHfJzJqWOTIevCs=; b=21kWjxfkH/wFdc
	W53+U9x7dXgxwTK+JQYK6H2xTeUzr1B6zlo3G13cO3/OYNx8OpYSUaC4WctZdYLjJ9dMz8fW7qDWW
	Nm5rKCxmhEuCh9d9T/kLevo6kRb9uECXvNswJWqK/c8GIR//ceXq5kYLJJbIoLBBU4W/104Ne7VOw
	MIz4ahsNeAu5E5liekMDf986l1ggiZ38yS2N6Fxv4Yu0GoYAAI8i5cGscT7M492ujcNVWF9WCH1as
	07vxA6ykdgs9tVJUrUkwVX1g9Nr0nA0a2QgAx3S/Vr+EpJUkbxpbMFT/qZb5X1uJbgsP84OB2P2Gz
	AvGfiPutal0RLCTK+ElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTov-0000000FNI7-1q0r;
	Sun, 04 Oct 2026 21:32:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTos-0000000FNEj-1KQq
	for linux-mtd@bombadil.infradead.org;
	Sun, 04 Oct 2026 21:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pH1+1/lMmmSMYISfb7sTntap9kyfXa8JbL+ThgWmCqw=; b=SzpYVMi4WxX3u72VEEnB4+TjdS
	GK1dbYNIwLAGRI7eV2kBpflEoj+SpGI7d0wMXebaVdekcI3fyLmaSNQlMlAp8rhelQonlL5HiF9Vi
	L8RgVL3GDukce4nSCvjCRYOimn3NlsMWPgdMAPEu3PleoU86k1M1VERDDeGNXh0TOg4RnIHMJJpDD
	qgtt2AAALsxVXi0qcAvU+ISc67ZWmMgIoFR+A0r0fWYXh50dP57fuSkgs3v1zp669YiBdUHyAryS1
	wd1kgfY/+fFEwiN1cslYBLs2BAFDf2LX+WOAcdYRdSSlw6xIRsnTsh3Cr8QNfrymga2MrPhEq+/zs
	F0GT/RsQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDToj-00000007TgL-0kZ8
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:32:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7956D1A113A;
	Sun,  4 Oct 2026 21:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E815604FE;
	Sun,  4 Oct 2026 21:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A887A1032820F;
	Sun,  4 Oct 2026 23:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149539; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pH1+1/lMmmSMYISfb7sTntap9kyfXa8JbL+ThgWmCqw=;
	b=Mw/QLsDaxRKLiY/JeSPOluW/kS723SOhVqqRHAwr+FGvkOhZckB6beMk2/7/9Gh2n1+zW/
	kkyNy/81wMhzcc0UfCmrHJkG/WJjOIKVrg3sPiFB2wHPRIsvSrEqghiPLX7z1EJyfchd3n
	3tOMatENDXET9Q2UR4j+LDGDS0rIEdh7RJk2sKoRCK4XuCk9aJcgrmbdqGwxKIQkTAh98L
	RZGZNEoKtKRHJIshg2qBZ1e+Ov05I3Jfq87lYXQVeWw2UsGMRSO/YQx7r1Jtaby4NauVpY
	tjiK13fguDyCzeYupifRFrbmb0UIdaIBFtKYqEJmskCV9qeFSiIu7+x2C3fgtg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:29 +0200
Subject: [PATCH v2 15/17] mtd: spi-nor: winbond: Add support for
 W35T01NW-C/E
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-15-592f3300a70f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261004_223222_020441_60990C33 
X-CRM114-Status: UNSURE (   8.78  )
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

Parts suffixed -C and -E are very similar: the -C variant comes with
additional JESD216F SFDP tables.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Logs for W35T01NW-C:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef5b1b
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0104ff00080117800000ff84010102e00000ff05010106e800
00ff8701011c000100ff0a000108700100ffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe5208affffffff3f0000000000000000eeffffffffff
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
0f951707aa460006d0e534d524464a6a0d2adca6eeab522c59497868e6828542  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id		ef 5b 1b 02 00 00
size		128 MiB
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
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 2048
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[   20.788989] random: crng init done
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
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_read
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_read
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 2048
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_read
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_read
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_read2
c8b5315b436f2f21d320704b5cae5349aa5f8c4bf245cfc7a7b55b26d139442a  spi_test
2cc891e91c0aefad43e9bee4348aeddb34a2040c83e3fa3e920aaca7b4790203  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff |   locked | 2048
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=134217728
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=2048
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 134086656 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff | unlocked | 2046
 07fe0000-07ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 134086656 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07feffff | unlocked | 2047
 07ff0000-07ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 125829120 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-077fffff | unlocked | 1920
 07800000-07ffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-07ffffff | unlocked | 2046
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-07ffffff | unlocked | 2047

Logs for W35T01NW-E:
********************

+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef5b1b
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0102ff00080117800000ff84010102e00000ff05010106e800
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe5208affffffff3f0000000000000000eeffffffffff
0000ffff00000c200f5210d800003452b50082e31458e96376337a757a75
ffc3d55c008070ffe950f8a110cb088b0000ac0000000000ffffff860000
00000000000000000000ffffffff430ef0ff215cdcff000b0016b181b585
00d87b9d580b000030f6de9c10000000
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
0fee35c2e84c7f280fe44e3249695f6075ab26716936deb21d4297dbafa39221  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
+ cat /sys/kernel/[   41.869223] random: crng init done
debug/spi-nor/spi0.0/params
name		(null)
id		ef 5b 1b 02 00 00
size		128 MiB
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
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 2048
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
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_read
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 16
mtd.oobsize = 0
regions = 0

+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_read
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 2048
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_read
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_read
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_read2
7997c21fcdcafb94f39c027a6f5e6df4dd92307a6e4e099b26b6a7038bfe479c  spi_test
a273339ca03dac990920b5ce3f664c784b7c427bfc9fff36904ba220f4d78a4e  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff |   locked | 2048
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=134217728
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=2048
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 134086656 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff | unlocked | 2046
 07fe0000-07ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 134086656 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07feffff | unlocked | 2047
 07ff0000-07ffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 125829120 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-077fffff | unlocked | 1920
 07800000-07ffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-07ffffff | unlocked | 2046
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-07ffffff | unlocked | 2047
---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index a830cad64c1c..b86b9ca1fbc6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -638,6 +638,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x5b, 0x1a),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP,
+	}, {
+		/* W35T01NW-C/E */
+		.id = SNOR_ID(0xef, 0x5b, 0x1b),
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
