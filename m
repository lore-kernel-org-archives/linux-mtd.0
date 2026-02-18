Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F87DE9A04D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30PWhZVYb0HBavOwNK5oPLfKC7d+5Vfj3Fqwea2PyWo=; b=Csca2QAxuQWSyP
	lsusZdh8Vrx+4/TMSxYqqkwCMkbtSuiZUqA7x4FwnYFn1DBUqVmFu04CldBAGNaJXnOLpq8vX0J+i
	OnLfw3SS/6GAMTjp6pbxUadPHlTHL5YuBRuuhuVE63Pnrk1Kppb9suc0JDi23YC0RDcCrMansqMHr
	KDkcHVlgitTik8RGKMHGRlEeaWE4zkJ5pnf23OxyBW2u12vpfZO0+AqzlKfbuH7VbyGQtLGTVSS9o
	aJ0YfhTmdxHJE9pUR29yFslTRBFlMEUqxDccdfotbCBfmSE6h2kOnqcG1zm6iNdExc4EFLP8q/Xfi
	zHXmCUBXZWEMaZGUtUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieT-00000009xT5-1sCM;
	Wed, 18 Feb 2026 14:35:41 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieP-00000009xRc-46Bn
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 14:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1771425337; x=1802961337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b4nAwwP9kKL9flULqfozPlWT1GSVAHqt8b0l1p7ovGQ=;
  b=OOGpA0sGZEx0YTJ38q4DMBhIEBpcIUh3xYJZT4flg8W8pC1rFnaCWeA1
   rIc8LDlv9FYC2fk0/+xjcvC4ArxcqpLYcg6YO7Pv3eMkOPyk+kQocds3X
   JaKhFTsrLcBZV9XQaFgCRHp284yMxyw9QwRhx1tGmDdwTiU9GU30/7+hd
   ZjF5VMEPQ7Vgtq6IzRsqLFVnsIvTHEOkXB4UuW1aHqQRg+6+6dbdDroyJ
   2A35GlKkkWIWuImE5t72v4jJEX83tn6ZFK3fIOnDJCQFXkciB57oXjhl+
   ixal5ac9ibyutSY+Pm9fasYrBrur/khwdTH+LH7YeRYZNpbg4DmQEqvHN
   w==;
X-CSE-ConnectionGUID: RQP3LO31SpiU+o41FX21fw==
X-CSE-MsgGUID: U8LcRvs4TA6klofjpwj24g==
X-IronPort-AV: E=Sophos;i="6.21,298,1763424000"; 
   d="scan'208";a="13290663"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 14:35:31 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:8957]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.194:2525] with esmtp (Farcaster)
 id 00709b63-fb83-4df5-a64e-073fb2d7c1fb; Wed, 18 Feb 2026 14:35:31 +0000 (UTC)
X-Farcaster-Flow-ID: 00709b63-fb83-4df5-a64e-073fb2d7c1fb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 18 Feb 2026 14:35:31 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 18 Feb 2026
 14:35:29 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH v2 1/3] mtd: spi-nor: winbond: Fix locking support for w25q256jwm
Date: Wed, 18 Feb 2026 14:35:21 +0000
Message-ID: <20260218143523.17467-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218143523.17467-1-farbere@amazon.com>
References: <20260218143523.17467-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D042UWA002.ant.amazon.com (10.13.139.17) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_063538_065661_FE714717 
X-CRM114-Status: GOOD (  14.25  )
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

The Winbond w25q256jwm device supports four Block Protect (BP) bits and
uses Status Register bit 6 as the Top/Bottom (TB) protect bit.

Update the flash parameters by enabling SPI_NOR_4BIT_BP and
SPI_NOR_TB_SR_BIT6. Without these flags, the locking configuration is
incorrect.

Reference:
https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q256JW.1

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
This flash is populated on the al11_k2v6_jrd10 board and was tested at
35700000 frequency using the amazon,alpine-dw-apb-ssi SPI controller.

root@alpine:~# cat /sys/bus/spi/devices/spi3.0/spi-nor/partname
w25q256jwm
root@alpine:~# cat /sys/bus/spi/devices/spi3.0/spi-nor/jedec_id 
ef8019
root@alpine:~# cat /sys/bus/spi/devices/spi3.0/spi-nor/manufacturer 
winbond

root@alpine:~# xxd -p /sys/bus/spi/devices/spi3.0/spi-nor/sfdp 
53464450060101ff00060110800000ff84000102d00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff0f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14d3e96376337a757a75
f7bdd55c19f75dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff 

root@alpine:~# cat /sys/kernel/debug/spi-nor/spi3.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3c
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbc
  mode cycles   2
  dummy cycles  2
 1S-1S-4S
  opcode        0x6c
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  0

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-1S-4S
  opcode        0x34

root@alpine:~# cat /sys/kernel/debug/spi-nor/spi3.0/params
name            w25q256jwm
id              ef 80 19 00 00 00
size            32.0 MiB
write size      1
page size       256
address nbytes  4
flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP | SOFT_RESET

opcodes
 read           0x13
  dummy cycles  0
 erase          0x21
 program        0x12
 8D extension   none

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 dc (64.0 KiB) [3]
 c7 (32.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-01ffffff |     [ 1  ] | no

root@alpine:~# dd if=/dev/urandom of=./spi_test bs=65536 count=1
1+0 records in
1+0 records out
65536 bytes (66 kB, 64 KiB) copied, 0.0002316 s, 283 MB/s

root@alpine:~# mtd_debug erase /dev/mtd22 0 65536
Erased 65536 bytes from address 0x00000000 in flash

root@alpine:~# mtd_debug read /dev/mtd22 0 65536 spi_read
Copied 65536 bytes from address 0x00000000 in flash to spi_read

root@alpine:~# hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0010000

root@alpine:~# sha256sum spi_read
71189f7fb6aed638640078fba3a35fda6c39c8962e74dcc75935aac948da9063  spi_read

root@alpine:~# mtd_debug write /dev/mtd22 0 65536 spi_test
Copied 65536 bytes from spi_test to address 0x00000000 in flash

root@alpine:~# mtd_debug read /dev/mtd22 0 65536 spi_read
Copied 65536 bytes from address 0x00000000 in flash to spi_read	

root@alpine:~# sha256sum spi*
b16b45f0cb74ba65d81766e9007d8cd1fbd3ac7ca7fbbd76fa4d181c3c1d52c0  spi_read
b16b45f0cb74ba65d81766e9007d8cd1fbd3ac7ca7fbbd76fa4d181c3c1d52c0  spi_test

root@alpine:~# mtd_debug erase /dev/mtd22 0 65536
Erased 65536 bytes from address 0x00000000 in flash

root@alpine:~# mtd_debug read /dev/mtd22 0 65536 spi_read
Copied 65536 bytes from address 0x00000000 in flash to spi_read

root@alpine:~# sha256sum spi*
71189f7fb6aed638640078fba3a35fda6c39c8962e74dcc75935aac948da9063  spi_read
b16b45f0cb74ba65d81766e9007d8cd1fbd3ac7ca7fbbd76fa4d181c3c1d52c0  spi_test

root@alpine:~# mtd_debug info /dev/mtd22
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 65536 (64K)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fb855fe44733..55f1209936d5 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -337,7 +337,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
