Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25197EB64D8
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipmoeJaJ1+UHWwKcMRQaBWoCGuDpWXZAVWQac4Dnj2Y=; b=ELvdIwQhMd2oyL
	3ixeNxo34FVlfvRb+zVZOL/GXMKFA9IU7+ewWsz16QhTU+2NuBz7s3qrkuHbj8CyxeC6uy0ZeH78N
	KWjBVyABKgNCoXC7WSVgll6Ne/raSvBlkAk9IwOnCvJbO7ReoyRnkOE1wewOF5HjizkPtU22jxuPk
	WDR/yVisRJXGUCa972rToWIo9TV5FqPHpj0bW2lgOOWPJbFlHV+GbFU/tgF2kz7vtZQCZYPr45ejM
	m8kKWDxi6sHNY7TizOb+zO2cRuf31XY9FCnkmFWQudnYxWNd5dzmsiQmUkFp+I8xwtONjwc70qdld
	uox0JCUlO/kcxVKn0HaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA7z-000lOW-0G;
	Fri, 16 Jun 2023 14:08:39 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA7t-000lKj-02
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 14:08:35 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686924505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFcxT/aNoenj1ayZItxhM3d2Zq0JIbTQyoNl2+ySG/k=;
	b=bWyEPocFf8Kbo9L/dh2hj+RATx/D4+q98U3IPcxeFhSXeNySFX0oT5TizTtJK66jXa3UmV
	Ns+cac1bC8qXUq0V9Nai0tNd5EbznVyQ6L1qF8tzxr5PXlnqAPOf6K0RcfIBvvohZkxiuT
	MfiXQRFnd0ZY/7ShGdt/yFxSQMrHjoi2jyS9pY+y2+aDl24C8zSN2lQGidjZe+6Imd6/WB
	5/y03xjt4g9iU5hzEpx5+I4Eso0roBGJnAazwwlctwkXXf2E8zvnkj6/rnDTzkViK2rIM5
	qIgFaCs1fO3W9kr7G/Ra8alo1uJ6M1PPdgWc9YYoLdEGHwp4wlhXZ8pXoymm/A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13B221BF209;
	Fri, 16 Jun 2023 14:08:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/2] mtd: spi-nor: Add support for sst26vf032b flash
Date: Fri, 16 Jun 2023 16:08:21 +0200
Message-Id: <20230616140822.2789638-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616140822.2789638-1-miquel.raynal@bootlin.com>
References: <20230616140822.2789638-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_070833_305512_EA88380E 
X-CRM114-Status: GOOD (  11.92  )
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

Describe this new part. The datasheet is public.

Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDocuments/DataSheets/SST26VF032B-SST26VF032BA-2.5V-3.0V-32-Mbit-Serial-Quad-IO-%28SQI%29-Flash-Memory-20005218K.pdf

Here are the sfdp tables plus base testing to show it works.

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
sst26vf032b
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
bf2642
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
sst
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ff81000106000100ffbf0001180002
0001fffffffffffffffffffffffffffffffffd20f1ffffffff0144eb086b
083b80bbfeffffffffff00ffffff440b0c200dd80fd810d820914824806f
1d81ed0f773830b030b0f7ffffff29c25cfff030c080ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffff0004fff37f0000f57f0000f9ff
3d00f57f0000f37f0000ffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffbf2642ffb95ffdff30f260f332ff0a122346ff0f19320f1919ffffff
ffffffff00669938ff05013506040232b03072428de89888a585c09faf5a
ffff06ec060c0003080bffffffffff07ffff0202ff060300fdfd040600fc
0300fefe0202070e
$ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
e7efddddb3d5ee89ca37bf6b6e789645  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

$ dd if=/dev/urandom of=./qspi_test bs=1M count=1
1+0 records in
1+0 records out
$ mtd_debug write /dev/mtd0 0 1048576 qspi_test
Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug erase /dev/mtd0 0 1048576
Erased 1048576 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 1048576 qspi_read
Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
$ hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0100000
$ mtd_debug write /dev/mtd0 0 1048576 qspi_test
Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 1048576 qspi_read
Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
$ sha1sum qspi_test qspi_read
2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_test
2f2f191c7a937eca5db21a1c39e79e7327587cc1  qspi_read

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sst.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 99c8a19493f5..48970d2f78fa 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -113,6 +113,10 @@ static const struct flash_info sst_nor_parts[] = {
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ)
 		.fixups = &sst26vf_nor_fixups },
+	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
+		PARSE_SFDP
+		.fixups = &sst26vf_nor_fixups },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
