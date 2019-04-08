Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2A2C282DD
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C7DB20880
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BnYTQaCQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C7DB20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7K1vIye7B1GJpLAdpCT+z9E0JULM3/Pt+VB/o7xrXao=; b=BnYTQaCQ9ATE29
	lO2jLMvYZi59rMxLNvBQVu5rps5+M5WO9D+euSRn82j1XO8brcEh1WZSSKoQ3hyU1hPhDPJq+UR2c
	EjWeOsHLYgwuUaj/TMO70yvZKwOcMq8EoIU4Yl7Dmg4ufWIx3H8P95Ui54jP/6iN24ABw7+u+aw8V
	8vdpxs8H27nPyXFHTGk0X6+q/Isez+QP06p98/URF1Tww1mTF8iIBxzEbXaQy2ao1a2TqMsBI6qPB
	H82vrjXq8HJ2b4x3iBU44DrXBtm5eqMqGTwItwMF0SVn87VCnOjsWdNVxEWRL97HriBM2pqcvAPYA
	Vwz8t8K59Gav72r4PwaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPhD-0006cm-SP; Mon, 08 Apr 2019 08:32:03 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPh7-0006bC-MO
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 08:32:01 +0000
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 89584200013;
 Mon,  8 Apr 2019 08:31:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: rawnand: marvell: Clean the controller state before
 each operation
Date: Mon,  8 Apr 2019 10:31:45 +0200
Message-Id: <20190408083145.13178-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_013157_907880_B59ED2FE 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: stable@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Since the migration of the driver to stop using the legacy
->select_chip() hook, there is nothing deselecting the target anymore,
thus the selection is not forced at the next access. Ensure the ND_RUN
bit and the interrupts are always in a clean state.

Cc: Daniel Mack <daniel@zonque.org>
Cc: stable@vger.kernel.org
Fixes: b25251414f6e00 ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Also include the reset of the interrupts each time
  marvell_nfc_select_target() is called.

 drivers/mtd/nand/raw/marvell_nand.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index f38e5c1b87e4..d984538980e2 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -722,12 +722,6 @@ static void marvell_nfc_select_target(struct nand_chip *chip,
 	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
 	u32 ndcr_generic;
 
-	if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
-		return;
-
-	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
-	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
-
 	/*
 	 * Reset the NDCR register to a clean state for this particular chip,
 	 * also clear ND_RUN bit.
@@ -739,6 +733,12 @@ static void marvell_nfc_select_target(struct nand_chip *chip,
 	/* Also reset the interrupt status register */
 	marvell_nfc_clear_int(nfc, NDCR_ALL_INT);
 
+	if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
+		return;
+
+	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
+	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
+
 	nfc->selected_chip = chip;
 	marvell_nand->selected_die = die_nr;
 }
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
