Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8951CC282D8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:02:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BDDF2175B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XXtDoMxN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BDDF2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYFj6rVipE6J6Fz3T9CLQ5Yau6GFgKS+bbe3Ug71ank=; b=XXtDoMxNBoAglo
	Wx992lszmsRgtq65Kv1tAp1hFP5JQY/C0cZ/B++qtNHCA8RKFwMEnw+56ZUBCusuxIbsRa44o+vGk
	HgCsKn+W9L4/z35TnfKyIcLt69GwLzU7Pdiif7R1hYRrd8PBtMCjsNzbPhoEFo+O6tFsbcmuH661Y
	wEFs4NOxzbcu+tE7ymH1eN/i1EKEkY2xJ7edm46MWxzPZT+8Me46quNsNopfZy0rjd74FnYYO8yYi
	kX555wp7YWXAJLaXsLA81Hc4X8pgttmy8u3CMEeQmx5GrwX8GhobQO60MnZYGLIIN0if4IRXw/BrJ
	h5835Bts/NwENGbqakxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gopV8-0001ar-KD; Wed, 30 Jan 2019 13:01:58 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gopUz-0001R7-T6
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 13:01:56 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 9A0F267BC90;
 Wed, 30 Jan 2019 14:01:47 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 30 Jan
 2019 14:01:47 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Wed, 30 Jan 2019 14:01:47 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v3 2/5] mtd: nand: Make flags for bad block marker position
 more granular
Thread-Topic: [PATCH v3 2/5] mtd: nand: Make flags for bad block marker
 position more granular
Thread-Index: AQHUuJv0DXEVjlBes0W0HKgB0AbanQ==
Date: Wed, 30 Jan 2019 13:01:47 +0000
Message-ID: <20190130130111.32724-3-frieder.schrempf@kontron.de>
References: <20190130130111.32724-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190130130111.32724-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9A0F267BC90.A03AE
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_050151_049664_3C408CBB 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Schrempf
 Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

To be able to check and set bad block markers in the first and
second page of a block independently of each other, we create
separate flags for both cases.

Previously NAND_BBM_SECONDPAGE meant, that both, the first and the
second page were used. With this patch NAND_BBM_FIRSTPAGE stands for
using the first page and NAND_BBM_SECONDPAGE for using the second
page.

This patch is only for preparation of subsequent changes and does
not implement the logic to actually handle both flags separately.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/raw/nand_amd.c      | 2 +-
 drivers/mtd/nand/raw/nand_base.c     | 6 ++++--
 drivers/mtd/nand/raw/nand_bbt.c      | 3 ++-
 drivers/mtd/nand/raw/nand_esmt.c     | 2 +-
 drivers/mtd/nand/raw/nand_hynix.c    | 2 +-
 drivers/mtd/nand/raw/nand_macronix.c | 2 +-
 drivers/mtd/nand/raw/nand_micron.c   | 2 +-
 drivers/mtd/nand/raw/nand_samsung.c  | 2 +-
 drivers/mtd/nand/raw/nand_toshiba.c  | 2 +-
 drivers/mtd/nand/raw/sh_flctl.c      | 2 +-
 include/linux/mtd/rawnand.h          | 1 +
 11 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_amd.c b/drivers/mtd/nand/raw/nand_amd.c
index 6e248bdcc797..6202cbf7ee8d 100644
--- a/drivers/mtd/nand/raw/nand_amd.c
+++ b/drivers/mtd/nand/raw/nand_amd.c
@@ -40,7 +40,7 @@ static void amd_nand_decode_id(struct nand_chip *chip)
 static int amd_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->options |= NAND_BBM_SECONDPAGE;
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c6199cc68d2f..9ef7b86cdc42 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -302,7 +302,8 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
-	page_end = page + ((chip->options & NAND_BBM_SECONDPAGE) ? 2 : 1);
+	page_end = page + (((chip->options & NAND_BBM_FIRSTPAGE) &&
+			    (chip->options & NAND_BBM_SECONDPAGE)) ? 2 : 1);
 
 	for (; page < page_end; page++) {
 		res = chip->ecc.read_oob(chip, page);
@@ -550,7 +551,8 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
 
 		i++;
 		ofs += mtd->writesize;
-	} while ((chip->options & NAND_BBM_SECONDPAGE) && i < 2);
+	} while ((chip->options & NAND_BBM_FIRSTPAGE) &&
+		 (chip->options & NAND_BBM_SECONDPAGE) && i < 2);
 
 	return ret;
 }
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 862eaa3a0552..c095c04d566d 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -466,7 +466,8 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 
 	pr_info("Scanning device for bad blocks\n");
 
