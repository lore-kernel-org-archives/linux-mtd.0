Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0818FD877E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDtttbHqjtddrL6pEBbOB8m1Ck9+nVGeeCayBf+Ujz0=; b=rns8UbdhlEQY0P
	OJooLyCq2uc9e6yybHZatYXReBVp8rvl/bzam9sFgnG/3MePxFsrF8d3YXz2XL3HU61UKzy9v1OC6
	fZPB5cNfLmNR11VwU1PFrLGT8PuYOfjT+zefPGcw4MkIyEG/DOkIcOZGH5rK5esbZmSSwBh8QmrwV
	7cK+D/izOHzfpPa3Vyl3fdcaVr9xQO3JuCtSi7JLlj9dxEMGoCWyKuZVBeVDPIVdL3K+YkNIlH/Q8
	k6x/uhDYLBRjYbTa3ZiRixahhTE7jpUG7CO6zCQmHUXUGW5Q+Tg29dnxHPmLvMGJc7hrEOYrvi/Dz
	ObWwMiCmX2c63SUOHrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMC-00000006a7C-2tzk;
	Tue, 17 Mar 2026 14:25:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VM2-00000006Zpx-0QYR;
	Tue, 17 Mar 2026 14:25:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 774514E42659;
	Tue, 17 Mar 2026 14:25:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E4F56011D;
	Tue, 17 Mar 2026 14:25:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 675B2104505F7;
	Tue, 17 Mar 2026 15:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757503; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ReYpIf5P0XqKNE/IqjBubHIkClDeft9UJw8AXo2Da0U=;
	b=gETtDY/marSGyoN7R6wguIOTQdEILbeMlwFAMgdMgnsxBV3tArklCOogLBtKk1d8gFG8qm
	Jm0hoXCLv1wDqkE4rnYteBz9rwh4QSEeZdlc/tlyT1tgyPAyhCvMpDbqcajMI5GH42xwkQ
	BcNcyMEa+9kgBoolJJtiJAskjmxfKaqwPE0d7+90oV8jqa2EYTC7GuIJNrL/D/bGpVMLPw
	OR2WBpAlayVzF2k08/4+JKLztAY7StppFTnwNsnW9T63uy7d6hDU0z4n80lgFYNE3EUVrw
	2Hh+ToLUEcP61DMjD/Vhm5nCN9VCoQWsuSsFW58FX7aLbprLC+AwAWZgI7r98g==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 6/9] mtd: rawnand: sunxi: remove dead code
Date: Tue, 17 Mar 2026 15:24:34 +0100
Message-ID: <20260317142437.580204-7-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072506_284105_C69DACB8 
X-CRM114-Status: GOOD (  15.86  )
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

sunxi_nand_ooblayout_free() is only used in a code path where
engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST

So the other cases can be removed.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ca701c75cec5..68e22ce451db 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1756,7 +1756,11 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 
-	if (section > ecc->steps)
+	/*
+	 * The controller does not provide access to OOB bytes
+	 * past the end of the ECC data.
+	 */
+	if (section >= ecc->steps)
 		return -ERANGE;
 
 	/*
@@ -1764,26 +1768,15 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	 * only have USER_DATA_SZ - 2 bytes available in the first user data
 	 * section.
 	 */
-	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
+	if (section == 0) {
 		oobregion->offset = 2;
 		oobregion->length = USER_DATA_SZ - 2;
 
 		return 0;
 	}
 
-	/*
-	 * The controller does not provide access to OOB bytes
-	 * past the end of the ECC data.
-	 */
-	if (section == ecc->steps && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
-		return -ERANGE;
-
 	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ);
-
-	if (section < ecc->steps)
-		oobregion->length = USER_DATA_SZ;
-	else
-		oobregion->length = mtd->oobsize - oobregion->offset;
+	oobregion->length = USER_DATA_SZ;
 
 	return 0;
 }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
