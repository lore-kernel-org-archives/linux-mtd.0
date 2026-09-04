Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F776C79F87
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+WBotBZ8Aqj9WwblQdj5r3oZe1Z7+1L7TggxD8ZxIo=; b=WtE4fFYCcPjmTF
	IF6Acj+TMXAxK+H/uVTe7gk5EmqPz3NpXe4yov/9n77gW6fVvPDQhB7qDknibOtVND9xqzmarGkjN
	+7/NGFyh2YmGFfqHo5wL/K2XgA3fiHJjqibXLRKXsBKu03nwXTR4e2+OZnj1FPayR1vNlg+rdCIzC
	f/x32qU3Q1uXJLFc3YEs+No0umKjztGnuSh6szbV3hOE1NKWyeMAlalp9P6S/AoRJPZ8oaUFcXr2L
	VWjSbluDbM6iHZqBi5yUYzHOG9ADT0Ps62PVtgdItN8xHEfV8ZV1r24HeUeRQ+heZQYtBFeE0/dM4
	UxJ+r16nadUdgj1PQJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YQb-000000031Ti-2bUL;
	Fri, 04 Sep 2026 18:14:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YQa-000000031Po-1ur7
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 18:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lWcfzaRbcFAWuXUugz8ocyLvRHCYGnfMdNocLzp7AEM=; b=OlYsR97DIR18/SBSo64/DsUQc6
	zMHimSIihxJasI1HSVIyd8C4+OjHf24mZEceqeGqk2o6O70++nqhFZ+7UDf3OsPd6q4hTDTVuqlwg
	HStORhZ8CN16mxjPtUSVLw+Bjtyt6OZTqNs80SZRM5iF91TmlAA/UaEFqasRUeuCDh1SfSNQsb1ep
	ayEaL/Oa3McqH/lGXNoNC5yX/qhuJxtL3zE1gww8+1mYdsEWIc26oNlxfu1f0/9CbJMFfnDD3BhkP
	BRm5eRrzD0aNgZe9sinPeuCn59pKI1fXDeoGZJjtte3XnCw7GSbDyVVdzef+W2bL2SsZ1KAPtUeHM
	E5pvqHAg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2YQU-0000000EOW5-1pb5
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:14:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BFABB4E41526;
	Fri,  4 Sep 2026 18:14:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92BEE6057F;
	Fri,  4 Sep 2026 18:14:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5986C11C78705;
	Fri,  4 Sep 2026 20:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lWcfzaRbcFAWuXUugz8ocyLvRHCYGnfMdNocLzp7AEM=;
	b=PZbP9JV68cMgXGQWmWHxBK0NeLzuVpu6ynNZIyEWoGpZelBJidJR9wAGEVjn2Mt+tyHhDb
	q/rLQzrm/llqRJNBxFeaQbqZ5KLnBpj3tJb2Yw4U76Ss0vXUem6Xz4sl0PMNBV0apBqBRF
	jy14SzmmegvSLJawjgmzW2c2jb3ADEDrYwCuRgYwyEbITeV2d49kzNnZJp/SR5Hdju8x2d
	0vbJJo5N5SrgE3gITV6G+/IuCLaiAfOVIEXpcQizOhMLGBeoNPFJ/Lp5h2bXn/GeG48Joj
	iknwlmbJjRq+5xosHv34L/H5T1KOt6/E1U/6lrpXzvzUU5hbMuV4v8SlFZrdPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:55 +0200
Subject: [PATCH v5 18/25] mtd: spi-nor: winbond: Add support for W25Q32RV-M
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-18-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_191411_795660_4F098427 
X-CRM114-Status: GOOD (  14.66  )
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

There is an ID collision with the chip of same density from the JV
family. Both chips are very similar in practice, it is mostly a matter
of electrical differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
the new SFDP (rev F) field which forces an alternate write SR2
opcode (0x31).

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef7016
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0100ff00080117800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0144eb086b083b42bbfeffffffffff
0000ffff44eb0c200f5210d800001432010183e314c2e96376337a757a75
f7a2d55c39f66dffe930f8800000000000002c0000000000f6f4ffff0f00
0000060d44bd27ed080d
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
2c0c54d6e360dae30b72615eac5f0faff59463aeb2237d46d08d6cfd77d6c9f6  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id		ef 70 16 00 00 00
size		4.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | SOFT_RESET | NO_WP | HAS_SR2_CMP_BIT6

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
[   15.820716] random: crng init done
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
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_read
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_test
+ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 4194304 (4M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
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
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_read
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_test
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
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_read
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_read
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_read2
c73e2828631d8f745c118e706e4ea7179328e6e03e49cb2d30784eb73ff6167f  spi_test
d26d11f7de825c1f2397e52307997c9befb07b93e6cd520d15a87d06abef2529  spi_test2
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
index 1b06d10d0f6b..6b58be6f3e7b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -366,7 +366,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q32JV-M */
+		/* W25Q32JV-M, W25Q32RV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x16),
 		.name = "w25q32jv",
 		.size = SZ_4M,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
