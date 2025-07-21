Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D179C87FC5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7I52QkQi3a3Gm2mf1hh3ligWsFq7+pYxNfVMwHnDi4Q=; b=yX1hUMfDfbpSZQ
	Wp6NMACEVj7hy5bFTfNpnlTVu6xfGe1meRmGVwviRa0tF9p7tgh4/alIuniApfkEz8cib44K8VlzS
	korKUxQ6ouQGQP8+7KQRnqzWgTcLpyhzAAw55PvUkpDn0dPU2XOkkaecKt2nZiZyt4R98cbhCunIv
	KQNGoqzlPkTvrA5a+lsPZhMIfM6TQdrrb7vedcI405tkDIiykIdk6pr7qKzitHGtYLJ4H1Tuzz/nB
	ygi651+2mhTHgumfNrL6OUmeeK6w22hAPR2e6x1CLD2/SLxXgRiZA8chDqAEJWgqs2FY/4if4aKcH
	86NNcauxPWtGTnEg8uOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxVa-00000000fq0-0ENT;
	Mon, 21 Jul 2025 20:53:14 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udx2j-00000000cQA-47mR
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 20:23:27 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bmBfv1hfsz9t06;
	Mon, 21 Jul 2025 22:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753129399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pAHQ2dzsa1Gx5qZSoXfc8MDD/s0A8UBfvT3bFt+EYdI=;
	b=Y6pi10M1tN8k59TwJkMIGBFkLK/e9nYWhcMpkm1dfplr7faqhb+w3hN3HGhtlz0NmNR7dT
	RG/IUsPbnsmkVdfH1b+nGLyw5L1IFQBjMDb2sl102QwMu3bd0YzgWli3M1P0uiaZBb6/Ey
	oHmw5hDkGh7LzVLUEqHU/9ddqcddkRuhgLyxirM+ypksx/gyE4QvLWQhVfpRaY6MFyVqPF
	7T/cMyXePAqo03/2F1XC2S8LAhtQXyjx5UsVfvB4wWF5GDmBLL1rprGA9VA7Fv3rgDgrqk
	RbfQn3QrwWcF1fyIuhI7fuoPOJViZ39Z4Jv1O+23huJ3vGgXHSccFcM63tvNtQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753129397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pAHQ2dzsa1Gx5qZSoXfc8MDD/s0A8UBfvT3bFt+EYdI=;
	b=AkiucPOP3HBNy/BFmKkz72FbAyt124rMdqMl5Dg/eDO96X9RqiTI6DJYLUuapiQ1OPqNoZ
	+aiDGvImTcTO8XacJFeyyQq9XUXedJZVUnWqBq3K/I7XbZVMGoIgrvkHc3WzG5UuYMghkw
	KZl4DT6ghOcOLMwM/N+hda4HKJc3OeVyanSA2Wy5pcPqEKlmalR/bDxvFo2DGU1aJ/aR4A
	xePwdJNT33VuOB2sjoW213+EKgy6k0fwGpSKhZVManQvRqSV6VUAwlJPNngMAzUSsRBs9t
	8MYMqrY/MC8g1Bzhdx0BjyVEBO7J7cAdThxx55rszLNpH26Gr1uC9mD7YX1pOA==
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
Date: Mon, 21 Jul 2025 22:22:26 +0200
Message-ID: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 49a12a7d2c5768edf98
X-MBO-RS-META: eshr33h8knsy7i57inxas8wbsewesagn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_132326_209068_B2ADB99C 
X-CRM114-Status: GOOD (  14.34  )
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

Add IDs for Winbond W77Q51NW, 512M-bit Secure Serial Flash Memory
with Post-Quantum Cryptography, Dual/Quad SPI, QPI and DTR . The
flash part is similar to W25Q512NWM .

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
---
V2: - Un-name the SPI NOR
    - Include output of https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-requirements
---
This flash is populated on the Retronix R-Car V4H Sparrow Hawk EVTB1 board
and was tested at 40 MHz frequency using the renesas,r8a779g0-rpc-if SPI
controller.

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef8a1a

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond

$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
534644500a0103ff00070117800000ff84010102e00000ffef04010a8001
000103000102c00100ffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520aaffffffff1f46eb000000000000feffffffffff
0000ffff46eb0c200f5210d800004642b10082e412d8ed6376337a757a75
0fa4d55c190a78ff807439250000000000002c2e00000000f6f4ffff0d00
0000460d000046ed46edffffffff632f000021ffdcffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff030009088091
09ffa0a1a2ffffffffffd0d1d2ffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffff7c9b
96f0a1a4c2ff

$ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
98f6f35460da6c6c617a6da2cbaf93cee5310a30d5d2f91af4613e04941fe863  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

$ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x13
  mode cycles   0
  dummy cycles  0
 1S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  6
 4S-4S-4S
  opcode        0xec
  mode cycles   2
  dummy cycles  6

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x12
 1S-4S-4S
  opcode        0x3e

$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name            (null)
id              ef 8a 1a 00 00 00
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | SOFT_RESET

opcodes
 read           0xec
  dummy cycles  8
 erase          0x21
 program        0x3e
 8D extension   invert

protocols
 read           1S-4S-4S
 write          1S-4S-4S
 register       1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 ff (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [ 1  ] | no

$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00001000 "boot"
mtd1: 02f80000 00001000 "user"
mtd2: 00040000 00001000 "env1"
mtd3: 00040000 00001000 "env2"

$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0129542 s, 162 MB/s

$ mtd_debug erase /dev/mtd1 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

$ mtd_debug read /dev/mtd1 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

$ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000

$ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read

$ mtd_debug write /dev/mtd1 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash

$ mtd_debug read /dev/mtd1 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

$ sha256sum spi*
6f59068c602a91d09e181a44109978239ca40dc539990cf695f5b65fa8cd03f6  spi_read
6f59068c602a91d09e181a44109978239ca40dc539990cf695f5b65fa8cd03f6  spi_test

$ mtd_debug erase /dev/mtd1 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash

$ mtd_debug read /dev/mtd1 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read

$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
6f59068c602a91d09e181a44109978239ca40dc539990cf695f5b65fa8cd03f6  spi_test

$ mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 49807360 (47M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 63a93c9eb917..3881a1c8a4a2 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -343,6 +343,10 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
+	}, {
+		/* W77Q51NW */
+		.id = SNOR_ID(0xef, 0x8a, 0x1a),
+		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	},
 };
 
-- 
2.47.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
