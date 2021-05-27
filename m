Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501CCC4708A
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:50:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C7DE6128D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C7DE6128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YQfFPfg5ZBHffEEWc8QSebdbBo2qHQpbCFDDHqLaE/w=; b=2HnxislgA1jasE
	pvPiEFXo3u7VlEreHE4VONRliHGrcmVyPYH6gq7bkMP+2h4JjzHLJfUn6EMmvCqWhb71fihVrYX6F
	+iFI7p9lWrM9PZ7BNH3B4eWqRo8UaMAjBoAV7iblF8FmqDBnRcUR8wnKg7KL4qbr8wLPZzsWK9BR8
	7yD7RlttKqg4kGZGwzf122E/5qh1oQvr5SJ/6/Wk1kmhowAJRR5AwxfhNFY2E5vm31IIAEIM2VFU5
	ikYce7Q4aYk2yT1fcwPUAORjD2tLZTwoM7LMD9KohP1PrcwHWUegM9p2B0rwKuss2K3JmhzdI2Y+c
	6PT9i9FCXZtfKSKzzU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBiR-0041CX-KM; Thu, 27 May 2021 08:50:07 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBiN-00418I-GU
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 08:50:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7F33E100014;
 Thu, 27 May 2021 08:50:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/2] mtd: rawnand: arasan: Rename the data interface register
Date: Thu, 27 May 2021 10:49:58 +0200
Message-Id: <20210527084959.208804-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_015003_721733_CFE66101 
X-CRM114-Status: GOOD (  10.90  )
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

There are 2 timing registers:
- "data interface"
- "timings"

So far, the "data interface" register was named "timings" which begins
misleading when bringing support for the "timings" register. Rename it
to "data_iface".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 6e8d33173c6b..2bb62d193b78 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -144,7 +144,7 @@ struct anfc_op {
  * @rb:			Ready-busy line
  * @page_sz:		Register value of the page_sz field to use
  * @clk:		Expected clock frequency to use
- * @timings:		Data interface timing mode to use
+ * @data_iface:		Data interface timing mode to use
  * @ecc_conf:		Hardware ECC configuration value
  * @strength:		Register value of the ECC strength
  * @raddr_cycles:	Row address cycle information
@@ -164,7 +164,7 @@ struct anand {
 	unsigned int rb;
 	unsigned int page_sz;
 	unsigned long clk;
-	u32 timings;
+	u32 data_iface;
 	u32 ecc_conf;
 	u32 strength;
 	u16 raddr_cycles;
@@ -331,7 +331,7 @@ static int anfc_select_target(struct nand_chip *chip, int target)
 	anfc_assert_cs(nfc, nfc_cs_idx);
 
 	/* Update the controller timings and the potential ECC configuration */
-	writel_relaxed(anand->timings, nfc->base + DATA_INTERFACE_REG);
+	writel_relaxed(anand->data_iface, nfc->base + DATA_INTERFACE_REG);
 
 	/* Update clock frequency */
 	if (nfc->cur_clk != anand->clk) {
@@ -970,11 +970,11 @@ static int anfc_setup_interface(struct nand_chip *chip, int target,
 		return 0;
 
 	if (nand_interface_is_sdr(conf))
-		anand->timings = DIFACE_SDR |
-				 DIFACE_SDR_MODE(conf->timings.mode);
+		anand->data_iface = DIFACE_SDR |
+				    DIFACE_SDR_MODE(conf->timings.mode);
 	else
-		anand->timings = DIFACE_NVDDR |
-				 DIFACE_DDR_MODE(conf->timings.mode);
+		anand->data_iface = DIFACE_NVDDR |
+				    DIFACE_DDR_MODE(conf->timings.mode);
 
 	anand->clk = ANFC_XLNX_SDR_DFLT_CORE_CLK;
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
