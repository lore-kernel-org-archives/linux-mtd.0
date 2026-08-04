Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D6C55838
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjnYqrxGAd9nEreb21jYUwv6lNnu3w+s3CgZ3u96p5I=; b=Vp3bFtdRY2htRn
	NC81lLcPgYEYTCe7iT8e8M1R3P2hzYMSEhu1ei4fAeom0SGMycfo6MBnkb7cBIAEUNhEd83Rsp14G
	sK7YGhsGNpleIE7HycwbHPFioyZMrM3c2aVaeWbg24kE7835OftNpa0mZSDtd4rN3N1x+wdtBOuCZ
	8BCz+Kk88FR+NxjzfgT/un37YlvW1XnN1u0baOG/HlYAnHCmZynqWkphX5UKQrTyBTlRBMkrHwnoD
	tt7MlV1mOSpza6C6tJX3pfoBJNo+f+Crg3albRnxyH6yrTeX4IBAGf1QvlweJMojuP+vEklGBzKvk
	5OI3+6xcXTTU0s8pBmnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlp-000000020cm-1ePM;
	Tue, 04 Aug 2026 14:05:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlo-000000020b2-0Hwi
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MwRHSkZqo8RDzaixPWGU7fjpYYgKsWfR2NmlW/uZHK8=; b=KFjpOH/UcjCnPf5PHcM9JdwrdO
	5L1+C9DZHWHt17WtqQjQL8nMkPdkdah0DwxCsJq9vRTlT1k4b5tszqW4Ae9CY1slrsx0MzN03seQC
	yBiU77VbCU25izvfBhODzgecKcu9lq/jt5HyNQYj9pRQpE0tPL1lTx43UgqmyBrIafDnai3HAZ7In
	1zqX2ixORlRjBSbz02qfPReZHaeXqMqGtF0Fd308wDPMHH1OqlqtmumVk61rf93x+3oTwXAnhLEI7
	wArmEtxQ3t2p+KJADGOZDgXqtYyDXkL+5hXYkZAr50KRsYtJmeqgBVLHmnUXHeNaiuddfVCW4yz9z
	1C6LU4nA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFlh-00000009yXn-3tIr
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:05:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C47E4E410DB;
	Tue,  4 Aug 2026 14:05:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14D086029E;
	Tue,  4 Aug 2026 14:05:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1EB5311C32D2A;
	Tue,  4 Aug 2026 16:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MwRHSkZqo8RDzaixPWGU7fjpYYgKsWfR2NmlW/uZHK8=;
	b=MLdprPbiPHgfOSvUEP6op7tnUE/Z8kCbCyIhVqXTNyt8vAYYvMi43mCMlOrPQOSFGMMDNI
	c2RiHwlkrtYVvkaupU8pIWtIdpJoFnUVwXdzQ2SZ7cOi6vEr14QiZK+iLZQNywz2bxGzRl
	Mug9Jb1jLBgE4IHTVwu+K9CevmRAC8yT+tE96b/4ukp4okSPYPsNFH2njywJrcBe8c90/L
	Z/BLOhtgNz2SmqA45p2PX1owaAwBdUXh4Y05YC0Q2I+ZA09aMH5IV+55KT70C5LagzOzLS
	HFAzaczo0grDDj5pk3W1M3ixK26/Ver+Tp3ed03joIFMr0RLV/f8Dns0Gfnr4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:42 +0200
Subject: [PATCH v4 20/28] mtd: spi-nor: winbond: W25Q512JV-Q/N: Fill
 locking information
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-20-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150522_108373_FAF62CFB 
X-CRM114-Status: GOOD (  12.13  )
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

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatibility reasons.

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
index 5a80de959768..1ac0177aeb44 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -234,6 +234,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q01JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x21),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
