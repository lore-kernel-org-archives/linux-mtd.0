Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89563C982D8
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGLytPCmUWp3j7iYZ9v5GSsBfAB4jrv4oBI7NrW+nbQ=; b=HV7sI1eh2nJbSx
	bi9PAB4anm8yFOswI5xWhYcGBKw8txonxk8lQXfk06t6EE9wxux2kbdV9TnsbSuBzz9ADZRZ0/wIp
	w6yzc3/Tlqryz0U5KNlk65CnThmbLDJWoS34425eaXdr7/HC7yTRH/Hpb0lmbQhGhUUPIyyD4aRAu
	1us21um9O6LLvnVvARTKtM58X1evBL87kss9eBffBYh9hr4ZYY7GPNhNRxuZzM1b3DLbCX7ALNMNS
	os3terpYnaq0KS3dtYHw2pDxAqBGWilX6NBDed1SySQg9ADbZCCbkZ4VibKbXYsa6QiGTmTnGXKBy
	fOJUzT4QNA5pVZvV+00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6b-0000000HXqd-1YoZ;
	Sun, 20 Sep 2026 14:01:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6Y-0000000HXly-0SzI
	for linux-mtd@bombadil.infradead.org;
	Sun, 20 Sep 2026 14:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3NbdKKd83YR1kvFls9B3jdIqq5J2V9j9jiNj9sENYuI=; b=XvD4v7DL8FBmkrG8ilaHAhuyo1
	ucOAXXGJq3XcoSyGem+zqI6GHPrawBGqjrbkSgFv+itiDNq6h1E4vFF1UnOsRDVUda4/6LvV1g3BK
	P4EoOHqFuPD03HmJXkW9AChDZj7mwHiIZj3nKYXiwVTL+oVYdENungE0g87hvez82X7HKAPRbwDZ2
	L3g0pk5rdBv3eiKRgVUVkC7vwzDxPZY4nsCqCoHPVBguX/QQSt+RN+r6rKkLe2u/CnYeClrRNAeN5
	ubT3s8WSAO6U/eZhtLgcWcY6e2bxh3X5nCqkAsMO4BzxnGL4pUGPa52jRlD0k8DYW0MqEQ35uMbwq
	c+U875cA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8I6R-0000000BPoK-2Y5k
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:01:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A334B4E404FF;
	Sun, 20 Sep 2026 14:01:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70A136033F;
	Sun, 20 Sep 2026 14:01:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 772E81032909D;
	Sun, 20 Sep 2026 16:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912868; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3NbdKKd83YR1kvFls9B3jdIqq5J2V9j9jiNj9sENYuI=;
	b=QLNsjhC5IZWxhcgHU99OBU0PMOqcDwdy9L2IrQQOueS8m3M6Mp5bWmlK62i3dSp3gY1usb
	fN2P4K4tfrWQbx/yyz1SOl6Q9u34M46FkReM+MqJU/QL5koe2P6VsT3CfjE0yOYWS1oqdH
	kLHYMfLIM+H+7UitcE6407bB9VP+lKCS4UljjJBXUak9IXyMhJAv/ehrswCu6o/+JKwPYP
	V3/OCj0vkxZa6tJFIbqwuZnP8h0JfY0+9lvjjWgG80bniFaHLOFIsMAk8OkHEPGikFG66A
	gfIthkFr7v4Qmk/97MqHeoESHgUYy3vw0+V7gs4UAX2PuPQ/zZOshP1TGw4J+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:23 +0200
Subject: [PATCH v2 14/25] mtd: spi-nor: winbond: W25Q64JW-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-14-ab9c9688d071@bootlin.com>
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
X-CRM114-CacheID: sfid-20260920_150111_865728_6E0FC28F 
X-CRM114-Status: GOOD (  13.09  )
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
earn a few % of write throughput.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 707 KiB/s
page write speed is 699 KiB/s
2 page write speed is 703 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 739 KiB/s
page write speed is 730 KiB/s
2 page write speed is 733 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef8017
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0344eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14c4e96376337a757a75
f7bdd55c19f75dffe930f880ffffffffffffffffffffffffffffffff0000
f0ffffffffff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
4b9a53f823cc5483babb4b6a8e816cb9ae11cbb7021cfb375bead1c42ae98fc2  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id		ef 80 17 00 00 00
size		8.00 MiB
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
 c7 (8.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-007fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
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
819fcf52ab4866740190d2eed271f1b30341619e598386a6d7566154f5b2d979  spi_read
819fcf52ab4866740190d2eed271f1b30341619e598386a6d7566154f5b2d979  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
819fcf52ab4866740190d2eed271f1b30341619e598386a6d7566154f5b2d979  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 8388608 (8M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 98a1e063e7fe..945363fd52a2 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -428,7 +428,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x17),
 		.name = "w25q64jwm",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q128JW-M */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
