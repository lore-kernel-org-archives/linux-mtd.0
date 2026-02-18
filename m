Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C68E9A047
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Feb 2026 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9mAApg2TDmmZHsxnPIlsRVuf7sGV+Ur0mn44tmkOSA=; b=TbNDLE/GodWHkE
	/VnwDoDSqcMnBine5QwY7DOiIR/sFfU0xtHgLiW4ouiFXUf0vR30SRBjdx1Cle7WKty9X9DhAm97/
	SlSmK5tqvwcPSuTSuGigdgKwpff3j6DkRlY/Fy0OfvQZzkd0LJGGebAc24wpqQ3mfEXQxD+fyvhwP
	CHupoQDq4eU2hqPKJeFlNvGk3GWFS+9OWD2OxCZXzRF9ii3pSvltn8oPVSXrcIXM9Tm7BtdEym7Yp
	96j/4aTnQp8LkZStFq9BaP7GTPXNOT2bXeL+CyRN2bPyA2k/82jlJL9eZHNbzT163owLiNCDH9sJ4
	Ug6nTeyA1hM7i77aDx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieV-00000009xTe-0zSo;
	Wed, 18 Feb 2026 14:35:43 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsieR-00000009xSM-2sEE
	for linux-mtd@lists.infradead.org;
	Wed, 18 Feb 2026 14:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1771425339; x=1802961339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KB0yIBc6Y4ZCpbQ8D6+n6Qw1JeejQ9xAVki9iGAlDFw=;
  b=gR4SpbGKiCwbsQj0olR8RQNKbOhJSSm2soubfYFtEFNHBG63EX08P2jT
   4eX+0GLb4Uu9wC8IdU8ZS8TvABXhRYZ2upRzSaTyLqxfmv/Wvpbn0D61O
   dYvihPvk7MzgCPEiR1JV5X+9UR8v5RjapzG/7KGWYgANNScbfHMnbb2QI
   XEfzO8PKRL9uPLSFpS0EwoAmiXq0E9S69qZift+CIpKNv7YHLF1z/XhiI
   SwZxswPW8vKIwunO7Sk9MSEp2uygFBoCO+br/nNS68nmoZf0tZqV5sGxo
   gAAU2ZBA7Blw8SIfCu8HX3lZn7wPrb4fb+++PuDNZcGkKXw/+c2d7yX7R
   A==;
X-CSE-ConnectionGUID: NJ9+012ARQew5AS26ss9PA==
X-CSE-MsgGUID: Berulvv4QNy0msLToLvVyQ==
X-IronPort-AV: E=Sophos;i="6.21,298,1763424000"; 
   d="scan'208";a="13068629"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 14:35:34 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:6576]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.230:2525] with esmtp (Farcaster)
 id 5b4211f6-9967-4c43-9e03-3f10d56dcfd0; Wed, 18 Feb 2026 14:35:34 +0000 (UTC)
X-Farcaster-Flow-ID: 5b4211f6-9967-4c43-9e03-3f10d56dcfd0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 18 Feb 2026 14:35:34 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 18 Feb 2026
 14:35:32 +0000
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <farbere@amazon.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: winbond: Fix locking support for w25q64jvm
Date: Wed, 18 Feb 2026 14:35:23 +0000
Message-ID: <20260218143523.17467-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218143523.17467-1-farbere@amazon.com>
References: <20260218143523.17467-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D042UWA002.ant.amazon.com (10.13.139.17) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_063539_771758_9E7BFCD8 
X-CRM114-Status: GOOD (  12.12  )
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

The Winbond w25q64jvm supports block protection through the Status
Register (SR) and provides a Top/Bottom (TB) protection bit.

Enable SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB for this device to
properly describe its locking capabilities.

The device uses Status Register bit 5 as the TB bit and supports only
three Block Protect (BP) bits. Therefore, do not set SPI_NOR_TB_SR_BIT6
or SPI_NOR_4BIT_BP.

Reference:
https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=en&DocNo=DA00-W25Q64JV.1

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
This flash is populated on the al10_k2v5_jrd_aio_makalu board and was
tested at 35700000 frequency using the amazon,alpine-dw-apb-ssi SPI
controller.

~ # cat /sys/bus/spi/devices/spi0.2/spi-nor/partname
w25q64jvm
~ # cat /sys/bus/spi/devices/spi0.2/spi-nor/jedec_id
ef7017
~ # cat /sys/bus/spi/devices/spi0.2/spi-nor/manufacturer
winbond

~ # xxd -p /sys/bus/spi/devices/spi0.2/spi-nor/sfdp 
53464450050100ff00050110800000ffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0344eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14c4e96376337a757a75
f7a2d55c19f74dffe930f880                                    

~ # cat /sys/kernel/debug/spi-nor/spi0.2/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0
 1S-1S-2S
  opcode        0x3b
  mode cycles   0
  dummy cycles  8
 1S-2S-2S
  opcode        0xbb
  mode cycles   2
  dummy cycles  2
 1S-1S-4S
  opcode        0x6b
  mode cycles   0
  dummy cycles  8
 1S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  4
 4S-4S-4S
  opcode        0xeb
  mode cycles   2
  dummy cycles  0

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02
 
~ # cat /sys/kernel/debug/spi-nor/spi0.2/params 
name            w25q64jvm
id              ef 70 17 00 00 00
size            8.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR | NO_READ_CR | SOFT_RESET

opcodes
 read           0x03
  dummy cycles  0
 erase          0x20
 program        0x02
 8D extension   none

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (8.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-007fffff |     [ 1  ] | no

/tmp # dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.0MB) copied, 0.010381 seconds, 192.7MB/s

/tmp # ./mtd_debug erase /dev/mtd2 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

/tmp # ./mtd_debug read /dev/mtd2 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

/tmp # hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
/tmp # sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

/tmp # mtd_debug write /dev/mtd0 0 2097152 spi_test
-sh: mtd_debug: not found
/tmp # ./mtd_debug write /dev/mtd2 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

/tmp # ./mtd_debug read /dev/mtd2 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

/tmp # sha256sum spi*
555b3718aa92b1313ff7f93e75306267a8ed0c5f4d92cc63c1eac4366731059b  spi_read
555b3718aa92b1313ff7f93e75306267a8ed0c5f4d92cc63c1eac4366731059b  spi_test

/tmp # ./mtd_debug erase /dev/mtd2 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

/tmp # ./mtd_debug read /dev/mtd2 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

/tmp # sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
555b3718aa92b1313ff7f93e75306267a8ed0c5f4d92cc63c1eac4366731059b  spi_test

/tmp # ./mtd_debug info /dev/mtd2
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 8388608 (8M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1 
mtd.oobsize = 0 
regions = 0

 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 6d325da121b4..eaa547d36aad 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -296,6 +296,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x17),
 		.name = "w25q64jvm",
 		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x18),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
