Return-Path: <SRS0=ooLN=B6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0313FC433E4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2020 16:54:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70432072D
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2020 16:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gS4rD0Jw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70432072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jOTDkN6cpML0tbuxB8m1rmrOSfRFHFoGoxMp0VcIHtk=; b=gS4rD0JwY9LsrBoK7H+Pp2pFz
	9OORbLGQ3NfvBqaS4eQb+iZ8G42bpS3WeukbUu6qNuwSvCbRPHtmtzU3iA706/xyjduwuPtt0mtQ8
	t4yTTq53j56ySYNzMDc4/ekXNDAyFHwaIMKza7bPMDP1kBTXogJaeGPs7us+CoEHT9eN9fU278j4E
	l/K5b8xQ+2u9Kv3BcXFC956ZP6u/9YaOsTlMpfgwptRMpjgR73ceU5flBqxSsfmeJNOqyqMj0hQpH
	Zh4OuggaQ92enJHjR223evsmad9t9SutLuJWwv99D0gcSZPVfps0Z2YLD7PP5DT2mm1nZ9JGWy3f/
	BciLQLJTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8noi-0002fx-No; Thu, 20 Aug 2020 16:53:32 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8nof-0002eT-EO
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2020 16:53:31 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BXW1h0NmszKmgn;
 Thu, 20 Aug 2020 18:53:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id Uq6jQwbZUeNk; Thu, 20 Aug 2020 18:53:24 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Subject: [PATCH v2 3/3] mtd: spinand: gigadevice: Add support for GD5F4GQ4xC
Date: Thu, 20 Aug 2020 18:51:21 +0200
Message-Id: <20200820165121.3192-4-hauke@hauke-m.de>
In-Reply-To: <20200820165121.3192-1-hauke@hauke-m.de>
References: <20200820165121.3192-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.60 / 15.00 / 15.00
X-Rspamd-Queue-Id: C0B386CF
X-Rspamd-UID: c6ab32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_125329_624234_A027A4B5 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: linux-mtd@lists.infradead.org, gch981213@gmail.com, vigneshr@ti.com,
 wigyori@uid0.hu, Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds support for the following 4GiB chips:
GD5F4GQ4RCYIG 1.8V
GD5F4GQ4UCYIG 3.3V

The datasheet can be found here:
https://www.novitronic.ch/sixcms/media.php/2/DS-00173-GD5F4GQ4xCxIG-Rev1.574695.pdf

The GD5F4GQ4UCYIGT (3.3V) version is used on the Imagination
Technologies Creator Ci40 (Marduk), the 1.8V version was not tested.

This device only works in single SPI mode and not in dual or quad mode
for me on this board.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/spi/gigadevice.c | 49 +++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 0b7667e60780..33c67403c4aa 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -132,6 +132,35 @@ static const struct mtd_ooblayout_ops gd5fxgq4_variant2_ooblayout = {
 	.free = gd5fxgq4_variant2_ooblayout_free,
 };
 
+static int gd5fxgq4xc_ooblayout_256_ecc(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 128;
+	oobregion->length = 128;
+
+	return 0;
+}
+
+static int gd5fxgq4xc_ooblayout_256_free(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *oobregion)
+{
+	if (section)
+		return -ERANGE;
+
+	oobregion->offset = 1;
+	oobregion->length = 127;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops gd5fxgq4xc_oob_256_ops = {
+	.ecc = gd5fxgq4xc_ooblayout_256_ecc,
+	.free = gd5fxgq4xc_ooblayout_256_free,
+};
+
 static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
@@ -225,6 +254,26 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgq4xa_ooblayout,
 				     gd5fxgq4xa_ecc_get_status)),
+	SPINAND_INFO("GD5F4GQ4RC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE, 0xa4, 0x68),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_f,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgq4xc_oob_256_ops,
+				     gd5fxgq4ufxxg_ecc_get_status)),
+	SPINAND_INFO("GD5F4GQ4UC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE, 0xb4, 0x68),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_f,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgq4xc_oob_256_ops,
+				     gd5fxgq4ufxxg_ecc_get_status)),
 	SPINAND_INFO("GD5F1GQ4UExxG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xd1),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
