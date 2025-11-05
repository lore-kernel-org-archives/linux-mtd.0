Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEB0CCFA1B
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUQ01UB57CKTG1EtnzvIebaszdJoBOktnpm2tLgaXxY=; b=I8oE3kPwjjkKTV
	ngjJGJMkZ8saSAJKJseCfIfb+imD0vsXWgXyPziRqdwlHpVD3B28qcaZJJTXDrmpkAG0HByuxiJjJ
	X087PYfSbRh0R9f2EhrEgyUheRz4aJSJR1Ad4Peln8UZW4pylfb+Xv8S6sFQDcmI0UHBYdbMc5cPQ
	iiLZvp85UtHViDlXE4waAtYOlgzPsk/QjHt02I6eImWKhpNDSeloQtYLJ+k/2dVIEqIrfeWTkjeOg
	1KFX1RvsIyU+SC2qNUavvuSBk7owuE14Qv98zpKFGgNnYfdELjo4k5MgNGVkM+pfNISkNySvgAHod
	BkyNw/nVZBxMGdchbksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIJ-0000000EAOs-3955;
	Wed, 05 Nov 2025 17:27:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIG-0000000EAM2-2re9
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Nov 2025 17:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CGieSf4sf5PwIa6l1gS6GefuQmbm4k5Nc8IQbv6zCok=; b=E9hlyK/kAMoiXXOsZ2lWXQyLyD
	hJo29dq0WQn1OQ/Dckp/dsF9qsTHO/FpYcQchTOqOsp/bVMn6m3Q22efcTyYinI5giYdZ0hcX/oxE
	5sfBOocVz8MdfcOcT8BPfLdOEhZdYg3CSeS7QdVu2lhFozdH4YaKjb1TJIfypQLMS3zbwmBo99/sa
	Rn2YWGn7OTGNCUQwfO2KepjuN+9bCMWwed91SypZc7CpY50bP5TYO0br1fEoZjaAHeQMswvFk6ffa
	yzZyBg3Y0XHOiPa6Ewargtbqn/tNsg1+EoLs0FQ0awKP9sNK7wzG4nvkrZjULL8n9RnVQ5iI8y4BZ
	WXlgtdhQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgQW-00000002cXP-1r1H
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:32:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06DFE4E4153E;
	Wed,  5 Nov 2025 17:27:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D12EE60693;
	Wed,  5 Nov 2025 17:27:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 153EA10B50A78;
	Wed,  5 Nov 2025 18:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762363651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CGieSf4sf5PwIa6l1gS6GefuQmbm4k5Nc8IQbv6zCok=;
	b=S3/K3cNg0YEJRdK7CBYcE3BG/lu/+2KuZDrUpqIRoM4yqK2+uB1tM9LIIb6nyQY9VrMvyE
	b1EomsmH9oMQ3wad+9ju4qK5QZKBJ1tsOZvajlBlVHvJZSnP4INIG+QClClVpmMBAJ6G+L
	sM7MjGlB+a3iHL6XOMKsi0XWIlHkv3U97UXJ7aAokNq1JcBcw83brY64gTVZW1W/flx3VD
	l6gOzyagkFwRZ9FUciy0mC8IWoaSRFsg75ARqu9H7/HokRrCHeN/tdsd7inb4ABQZXQvXU
	loSuq5eB4sACsMrMuyxcQy84M7qIxJ/0nDQWTmGXNUbPuvTEapDLX8/Z6I+U9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Nov 2025 18:27:04 +0100
Subject: [PATCH 5/6] mtd: spi-nor: winbond: Add support for W25H01NWxxAM
 chips
MIME-Version: 1.0
Message-Id: <20251105-winbond-v6-18-rc1-spi-nor-v1-5-42cc9fb46e1b@bootlin.com>
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
X-CRM114-CacheID: sfid-20251105_163204_628232_30CE7441 
X-CRM114-Status: GOOD (  13.40  )
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
efa021
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
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef a0 21 00 00 00
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
a2cab5130668ecf92f4da32cbc2ab7be5e6db03ff36972775822f56e324d5122  spi_read
a2cab5130668ecf92f4da32cbc2ab7be5e6db03ff36972775822f56e324d5122  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a2cab5130668ecf92f4da32cbc2ab7be5e6db03ff36972775822f56e324d5122  spi_test
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
index 781ca0abfcdca2dc883e33bfa5c164623cf0905d..338e44db506a819b15e21f312c06ec13e6d37d28 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -359,6 +359,10 @@ static const struct flash_info winbond_nor_parts[] = {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+	}, {
+		/* W25H01NWxxAM */
+		.id = SNOR_ID(0xef, 0xa0, 0x21),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 	},
 };
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
