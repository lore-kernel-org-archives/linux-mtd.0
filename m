Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BF5C55822
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqNMXIqh6iwDC8PvVgGqj7OXu30OHMqI4spixxdjgow=; b=C5NvU4pnrd6H3j
	Q3h0iTjJn4Mvt/cm5oXQa2oBOvbttFsjalAiE+9m2aN7WgI4vR1bHT9jMPsrsWXAz1igwcW++/VNU
	eow564fwdVQEdWPO2wCkhcqybuObS+oUqYhInKmneNiYYKrPSeCQxGqoqpAI7RFoMPjVS49WHPiBE
	kEpQuj0IWcc9xMOHu59fLGKtS6d0OPabEnNhOVUx0RdjFY+9sz2ueqwMgci73Ut8AXGD6mWdK8z7p
	uuYWEpZazTPGG2yAtzSyApQ+cPvUevJIMWYp73IW4lWwcwNpcuGfQs84SgxonWblbfmPIqT1MwbVI
	ZKCbZvOVzAfI31oAvyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlr-000000020fa-2bNk;
	Tue, 04 Aug 2026 14:05:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFlp-000000020cV-2gFX
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a8JXb5k+mM9U89vEfltmq+tzKFBPYOhOc9XoqlLiwTs=; b=lF/xcgExED5+IiXAsw3c3QSLWB
	D1Q2E7LbqozUvfrX5LgIwc6PQMfcFglPTbVizunJT4o588ZJK/zzTpnNFj/9+aRoR4XCspQJpAVbf
	TdWdQ2rN96QfeVbBENWajHY6d+mfGwwFu6zkMXBUYo1P1nVVsS5z/6d8h77aqDj03A15Qz5LwKqbp
	VJKixRu5KG8c+cwW6u/aozthWfewA4zf5PVhH4WYj+qpQFWqgmESGVc/V7K/ROfT2gTNlU5hs4PSc
	gKZwKnZR9qSXDQndvCRk8XfuL6zqYg3ATjijJRkL+5LygfjlTOU6TGO1UfNfWGHrwXdXXXepH2MoJ
	ARkSGtDQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFlk-00000009yYv-2QX2
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:05:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE2254E410DF;
	Tue,  4 Aug 2026 14:05:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFB4C6029E;
	Tue,  4 Aug 2026 14:05:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E066B11C32D29;
	Tue,  4 Aug 2026 16:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a8JXb5k+mM9U89vEfltmq+tzKFBPYOhOc9XoqlLiwTs=;
	b=kG09q25JSCy2Ya8KNfMmcLs94VGa7u95lTSXCNTmTHS8WHAxCXMP2QzR3LyP0OPZBpwIej
	7en7sO5BKJUVdQ7XaiLkVK9nbEd1/IUpKMBppOlb0DBmJux9klZa2W/O8qVPyA8k7cCixb
	dI3HEcqc7TBJ9yP0/HUnp+7nQkj83MxXhVZNtj3r7/AfN4edw0YIpaexu18aORLWCj+9n8
	hyQoDLdIZ9rxOjeIXou3MJ/7ZsYPwMoFzLJk9o2wLKCrTGRvnwzKQkVU4mHX5MnG5/we5R
	EhUS4TA/zBq4Zaq0c93nKiLirZM9G0ItfzpsvzQ5H7A3KDQKlMv2u4fIhq6Eew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:44 +0200
Subject: [PATCH v4 22/28] mtd: spi-nor: winbond: W25Q32JV-M: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-22-ee3445066e4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20260804_150524_734247_61C840EC 
X-CRM114-Status: GOOD (  13.58  )
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
index 59d5be14a73c..3f9f2257ac91 100644
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
