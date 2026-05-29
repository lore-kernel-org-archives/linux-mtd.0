Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BB6CD6E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozQciJmNVnKH2zw8BJ+hpB1p+L8X9RhMpv9t4KAEg2Q=; b=glUDaXOVZ/Qnq3
	L7NYFk71TTsYVetrBxT8H7eHUlteIO84MzRV0O7MwuwvNOZoWBjz5peINIGgh9IG2DII4K2e1yc/B
	IaWv07FRWwUfr1WAuURXTUzjfO+Q0TVXxgvjgFmWCHx978rHX7EnDCSwybrMkeyLWbtiQ8wx9+1dj
	tE7dYuzmHv9Uhufm3aAPEaP5rFMcsQ8+7mq+UzfWHCg20rPUjk+yjo3pNW//P1gTjjH5ZqhlxvNCE
	Imjh3LHXjZfohnqyYe7Edcn5D9LGHSNm0ABBGnnLaoKt4PrDLEZqhqWCupvi8FSG3SI2tfUwx0xNv
	kwiCpx1o9Ixo4eAOuQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3F-00000007fgR-422K;
	Fri, 29 May 2026 15:23:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz3B-00000007fTf-0TOs
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:23:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 54D874E42D8D;
	Fri, 29 May 2026 15:23:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2298D601FA;
	Fri, 29 May 2026 15:23:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E35B10888CE1;
	Fri, 29 May 2026 17:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XCLIcbntrulIE3DzIpWWzCQJq6qdAjfo/g+E9I90xk0=;
	b=gdJyecEhlQZ/y6Ohzr3QMy0jLRiFN1t5PVxbV9LqNKZlIwWhLgKXtiQNgQtoY2Zvmj98Bh
	zVJsmQaqnPWKJ2qTXZllxBZFg8tUrZXkXW6w0355ho9p7gjxye9Ca5CWHXnamA62ZY+nKR
	shd4r9hUBf9OQamEqt68shZKcvLjm8mxUtZcHaOk/cqL1N3qWc63xhftU/cFyiirrvyrhu
	mQERXjmFCeCKvQqlwMDjgGaHaVXv2wQmfdwZBUQ6rAz+8i5RxxGImU8dKzfckTEM3Fx8vp
	Ac/AaHGzKxIej7hvVh2DypWnnI+ozm8MZGlV5xwths+nqQBlU9DBivkqIYC7NQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:34 +0200
Subject: [PATCH 14/30] mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-14-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082305_473753_61E09E7D 
X-CRM114-Status: GOOD (  11.08  )
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
device, flag these capabilities.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ sha256sum spi_test
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff | unlocked | 1024
$ flash_lock -l /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x4000000
Lock status: locked
Return code: 1
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
$ dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
$ sha256sum spi*
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_read2
090febbfd471d60250b2c6166939335012ad84207ab29b6657fcf62e8fc21fa4  spi_test
0236e30ff05676c4bcc80b55aa0ebf4747630e0ae3360e025c9e0c2509402a6b  spi_test2
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03ffffff |   locked | 1024
$ flash_lock -u /dev/mtd0
$
$ size=$(cat /sys/class/mtd/mtd0/size)
$ nblocks=$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed -e 's/.*
unlocked | //')
$
$ bs=$(($size / $nblocks))
$
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff | unlocked | 1022
 03fe0000-03ffffff |   locked | 2
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff | unlocked | 1023
 03ff0000-03ffffff |   locked | 1
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2**7 * $bs))) $((2**7))
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-037fffff | unlocked | 896
 03800000-03ffffff |   locked | 128
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 2 # first two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-03ffffff | unlocked | 1022
$ flash_lock -u /dev/mtd0 $bs 1 # first one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-03ffffff | unlocked | 1023
$ all_but_one=$((($size / $bs) - 1))
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-03ffffff |   locked | 1023
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-03ffffff |   locked | 1022
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03feffff |   locked | 1023
 03ff0000-03ffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-03fdffff |   locked | 1022
 03fe0000-03ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 3eb3f32e8b22..2e5b488818c8 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -222,6 +222,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q512JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x20),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q01JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x21),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
