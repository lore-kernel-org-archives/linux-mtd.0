Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6212CCFA18
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEda5pw1ZU+qeKBYpVQVlIbKikuCF1gbKudlU2F68Uw=; b=XQSrp4bbYzq2JC
	57dpZm/xBxpQJdIUXBVrNJ1sScss6U14/iw2m+rHZ0wJUF8+HFkg28QnYrSURXOv9ZiexxhArLCJn
	0RsQbk+tcLwYiPrLA1VZkRsw31q6KKMD1Qq1qZ7k76FOo9jQLvvFTIXNH4+TJ9paOzYDhxCXaxPpy
	Dyj609dbDCdyPLcCgA0rGNbQzqh6L5qiye7+F7C774dEgzCKDbRauKaDUJmUFgaKASdI/8WDCnhEe
	gGYmFs3kqp8mQdTSPDqyPjORJ9FP6dess38pRahXBZOGdkDmH73HEkKdGhzQj/HsA30rkhphebCLw
	hc4a9oJxnWHYqPAg+A1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIH-0000000EANF-1Nw2;
	Wed, 05 Nov 2025 17:27:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIA-0000000EAJR-0ylT
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 17:27:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB7901A18C7;
	Wed,  5 Nov 2025 17:27:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1E3F60693;
	Wed,  5 Nov 2025 17:27:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F16F010B50A78;
	Wed,  5 Nov 2025 18:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762363647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RpAQM7b8Qix65CMI/sBmP05P46NUJ0wMgmRJ/77M2f4=;
	b=Ieje6ZArOtDrNr9myXRx80Rdu+BsDqjTzqSmxKpm9f0BpB7n2QCcLCODmdofF0NJtXgguM
	rJL4w0OM626xA2mwirk3nzXVfCrBPAtmC5//6wO8BS150xf1/apGEaz3Z+JN/7FUeKBvWD
	Zp9rLmY5AXpsgcTpWd5rEYJAD1i6Z7X1zcrf6ib9j0CJtRgBXtyN/lzfXBDGLKcnyVeRye
	YVU0uGd1PArMMfOudEFGacfAGhER7KXy+sh6zuS5G0yptmhgxON6jybTTqFYztuBj03wdM
	hB0dj6ZSRuKbVjS3UPpSNvzKZ7VfABBvxBzBk5/TPt3FsLIsZ9ft04THYxXc3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Nov 2025 18:27:01 +0100
Subject: [PATCH 2/6] mtd: spi-nor: winbond: Add support for W25Q01NWxxIM
 chips
MIME-Version: 1.0
Message-Id: <20251105-winbond-v6-18-rc1-spi-nor-v1-2-42cc9fb46e1b@bootlin.com>
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
In-Reply-To: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092731_081302_38DF5D58 
X-CRM114-Status: GOOD (  13.71  )
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

These chips must be described as none of the block protection
information are discoverable. This chip supports 4 bits plus the
top/bottom addressing capability to identify the protected blocks.

Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
cat: can't open '/sys/bus/spi/devices/spi0.0/spi-nor/partname': No such file or directory
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef8021
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff3f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003652b50082ea14e2e96376337a757a75
f7bdd55c19f75dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff
$ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
d70b64bfa72dad202ff6881f92676b3a79b1e634b60653cd15f1820b7f3acaea  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id		ef 80 21 00 00 00
size		128 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET | NO_WP

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
$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ hexdump spi_read

0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
$ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
900fef48fdac362ce15d4608acfd9d733b514751423ae8d26e94036531198fb8  spi_read
900fef48fdac362ce15d4608acfd9d733b514751423ae8d26e94036531198fb8  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
900fef48fdac362ce15d4608acfd9d733b514751423ae8d26e94036531198fb8  spi_test
$ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 134217728 (128M)
mtd.erasesize = 65536 (64K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index a13a1201eae92233091dde644d590baa57e97046..580c9cb37958136e7e9fbc71152de55ab008812e 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -347,6 +347,10 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25Q01NWxxIQ */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+	}, {
+		/* W25Q01NWxxIM */
+		.id = SNOR_ID(0xef, 0x80, 0x21),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 	},
 };
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
