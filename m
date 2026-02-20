Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE0C5ACD3
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/oEH32vun4VLA/3rfcs00ZtMjl6o7XmvV+5EeTNnv8=; b=x7SDkD3nT1gZZU
	Jy7y//IKFfHT1u8t5SCqvE8FC1Y/KCd+oH+uY5s1d1LFEcxZFAMQuzyT4w4dGLXxE+EEj160jCg1H
	mS21c+fYVDXcFQJFetqLBC35B4/Wxbj/8vnFtd7efL2LP/YkiGYHlKLQnPeNjj5EQYgEVt8OL4atc
	zfuGzjwRudrYy+EkSDhLiHoilySNK/t3KVJ17MYoMnY3BrP4swu31aMJZ7zQK4ZOpsGCoWhLaC6ej
	hTLv7CGol3VLPtIK56ALQfLACe3R9ek9bb90hI0tx1NVTgguKPoeLgz2XCm8SbcoK66m1DSwe9dTK
	/5P37RFkT+wilG1PQNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5g-0000000FBlD-35ft;
	Fri, 20 Feb 2026 16:10:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5T-0000000FBUn-3rey
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 16:10:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8163D4E40945;
	Fri, 20 Feb 2026 16:10:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 563005FA8F;
	Fri, 20 Feb 2026 16:10:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 492B810368D45;
	Fri, 20 Feb 2026 17:10:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603837; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kwjIfxJ8VNKkkqo4t0mWwpyEaLWQDyzfgT0yAJ2gX2E=;
	b=XoZudrdU9MU8FqiGo0MY7wjqPVjn/PHA5ebsam9oLxnojF2wMpeWVz8KZaBkFDhX0dcbBL
	uJPWsghim8fLkbuNDV0Q18OEIkIzq+LSM07yAxQR6P8F8gM7WnumCzk8WnNIsteajcyTWT
	hehwbRQWfn5hTdOAIXXsMAcdlea0F1LkEXzdsECoYKZcGohd14vNHxfNxrtGNYn6/LpgwQ
	tyiDXGQL6MN1la8r9gOHBPLVW9YsaOl38LiqNcN/cufurMz9gQeOPbeHTwbuUG5J88n1v3
	ZHqs/c2OIUNpj575epYSLATY/Ih5FCQe1R+oeH/QYKK+zL33YdDJJAVFv8jjJA==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a define - take2
Date: Fri, 20 Feb 2026 17:10:09 +0100
Message-ID: <20260220161011.999642-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220161011.999642-1-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_081040_091691_EC92C0B4 
X-CRM114-Status: GOOD (  13.26  )
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

The user data length (4) has been replaced almost all over the file, but
2 places were forgotten.

The user data is placed before the ECC, for each step.
So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);

And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
the same offset plus the current user data size:
section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;

Fixes: 1be7ac78b72f ("mtd: rawnand: sunxi: Replace hard coded value by a define")
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 99d305bbda53..5d925b59b618 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1051,7 +1051,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int offset = ((ecc->bytes + 4) * ecc->steps);
+	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
 	int len = mtd->oobsize - offset;
 
 	if (len <= 0)
@@ -1747,7 +1747,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section >= ecc->steps)
 		return -ERANGE;
 
-	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + 4;
+	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
 	oobregion->length = ecc->bytes;
 
 	return 0;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
