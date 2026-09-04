Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F45EC79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKvJHexpnfB/zsQxD+qtQvsQqII/9ii2Q7+rZZnpZP4=; b=mX4D+zrXl6jPw5
	doqqH9gzbSOP2bnF3XxeK53iMUtljOk1i+NkaLh39O7dJwX6nKvpOzVDq4hqGU8UC5jA3iF7DfPJd
	Gdgq8lzJNz86tD+XKvAOZTNeJqgcgf0uhwzpEcZeRO7XXLEJ8CnxpqmN4Vr0aso8lCCznooo6noHp
	ZeTLKJnHEodC2trGrtTASegUxE9hlNSrhyU5UHB9BRW//Bv8KKol30hFAgZiFMajpROKWpwv/Bkih
	D5GKkRIvhwg6QPcIrSxTPDVWn/Qn4HeQP6+9o+gPPdyXh1ej94HKBvyvwc4h0ewWn7x1zUpKe/LO+
	tvne8+Xkk59p5N1HMK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZz-00000002rT1-3AYA;
	Fri, 04 Sep 2026 17:19:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZy-00000002rQ2-1kJz
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3efIfSAbxxvdxn51ThjkDDaDZYhGIEem63OaqSYx3yI=; b=geryBbcjr2ofcSra/NF02VjNBk
	oOHMR+cM2WjZKsAJkgewLAicjYwypLDFutDFWoyLNnfE0Z9snxmF+Kv5YDKxLJ/Ztb59mEALFGAk1
	RZ8UExFcfJ7PFyTZIxfYvNeefzn/QZDEdUGEpBq1JgfEvacopXa605KVaG0ccvje2Xd8M9eVK8u2o
	JfNZ9FxBTVV+cLEGp5hcBQmIOnzow/8HPdjdwW5FcPfx/ahMygaL7d6TKG5+/scDcfAMkwAHvTlVN
	ifoW9CBEok/xim2UJ7qvsBpoG6CJxHa63/Ics9srtB2/vUP3HLGFBuel9E0Q75bEwuAUKd5PRZk9Z
	e15/vc0A==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZt-0000000EL1K-0Zis
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6CE6F1A19B2;
	Fri,  4 Sep 2026 17:19:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40CD06057F;
	Fri,  4 Sep 2026 17:19:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A12711C79BC4;
	Fri,  4 Sep 2026 19:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3efIfSAbxxvdxn51ThjkDDaDZYhGIEem63OaqSYx3yI=;
	b=ekG7yclNAuvJ7RMJ57oI8MHRvHRIGirOaTIl5VLZiQ97yZ+9v4nBuvpwhZEl0ktyQF6EqX
	TzHAcl+/08kxUjG6AKV6CkoAzaQ2KaHo52eyeGN8z0P4dYiJ1usEWFiF74FMpYqBikpIay
	bvuFrNSPKGsbtpqdcPqf161H5rayr+s5H/aXPTDHcOepRE7fE8ud1nC4hTUjnQF9XMCV4H
	EYIrxZadq4D3Z5poVboAOU3DhR8l0yKpbyF3UAiAFuDxSqDCWREhs7mhegE2kPkvDTu9Jf
	44bnlynrU9gXYoWyYUagV7Q2wPHarszHHMyease1IjPKTNMweCsK+WwW2/LSWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:13 +0200
Subject: [PATCH v6 20/26] mtd: spi-nor: winbond: W25Q32JV-M: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-20-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181949_798429_0EA01DCE 
X-CRM114-Status: GOOD (  13.36  )
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
device, flag the missing CMP capability.

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
+ dd 'if=/dev/urandom' 'of=./spi_test' 'bs=1M' 'count=2'
[   34.621251] random: crng init done
2+0 records in
2+0 records out
+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
a3d9042b2e8085f39ebdefbabee5d3bc8baed5217f2a51510bd523db1b147395  spi_read
a3d9042b2e8085f39ebdefbabee5d3bc8baed5217f2a51510bd523db1b147395  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
a3d9042b2e8085f39ebdefbabee5d3bc8baed5217f2a51510bd523db1b147395  spi_read
a3d9042b2e8085f39ebdefbabee5d3bc8baed5217f2a51510bd523db1b147395  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
a3d9042b2e8085f39ebdefbabee5d3bc8baed5217f2a51510bd523db1b147395  spi_read
a3d9042b2e8085f39ebdefbabee5d3bc8baed5217f2a51510bd523db1b147395  spi_read2
a3d9042b2e8085f39ebdefbabee5d3bc8baed5217f2a51510bd523db1b147395  spi_test
bcf94096d25ce535e4b920f876d53420e6d8d917d0d14dd766b5f8c3d6f40475  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=4194304
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=65536
+ bps=1
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 4063232 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff | unlocked | 62
 003e0000-003fffff |   locked | 2
+ flash_lock -u /dev/mtd0 4063232 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff | unlocked | 63
 003f0000-003fffff |   locked | 1
/* Skipping BP3 test */
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff |   locked | 2
 00020000-003fffff | unlocked | 62
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff |   locked | 1
 00010000-003fffff | unlocked | 63
+ all_but_one=63
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 65536 63
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-003fffff |   locked | 63
+ flash_lock -u /dev/mtd0 65536 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-003fffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 63
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff |   locked | 63
 003f0000-003fffff | unlocked | 1
+ flash_lock -u /dev/mtd0 4063232 1
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff |   locked | 62
 003e0000-003fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 98178344e334..356263dbef58 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -313,7 +313,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q32jv",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
