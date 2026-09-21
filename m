Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3A6C982E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsVwozUjh/mXNRY91ChFFxSLhlhH8wuK0Gwkts7PotI=; b=mC8bF/UkCUPMyK
	llBVYhHqd80ql8D904eu7ws2288KT922Z/u6snX2rHL02g6jSyH+3nMcXNJSi2/Saa/C6igWJ7zxk
	0GrIsWq/aVsPt/YX2qhdueDl8eM7D9d9DI7Y3MVW3iXxFEHh4PFAPAB6OH6oi60G7C5ZFzp2Loc0w
	tKL1b1CUatfe5CANmbTwWPxpWpoKHuIkPLioVSC7HiUuNET8W8rPglEheT1FYXNqQhiUE+3MBKGNo
	GGWcaxbpQ8NqQQJledi1I4/5+MHK+8dHitSm3xwupBxWrxjm+fq9IST7nSvakZvUHoc4Y/j8XihQK
	OlIXwDhhb44K8bRH/hSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xl9-000000015Mq-1uPM;
	Mon, 21 Sep 2026 06:44:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xl7-000000015LQ-1a8x
	for linux-mtd@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0bPMq8RIZA3Ukk3IcKkKPJxIcCIRNX5G6DuzCvDjTQg=; b=GxcmxgLvJUdbpbybyQtpm5UKTW
	EqPc1Gbp7j45/CKMzj66pQ8TyIWErnbTsMxEzdHzTkB8mmoJAd4S6DdizOfhTYLxBywWa9Z44L25/
	nP83iUytFxew9SMiikNlqjzT5ur2rmrqw8q1J5YKA3cXTPnhCZNOah2eyET4WemspzdpuAX559iT8
	iAAiJFMNASrtqcNaVpZjDTfPnpxFM2/4c7UbGckBckwBYm9q0EWpEWLemzrgxoYriJPJn0oFbbLJ6
	9LVo+J5pyfJMZEdKrL6P4+QPxIeNxtbIcn2jbWQFekcWwAe3zQIHGMhpeATyD+ZMVcfKqdcwAMgf+
	11f4ytyg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xl3-0000000Ffoc-3Osz
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 06:44:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8122C4CBC2;
	Mon, 21 Sep 2026 06:44:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D33AB60580;
	Mon, 21 Sep 2026 06:43:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2432B103290D8;
	Mon, 21 Sep 2026 08:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0bPMq8RIZA3Ukk3IcKkKPJxIcCIRNX5G6DuzCvDjTQg=;
	b=EfVbQd7LQi0/2dj6S5/N+c9o2y2fyd+34+xYBax3y2ReMph9lihPzDUKlaomSC3fWHZJLQ
	b6KCxCNyKqAiZceYWqCoM6o7B81QkU4eEZxyIo0g1QFES4y7jf/H0JfPQkVrQJskXzFrdk
	XTPC6LHB3hkINdGHMZxLudzaI7ljL68hAxnldWzy37QuHUu4eqHRDAljo0v+AdmywRdnI2
	COhRjzLVBNXQJtuQZ5bEy2RcVby7SKwbJ0nyvsFhLYt5+vxSPXH0N2OIRECV6XSXlsVZc7
	nH+5C5/M6PSbgKbv/BBIZQbj+NUbd9k7VSaWCf3DS3aLN9hkxuA5VZLMzrWb9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:38 +0200
Subject: [PATCH v3 07/25] mtd: spi-nor: winbond: W25Q64JW-M: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-7-38eef3b6a7db@bootlin.com>
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
X-CRM114-CacheID: sfid-20260921_074410_361948_5DB16826 
X-CRM114-Status: GOOD (  13.20  )
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

The SFDP table does not advertize the locking capabilities of the
device, flag the missing capabilities.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x800000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
0ddafd3bffb8a1568f0621602caa65a527076307c7bd1a5dbab5b395c7047e39  spi_read
0ddafd3bffb8a1568f0621602caa65a527076307c7bd1a5dbab5b395c7047e39  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x800000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
0ddafd3bffb8a1568f0621602caa65a527076307c7bd1a5dbab5b395c7047e39  spi_read
0ddafd3bffb8a1568f0621602caa65a527076307c7bd1a5dbab5b395c7047e39  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
0ddafd3bffb8a1568f0621602caa65a527076307c7bd1a5dbab5b395c7047e39  spi_read
0ddafd3bffb8a1568f0621602caa65a527076307c7bd1a5dbab5b395c7047e39  spi_read2
0ddafd3bffb8a1568f0621602caa65a527076307c7bd1a5dbab5b395c7047e39  spi_test
0b78bc34748f826c82efbdd8264b931abedbc55b4798365364250ae56c476221  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=8388608
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=131072
+ bps=2
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 8126464 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007bffff | unlocked | 62
 007c0000-007fffff |   locked | 2
+ flash_lock -u /dev/mtd0 8126464 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007dffff | unlocked | 63
 007e0000-007fffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff |   locked | 2
 00040000-007fffff | unlocked | 62
+ flash_lock -u /dev/mtd0 131072 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 1
 00020000-007fffff | unlocked | 63
+ all_but_one=126
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 131072 126
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 1
 00020000-007fffff |   locked | 63
+ flash_lock -u /dev/mtd0 131072 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff | unlocked | 2
 00040000-007fffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 126
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007dffff |   locked | 63
 007e0000-007fffff | unlocked | 1
+ flash_lock -u /dev/mtd0 8126464 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007bffff |   locked | 62
 007c0000-007fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 1177e00513d7..d0da8f29fe5f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -427,7 +427,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x17),
 		.name = "w25q64jwm",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q128JW-M */

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
