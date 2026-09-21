Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79956C982E6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWp24ZNXF9HIEFp+zbrNrkM9YA+lRnS0iMi/GIuWQFs=; b=qBAabEyZpALxX9
	jKprhz3PLlxs4sVViymGiuUNW0kKIfCOS6rZRpdyHcOC6VKtT6nIRb/PBCq11PeUHSlbZjSC83UF0
	aA5QM2qKCBJDRjVWfN6z6XeyP04Ri4HFAZYe4FuSv6XosCfyoVWtLBOqeZ8z6JdOc/LV0cnyXtldM
	TjgxI81MN0XIAIsGAYkkBOdAv7AHilwKVktmzNMhqP88zqHkTCwti5YME7dUaV/avQxMfS5aoICyc
	RAu1au3W0ptVlsoR7riYw/oquqOrxFnF34ZYaAgnQ7o3iGOCFlwYlaC40xp+NK4GOl4S70N7tdQHP
	UTwFwKzI3EqT4x712sYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlP-000000015hT-1h1m;
	Mon, 21 Sep 2026 06:44:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlL-000000015cF-1dUd
	for linux-mtd@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lx4CC1PDKFceIk5BvBHALiKw/mBaSLCit5tSjp83XPc=; b=J21XJ6hGJ+lOCSgLBvnThJRFXd
	uQ73w8BOZfLAE1waImxgyYsDoPzyiZogB4hyliwMAxrVRwyAx8T1KtyO8ddvy3mvIT+AD7QyFQ46J
	wdK7iU+DjLM1547YNO6QSbcimeAe3rASh2qZCz/8NVeKjNH8aQHZDl7oAZG7QOzSYaXd9vuhaBW3c
	q5r+VhB2ARBd7ctEAQVEI8XKzU1yQzTLFKMpno/Xl8kY5KF3ukJJCLr6PRfdTYQN0IWi9vGLG2Mu/
	MqXrbIE2WjrAt/r3RoYVMKow4zkeObGr7d1Ir73iaXqYUOqiTHZofDpOqpbaSCnHxfPvc3sXjzHlu
	vfN84wiA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Xl4-0000000BtFg-0Mbb
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:44:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41A24C8F47D;
	Mon, 21 Sep 2026 06:44:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41E0B60339;
	Mon, 21 Sep 2026 06:44:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53F6D103290E4;
	Mon, 21 Sep 2026 08:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lx4CC1PDKFceIk5BvBHALiKw/mBaSLCit5tSjp83XPc=;
	b=j0qgnLvTMuMHZ4LGKFdpZ8i9bMDPV5oYFmz2qKR6pCqwrHrA/ILUSt6IG5qmIJ58DsIf75
	LCfwLvJz6Jbem6QpnVJSmnCPt5QqAZYmdWGCvaal1TL+L3GFx41F2haS374cLxc9wW39i6
	er9quouJ6M3hw4nzVUE+Kf7zTWdzbbncCKBa90WHA59PRxAokBvuxACRHTyo2E/cOmBwIO
	WUHiHINaPLzxHCM8hBtxkbvMXWJhfEwEMfFp/jFGXFWtACRBgbY/helIj6+MCvx71pCKQu
	/30bwQlYdPz9jOOxnsz1yD5YAXvvTFvK8miAjKafN3j7wFVjibbartdkS2pmRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:46 +0200
Subject: [PATCH v3 15/25] mtd: spi-nor: winbond: W25Q128JW-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-15-38eef3b6a7db@bootlin.com>
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
X-CRM114-CacheID: sfid-20260921_074413_069326_9C390E79 
X-CRM114-Status: GOOD (  13.03  )
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
eraseblock write speed is 379 KiB/s
page write speed is 376 KiB/s
2 page write speed is 378 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 387 KiB/s
page write speed is 385 KiB/s
2 page write speed is 386 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
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
id		ef 80 18 00 00 00
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
62363c62c7fcdb2181eab9031b13814d9fe8f22e38a68353ae81405676138ad0  spi_read
62363c62c7fcdb2181eab9031b13814d9fe8f22e38a68353ae81405676138ad0  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
62363c62c7fcdb2181eab9031b13814d9fe8f22e38a68353ae81405676138ad0  spi_test
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
index 945363fd52a2..fbad9e408d7a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -435,7 +435,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x18),
 		.name = "w25q128jwm",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q256JW-M */

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
