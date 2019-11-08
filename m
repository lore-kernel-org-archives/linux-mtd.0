Return-Path: <SRS0=/qel=ZA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E72AC5DF60
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 07:49:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74071207FA
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 07:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hYCe/2yz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74071207FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fz9gmH3QzwecnsB4Mbj3zJrKBotY2sQKYPfyX700/Os=; b=hYCe/2yz7/8+Y5
	r5GGv9i8dUpDjJEIxO8gFzisCw73mnZ1IAdz8tdbey/T/OtDDjKhGRThjC6cTfhcO1Qs/lVSrgyiH
	LaFdxFt3nWvY+PTf1/fmSzZeBdjeqNuaaQnxiVFqZ4iMkRjvvdtui452gYd9KYSLNxdcOifK4OagA
	ehpRtpUuY2Fgdrk4Y1LoT0IXZrMpascPYoBiOo9UIny6WoZ6nml+KDEo0cFaZhSUKiISsUCm1a5Pz
	eltimLiw8qEq3zvW5cWLJ9yceBbwS854PMhWMLMl+KLYzV/vdVdGLZ1PMRRMshOz8ykdHQ5Zni/Te
	jvKve/z2shaWtuQQ1v4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSz0z-0006eb-Am; Fri, 08 Nov 2019 07:49:05 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSz0w-0006dj-G7
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2019 07:49:04 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iSz0p-0002is-9R; Fri, 08 Nov 2019 08:48:55 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1iSz0n-0004rt-Pu; Fri, 08 Nov 2019 08:48:53 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: miquel.raynal@bootlin.com, frieder.schrempf@kontron.de,
 bbrezillon@kernel.org, richard@nod.at
Subject: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Date: Fri,  8 Nov 2019 08:48:52 +0100
Message-Id: <20191108074852.18507-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_234902_594816_EA79CED3 
X-CRM114-Status: GOOD (  11.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com, sshivamurthy@micron.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The MT29F1G01AAADD is a single die, SLC based SPI NAND. It has a
capacity of 1Gb and supports 4-bit ECC. The datasheet can be found [1].

Unfortunatly the linked device is marked as EoL, but I will expect that
the MT29F1G01AAADDH4-ITX behaves the same way.

[1] https://datasheet.octopart.com/MT29F1G01AAADDH4-IT:D-Micron-datasheet-11572380.pdf

Cc: Peter Pan <peterpandong@micron.com>
Cc: sshivamurthy@micron.com
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v2:
- Convert 0x10 into 16 for ooblayout description
- Don't break web link within commit message

 drivers/mtd/nand/spi/micron.c | 68 +++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 7d7b1f7fcf71..70e278759bd3 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -34,6 +34,18 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+static SPINAND_OP_VARIANTS(read_cache_variants_mt29f1g01aaadd,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants_mt29f1g01aaadd,
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants_mt29f1g01aaadd,
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
 static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
 					struct mtd_oob_region *region)
 {
@@ -90,6 +102,52 @@ static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int mt29f1g01aaadd_ooblayout_ecc(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (section * 16) + 8;
+	region->length = 8;
+
+	return 0;
+}
+
+static int mt29f1g01aaadd_ooblayout_free(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	/* 2 bytes for the BBM + 2 bytes to skip non-ecc memory */
+	region->offset = (section * 16) + 4;
+	region->length = 4;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops mt29f1g01aaadd_ooblayout = {
+	.ecc = mt29f1g01aaadd_ooblayout_ecc,
+	.free = mt29f1g01aaadd_ooblayout_free,
+};
+
+static int mt29f1g01aaadd_ecc_get_status(struct spinand_device *spinand,
+					 u8 status)
+{
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+	case STATUS_ECC_HAS_BITFLIPS:
+		/* 1 to 4-bit error detected and corrected */
+		return 4;
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct spinand_info micron_spinand_table[] = {
 	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -100,6 +158,16 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
 				     mt29f2g01abagd_ecc_get_status)),
+	SPINAND_INFO("MT29F1G01AAADD", 0x12,
+		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 2, 1, 1),
+		     NAND_ECCREQ(4, 2048),
+		     SPINAND_INFO_OP_VARIANTS(
+					&read_cache_variants_mt29f1g01aaadd,
+					&write_cache_variants_mt29f1g01aaadd,
+					&update_cache_variants_mt29f1g01aaadd),
+		     0,
+		     SPINAND_ECCINFO(&mt29f1g01aaadd_ooblayout,
+				     mt29f1g01aaadd_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
