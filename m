Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB235C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Apr 2022 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bIH1WUJwe0+Lru+4OopmZjFEbpcpHVMPCswcdsoadpg=; b=2afjIT5Zmd5djp
	AOFWPWW1jIMjPkw5pLTwmGBSZ4W0Dls/OZlHugBcFJGiYa3auiUlw/H+R0/hTnZTIfQRru/VIYOdj
	mr9nqLZgnuDVc8vi/43LViE/iWl2Fqq4OwCorueZHckP5i4jhq7jAIwTq7R8a+YgLAAumuAA9vKfz
	zloKwo3RRDrDrBwtwbJy0xiMmbUs8G3Aw2mN/QnsiEIetbJKyO9ia/hlsuiBaioLx5/5E6bRN+VCl
	n6iflBumKt7l43BrVQIN+DQ6LpOcwh2T0DBNcayOEmb+uDLCAAvET++M5ZQOCdm6UtYVvuv8qoFg5
	ZFkITtAv05tVoYGBc4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nagE8-009XA4-Ia; Sat, 02 Apr 2022 16:03:48 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nagE5-009X92-Qf; Sat, 02 Apr 2022 16:03:47 +0000
Received: by mail-pf1-x435.google.com with SMTP id w7so5157759pfu.11;
 Sat, 02 Apr 2022 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnneJ6Ho0S+IA/D1ZV6cBxZg4vItd7oSWatM2pfG5Pg=;
 b=W5xsRbbpSLi9p1T6Laus3rnc5bGfdBkLjIkZ/QY9875Zszcx8AxGQn7R+lEbw4aQd9
 cmTn4S2OM9wUBWaZCSqB+MRLmKhXcO4Nc0YbGUFBTF9xVdsBhuGy1Q7YOz/+XgdNrqm/
 OmyFJ+YeNVw6W3EzgIlGFTKlEqwA0LCLm0GpVMfl6bzOfEAGx+J4t6plSWsfWNEpEkoP
 RhRRTsMcq553SQXzqBCf47WxBS1EsjEcVFICBzyOEpNfoM5tAnRg4wvEndLo8WaOFVy1
 o7WnqkHR73KTuHJ8dUmaktGxFwmxCbIv4yG/y+N9bPJ7BJ3hfqZhTtlwxUcbGJMFVtg/
 bBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnneJ6Ho0S+IA/D1ZV6cBxZg4vItd7oSWatM2pfG5Pg=;
 b=TcxYKLYbExama7h31D2Nps0zD6AmFNXlxfeK9Y2orcWczQSWWECPJWx6Y5F1wGeNBk
 BlajEEj/Z+S4LrtDowHaWKaezdoXbX9qpcml1BRzKhOBP92jNU39oRQgU1BnnuAjr998
 jj1YBUPa7598s+P6tBvG/d5ykPvyFICnOt80jLRjXBgEpYa0BNZq1vsveKvI9LF4l28y
 VgdJDwFBiOGAdb/r7qngp01T58FOJT1MamaQ9puaYSalSlnSpo3t5BkllmH27mC/t4X9
 qX1xXQWwO5L4Ndi/tYfPSVqVgLcajS7opIebrBWq4fvtAg/1+sxhZ6BRkEKST4zWUPt2
 xCyg==
X-Gm-Message-State: AOAM530CC6NACk1Nes9W1ulKG4Ufcj6NlUJOXdNcKKwiBkHZuf70NAo9
 0jY7nBMrzydG5o8aIMbIX7Lm0qjp4bwxA7Eygy4=
X-Google-Smtp-Source: ABdhPJwQSFddjPPGwDTDrCrAyDtU8UoQsvWTSrQlSFtt+quKPSBuORiJM8uSNZHpJoKZHQF/gH0ZCQ==
X-Received: by 2002:a05:6a00:ac1:b0:4f1:29e4:b3a1 with SMTP id
 c1-20020a056a000ac100b004f129e4b3a1mr49940986pfl.63.1648915420250; 
 Sat, 02 Apr 2022 09:03:40 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a056a000b4300b004faee36ea56sm6733974pfo.155.2022.04.02.09.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 09:03:39 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Chuanhong Guo <gch981213@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, Paul Cercueil <paul@crapouillou.net>,
 Yu Kuai <yukuai3@huawei.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 RogerCC Lin <rogercc.lin@mediatek.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: fix ecc parameters for mt7622
