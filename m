Return-Path: <SRS0=bEc/=4X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE02C3F2C6
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 03:09:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D27B2073D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 03:09:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JzdwQw9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D27B2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KVps3xgaVYmivGaESoZqPvY9TThVtgDoilBLfPwog/Q=; b=JzdwQw9i6sRh5zmKb+9zphsAEa
	gSotS2mfBFCkbqbZJnVzoii+i8BbSTKCGfpWoNE+hzG+dpmV5XK8A8jWQ4AeImJUqnh1LQ7s9TgAI
	GkEJpO6XHJLo+DEpVhrUAQeB58FZ2PWwjQFH0+0CWkJG+TEj/qM0gmK3U9tc1Jkvvd6z3zyfzxxrN
	Lk7v+2VNYfc0gzJSNRfiCQyCL7dyOkqyR3BHUyYyLAg8rUtTPkXE3jxv+ukrfy+rvbACX26dAvk96
	4z211nCZtlJpn8xVYpxyNS0KaoabhCVZYXl25dU4/QdoMnx42lRRa5NF+UaGijqAr1hR5PXac10JW
	Mc1jG6lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA3MD-0000kc-GG; Fri, 06 Mar 2020 03:09:01 +0000
Received: from mo-csw1115.securemx.jp ([210.130.202.157]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA3M6-0000is-8q
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2020 03:08:59 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 02638mXr029245;
 Fri, 6 Mar 2020 12:08:48 +0900
X-Iguazu-Qid: 2wGrDj8Mc35JYvFk0m
X-Iguazu-QSIG: v=2; s=0; t=1583464128; q=2wGrDj8Mc35JYvFk0m;
 m=30XSXFJA1rnp94hRBnSOkpVXRTzIW0024bvn1q+XQp0=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
 by relay.securemx.jp (mx-mr1113) id 02638l6W008534;
 Fri, 6 Mar 2020 12:08:48 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
 by imx12.toshiba.co.jp  with ESMTP id 02638lrE020487;
 Fri, 6 Mar 2020 12:08:47 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 02638kFH000418;
 Fri, 6 Mar 2020 12:08:46 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH v3 1/2] mtd: spinand: toshiba: Rename function name to change
 suffix and prefix (8Gbit)
Date: Fri,  6 Mar 2020 12:08:44 +0900
X-TSB-HOP: ON
Message-Id: <d6d53d2b5723e7c8b1818080626d0f0a48bb17d8.1583371913.git.ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1583371913.git.ytc-mb-yfuruyama7@kioxia.com>
References: <cover.1583371913.git.ytc-mb-yfuruyama7@kioxia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_190854_604468_C9F1F113 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The suffix was changed from "G" to "J" to classify between 1st generation
and 2nd generation serial NAND devices (which now belong to the Kioxia
brand).
As reference that's
1st generation device of 1Gbit product is "TC58CVG0S3HRAIG"
2nd generation device of 1Gbit product is "TC58CVG0S3HRAIJ".

The 8Gbit type "TH58CxG3S0HRAIJ" is new to Kioxia's serial NAND lineup and
the prefix was changed from "TC58" to "TH58".

Thus the functions were renamed from tc58cxgxsx_*() to tx58cxgxsxraix_*().

Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
changelog[v3]:Fixed commit message to make it easier to understand.
changelog[v2]:Split 2 patches, and add patch description.

 drivers/mtd/nand/spi/toshiba.c | 60 +++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 0db5ee4..700d86f 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -25,8 +25,8 @@ static SPINAND_OP_VARIANTS(write_cache_variants,
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
-				     struct mtd_oob_region *region)
+static int tx58cxgxsxraix_ooblayout_ecc(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *region)
 {
 	if (section > 0)
 		return -ERANGE;
@@ -37,8 +37,8 @@ static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
-				      struct mtd_oob_region *region)
+static int tx58cxgxsxraix_ooblayout_free(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *region)
 {
 	if (section > 0)
 		return -ERANGE;
@@ -50,13 +50,13 @@ static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops tc58cxgxsx_ooblayout = {
-	.ecc = tc58cxgxsx_ooblayout_ecc,
-	.free = tc58cxgxsx_ooblayout_free,
+static const struct mtd_ooblayout_ops tx58cxgxsxraix_ooblayout = {
+	.ecc = tx58cxgxsxraix_ooblayout_ecc,
+	.free = tx58cxgxsxraix_ooblayout_free,
 };
 
-static int tc58cxgxsx_ecc_get_status(struct spinand_device *spinand,
-				      u8 status)
+static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
+					 u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
@@ -95,75 +95,75 @@ static int tc58cxgxsx_ecc_get_status(struct spinand_device *spinand,
 
 static const struct spinand_info toshiba_spinand_table[] = {
 	/* 3.3V 1Gb */
-	SPINAND_INFO("TC58CVG0S3", 0xC2,
+	SPINAND_INFO("TC58CVG0S3HRAIG", 0xC2,
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
+		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
+				     tx58cxgxsxraix_ecc_get_status)),
 	/* 3.3V 2Gb */
-	SPINAND_INFO("TC58CVG1S3", 0xCB,
+	SPINAND_INFO("TC58CVG1S3HRAIG", 0xCB,
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
+		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
+				     tx58cxgxsxraix_ecc_get_status)),
 	/* 3.3V 4Gb */
-	SPINAND_INFO("TC58CVG2S0", 0xCD,
+	SPINAND_INFO("TC58CVG2S0HRAIG", 0xCD,
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
+		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
+				     tx58cxgxsxraix_ecc_get_status)),
 	/* 3.3V 4Gb */
-	SPINAND_INFO("TC58CVG2S0", 0xED,
+	SPINAND_INFO("TC58CVG2S0HRAIJ", 0xED,
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
+		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
+				     tx58cxgxsxraix_ecc_get_status)),
 	/* 1.8V 1Gb */
-	SPINAND_INFO("TC58CYG0S3", 0xB2,
+	SPINAND_INFO("TC58CYG0S3HRAIG", 0xB2,
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
+		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
+				     tx58cxgxsxraix_ecc_get_status)),
 	/* 1.8V 2Gb */
-	SPINAND_INFO("TC58CYG1S3", 0xBB,
+	SPINAND_INFO("TC58CYG1S3HRAIG", 0xBB,
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
+		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
+				     tx58cxgxsxraix_ecc_get_status)),
 	/* 1.8V 4Gb */
-	SPINAND_INFO("TC58CYG2S0", 0xBD,
+	SPINAND_INFO("TC58CYG2S0HRAIG", 0xBD,
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
+		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
+				     tx58cxgxsxraix_ecc_get_status)),
 };
 
 static int toshiba_spinand_detect(struct spinand_device *spinand)
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
