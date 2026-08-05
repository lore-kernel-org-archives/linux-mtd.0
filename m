Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1609C55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=580cWimB7ZKJUAbBkcGFpVLGvGmp+o7DBycAn1J/ZYY=; b=eMikywXd5G954/
	whhaP281FFxVpYmlqdHTG+anMPCgmKr2A5rRZW4nyPw3zMnV+7Umd0bC+U+dn2iQE/1Q6solqX/tO
	gsmdvbZSiYRrx9j+IhuZRs75mE3dbewmQLxgV0kPhT1ZCzq604K/xCybhvO4yoUrQ9GyveBTgHBjD
	rur2NgIY6ePirtIxAwhhcCYkD4OgpUylys7gwlxHDVoDs0cu6AAJwcSEW7C8jhd/ys7Rgw2hUZHDL
	pAqoeuKcGEqY7sYD/ONKuKz/4igvxjc8NbKUfrprAa2WL4bu+AUIKL2/0l31Pw4oqLHJMwOyGWeJd
	XSJwrkmxg6lw3JoBgigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWbC-00000003TPE-1Gbu;
	Wed, 05 Aug 2026 08:03:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWaz-00000003T5Z-1GxB
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C75B54E410F3;
	Wed,  5 Aug 2026 08:03:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C915602AB;
	Wed,  5 Aug 2026 08:03:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E625111C34364;
	Wed,  5 Aug 2026 10:03:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785917002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X8aYxMlLfJq5PE2QjM0slAjtAnVX/GkZT4hxi09Jwi0=;
	b=eyD8f0ltqwi0/66x6YXWJwPIdAKTFe1KQLXY/0auqo0cecYdlXe4VeIDT4ei6DRl87uMjo
	c0Bz4RyeHf/aZFCASPSeCHF9ZJ8Ytn6kT+BQyt/XHro7Y4hge66HxxC6qdv27cX9lhs2DS
	oJAKnhJNQHS0SCZmy1kDtA+R6XuKvX9Y9DCjq6D48mW40To1JS7k+9jwHj3JOU93MTeuCX
	Rl+fcpHAQlA+SD1SvUJGshm4qlnBU6ezwlCU/+v1ofSw5dcAOSAWj7s5Xi9yyfi8zAXTDb
	BJVdugnqLMahDv/OBLpmUGrm+LONAV6PBZ96MnwhuH2cgxOdAstaClQad+d90g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:46 +0200
Subject: [PATCH v5 21/28] mtd: spi-nor: winbond: W25Q01JV-Q/N: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-21-87238e577794@bootlin.com>
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
X-CRM114-CacheID: sfid-20260805_010325_855673_361EDB93 
X-CRM114-Status: GOOD (  12.92  )
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

The SFDP table does not advertize the locking capabilities of the
device, flag these capabilities.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef4021
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ff03000102f000
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff3f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff
$ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
c733cf105c5f05ed23ad3a32c2a72c1a09d4b895c628db52e645a8a457dfc7d6  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
$ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/
jedec_id      manufacturer  sfdp
$ sha256sum /sys/kernel/debug/spi-nor/spi0.0/capabilities
6204c70963ab07f9865d051b888679ce34ad3a9f167fbbd4a2a6e0c3d0ce4cdf  /sys/kernel/debug/spi-nor/spi0.0/capabilities
$ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
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

$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 40 21 00 00 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

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
 c7 (128 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-07ffffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 2048

$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ flash_lock -u /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x8000000
Lock status: unlocked
Return code: 0
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
3fa6e836be5a072bd2d4ae538559dce20b14c5827ccc0cf6df783c0c35a4a83f  spi_read
3fa6e836be5a072bd2d4ae538559dce20b14c5827ccc0cf6df783c0c35a4a83f  spi_test
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff | unlocked | 2048
$ flash_lock -l /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x8000000
Lock status: locked
Return code: 1
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
3fa6e836be5a072bd2d4ae538559dce20b14c5827ccc0cf6df783c0c35a4a83f  spi_read
3fa6e836be5a072bd2d4ae538559dce20b14c5827ccc0cf6df783c0c35a4a83f  spi_test
$ dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
$ sha256sum spi*
3fa6e836be5a072bd2d4ae538559dce20b14c5827ccc0cf6df783c0c35a4a83f  spi_read
3fa6e836be5a072bd2d4ae538559dce20b14c5827ccc0cf6df783c0c35a4a83f  spi_read2
3fa6e836be5a072bd2d4ae538559dce20b14c5827ccc0cf6df783c0c35a4a83f  spi_test
367809dbdff878d023d3a1a8526a6382759a3ec78aa6289d18577d15f013d44f  spi_test2
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07ffffff |   locked | 2048
$ flash_lock -u /dev/mtd0
$ nsectors=$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed -e 's/.
*unlocked | //')
$ ss=$(($size / $nsectors))
$ bps=$(($ss / $bs))
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2 * $ss))) $((2 * $bps)) # last two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff | unlocked | 2046
 07fe0000-07ffffff |   locked | 2
$ flash_lock -u /dev/mtd0 $(($size - (2 * $ss))) $((1 * $bps)) # last one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07feffff | unlocked | 2047
 07ff0000-07ffffff |   locked | 1
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2**7 * $ss))) $((2**7 * $bps))
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-077fffff | unlocked | 1920
 07800000-07ffffff |   locked | 128
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $((2 * $bps)) # first two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-07ffffff | unlocked | 2046
$ flash_lock -u /dev/mtd0 $ss $((1 * $bps)) # first one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-07ffffff | unlocked | 2047
$ flash_lock -l /dev/mtd0 $ss $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-07ffffff |   locked | 2047
$ flash_lock -u /dev/mtd0 $ss $(($ss / $bs)) # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-07ffffff |   locked | 2046
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07feffff |   locked | 2047
 07ff0000-07ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $ss))) $(($ss / $bs)) # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff |   locked | 2046
 07fe0000-07ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 1ac0177aeb44..59d5be14a73c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -239,6 +239,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q01JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x21),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