Date: Sun,  3 Apr 2022 00:03:13 +0800
Message-Id: <20220402160315.919094-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_090345_905864_D99F4F43 
X-CRM114-Status: GOOD (  15.47  )
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

According to the datasheet, mt7622 only has 5 ECC capabilities instead
of 7, and the decoding error register is arranged  as follows:
+------+---------+---------+---------+---------+
| Bits |  19:15  |  14:10  |   9:5   |   4:0   |
+------+---------+---------+---------+---------+
| Name | ERRNUM3 | ERRNUM2 | ERRNUM1 | ERRNUM0 |
+------+---------+---------+---------+---------+
This means err_mask should be 0x1f instead of 0x3f and the number of
bits shifted in mtk_ecc_get_stats should be 5 instead of 8.

This commit introduces err_shift for the difference in this register
and fix other existing parameters.

Public MT7622 reference manual can be found on [0] and the info this
commit is based on is from page 656 and page 660.

[0]: https://wiki.banana-pi.org/Banana_Pi_BPI-R64#Documents

Fixes: 98dea8d71931 ("mtd: nand: mtk: Support MT7622 NAND flash controller.")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/raw/mtk_ecc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_ecc.c b/drivers/mtd/nand/raw/mtk_ecc.c
index e7df3dac705e..49ab3448b9b1 100644
--- a/drivers/mtd/nand/raw/mtk_ecc.c
+++ b/drivers/mtd/nand/raw/mtk_ecc.c
@@ -43,6 +43,7 @@
 
 struct mtk_ecc_caps {
 	u32 err_mask;
+	u32 err_shift;
 	const u8 *ecc_strength;
 	const u32 *ecc_regs;
 	u8 num_ecc_strength;
@@ -76,7 +77,7 @@ static const u8 ecc_strength_mt2712[] = {
 };
 
 static const u8 ecc_strength_mt7622[] = {
-	4, 6, 8, 10, 12, 14, 16
+	4, 6, 8, 10, 12
 };
 
 enum mtk_ecc_regs {
@@ -221,7 +222,7 @@ void mtk_ecc_get_stats(struct mtk_ecc *ecc, struct mtk_ecc_stats *stats,
 	for (i = 0; i < sectors; i++) {
 		offset = (i >> 2) << 2;
 		err = readl(ecc->regs + ECC_DECENUM0 + offset);
-		err = err >> ((i % 4) * 8);
+		err = err >> ((i % 4) * ecc->caps->err_shift);
 		err &= ecc->caps->err_mask;
 		if (err == ecc->caps->err_mask) {
 			/* uncorrectable errors */
@@ -449,6 +450,7 @@ EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
 
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
 	.err_mask = 0x3f,
+	.err_shift = 8,
 	.ecc_strength = ecc_strength_mt2701,
 	.ecc_regs = mt2701_ecc_regs,
 	.num_ecc_strength = 20,
@@ -459,6 +461,7 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
 
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
 	.err_mask = 0x7f,
+	.err_shift = 8,
 	.ecc_strength = ecc_strength_mt2712,
 	.ecc_regs = mt2712_ecc_regs,
 	.num_ecc_strength = 23,
@@ -468,10 +471,11 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt2712 = {
 };
 
 static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
-	.err_mask = 0x3f,
+	.err_mask = 0x1f,
+	.err_shift = 5,
 	.ecc_strength = ecc_strength_mt7622,
 	.ecc_regs = mt7622_ecc_regs,
-	.num_ecc_strength = 7,
+	.num_ecc_strength = 5,
 	.ecc_mode_shift = 4,
 	.parity_bits = 13,
 	.pg_irq_sel = 0,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
