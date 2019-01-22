Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB59AC282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 14:56:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F0E21019
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 14:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Srw5IaWS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F0E21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ltx8Olg38Y/kbNgLzxynndt4AJGawg7OTmWTsnYhf+0=; b=Srw5IaWS0lz/Tu
	BQv1WpxcwToyZ+zuheIhIu9TGw6iIjBuyy5GOkjHDOBymmFaq/Jm+KEMJncoPFeTJ00QUX/CX4q+j
	c3RsHNGhtcPcJoK28kJ1TfDHW2zgVAWB6KhQbbsUkNgOpzqp6u6tcQgSuTMOyc9xOt4GXS42DNnO5
	zxW0+lJWI+jlnZoqfkYlgRCDOhVbAU0E59+xvKIQI/H3oaBMdH8kyeeLOZZFvu1iOBiZUn+fU8U97
	OhtuF713iFgM8+HBfbu2C5pRe3byMHZyblxpWk1WqG5D+OLRLVoszocnz8JFTLtW/ajCSWv+7TzCP
	GZ1CXAu5egWA5SIYCbYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glxTm-0006lJ-VP; Tue, 22 Jan 2019 14:56:42 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glxTj-0006kV-IX
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 14:56:41 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 38B15A1346;
 Tue, 22 Jan 2019 15:56:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id cpljv2w1NewR; Tue, 22 Jan 2019 15:56:34 +0100 (CET)
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Date: Tue, 22 Jan 2019 15:56:32 +0100
Message-Id: <20190122145632.17547-1-sr@denx.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_065639_758253_00CB4421 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for GigaDevice GD5F1GQ4UC SPI NAND chip.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Chuanhong Guo <gch981213@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
---
Frankly, I'm a bit unsure, if these new ooblayout_foo functions are 
needed for this device. I was unable to find a datasheet for the
already supported devices (GD5F1G/2G/4GQ4xA), so I couldn't compare
the OOB area values here with the ones for my SPI NAND chip.

I'm also not 100% sure, if I should use NAND_ECCREQ(8, 2048) or
NAND_ECCREQ(8, 512) for this device.

So comments welcome.

Thanks,
Stefan

 drivers/mtd/nand/spi/gigadevice.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e4141c20947a..a9d256fa2577 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -57,6 +57,31 @@ static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static int gd5f1gq4u_ooblayout_ecc(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
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
+static int gd5f1gq4u_ooblayout_free(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = 62;
+
+	return 0;
+}
+
 static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
 					 u8 status)
 {
@@ -86,6 +111,11 @@ static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
 	.free = gd5fxgq4xa_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops gd5f1gq4u_ooblayout = {
+	.ecc = gd5f1gq4u_ooblayout_ecc,
+	.free = gd5f1gq4u_ooblayout_free,
+};
+
 static const struct spinand_info gigadevice_spinand_table[] = {
 	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
@@ -114,6 +144,15 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
 				     gd5fxgq4xa_ecc_get_status)),
+	SPINAND_INFO("GD5F1GQ4UC", 0xd1,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
+		     NAND_ECCREQ(8, 2048),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&gd5f1gq4u_ooblayout,
+				     gd5fxgq4xa_ecc_get_status)),
 };
 
 static int gigadevice_spinand_detect(struct spinand_device *spinand)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
