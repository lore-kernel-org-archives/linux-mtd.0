Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF2DC433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:51:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22AAC6108F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22AAC6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VJ3SEo4VtYkpv3TQlDff9OjLZNUPWJdF5BNl4XhKM/M=; b=HCCFEfSGUG3n/f4/16S8121cD
	cqTJY6fyNTe9JdL7XwBHgnHYQ+h+q9NFuzRsE6QEB2UpqUgUSl+QT/vtLrSpO0w84Ns4uYUkSIaAp
	nqBjcFhA17JSR3J2LeQyMXhmHTrfo27FqcuCwy1eIFpIB74Oi+5bZJgeXViXK2vxhPR5O6eJc5cBx
	DoEp3QPUrbmQi4imUp7FzzG9RDICGt9UNn06DaxwGBHpshsU6x/VZ7CggkdE2YZrzzwN3TM/led1E
	7Ad6m5m8p/uq8aJh2vVCWIRh9OEh4i1Rsq/chBFM72FQ24cPDNDUXaUSPZf5kOKAOsswbqy2OYx4K
	lohDI9uYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDdP-00C9FV-8j; Fri, 02 Apr 2021 06:50:23 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDcS-00C94A-AD
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 06:49:26 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 33D64C0006;
 Fri,  2 Apr 2021 06:49:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/5] mtd: rawnand: arasan: Ensure proper configuration for the
 asserted target
Date: Fri,  2 Apr 2021 08:49:14 +0200
Message-Id: <20210402064915.220781-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402064915.220781-1-miquel.raynal@bootlin.com>
References: <20210402064915.220781-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074924_655985_516D488D 
X-CRM114-Status: GOOD (  17.30  )
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
