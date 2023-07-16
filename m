Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C4EB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpyZP3e78MbfHZUAVD+XO7ZIzMZE3eHxLQHrA2tPGTQ=; b=Qbjuki2RGhehMp
	6b/W6qpgcNFBhQoZyBFQzCMe5FKsXkJjSDqpzrKYO/nfYXm6789QHz0thEa7YKf3T7K04Oc+ws7qG
	oquLNPbgatH0UDGKVuDtoSykRx89FbNIHMPDrogmWKU7ev8Te6NMHnkZTktnptwsaRWBFPCwrV8aG
	fRfNu0kFICySUga+Bma2Jb5axMRgrGMPo2oLBrZyzRojyaaRSoIR7W9itikXf+aBeWRi17ePP2hpe
	hlwnL2MAsoujSSjBY0/6TedRNQOD5dWB6Ot2aV3DTXam5Nkp99HSAVrla4eAW1nS8VOjLP6aX/g6m
	M3iegmp9J1A7iKQNG/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL31T-00Bz8M-0O;
	Sun, 16 Jul 2023 14:46:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30u-00ByiD-0J;
	Sun, 16 Jul 2023 14:46:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C52AC0007;
	Sun, 16 Jul 2023 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtz9hayiWO0623xI6pr99DqVSoh1nuYYDdJKjGU+Jc4=;
	b=RMI3DqzQQQo7QQhXSowGcqETcQ7Q5AqZYLXsHzzKvpM42lYSZa+kSQkRnGeqjDtKBLmVGw
	cGVbBfJQiuwyiCcCzMAh+eOW5SmU3VBFQUpJ2FfThFTfRUv5yewjxLJayCG+E2cRDMjz3r
	7zW/iR5ONRJNP6+ZcYnMEAOlpJA+YeT0TUB77ir7E4284oBtTx6OtwpQRsOXLpyYKJ8Lcc
	vV3OUq5UgvRDmEbblRElDAUUD/yXF/7Q0fb6q6oru4Vjun3Y2M2s990PZQhUkyyPi4DouU
	Cgcot3IHkaRXWb1qe2k2RcfjoUpzqua42TPH6bDmH2g11QbdUqnzkyTVCfXwwA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/8] mtd: rawnand: qcom: Use u8 instead of uint8_t
Date: Sun, 16 Jul 2023 16:46:06 +0200
Message-Id: <20230716144612.32132-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074620_428663_8BF805C1 
X-CRM114-Status: GOOD (  10.79  )
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

Fix the following checkpatch warning:
    "CHECK: Prefer kernel type 'u8' over 'uint8_t'"

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 023c8b36426b..0136df01738e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -212,7 +212,7 @@ nandc_set_reg(chip, reg,			\
 /* Returns the dma address for reg read buffer */
 #define reg_buf_dma_addr(chip, vaddr) \
 	((chip)->reg_read_dma + \
-	((uint8_t *)(vaddr) - (uint8_t *)(chip)->reg_read_buf))
+	((u8 *)(vaddr) - (u8 *)(chip)->reg_read_buf))
 
 #define QPIC_PER_CW_CMD_ELEMENTS	32
 #define QPIC_PER_CW_CMD_SGL		32
@@ -1884,7 +1884,7 @@ static void qcom_nandc_codeword_fixup(struct qcom_nand_host *host, int page)
 }
 
 /* implements ecc->read_page() */
-static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
+static int qcom_nandc_read_page(struct nand_chip *chip, u8 *buf,
 				int oob_required, int page)
 {
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
@@ -1912,7 +1912,7 @@ static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
 }
 
 /* implements ecc->read_page_raw() */
-static int qcom_nandc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
+static int qcom_nandc_read_page_raw(struct nand_chip *chip, u8 *buf,
 				    int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -1958,7 +1958,7 @@ static int qcom_nandc_read_oob(struct nand_chip *chip, int page)
 }
 
 /* implements ecc->write_page() */
-static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
+static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 				 int oob_required, int page)
 {
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
@@ -2035,7 +2035,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 
 /* implements ecc->write_page_raw() */
 static int qcom_nandc_write_page_raw(struct nand_chip *chip,
-				     const uint8_t *buf, int oob_required,
+				     const u8 *buf, int oob_required,
 				     int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
