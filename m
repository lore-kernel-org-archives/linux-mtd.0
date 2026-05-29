Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5FACD6E51
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXCwe4hRwtvWc+H+ue2GpHteQ8kpqd8GLzLFt5o05RU=; b=CC6fbR5i7OlSOp
	AXgzXbm93c9Zrv94mKS1Q5wVWrGWqGIVLRTbGp0s0VIDKWGiI0jelCq38+YH6aZagNP2b9mWy4zt0
	gCqrwHAmeWtFCBjjv3+99xW+aluhh+p1yvLgGyQaETSQ3+3fLS+nmDC3KXaE9s1o94/Kz9gfGP8SM
	7ABCZip1cN7GiMUIbOqJxlOBfAuFXlA9xgTMODx/IhpRHmlxpCYj+3rETCYbH8MBkGIk9viYWT5I9
	zlXS5LbynDGEvGwD6/k/K7bMCgwtY40TEc4lXUv7KF1d2w89m0465GWwx3cO/ZFpWne/wn+KxgSl+
	dDZyW3Fnuti/RbfAIsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3d-00000007gJ3-4AKa;
	Fri, 29 May 2026 15:23:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3a-00000007gC8-1sLn
	for linux-mtd@bombadil.infradead.org;
	Fri, 29 May 2026 15:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qlWWyGvzUgQy+AKR69b9LqNs8ZCcvfMCxoNLIl5u09k=; b=HzhSaDn/2JmxDSzMTUdE5g5NUN
	To19bhBSdPfR1rq3Y3Iz4ZE7eH6IEMMgdh1gGAGqQHzLA0DO4zQIJQ6v/Ngy0OZcdPzJXys6Iecx2
	seHerXLNoWEzLbtYLNi2ZiKKELkv4ccGt/8mJygSE/upp19OfyixvvIX2tn28y1xFnNs+YmrVQxaC
	NCjyZUhGLWM3+1xj01scDItWTlGVp1oYgjok78PB8X3fUhonKkvj7Mwqf67UyY6Fjuz7V/02WPeli
	1A8k1sjgHLv5PQiwJe9q1yTeqrAPeoTt+D3QV2KYT4CrJklv/E8xHjhAQHQYg6Q030qUPczGBAdLD
	K+S65BCw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3W-00000006L2P-27tM
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:23:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 352DF4E42D90;
	Fri, 29 May 2026 15:23:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AF3E601FA;
	Fri, 29 May 2026 15:23:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C3A010888CDC;
	Fri, 29 May 2026 17:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068204; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qlWWyGvzUgQy+AKR69b9LqNs8ZCcvfMCxoNLIl5u09k=;
	b=lNNfxPq58Cj7zHF5xOJMdKrTMj56g/HdaBZzHEkSgmRoKxrOdn9qO9z55B5pGpJzYowcQA
	48EyEshuMmyI/xCk9mLgF0oCqqT5meqnOmVaZfVK1QfdZkk3bKX3tVtFpxHviDhaiEeVYb
	Q6gr2tF6sjeu+ycytMyX/0Kg6Mqd26zP/fIDSqnjMGotlaGBXwRJ56l6UoD78j/2TDQomS
	SXLTfI8o3UGDIJIMfaiAPx3YY8g4nlKiUHR2LbB4dwSW5PLEcfG12uglUMUlPQqGS1wAYH
	utypfgoKL6OiQgbHGri9agQPZ8YY/6M92Qz8X5MDJGUjONDQy02hxTK/PBTKmg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:47 +0200
Subject: [PATCH 27/30] mtd: spi-nor: winbond: W25Q01JV-M: New chip
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-27-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_162326_701787_18D1FAB3 
X-CRM114-Status: GOOD (  12.86  )
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

Add support for W25Q01JV-M. It is a 3.3V chip with usual dual/quad
capabilities.

The SFDP table is pretty complete except for the locking capabilities
which must be filled manually.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef7021
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ff03000102f000
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff3f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
c733cf105c5f05ed23ad3a32c2a72c1a09d4b895c628db52e645a8a457dfc7d6  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id		ef 70 21 00 00 00
size		128 MiB
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
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_read
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
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
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_read
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_test
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
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_read
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_read
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_read2
7ccac32f903edeaed4e7c6355a91c2e6dfc95dd007069c9f22ea2b9d45f5ce35  spi_test
43870da5d2b9fcb8fe0a6a96350b87da1e9423fe9f9e2f039bf363e68916ae0d  spi_test2
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
+ all_but_one=2047
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 2047
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-07ffffff |   locked | 2047
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-07ffffff |   locked | 2046
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2047
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07feffff |   locked | 2047
 07ff0000-07ffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 134086656 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-07fdffff |   locked | 2046
 07fe0000-07ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fa842e841804..1e5ad4e3ef7a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -311,6 +311,12 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x20),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+	}, {
+		/* W25Q01JV-M */
+		.id = SNOR_ID(0xef, 0x70, 0x21),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
