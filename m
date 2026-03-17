Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910A3FD877D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nSJWJvPhW1dHiRzBtzSjq0KWD+zWR+6WKJ0ErAh7ZA=; b=4+495uhMoCIT2s
	IjNxvnHkNpbsogRjlBR2oDlXD/6pV936JCNHc3n3jLLBNOrcMaxuJFE6QAU6ijm0DcWnhf3FvYleg
	/kvveqnC6omsvFdAj/cp/+KRmmeBwstpL06RtlKyrpF46BN3Wm9JnBFB95qMRMO6BfIghyLYgY/Yr
	S9q5UuVOaYnOvY1SE4fJQPgiOQN/HnXvTM7zgm82KzicYBtJJW6FkPjszsRgmdTMSivD0P/4Tx6na
	mss8+pJuXk5vf4Yzg+6DWuTdxEnHJfl2PBWe4eFeY/pmpIepeugeuvgk9KdNkMHnosroCUnSyrMte
	sEQ9mIzDYXTuzKDWfVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMR-00000006aPg-2nIm;
	Tue, 17 Mar 2026 14:25:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMA-00000006a1k-23yl
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 14:25:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 80476C55075;
	Tue, 17 Mar 2026 14:25:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98A995FC9A;
	Tue, 17 Mar 2026 14:25:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF9E2104505FE;
	Tue, 17 Mar 2026 15:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757505; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BrbsAztv/q276b/C/c8lHnbUQV+pP9AxyLo2fJhBj9o=;
	b=CqbAPns7a/XjfdhNap2qLpTfQR0xrIEVOs9+SBHo3llrTb21rceKCQsb2U/Qg2ynuRy+UB
	L2/BAgYnXm7qZqHkw6XT9KEezsc+8mEpTFuFS6YlV2X9dQOEEK9IrVm1po3RIpAZecEtP7
	KFnk1s35aY5dJN7PRhJCMHXqwYZv5J86ypdKU4Io7fP1ovNwUuKfLtTeGE1xD52tS0tHvy
	ce/KJyh37G6Sli1PXGFkoGyN70vKrH4fqJmrquh60PFWT/FFp9B0vmmXy28zCeSczQnsA1
	hOM2wAm1sgkJmHOICF4MDaRp7DP8wh1orrmUJaGDNN1lmY+Xwu7hITNcFLAZNw==
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
Subject: [PATCH v3 7/9] mtd: rawnand: sunxi: change error prone variable name
Date: Tue, 17 Mar 2026 15:24:35 +0100
Message-ID: <20260317142437.580204-8-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072514_954826_D0793078 
X-CRM114-Status: GOOD (  15.81  )
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

In sunxi_nand_hw_ecc_ctrl_init(), i is used as a loop index variable and
at the same time as the value used to set ECC mode in ECC control
register.
To prevent it from being re-used as a loop variable, let's change the
naming to ecc_mode.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 68e22ce451db..81e491be3563 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1796,6 +1796,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	int nsectors;
+	int ecc_mode;
 	int i;
 
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
@@ -1849,18 +1850,18 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	}
 
 	/* Add ECC info retrieval from DT */
-	for (i = 0; i < nfc->caps->nstrengths; i++) {
-		if (ecc->strength <= strengths[i]) {
+	for (ecc_mode = 0; ecc_mode < nfc->caps->nstrengths; ecc_mode++) {
+		if (ecc->strength <= strengths[ecc_mode]) {
 			/*
 			 * Update ecc->strength value with the actual strength
 			 * that will be used by the ECC engine.
 			 */
-			ecc->strength = strengths[i];
+			ecc->strength = strengths[ecc_mode];
 			break;
 		}
 	}
 
-	if (i >= nfc->caps->nstrengths) {
+	if (ecc_mode >= nfc->caps->nstrengths) {
 		dev_err(nfc->dev, "unsupported strength\n");
 		return -ENOTSUPP;
 	}
@@ -1896,7 +1897,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->read_oob_raw = nand_read_oob_std;
 	ecc->write_oob_raw = nand_write_oob_std;
 
-	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(nfc, i) | NFC_ECC_EXCEPTION |
+	sunxi_nand->ecc.ecc_ctl = NFC_ECC_MODE(nfc, ecc_mode) | NFC_ECC_EXCEPTION |
 				  NFC_ECC_PIPELINE | NFC_ECC_EN;
 
 	if (ecc->size == 512) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
