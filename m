Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16A4C982E1
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuF18R+2dJ/Zr/AwvwCysHFCv4Cspby8NjFwwnTqIdI=; b=WWoPYxmHRk7gBu
	YVEdpXrMDHFCln83Z9RQKojEtT4e8r+z8JYY6rS92lnsY74F7O1SrPUuibAR62PAqjZJbwvHhn3YT
	Pmpe5rmpx2XcYB4FXuQcIH2cRPYK3JTVQ9kS7ET5xz6/hGyznyhurPY1819oQZy6RKELOfBorbBal
	ztDKWe9lB9UKsY0Kd5LJXkAF0iSv/hHiQ5yg5imVCR6DqBAeF9HoiP6FQIwONwPI77LFtprQIblW3
	ikxG/vhs9lQacO4iAr9NslWEnF33R+4afDxzY0GJE+T34jpIcQmzQCtKhgPe/sywv764jhJPtbMJE
	E4e3ic3m7O6VOtJglGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6Z-0000000HXnw-0clJ;
	Sun, 20 Sep 2026 14:01:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6X-0000000HXlt-2t3u
	for linux-mtd@bombadil.infradead.org;
	Sun, 20 Sep 2026 14:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MRC9qvTqZrpWIonRs8TglZmtXqsVP7f9eMt/Za9gR1o=; b=SUB/Pp9jYpEnYe0wJLL34eBTfk
	LzVWhJkHbgfrI2h56ls4fswIpi0B9icr9awEZkv5t1ctEnJBoMeuIqVYlj071hHMH1/xgN1BL1Fjm
	zF4R87jQ4q6yv3pOYtYtcmMYCKgLOWOcO3aKlSBgHuWu/boFFVNCdnUeB/P9LxRyyJzNZvvHMzaPr
	IaB/jFPI8f/1dYcLBLQ4ticZAwriM55X0FZw71ei13Ss8yl8J1N1XsMQKfHqd2tfOrfEZXW4nXxi/
	jK7yh4HwSSBMrQxEsU/xy3syYgkRh+4c7T5DynHSijuTZASEB9GPrFl8KE7QjIxCNTpnxAuDHmTcH
	IEdwrDeA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I6T-00000008NVL-3nMj
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:01:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C51101A09A9
	for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2026 14:01:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99A396033F;
	Sun, 20 Sep 2026 14:01:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBCB110329080;
	Sun, 20 Sep 2026 16:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912864; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MRC9qvTqZrpWIonRs8TglZmtXqsVP7f9eMt/Za9gR1o=;
	b=EhEMT0SNWs7NeaSqiYWM0WDevfoDaNSw6eht2UUjUs9S9Eu5FzDECUfWlSbkf46ETckJxD
	xGJ9NWet2y9AkG14HMH/Hzuusu+enlah4cCQn1Z/UuTLfxRIqPrR7xL8nP8YlmQre7H6CU
	6Uoa5BOiHxGSkbsEV5d/pBway7iK820YMcPxNUaPG/B9MhOwkBN5Fju1dWBX3AZdjvZpGE
	ffb7hQlGMEm4j/eM0rrahGYn0SbTUqow2WJWvXekOUH4wepOXl4UXHO47AguTOYktpWXml
	Xfn3X6UDy2Wk0K7RPJ5k6mcEiikH6K6cBM0ngvX+cvcfA5HCRuPyublyjtnidQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:22 +0200
Subject: [PATCH v2 13/25] mtd: spi-nor: winbond: W25Q32JW-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-13-ab9c9688d071@bootlin.com>
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
X-CRM114-CacheID: sfid-20260920_150114_189805_E25E76F9 
X-CRM114-Status: GOOD (  14.55  )
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
eraseblock write speed is 416 KiB/s
page write speed is 413 KiB/s
2 page write speed is 415 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 424 KiB/s
page write speed is 421 KiB/s
2 page write speed is 423 KiB/s

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
id		ef 80 16 00 00 00
size		4.00 MiB
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
d5d5966e19c29fcd8007cf50d715943db3d8468d3f93a71a43d2c026c1cbfb00  spi_read
d5d5966e19c29fcd8007cf50d715943db3d8468d3f93a71a43d2c026c1cbfb00  spi_test
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
d5d5966e19c29fcd8007cf50d715943db3d8468d3f93a71a43d2c026c1cbfb00  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index a4ac11785d25..98a1e063e7fe 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -420,7 +420,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x16),
 		.name = "w25q32jwm",
 		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
