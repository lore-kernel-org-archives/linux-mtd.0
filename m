Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255E9C5516D
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 12:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wo4bdWAElcbT5VxtlUElRH6tqFoF4FV7vH9hzFtgCzw=; b=X8aFlJYwdvYBVD
	hRhyDB6la2DMk+unkVq4bKwq6wbMzB7e4n+8FbXW+b3uOa3Nk7lIjXbuCEkHIn2WuBM+Q6lR/kZEM
	u5NldaKCybMozbF3qQmj3hhFSuQIsmF0giELC5dg2pw1DAGTWidRgJ66vKYhvzDLopeNpTsBQtlIN
	kzgP2/8Fs/u7gVZzRjEZs5eLJcUbSq22g6Be4aC2YIw1W0N0chKueq9LQsaAe8tOHUhE9J1VmJ0o4
	8XwtKkeGaZkzJ/AdmGugOjGWf/huEII50UHtSis5jIJMSXwxv96XtfeDX+21AH+kMEDF5Iwi3QUp6
	CpAI/1ysv0AiA5iDWvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplxX-0000000CRoP-34UC;
	Fri, 31 Jul 2026 12:03:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplxP-0000000CRZv-2c25
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 12:03:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 234AE4E41051;
	Fri, 31 Jul 2026 12:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2CF86039A;
	Fri, 31 Jul 2026 12:03:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14EDE11C167A4;
	Fri, 31 Jul 2026 14:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785499397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZSwBRKSeEJLmPRZqDrouIl1j9KCipSpF16hLIOCCLWc=;
	b=eKYVaA7qavNWCELayaw6GUqrKie4tUtV+6Pm2qXzUKzTBeDIZUVNMrP3/z2VuSfucf1jNv
	Fl13FAwN4NEAbr+Yt5QuZOiMzVB9oRVNAVPQatjvOTjUfVXXXDEGCRRExdj1zzJjjhCLoY
	8AHXhbbTr8cQl8EYl5hbVeJo8sGB6eRYKN2CciInkemCteaAGXAoi4J48grCvD8YHsHuth
	jYZPiIAq7iZhV5q+q+o1irRMRGSuHIE6wvSbp950kzPpthozKspkSguuMa0QpppSpLVxaA
	PAdP1dRKAyLZh8BfUBfGQrsJX3BG/9NKoX6wRaxKJyn0UUOKX+PBYWr9nU+5eg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Jul 2026 14:02:13 +0200
Subject: [PATCH v2 20/23] mtd: spi-nor: winbond: W25Q02JV-M: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-20-2549ef1b1af8@bootlin.com>
References: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
In-Reply-To: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_050319_988411_15ECF892 
X-CRM114-Status: GOOD (  10.59  )
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

The SFDP table is pretty complete except for the locking capabilities
which must be filled manually.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x10000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0fffffff | unlocked | 4096
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x10000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_read2
8370dfccafceea1f6961d138d3412ce61dca4c7826d4775d3562acef2b10e3c6  spi_test
e61267bbd0864dfe7e67a8bfc0875a23308d98c7297fcf5a813830532f48c06f  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0fffffff |   locked | 4096
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=268435456
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=4096
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 268304384 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffdffff | unlocked | 4094
 0ffe0000-0fffffff |   locked | 2
+ flash_lockk uu /dev/mtd0 268304384 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffeffff | unlocked | 4095
 0fff0000-0fffffff |   locked | 1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 260046848 128
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0f7fffff | unlocked | 3968
 0f800000-0fffffff |   locked | 128
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-0fffffff | unlocked | 4094
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-0fffffff | unlocked | 4095
+ all_but_one=4095
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 4095
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-0fffffff |   locked | 4095
+ flassh__llock u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-0fffffff |   locked | 4094
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 4095
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffeffff |   locked | 4095
 0fff0000-0fffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 268304384 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0ffdffff |   locked | 4094
 0ffe0000-0fffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 02d599fa392c..73f6c26f81d7 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -336,6 +336,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
