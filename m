Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3943606A32A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 09:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JFzP6rqR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=heyangtek.com header.i=@heyangtek.com header.a=rsa-sha256 header.s=default header.b=eUKC/xF3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3j2a6ZbUqF9kxBnEMbZfVa7i1qnE6RbCUTC4p08YC3I=; b=JFzP6rqRJDv94se4DU7pmBK7NW
	zJN2kwYvZmGj3JVEmjDH2nJ+OfIMvtm6Zr+boKpKD7Gg6PhtN6Wn5e4e4nHd93/nYdbVbuT5ALEg5
	6cRBb2GZCHmriRmS7O/+HVKJ3j3zkr2r18Lh29Ux4MU2L+Ldy7j/jUu7sIajsUG0/1iSl2rLhCeHZ
	cWm/4Ki8mA3UMUAuqQlPjy7sFOcIFn7Ib5kZ6++XUO/xPYCJVsK6bcMCEsFhe1m+h2YTody/S2JWk
	Qh/elnNCM1raV8XFz06l/gQ0s1g+ZHzhwgeuiDQHWFDUcwwEGoN6v5DPOQS1/QzgBUCN1bbuF+ebf
	mAEggfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbtd-00000008LF7-37mu;
	Wed, 18 Nov 2026 09:24:05 +0000
Received: from mail-m6051.netease.com ([210.79.60.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbtY-00000008LCh-04BM
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 09:24:04 +0000
Received: from [192.168.2.232] (unknown [IPV6:240e:3b7:3272:6170:ecb2:3a9a:1b03:d43a])
	by smtp.qiye.163.com (Hmail) with ESMTP id 551fe5499;
	Wed, 18 Nov 2026 17:23:49 +0800 (GMT+08:00)
From: Lin Quanji <linquanji@heyangtek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Aleksei Sviridkin <f@lex.la>
Subject: [PATCH] mtd: spinand: heyangtek: add support for HYF4GQ4UAACBE
Date: Wed, 18 Nov 2026 17:23:48 +0800
Message-ID: <20261118172348.164296-1-linquanji@heyangtek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1edf8375203ackunm9d579b322997ac
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEJIVh4YQk1NGEMfQh5OT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJT0seQUgZTEFISUxJQU1KTEtBHhgZSUFIGkIaQUoZS0
	hBH09IGllXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=eUKC/xF3JO8os4EWusGybAV/HS72ycfpKoNL+cvKi+wwibJZoLJSiL7KZHCun+7f1pjfrv7UF0Csy/pmKPaEX+dUQz+yfFhKuVnTX0ZKUV2O/oIFVww5GBWO4jsFRRE6YEfwDJP5d6/jDX8DgKzQPYAJAqqJLo5mGCUVOevkgqc=; c=relaxed/relaxed; s=default; d=heyangtek.com; v=1;
	bh=XRy2hLHw344c+BlmroVOB3A9JuFxEmGbv8Z+a8fZYV8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_012400_609237_744FEC78 
X-CRM114-Status: GOOD (  11.05  )
X-Spam-Score: -2.0 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the 4 Gbit member of the HeYangTek SPI-NAND family.  The die has
4096-byte pages and a 256-byte spare area, and uses eight 512-byte ECC
steps with 14-bit correction, i.e. 24 bytes of on-die parity per step
and 192 bytes in total.

The spare area is therefore laid out in eight 32-byte groups, one per
ECC step: bytes 0..7 are exposed as free and bytes 8..31 hold the
parity.  This is not the "first half free, second half parity" layout
used by the GigaDevice 256-byte-OOB parts, which carry 8-bit ECC and
consequently only need 128 bytes of parity.

The ECC status register uses the same 2-bit encoding as HYF1GQ4UDACAE,
so the existing hyf1gq4_ecc_get_status() is reused unchanged.

Datasheet: https://www.heyangtek.cn/h-pd-31.html

Signed-off-by: Lin Quanji <linquanji@heyangtek.com>
---
 drivers/mtd/nand/spi/heyangtek.c | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/mtd/nand/spi/heyangtek.c b/drivers/mtd/nand/spi/heyangtek.c
index 76d97ae..fa69ea8 100644
--- a/drivers/mtd/nand/spi/heyangtek.c
+++ b/drivers/mtd/nand/spi/heyangtek.c
@@ -73,6 +73,48 @@ static const struct mtd_ooblayout_ops hyf1gq4_ooblayout = {
 	.free = hyf1gq4_ooblayout_free,
 };
 
+/*
+ * HYF4GQ4UAACBE: 4 KB page, 256-byte spare area.  The die uses eight
+ * 512-byte ECC steps, each owning one 32-byte group of the spare area:
+ * bytes 0..7 are exposed as free and bytes 8..31 hold the on-die parity
+ * (24 bytes, i.e. 14 bit / 512 B).  8 x 32 = 256 bytes, of which 192 are
+ * parity.
+ */
+static int hyf4gq4_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = (32 * section) + 8;
+	region->length = 24;
+
+	return 0;
+}
+
+static int hyf4gq4_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	if (section) {
+		region->offset = 32 * section;
+		region->length = 8;
+	} else {
+		/* section 0 has two bytes reserved for the bad block marker */
+		region->offset = 2;
+		region->length = 6;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops hyf4gq4_ooblayout = {
+	.ecc = hyf4gq4_ooblayout_ecc,
+	.free = hyf4gq4_ooblayout_free,
+};
+
 static int hyf1gq4_ecc_get_status(struct spinand_device *spinand, u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -118,6 +160,16 @@ static const struct spinand_info heyangtek_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&hyf1gq4_ooblayout,
 				     hyf1gq4_ecc_get_status)),
+	SPINAND_INFO("HYF4GQ4UAACBE",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xd4),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(14, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&hyf4gq4_ooblayout,
+				     hyf1gq4_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops heyangtek_spinand_manuf_ops = {
-- 
2.55.0.windows.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
