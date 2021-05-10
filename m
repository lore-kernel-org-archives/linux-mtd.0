Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60039C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:49:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B271F61945
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B271F61945
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VJ3SEo4VtYkpv3TQlDff9OjLZNUPWJdF5BNl4XhKM/M=; b=pSlUVraQV+8tDPF/z2Ff4yfPO
	5j9ftTIQnLXGWyfuACwae9BUAdU5hx7LsE/a4HYvqWKf02AL1DoGBlmlmlcTpRHqEXv4bBFdw/L2H
	GQzBG7wOKBOAeUXRl/g36A7d43raqMURP4/pZm8s8GorIDkR1jCxF/rNOSYNyWayzWqtw/CKLnRau
	OMJDK5CD9VxPgA6JSkudympNus68x2dUZOGNv8NGLDplkJ+fwG6GKy31W2hqjMmX/43oQCNj0bIWl
	oyUXVNFW7BYl0LJUABy/d0IbV3htyXliru6BzF+VbJCkZo7dWxmJpXAMobymot4WYvaY60cJmEutb
	WzP1CbVtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3SZ-00DzlA-4C; Mon, 10 May 2021 10:48:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LT-00DyUw-35
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Pze3SkdUAIdGs89IWvbqviVQaGc7ryD3ysaRqZHxHFQ=; b=yHkomp6KPZ9PAMtNfYLEZ14UUH
 51jtu/wrW0jYOVeBwZozU+JrUEdOLxVH7WDAv3QrSpgBkeJr3lJpfrtayCU0qRQCJMbn2RnZFvKlh
 ZhQ82IbSRMUpq4HgRIT9rrmzJOqmEscUGECYQfaojEpQlJuPJjTMJIZXzabI1rpXCQmcUqxt5VBsi
 o4nmmYlzz1D407vqGM3c/VhFIBeH4cXq3IOIvjINqnQJ9gnWR588sOhIpC8lOFpmU+67anNoHY21u
 zueVv7j+EpOv/Ch6lW57XlLxrjNAq/HAJqpUDu2gFd4DRb67dlH4P0HlY7jZrCD4zg6mUkQZrbPn4
 Ruay0Nqw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3LP-008Ya1-W9
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:41:01 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6A31B1C000F;
 Mon, 10 May 2021 10:40:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 4/5] mtd: rawnand: arasan: Ensure proper configuration for
 the asserted target
Date: Mon, 10 May 2021 12:40:50 +0200
Message-Id: <20210510104051.9701-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-1-miquel.raynal@bootlin.com>
References: <20210510104051.9701-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034100_338483_DF41AD23 
X-CRM114-Status: GOOD (  17.97  )
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
