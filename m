Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4702AC982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlqooLGisx/T9go+s5q0J/U9NgIX5aVI+3jqPhJO5PM=; b=17OVWauSu9Z2YV
	AlPsW39IczMR6lbC15pSaLyxCPKw31gPyOhQWdNq2SsF40VOUprQQ7ocHbnsZ9Ye/5U88L0IqU1Qu
	sKh7KIrokWoSkfQ8fx/2lHtKlY1lz7hzEWTMam+XKVZWoqmdysfSGDJbrhB9kpMkKEzrFeP7+UCjS
	ZkU/hwmYpClBdzihmfqetrLwaXBFjy2lrxyLxU325wGCkPlCqqKZk8G0pWRgOPD8PkkUOccgJg+82
	DBS5K36gmduUhwYlY47L2EqI1s4KjKlZU5mVjF9wgTL3btiys4RZH90wJZnhLH1wBJaI37UdRORk+
	BbaLv0sX5u16ADK+K0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I5v-0000000HXFM-2jTm;
	Sun, 20 Sep 2026 14:00:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8I5s-0000000HXCg-3uYX
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 14:00:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6024C4E404FF;
	Sun, 20 Sep 2026 14:00:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D3416033F;
	Sun, 20 Sep 2026 14:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C35F81032906C;
	Sun, 20 Sep 2026 16:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pdnTDoTdkYsMkfPFjhQtytxCxnMytcCCGSTn7ukjBN4=;
	b=ULSpmnD7TwZz/g+xBW3mtupH0JfrJw57jKKmOU5hxMTCFzu00Ki07Ss7eqJGNGBgC/SRy0
	M3/4DqXIfx5+RGKYooIMBMRsbo8/qI05W031MWJfiJLFC1Kuuw7/DqTgR2pp2ve4SBhM/7
	Uu9KwLUxrK6slwe+DlEI9pVpcouwTvzIiU4XQchLXW2wQDhhbgzGQ6Ckt+Cq1S0pnhCg8q
	tzy87l4a5SdJgUA6eg4CZbHFcgXCUaHUZ1d9uZZ5SycgUWIRSR14qDb4JxgIqQjhJUWrcs
	pCYfvJHg+wbZll5tNhFTCw9UXGHKA1Bq4GOzI2AmnPtlVrph9j+aj//b+XJ4RQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:13 +0200
Subject: [PATCH v2 04/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking
 information
MIME-Version: 1.0
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-4-ab9c9688d071@bootlin.com>
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
X-CRM114-CacheID: sfid-20260920_070037_266479_E5639D4B 
X-CRM114-Status: GOOD (  13.10  )
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

This feature is identical across the various datasheets exposing the
same ID, however I could only test it on the JW-Q variant.

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
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_test
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
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_test
+ dd 'if=/dev/urandom' 'of=./spi_test2' 'bs=1M' 'count=2'
2+0 records in
2+0 records out
+ mtd_debug write /dev/mtd0 0 2097152 spi_test2
Copied 2097152 bytes from spi_test2 to address 0x00000000 in flash
+ mtd_debug read /dev/mtd0 0 2097152 spi_read2
Copied 2097152 bytes from address 0x00000000 in flash to spi_read2
+ sha256sum spi_read spi_read2 spi_test spi_test2
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_read2
5571f5b1deca4414397a96746a87a77ddbe37381cdfc8b104638763d72fa04f1  spi_test
896f1008afff470b95ada9696d79308125a86a6e72fe6f0106b1df93a874aca4  spi_test2
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
index fe541c6fd939..7097948e7dba 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x17),
 		.name = "w25q64dw",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q128FW-G/Q, W25Q128JW-Q/N */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