-	if (this->options & NAND_BBM_SECONDPAGE)
+	if ((this->options & NAND_BBM_FIRSTPAGE) &&
+	    (this->options & NAND_BBM_SECONDPAGE))
 		numpages = 2;
 	else
 		numpages = 1;
diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_esmt.c
index 80d2d3a1b5f2..99a8092969a7 100644
--- a/drivers/mtd/nand/raw/nand_esmt.c
+++ b/drivers/mtd/nand/raw/nand_esmt.c
@@ -36,7 +36,7 @@ static void esmt_nand_decode_id(struct nand_chip *chip)
 static int esmt_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->options |= NAND_BBM_SECONDPAGE;
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 2789bf3857c9..e685d70c1618 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -674,7 +674,7 @@ static int hynix_nand_init(struct nand_chip *chip)
 	if (!nand_is_slc(chip))
 		chip->options |= NAND_BBM_LASTPAGE;
 	else
-		chip->options |= NAND_BBM_SECONDPAGE;
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	hynix = kzalloc(sizeof(*hynix), GFP_KERNEL);
 	if (!hynix)
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 6db7ced4b96b..e287e71347c5 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -62,7 +62,7 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 static int macronix_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->options |= NAND_BBM_SECONDPAGE;
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	macronix_nand_fix_broken_get_timings(chip);
 
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index ea6b6e80d6f8..ca80e09783c7 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -448,7 +448,7 @@ static int micron_nand_init(struct nand_chip *chip)
 		goto err_free_manuf_data;
 
 	if (mtd->writesize == 2048)
-		chip->options |= NAND_BBM_SECONDPAGE;
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	ondie = micron_supports_on_die_ecc(chip);
 
diff --git a/drivers/mtd/nand/raw/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
index 3be737139210..ace50522dd19 100644
--- a/drivers/mtd/nand/raw/nand_samsung.c
+++ b/drivers/mtd/nand/raw/nand_samsung.c
@@ -123,7 +123,7 @@ static int samsung_nand_init(struct nand_chip *chip)
 	if (!nand_is_slc(chip))
 		chip->options |= NAND_BBM_LASTPAGE;
 	else
-		chip->options |= NAND_BBM_SECONDPAGE;
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 222a66bf0aa6..0031e6727193 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -147,7 +147,7 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 static int toshiba_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->options |=  NAND_BBM_SECONDPAGE;
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	/* Check that chip is BENAND and ECC mode is on-die */
 	if (nand_is_slc(chip) && chip->ecc.mode == NAND_ECC_ON_DIE &&
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 2017b00fadd8..971d9afd55e5 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -1176,7 +1176,7 @@ static int flctl_probe(struct platform_device *pdev)
 	if (pdata->flcmncr_val & SEL_16BIT)
 		nand->options |= NAND_BUSWIDTH_16;
 
-	nand->options |= NAND_BBM_SECONDPAGE;
+	nand->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_resume(&pdev->dev);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index da785d92e26e..23ad4ad790af 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -176,6 +176,7 @@ enum nand_ecc_algo {
  * Position within the block: Each of these pages needs to be checked for a
  * bad block marking pattern.
  */
+#define NAND_BBM_FIRSTPAGE		0x01000000
 #define NAND_BBM_SECONDPAGE		0x02000000
 #define NAND_BBM_LASTPAGE		0x04000000
 
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
