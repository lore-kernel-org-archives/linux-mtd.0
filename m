Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72F9C982E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5iY5OdjG9eNewn5y9RuSYzl66hL0QFAZoNtr/+Sh5o=; b=Q87BjrH0dRlay1
	gCBt2bU01us2PomoDfCPOF8n03R9P58FR6w9Kmm5KiTwdyI52C4I0+Eap1EMgNsVVT31YjNS4AVSk
	A/38vlTEXodwwzzJ6GL/0xVnp6bFkLXGzZ1RCEcLi3IxssrPsoIFFOYtQJMaBEU/dWj8y3WH3H6Z1
	5o8n44dn9ChnZNNRBJAUcPFPHvSWJHQynmESeQullwjglrlrkiduPdqqvD//pVIi0t2HQa9A/C7Tw
	yDmCALFNN0LWpX394j+dSAuNaMRPDnpibtp7feumvk33VuZP+1vLoz4FYBkzApFEftVaiyAUdIOXG
	Gb/XUNdHB/mHGRlmkRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlO-000000015gV-23xD;
	Mon, 21 Sep 2026 06:44:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XlJ-000000015b6-426Q
	for linux-mtd@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UpbUJ9I6l0MfDAZVNSnTpD5ObIVDd5CVsQBIEq0tqrA=; b=VCxRkrQzlFshCNr0GBb2HHgdbZ
	am4/V5hsw1kCl1WTEbfOtGSL1EzCKaQavY0Vdn6JduobloX+AsrkAnuz329PVGG/hThRE0Ghq23uX
	T+npFbJF0P3+67Xi7y6u+8k+x8g1nqYqMha5DvCxXgexvblmmCGXQ/4b1eF3XsniVsm7Pne26ofME
	O8QdXzKASqzxE3Xqf3XUIa2qLAMvy+qTOBOIwlz8FljRaYeflViq3nawN466ip19eGqlMINgvDg5u
	cjEOTDa/beHvHwfP4d+FDIcLSE/czKFFUbmUbQYpXTwYd7sapvvp84QMpvIG47fOmk9oCtrCFkWFG
	JIf5Ww7w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Xkx-0000000BtEw-2art
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:44:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4ADC14E40C54;
	Mon, 21 Sep 2026 06:44:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E9D36074F;
	Mon, 21 Sep 2026 06:44:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F5CB103290DE;
	Mon, 21 Sep 2026 08:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UpbUJ9I6l0MfDAZVNSnTpD5ObIVDd5CVsQBIEq0tqrA=;
	b=ogUHVTgNoe1MUgSyNShzqo0QGefR6tUtQBbviMp4Y9i1Kf07Tk91Pl/aloWLb6vuQQE20g
	nA+tD+9M96dZWswyMusMcJkBZobW4drWFb8lymOppPPjODpeCfViJb5asLJxW/CkG/AybW
	k+OzSzej87IdqYrNCR0HbUclbV1Zwuebk3JSx5tJ760xE7d+7bnfLQ396MTQsp1RTCHefE
	Prft6R8LoXluEx+t6f0qTwTgmZzQEMgt/mwawlsG/bOnyGyO4LnMGPaltqxeiDdWBFpcgm
	YNl0KR6mcs018qWrzHYlBwfNSvg3VKm1qsHd8K9Zhu7BDSKOHuQc0eCv3IgDjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:43 +0200
Subject: [PATCH v3 12/25] mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-12-38eef3b6a7db@bootlin.com>
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
X-CRM114-CacheID: sfid-20260921_074406_250656_F903103A 
X-CRM114-Status: GOOD (  12.98  )
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
eraseblock write speed is 378 KiB/s
page write speed is 375 KiB/s
2 page write speed is 375 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 386 KiB/s
page write speed is 382 KiB/s
2 page write speed is 384 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef6018
+ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
+ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520f9ffffffff0744eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14c9e96376337a757a75
f7bdd55c19f75dffe930f880ffffffffffffffffffffffffffffffff0000
f0ffffffffff
+ sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
9f09054bceec22f43966246eb3043944d50cb679d0a56e8579f78ebe4f99b5a1  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
id		ef 60 18 00 00 00
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
a4fc3a4bd8163710f3a51f6bda131e0146dd7f9e92b7b201e0a8df18e7b89040  spi_read
a4fc3a4bd8163710f3a51f6bda131e0146dd7f9e92b7b201e0a8df18e7b89040  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
a4fc3a4bd8163710f3a51f6bda131e0146dd7f9e92b7b201e0a8df18e7b89040  spi_test
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
index 7e79a415db4b..a4ac11785d25 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -341,7 +341,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x18),
 		.name = "w25q128fw",
 		.size = SZ_16M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q256JW-Q/N */

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
