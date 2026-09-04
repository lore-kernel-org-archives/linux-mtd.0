Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14980C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tlEd9EhaLE3jofY3jTrQdvjKY5IEtdxn8vZV435PBU=; b=lfBBVUvkbhTDOb
	++JRcyzH6EnTc6ap+BH89nYBZnqO4ljAfWpEbzpNvjtLKx4nXmniOHzZ6yRaBN6J0XikbLHwndHIi
	87Gcfe3r95kR/1oLBQP27bZSumRkoEsramDs3dFa80TDdoUKNvV9ga2OqYkUCKZzDc1x16P1mt/VX
	YSgZHACxstCKYjDsvdxQsa74ZRg8489IYzNC5MyOB9GD1PReY+JtntJ/RA3V/Cl5CBWauWhQ4XJ+x
	9WQuIRVSnOtesLeosKphcyYS/ZUoGebKg+45QZD+QR93Bmlk90S1XAajbRg2TTraAgs5uNMNNXepJ
	Lmo5c+QwQFUDnzI/daMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xa6-00000002rbo-1R8f;
	Fri, 04 Sep 2026 17:20:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xa2-00000002rVR-1uzU
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z5w8Hj9+C+GP8gcfdMUIRQ6pHyZoN1gf3cldgQtFd3Q=; b=TIhY0uDkwlgS+Y0ArG4GvVKrkn
	HCB6mOrcJhbRpMqDY2ikzuJxO/rAeISJ3dBimvBfob60+v0/4eLL1ZE5DQJAmWjm7YE07uk7kdKa/
	u3uROGJiW5idTW2vOibLrYUJuHm/mLEFpfwG2155E3LzPLqkBLT01459fIzP+ff+9in5KEkZd3VEJ
	a7S80RP5YArAFIjorrfbJRZ7lw1C2/FaHiR2hy5JPj5rKt0f7xFP5s+x0kxcdM/6RVqBZBjC64dmU
	PiECD49aYtmEJ3YcJxSL9bsHIP4zl6pEVX2F8A5I2BH3NwJsDsJ9hKSBBVWATpl8CEE9+K4IARdaz
	emRhaFaA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZv-0000000EL2z-3pq0
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 515141A19B3;
	Fri,  4 Sep 2026 17:19:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 256A06057F;
	Fri,  4 Sep 2026 17:19:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 515FD11C79AE2;
	Fri,  4 Sep 2026 19:19:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542390; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z5w8Hj9+C+GP8gcfdMUIRQ6pHyZoN1gf3cldgQtFd3Q=;
	b=xzYv/En/0T6CC4m6vjpjMFmbsT07etOM4m5dBoMQ/MxYOc1LeTZ3Ml9sSwCbQp2uT07+6t
	hbzTFewQ3obYEnxmdTxnc1ougLpoBCCYdN5pOPDWxZD3I1II1AEV1ny1fgsm8syKXz7baK
	yraIHhFsHF8LaNMiteLxWtiU+gMzi57x2CudfhVi63EU6JCTyg0PogSnW7+64zMWPeFzYW
	qHl6/cYlI2Kc5HGnDplk09koO8EfPOUlQO2AIZBLcqnKyX8m/BXoVemIK6nthb/XT48A0z
	9Wq0Sn+GJFFOnm7o6D71Xqut2P8PEbMrH8eje9xdX/18NQ5MvqRV/PovuCuzfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:15 +0200
Subject: [PATCH v6 22/26] mtd: spi-nor: winbond: W25Q128JV-M: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-22-bdb282f42a47@bootlin.com>
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
X-CRM114-CacheID: sfid-20260904_181952_170293_DB016B0F 
X-CRM114-Status: GOOD (  13.22  )
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
+ alias 'show_sectors=grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+ flash_lock -u /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x1000000
Lock status: unlocked
Return code: 0
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff | unlocked | 64
+ flash_lock -l /dev/mtd0
+ flash_lock -i /dev/mtd0
Device: /dev/mtd0
Start: 0
Len: 0x1000000
Lock status: locked
Return code: 1
+ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+ sha256sum spi_read spi_test
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_read2
e30cacd4f9d230b2fc4ae12851797332d9baf8456520872161f79379c80ea2b0  spi_test
c9d2a381c868b43a44563b0e36e2556b3095acf94f6dad8f259c85eab536363e  spi_test2
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00ffffff |   locked | 64
+ flash_lock -u /dev/mtd0
+ cat /sys/class/mtd/mtd0/size
+ size=16777216
+ cat /sys/class/mtd/mtd0/erasesize
+ bs=65536
+ grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params
+ sed -e 's/.*unlocked | //'
+ nsectors=64
+ ss=262144
+ bps=4
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 16252928 8
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00f7ffff | unlocked | 62
 00f80000-00ffffff |   locked | 2
+ flash_lock -u /dev/mtd0 16252928 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00fbffff | unlocked | 63
 00fc0000-00ffffff |   locked | 1
/* Skipping BP3 */
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 8
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0007ffff |   locked | 2
 00080000-00ffffff | unlocked | 62
+ flash_lock -u /dev/mtd0 262144 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff |   locked | 1
 00040000-00ffffff | unlocked | 63
+ all_but_one=252
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 262144 252
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0003ffff | unlocked | 1
 00040000-00ffffff |   locked | 63
+ flash_lock -u /dev/mtd0 262144 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-0007ffff | unlocked | 2
 00080000-00ffffff |   locked | 62
+ flash_lock -u /dev/mtd0
+ flash_lock -l /dev/mtd0 0 252
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00fbffff |   locked | 63
 00fc0000-00ffffff | unlocked | 1
+ flash_lock -u /dev/mtd0 16252928 4
+ grep -A4 'locked sectors' /sys/kernel/debug/spi-nor/spi0.0/params
locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-00f7ffff |   locked | 62
 00f80000-00ffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index b4f83a50fd9a..e3c67db28c90 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -327,7 +327,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q128jv",
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q256JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x19),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
