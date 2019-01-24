Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B08C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 12:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B60420855
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 12:48:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WM4YhQxq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B60420855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dV/bO34JFHbnSth2YJms2ZjoG+pElSKWIqve8NC7adw=; b=WM4YhQxqaEKqkt
	0tIydJ9E65m6UmJedfVLaLDlbaCJLWD1X6gK36WUFHVx5gj7s7xt7Bhg72OMsA1rqkO/0/9Py5/RL
	gWLpesKpg2Db5hZ5mJHZ1SzqkAoTydGSHhe7JKoGW6QCCuCSYY6NLdudJHSX7+pKQ0So515U6x+gU
	LAA+3Ir3Ku7g3BG7TheNILFX+fUANH0u+ETLfSiiMt8aSLDVj8qJX0DyHNNUELaO3kjPwnX5hCAew
	v+wmFDKqg2BV84tCIR7qc4gV1Mf7GRlJmGjkX0EDnX+6WTWt3ESi7TGFSvtMNnRAr2deczcFGRgO2
	KTPLb4axj6gVWMXBigUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmeQY-0001DY-JQ; Thu, 24 Jan 2019 12:48:14 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmeQV-0001D5-KC
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 12:48:13 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id C4C51A17FC;
 Thu, 24 Jan 2019 13:48:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id Z2tMcc4ckMVy; Thu, 24 Jan 2019 13:48:07 +0100 (CET)
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spinand: Add support for GigaDevice GD5F1GQ4UExxG
Date: Thu, 24 Jan 2019 13:48:06 +0100
Message-Id: <20190124124806.3902-1-sr@denx.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_044811_966267_4248F6FB 
X-CRM114-Status: GOOD (  15.97  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for GigaDevice GD5F1GQ4UExxG SPI NAND chip.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Chuanhong Guo <gch981213@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
---
v2:
- Name of NAND device changed to better reflect the real part
- OOB layout changed to only reserve 1 byte for BBT
- Use ECC caps 8bits/512bytes instead of 8bits/2048bytes
- Enhanced ecc_get_status() function to determine and report
  a more fine grained bit error status

 drivers/mtd/nand/spi/gigadevice.c | 83 +++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e4141c20947a..0b49d8264bef 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -12,6 +12,8 @@
 #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
 #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
 
+#define GD5FXGQ4UEXXG_REG_STATUS2		0xf0
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -81,11 +83,83 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int gd5fxgq4uexxg_ooblayout_ecc(struct mtd_info *mtd, int section,
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
+static int gd5fxgq4uexxg_ooblayout_free(struct mtd_info *mtd, int section,
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
+static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
+					u8 status)
+{
+	u8 status2;
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQ4UEXXG_REG_STATUS2,
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
 
+static const struct mtd_ooblayout_ops gd5fxgq4uexxg_ooblayout = {
+	.ecc = gd5fxgq4uexxg_ooblayout_ecc,
+	.free = gd5fxgq4uexxg_ooblayout_free,
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
+		     SPINAND_ECCINFO(&gd5fxgq4uexxg_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
 };
 
 static int gigadevice_spinand_detect(struct spinand_device *spinand)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
