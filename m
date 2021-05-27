Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2010C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:51:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F246128D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 08:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F246128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjDo4jbj3nuy6FXte6JDSsjiYCwBTy+oke2HVr5OCFk=; b=TyV2pxCDcTTiaD
	jqVoDGOL1cMNiZz/vhX6FqZgrpTaxIhcdmkbUGqFKeW/4OAk5+S5znCrJC5N628ghMPSeyJqJfahp
	VfSftCiolfsKs0L3PSB6nV8ZwlKfBw0GeWME9+oR0IUo+OQIv9o9GsJt3shT64OcsaPa1UJBscjmu
	bxin75aoeCgWWa6wmWj2buttr/vnRle+D8kVF3jMEvs1yMRI6MtzjJZdpJzhHW582YUEHx4X3TzqO
	fAZSPCd+FlLC/UgmYg6LkZlaKYg8njExdhL10PNWWxpRTQ8WkEOp/Dhh40bY9kD9ZSkB7WP4B3rl2
	a54vT1GknVoflkJIYZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmBip-0041PL-Ql; Thu, 27 May 2021 08:50:31 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmBiO-00419F-6k
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 08:50:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D5A3C100019;
 Thu, 27 May 2021 08:50:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: rawnand: arasan: Finer grain NV-DDR configuration
Date: Thu, 27 May 2021 10:49:59 +0200
Message-Id: <20210527084959.208804-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210527084959.208804-1-miquel.raynal@bootlin.com>
References: <20210527084959.208804-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_015004_544569_FE259D96 
X-CRM114-Status: GOOD (  16.66  )
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

Add support for the timings register which may improve a bit the
overall throughput.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 56 ++++++++++++++++++-
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 2bb62d193b78..8317d973ef6d 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -72,6 +72,15 @@
 
 #define FLASH_STS_REG			0x28
 
+#define TIMING_REG			0x2C
+#define   TCCS_TIME_500NS		0
+#define   TCCS_TIME_300NS		3
+#define   TCCS_TIME_200NS		2
+#define   TCCS_TIME_100NS		1
+#define   FAST_TCAD			BIT(2)
+#define   DQS_BUFF_SEL_IN(x)		FIELD_PREP(GENMASK(6, 3), (x))
+#define   DQS_BUFF_SEL_OUT(x)		FIELD_PREP(GENMASK(18, 15), (x))
+
 #define DATA_PORT_REG			0x30
 
 #define ECC_CONF_REG			0x34
@@ -145,6 +154,7 @@ struct anfc_op {
  * @page_sz:		Register value of the page_sz field to use
  * @clk:		Expected clock frequency to use
  * @data_iface:		Data interface timing mode to use
+ * @timings:		NV-DDR specific timings to use
  * @ecc_conf:		Hardware ECC configuration value
  * @strength:		Register value of the ECC strength
  * @raddr_cycles:	Row address cycle information
@@ -165,6 +175,7 @@ struct anand {
 	unsigned int page_sz;
 	unsigned long clk;
 	u32 data_iface;
+	u32 timings;
 	u32 ecc_conf;
 	u32 strength;
 	u16 raddr_cycles;
@@ -332,6 +343,7 @@ static int anfc_select_target(struct nand_chip *chip, int target)
 
 	/* Update the controller timings and the potential ECC configuration */
 	writel_relaxed(anand->data_iface, nfc->base + DATA_INTERFACE_REG);
+	writel_relaxed(anand->timings, nfc->base + TIMING_REG);
 
 	/* Update clock frequency */
 	if (nfc->cur_clk != anand->clk) {
@@ -955,6 +967,7 @@ static int anfc_setup_interface(struct nand_chip *chip, int target,
 	struct device_node *np = nfc->dev->of_node;
 	const struct nand_sdr_timings *sdr;
 	const struct nand_nvddr_timings *nvddr;
+	unsigned int tccs_min, dqs_mode, fast_tcad;
 
 	if (nand_interface_is_nvddr(conf)) {
 		nvddr = nand_get_nvddr_timings(conf);
@@ -969,13 +982,52 @@ static int anfc_setup_interface(struct nand_chip *chip, int target,
 	if (target < 0)
 		return 0;
 
-	if (nand_interface_is_sdr(conf))
+	if (nand_interface_is_sdr(conf)) {
 		anand->data_iface = DIFACE_SDR |
 				    DIFACE_SDR_MODE(conf->timings.mode);
-	else
+		anand->timings = 0;
+	} else {
 		anand->data_iface = DIFACE_NVDDR |
 				    DIFACE_DDR_MODE(conf->timings.mode);
 
+		if (conf->timings.nvddr.tCCS_min <= 100000)
+			tccs_min = TCCS_TIME_100NS;
+		else if (conf->timings.nvddr.tCCS_min <= 200000)
+			tccs_min = TCCS_TIME_200NS;
+		else if (conf->timings.nvddr.tCCS_min <= 300000)
+			tccs_min = TCCS_TIME_300NS;
+		else
+			tccs_min = TCCS_TIME_500NS;
+
+		fast_tcad = 0;
+		if (conf->timings.nvddr.tCAD_min < 45000)
+			fast_tcad = FAST_TCAD;
+
+		switch (conf->timings.mode) {
+		case 5:
+		case 4:
+			dqs_mode = 2;
+			break;
+		case 3:
+			dqs_mode = 3;
+			break;
+		case 2:
+			dqs_mode = 4;
+			break;
+		case 1:
+			dqs_mode = 5;
+			break;
+		case 0:
+		default:
+			dqs_mode = 6;
+			break;
+		}
+
+		anand->timings = tccs_min | fast_tcad |
+				 DQS_BUFF_SEL_IN(dqs_mode) |
+				 DQS_BUFF_SEL_OUT(dqs_mode);
+	}
+
 	anand->clk = ANFC_XLNX_SDR_DFLT_CORE_CLK;
 
 	/*
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
