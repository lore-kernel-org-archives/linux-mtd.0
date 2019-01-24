Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3132C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E8521872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+EpG7bK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E8521872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YEmE1aMSg4/35beMuYVn0Oorc8hdZwti2vvQoDdbzec=; b=E+EpG7bKeZ1fZC
	dVMlLSc71hSP+UFEoABomFS7p6i8ePDb+ir7+WTd/tDG+lT4Z4AlIjab8Gxuf3Jol+mTuYmaS8FK4
	bYaeQITB68u47eo5sAVX8Hymqfdp+Rx7pJUpLXbMSco+Noz11ahHqclvw/NvWPTqpHvlHu6iO97q1
	yHdpufqWpbRUR6Z9k9OQCnmmV7wbjSYWKOcUhyTZWHJKh+ExEyMbNc+yMMaQEvsFT5zGz8uSJ+CZb
	8Yj+lvlv3V31xjf2VwHYtK/Jkpa+0A50IgyVFYj3ZSmXXuq3eHBYV4uySziMNf/+eZq2O22q7Euqq
	2osv0EhlzensDPRbs1jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhAf-0007UU-C6; Thu, 24 Jan 2019 15:44:01 +0000
Received: from mx2a.mailbox.org ([2001:67c:2050:104:0:2:25:2]
 helo=mx2.mailbox.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhAc-0007Ta-0y
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:43:59 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 0152CA1A8A;
 Thu, 24 Jan 2019 16:43:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id TJ5AafDMgnOD; Thu, 24 Jan 2019 16:43:47 +0100 (CET)
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd: spinand: Add support for GigaDevice GD5F1GQ4UExxG
Date: Thu, 24 Jan 2019 16:43:46 +0100
Message-Id: <20190124154346.18033-1-sr@denx.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_074358_366516_76318A27 
X-CRM114-Status: GOOD (  17.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for GigaDevice GD5F1GQ4UExxG SPI NAND chip. Tested with the
'U' (3.3V) version, GD5F1GQ4UExxG but should also work just fine with
the 'R' (1.8V) version as well. To support this 1.8V chips version,
a new entry in the gigadevice_spinand_table with the device ID of this
chip (0xc1) should be sufficient.

Signed-off-by: Stefan Roese <sr@denx.de>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
---
v3:
- Reworded the commit text to reflect, that currently only the 'U'
  (3.3V) version is supported but the code should be ready to support
  the 'R' (1.8V) version as well.
- Changed the function and macro names accordingly ('U' -> 'x')
- Added Boris's Reviewed-by tag

v2:
- Name of NAND device changed to better reflect the real part
- OOB layout changed to only reserve 1 byte for BBT
- Use ECC caps 8bits/512bytes instead of 8bits/2048bytes
- Enhanced ecc_get_status() function to determine and report
  a more fine grained bit error status

drivers/mtd/nand/spi/gigadevice.c | 83 +++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e4141c20947a..6040ee5b32f0 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -12,6 +12,8 @@
 #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
 #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
 
+#define GD5FXGQ4XEXXG_REG_STATUS2		0xf0
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -81,11 +83,83 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int gd5fxgq4xexxg_ooblayout_ecc(struct mtd_info *mtd, int section,
+				       struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 64;
+	region->length = 64;
+
+	return 0;
+}
+
+static int gd5fxgq4xexxg_ooblayout_free(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 1 bytes for the BBM. */
+	region->offset = 1;
+	region->length = 63;
+
+	return 0;
+}
+
+static int gd5fxgq4xexxg_ecc_get_status(struct spinand_device *spinand,
+					u8 status)
+{
+	u8 status2;
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQ4XEXXG_REG_STATUS2,
+						      &status2);
+	int ret;
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS:
+		/*
+		 * Read status2 register to determine a more fine grained
+		 * bit error status
+		 */
+		ret = spi_mem_exec_op(spinand->spimem, &op);
+		if (ret)
+			return ret;
+
+		/*
+		 * 4 ... 7 bits are flipped (1..4 can't be detected, so
+		 * report the maximum of 4 in this case
+		 */
+		/* bits sorted this way (3...0): ECCS1,ECCS0,ECCSE1,ECCSE0 */
+		return ((status & STATUS_ECC_MASK) >> 2) |
+			((status2 & STATUS_ECC_MASK) >> 4);
+
+	case GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS:
+		return 8;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
 	.ecc = gd5fxgq4xa_ooblayout_ecc,
 	.free = gd5fxgq4xa_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops gd5fxgq4xexxg_ooblayout = {
+	.ecc = gd5fxgq4xexxg_ooblayout_ecc,
+	.free = gd5fxgq4xexxg_ooblayout_free,
+};
+
 static const struct spinand_info gigadevice_spinand_table[] = {
 	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
@@ -114,6 +188,15 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
 				     gd5fxgq4xa_ecc_get_status)),
+	SPINAND_INFO("GD5F1GQ4UExxG", 0xd1,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&gd5fxgq4xexxg_ooblayout,
+				     gd5fxgq4xexxg_ecc_get_status)),
 };
 
 static int gigadevice_spinand_detect(struct spinand_device *spinand)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
