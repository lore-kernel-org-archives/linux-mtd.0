Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83AAC47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0446101B
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0446101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJ3SEo4VtYkpv3TQlDff9OjLZNUPWJdF5BNl4XhKM/M=; b=Mmqtql0DhW1Kdm
	4XmG+Wnk5I/Eru4W1Uwp1U6pELfDvM7qeCfMzZoGOUwV381QSxTo//NNEvkR3P8VbqF2aVy1D7Tmt
	ci+qNI9o6yT1g3qcF5aK7uNkHXCHqKodCq6mEQPrHNUlg6k5yR9olamBcvhfOPlb1qPK8+47tt8MR
	0imjnBFvBVju8sTM+IBGyqWT/+RLxCuTvou/Hi6idGUtDhI3i27e+ObDChS5n2ILhDaLOfAB/vX7P
	e6Bob0yaMIbz4WP5RjwzPM2XNa1a6m1daADxN6nqosQldK4BO6nw0EbMdkGQrYJKvGmbZ006QVqWB
	JB/jskbuWVfuh4R1AMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llrsu-00Dd9z-TW; Wed, 26 May 2021 11:39:37 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpuB-00Cug0-7M
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:32:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E875B6001A;
 Wed, 26 May 2021 09:32:44 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RESEND v3 3/4] mtd: rawnand: arasan: Ensure proper configuration for
 the asserted target
Date: Wed, 26 May 2021 11:32:41 +0200
Message-Id: <20210526093242.183847-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526093242.183847-1-miquel.raynal@bootlin.com>
References: <20210526093242.183847-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_023247_639769_85B21E98 
X-CRM114-Status: GOOD (  17.44  )
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

The controller being always asserting one CS or the other, there is no
need to actually select the right target before doing a page read/write.
However, the anfc_select_target() helper actually also changes the
timing configuration and clock in the case were two different NAND chips
with different timing requirements would be used. In this situation, we
must ensure proper configuration of the controller by calling it.

As a consequence of this change, the anfc_select_target() helper is
being moved earlier in the driver.

Fixes: 88ffef1b65cf ("mtd: rawnand: arasan: Support the hardware BCH ECC engine")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 90 ++++++++++++-------
 1 file changed, 57 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 549aac00228e..390f8d719c25 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -273,6 +273,37 @@ static int anfc_pkt_len_config(unsigned int len, unsigned int *steps,
 	return 0;
 }
 
+static int anfc_select_target(struct nand_chip *chip, int target)
+{
+	struct anand *anand = to_anand(chip);
+	struct arasan_nfc *nfc = to_anfc(chip->controller);
+	int ret;
+
+	/* Update the controller timings and the potential ECC configuration */
+	writel_relaxed(anand->timings, nfc->base + DATA_INTERFACE_REG);
+
+	/* Update clock frequency */
+	if (nfc->cur_clk != anand->clk) {
+		clk_disable_unprepare(nfc->controller_clk);
+		ret = clk_set_rate(nfc->controller_clk, anand->clk);
+		if (ret) {
+			dev_err(nfc->dev, "Failed to change clock rate\n");
+			return ret;
+		}
+
+		ret = clk_prepare_enable(nfc->controller_clk);
+		if (ret) {
+			dev_err(nfc->dev,
+				"Failed to re-enable the controller clock\n");
+			return ret;
+		}
+
+		nfc->cur_clk = anand->clk;
+	}
+
+	return 0;
+}
+
 /*
  * When using the embedded hardware ECC engine, the controller is in charge of
  * feeding the engine with, first, the ECC residue present in the data array.
@@ -401,6 +432,18 @@ static int anfc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 	return 0;
 }
 
+static int anfc_sel_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
+				     int oob_required, int page)
+{
+	int ret;
+
+	ret = anfc_select_target(chip, chip->cur_cs);
+	if (ret)
+		return ret;
+
+	return anfc_read_page_hw_ecc(chip, buf, oob_required, page);
+};
+
 static int anfc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
 				  int oob_required, int page)
 {
@@ -461,6 +504,18 @@ static int anfc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
 	return ret;
 }
 
+static int anfc_sel_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
+				      int oob_required, int page)
+{
+	int ret;
+
+	ret = anfc_select_target(chip, chip->cur_cs);
+	if (ret)
+		return ret;
+
+	return anfc_write_page_hw_ecc(chip, buf, oob_required, page);
+};
+
 /* NAND framework ->exec_op() hooks and related helpers */
 static int anfc_parse_instructions(struct nand_chip *chip,
 				   const struct nand_subop *subop,
@@ -753,37 +808,6 @@ static const struct nand_op_parser anfc_op_parser = NAND_OP_PARSER(
 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
 	);
 
-static int anfc_select_target(struct nand_chip *chip, int target)
-{
-	struct anand *anand = to_anand(chip);
-	struct arasan_nfc *nfc = to_anfc(chip->controller);
-	int ret;
-
-	/* Update the controller timings and the potential ECC configuration */
-	writel_relaxed(anand->timings, nfc->base + DATA_INTERFACE_REG);
-
-	/* Update clock frequency */
-	if (nfc->cur_clk != anand->clk) {
-		clk_disable_unprepare(nfc->controller_clk);
-		ret = clk_set_rate(nfc->controller_clk, anand->clk);
-		if (ret) {
-			dev_err(nfc->dev, "Failed to change clock rate\n");
-			return ret;
-		}
-
-		ret = clk_prepare_enable(nfc->controller_clk);
-		if (ret) {
-			dev_err(nfc->dev,
-				"Failed to re-enable the controller clock\n");
-			return ret;
-		}
-
-		nfc->cur_clk = anand->clk;
-	}
-
-	return 0;
-}
-
 static int anfc_check_op(struct nand_chip *chip,
 			 const struct nand_operation *op)
 {
@@ -1007,8 +1031,8 @@ static int anfc_init_hw_ecc_controller(struct arasan_nfc *nfc,
 	if (!anand->bch)
 		return -EINVAL;
 
-	ecc->read_page = anfc_read_page_hw_ecc;
-	ecc->write_page = anfc_write_page_hw_ecc;
+	ecc->read_page = anfc_sel_read_page_hw_ecc;
+	ecc->write_page = anfc_sel_write_page_hw_ecc;
 
 	return 0;
 }
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
