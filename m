Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E86CEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YTxSsLnmnFYDN7xctoTal79SKSHAMP/dXE40f5AdCJ0=; b=rYlxQvzIDGCI+J
	0QyGY6aZZeQy2fwjjnobfeZU2khjFuJvPCXuQJx+zkR+6FBhRX4vYoumcpbd+DjCIxsN8UBFee9a9
	GZPsL79K8GOqyyMsB3PuIMjHp7mpNo3jZdrLpd+2G8z3soF6ja7YSqtOLiAhSpctzYn1fAL1C9bOb
	reWTJB9pzGnkgH5A3S4EUHyAMZpteKAod1HGMmHmgWz5RhW7r/HKqyqKFsGFr7fcxSJ7IaMAC6id5
	37WGvE2UixFthMLgnWubWHJps2jgIAm2PeXWxcAJqtglg57PEdzyOq+HrPQo0QqN3mNyu7M7P+YxN
	5pUmHg4FI0wUihyr1qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcUk-000Usj-0N;
	Wed, 12 Jul 2023 16:15:14 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcUh-000Uqf-2I
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 16:15:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF08360009;
	Wed, 12 Jul 2023 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689178506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QxTdJsrNKM3LWHSSmzfdlA2/i2WEVc+F5JQ6xnU9k4Q=;
	b=n2TK3mFvPeRcjLU4YXf8kolSpfW70ySbXA4W39iKy3R1Vig1u6u/xx97QW6WBi1Gn5rwr3
	L0Bv6RYLH4kljrWWyzkSzCzOQmGOzWS2YzFcMPBGtYnAGjC8KWosyjVcduJwvJpaly3tge
	plkod20BPBM24b3C6i5ugAt9FviP5s9F6QRjjm/Fvng4wbHYXVz7cdQ/N7iocletVbpuwt
	XJ/kw3C90KA7G4/qmjTxItRP78Yi3IhCy11k4M5aUFxfF60C7ecA9IcVzJ/wEblcwvxZf8
	HRnkBPPhORykxErUxOXs/Kf/fxLYTwmbT0tPA0e2W9FsZ5Wre9xfCmaYFqBiMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3] mtd: spi-nor: Add support for sst26vf032b flash
Date: Wed, 12 Jul 2023 18:15:03 +0200
Message-Id: <20230712161503.448024-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091512_014642_FE669CF8 
X-CRM114-Status: GOOD (  12.97  )
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

Changes in v3:
* Dropped the second patch (untested changes as advised by Tudor).
* Avoided playing with locking as I cannot test it either: simplified
  the diff by just using the PARSE_SFDP flag.
* Rebased on top of -rc1 and adapted the patch to the current state.

 drivers/mtd/spi-nor/sst.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 688eb20c763e..754e49f7ac33 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -111,6 +111,8 @@ static const struct flash_info sst_nor_parts[] = {
 			      SPI_NOR_QUAD_READ) },
 	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "sst26vf032b", INFO(0xbf2642, 0, 0, 0)
+		PARSE_SFDP
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
