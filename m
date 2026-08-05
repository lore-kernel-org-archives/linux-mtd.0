Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C837FC55ABA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPg1smQ/e0V1L2Bi+IvqDFCWRYVS3ZgOo4R0hs+jr68=; b=3eouJYQFsSDVkO
	TqsNwFKxQGw1o6YWwou+tDi1PPHG3atb09jgCdE+KKlXHF2P5UrMZfTTe90NQwpURtG1mWnU0dFNx
	nO6e8xefraaB6GrbiFI6DZPk8qaf3rEwKVga7ZtYOpDXosN2fC02tt/EritVE4KLVrUJm9bY+6ImG
	rd+0JsaBZz+L5Pzd3pF0Vu0q2U8A4Njfs/ikNgzt4/6w2SvvYr79LjPsdIxxDPwt1thm5vuSCFeEI
	COptWy0BFybOjf/vFNftuQ1tV1JN1uNP3DUcOLG77FTe3UM5Nh4CWJUoHZK3EcoenC4o2a7ygEUuv
	/xESfCz4KO4rElPkBI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb2-00000003TBR-0aDZ;
	Wed, 05 Aug 2026 08:03:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWb0-00000003T8k-2lFa
	for linux-mtd@bombadil.infradead.org;
	Wed, 05 Aug 2026 08:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v96X6gM4o5yMWfEIBxxO9VRwA8Y2VAK+kKp6k/DC5H4=; b=qBdwo0Wnk+a6848npZEk/5/egC
	tf72AlYHS02Uuopo3092CZAhAGMtPOSWGKLrs+XFQ6S7DT9pJPiGnzA69AlOi2HSk4lBtKTx71L3i
	8PPtDWX7Gyx1bH+4F8DgjWjY+dPsZIN3BBMRxlwNw6ASfXxjW9aIjEzk1Wt8PA3/A3EeHyUsx/MgR
	GGNpNP8xyma2MYTayZ72yAUEVmIUhdZkm0UV0xQ66ohb3bokq4AzJZr1oVZj6KiZnTSZ3j5xrBhAo
	kWQf4GcmK7QUV3F2ZKZSJbwuVavD7AFgVvwhRrx/s7I4x5wg+il4FN9kCd+ztb6GViVcgyGzwOzfQ
	2Hm2SDYg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrWat-0000000AYqA-0KGW
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 71E364E410C9;
	Wed,  5 Aug 2026 08:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46940602AB;
	Wed,  5 Aug 2026 08:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 939B411C34364;
	Wed,  5 Aug 2026 10:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v96X6gM4o5yMWfEIBxxO9VRwA8Y2VAK+kKp6k/DC5H4=;
	b=IgGU/dzB5Gv3vop/KVuY878HE3IdEd/Gqp/4aembnK8YQfYyRyKaqhk3vSlvhTVrNQ66eD
	DjTd1ZOvTmPmxhUrwtVrxYLUgwM3cbt5rvfEtWwt+4DdtVjnRE/qoteOmUgaGbijqmuLwB
	KcYrEKjpjjsJLhF5HUFPlL2SYLDS7jlvFqnTfFzI45C9ZE6nLolF7oxXg6GnQB8y+MaozN
	JEv9ORxXDLpM352ZB6Viovxvu+bkJZHczPJ+5OcX4u76D+C4+jj/sJ/RCktKXQ8/mWZyoA
	xoHQEafaxMfzdqvKhlDrxz0gIA+f3BqmYxepx3eSioLPR00rF62ydmTD7hNZ7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:42 +0200
Subject: [PATCH v5 17/28] mtd: spi-nor: winbond: W25Q32JV-Q/N: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-17-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_090319_253482_3EC7573D 
X-CRM114-Status: GOOD (  14.24  )
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
let's make sure the bit remains disabled for them, for backward
compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ alias show_sectors='grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0
/params'
$ flash_lock -u /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: unlocked
Return code: 0
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_test
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff | unlocked | 64
$ flash_lock -l /dev/mtd0
$ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x400000
Lock status: locked
Return code: 1
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_test
$ dd if=/dev/urandom of=./spi_test2 bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
$ sha256sum spi*
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_read2
6d7c114421890dfa12e1824aa351d4490815a9c0ceb9c2e7981073106a11fc71  spi_test
5b69b16c88c3ae48213c359d2f9fd7f0583e513dabb224b3404bc93a5e173253  spi_test2
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003fffff |   locked | 64
$ flash_lock -u /dev/mtd0
$ size=$(cat /sys/class/mtd/mtd0/size)
$ nblocks=$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed -e 's/.*
unlocked | //')
$
$ bs=$(($size / $nblocks))
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff | unlocked | 62
 003e0000-003fffff |   locked | 2
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last one
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff | unlocked | 63
 003f0000-003fffff |   locked | 1
$ flash_lock -u /dev/mtd0
$ all_but_one=$((($size / $bs) - 1))
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0000ffff | unlocked | 1
 00010000-003fffff |   locked | 63
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0001ffff | unlocked | 2
 00020000-003fffff |   locked | 62
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003effff |   locked | 63
 003f0000-003fffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-003dffff |   locked | 62
 003e0000-003fffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index b250a43ad4e1..64bf98ffc25b 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -203,7 +203,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
-		.flags = SPI_NOR_QUAD_PP,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
@@ -522,6 +522,9 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 		/* SPI_NOR_QUAD_PP was unsupported */
 		p->hwcaps.mask &= ~SNOR_HWCAPS_PP_1_1_4;
 		spi_nor_set_pp_settings(&p->page_programs[SNOR_CMD_PP_1_1_4], 0, 0);
+
+		/* SPI_NOR_HAS_CMP was unsupported */
+		nor->flags &= ~SNOR_F_HAS_SR2_CMP_BIT6;
 	}
 
 	return 0;

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
