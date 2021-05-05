Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB806C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:45:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34822613E3
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34822613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4DxIYaS03pJqOIMqvmiryszmk4b1wn5YeBU9ehon0r0=; b=bj+k/M/SnPP/Rl52YwXYjqp8a
	c/JaOc8zkM/kNw/o3RcqqGmSiOJGdxleQndoIavTxAutgazw9ym+Hj46sriEFgjRPi0BaOHqHyIFA
	YeUOr4aeo/iivYAdt4KNSeyS7gO04SjNSFRZ/+u0VO+vW8r4qyyaFGWeYnBHUrvQ7uy3XQd062vO+
	fLGZ2eo/QhcFLRt5XHuZzrcKOJ0nXJwVyqVf0ia2da4AjnoZYtVLjmok1uY1vVM0P6yRuaEERjmvw
	tT0Gmh9aXyY3OJNa7NNR5RwbyYMc+qaSRSkVSa1Fmy912hRrvmDz9/ROb8j2Q2cch/zH16wfLrb19
	hS5td3aLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePKA-002Q2v-6v; Wed, 05 May 2021 21:44:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDa-002Onj-8B
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=LIG8zhgZXCriGWLvZTuxp+5OCG13ol8QdTmca12IxFY=; b=cDiwWu+aqdgZJ2ynazq5A8puHF
 M57VwCpUgPrTCD7CmVGEPpCo4DdkyAQb6yNjs8cIeZlSps3YGuocT3NRvXalTN569qkwaIpTttCQx
 YTYYk3MPH3AZ8udCFahA0LOzqa8bKSQQ58bUuYSRVR1Ko4kUYuHybJ9CDQaIXJ6yvyNbD3hw741Fk
 Ez3RyBIOb6C8Kt+x/DyRopnAxBnhZPdCIjGpOrwl22N4nebKtOibcIHDF5WEcNyeOM5bQpagLfGjX
 Zj4qX5QZJOX9ZYqkagyhnenO5LALQshnaIYciDEUmowddtzRlFi/gYLzgtGPoWfOIUtPXYAUMjnXR
 1bddhOTw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDW-005IeS-7P
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:05 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C47F91BF20E;
 Wed,  5 May 2021 21:37:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 08/22] mtd: rawnand: Add NV-DDR timings
Date: Wed,  5 May 2021 23:37:36 +0200
Message-Id: <20210505213750.257417-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143802_574824_D815D043 
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

Create the relevant ONFI NV-DDR timings structure and fill it with
default values from the ONFI specification.

Add the relevant structure entries and helpers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_timings.c | 255 ++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h         | 112 ++++++++++++
 2 files changed, 367 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 94d832646487..481b56d5f60d 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -292,6 +292,261 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
 	},
 };
 
+static const struct nand_interface_config onfi_nvddr_timings[] = {
+	/* Mode 0 */
+	{
+		.type = NAND_NVDDR_IFACE,
+		.timings.mode = 0,
+		.timings.nvddr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tAC_min = 3000,
+			.tAC_max = 25000,
+			.tADL_min = 400000,
+			.tCAD_min = 45000,
+			.tCAH_min = 10000,
+			.tCALH_min = 10000,
+			.tCALS_min = 10000,
+			.tCAS_min = 10000,
+			.tCEH_min = 20000,
+			.tCH_min = 10000,
+			.tCK_min = 50000,
+			.tCS_min = 35000,
+			.tDH_min = 5000,
+			.tDQSCK_min = 3000,
+			.tDQSCK_max = 25000,
+			.tDQSD_min = 0,
+			.tDQSD_max = 18000,
+			.tDQSHZ_max = 20000,
+			.tDQSQ_max = 5000,
+			.tDS_min = 5000,
+			.tDSC_min = 50000,
+			.tFEAT_max = 1000000,
+			.tITC_max = 1000000,
+			.tQHS_max = 6000,
+			.tRHW_min = 100000,
+			.tRR_min = 20000,
+			.tRST_max = 500000000,
+			.tWB_max = 100000,
+			.tWHR_min = 80000,
+			.tWRCK_min = 20000,
+			.tWW_min = 100000,
+		},
+	},
+	/* Mode 1 */
+	{
+		.type = NAND_NVDDR_IFACE,
+		.timings.mode = 1,
+		.timings.nvddr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tAC_min = 3000,
+			.tAC_max = 25000,
+			.tADL_min = 400000,
+			.tCAD_min = 45000,
+			.tCAH_min = 5000,
+			.tCALH_min = 5000,
+			.tCALS_min = 5000,
+			.tCAS_min = 5000,
+			.tCEH_min = 20000,
+			.tCH_min = 5000,
+			.tCK_min = 30000,
+			.tCS_min = 25000,
+			.tDH_min = 2500,
+			.tDQSCK_min = 3000,
+			.tDQSCK_max = 25000,
+			.tDQSD_min = 0,
+			.tDQSD_max = 18000,
+			.tDQSHZ_max = 20000,
+			.tDQSQ_max = 2500,
+			.tDS_min = 3000,
+			.tDSC_min = 30000,
+			.tFEAT_max = 1000000,
+			.tITC_max = 1000000,
+			.tQHS_max = 3000,
+			.tRHW_min = 100000,
+			.tRR_min = 20000,
+			.tRST_max = 500000000,
+			.tWB_max = 100000,
+			.tWHR_min = 80000,
+			.tWRCK_min = 20000,
+			.tWW_min = 100000,
+		},
+	},
+	/* Mode 2 */
+	{
+		.type = NAND_NVDDR_IFACE,
+		.timings.mode = 2,
+		.timings.nvddr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tAC_min = 3000,
+			.tAC_max = 25000,
+			.tADL_min = 400000,
+			.tCAD_min = 45000,
+			.tCAH_min = 4000,
+			.tCALH_min = 4000,
+			.tCALS_min = 4000,
+			.tCAS_min = 4000,
+			.tCEH_min = 20000,
+			.tCH_min = 4000,
+			.tCK_min = 20000,
+			.tCS_min = 15000,
+			.tDH_min = 1700,
+			.tDQSCK_min = 3000,
+			.tDQSCK_max = 25000,
+			.tDQSD_min = 0,
+			.tDQSD_max = 18000,
+			.tDQSHZ_max = 20000,
+			.tDQSQ_max = 1700,
+			.tDS_min = 2000,
+			.tDSC_min = 20000,
+			.tFEAT_max = 1000000,
+			.tITC_max = 1000000,
+			.tQHS_max = 2000,
+			.tRHW_min = 100000,
+			.tRR_min = 20000,
+			.tRST_max = 500000000,
+			.tWB_max = 100000,
+			.tWHR_min = 80000,
+			.tWRCK_min = 20000,
+			.tWW_min = 100000,
+		},
+	},
+	/* Mode 3 */
+	{
+		.type = NAND_NVDDR_IFACE,
+		.timings.mode = 3,
+		.timings.nvddr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tAC_min = 3000,
+			.tAC_max = 25000,
+			.tADL_min = 400000,
+			.tCAD_min = 45000,
+			.tCAH_min = 3000,
+			.tCALH_min = 3000,
+			.tCALS_min = 3000,
+			.tCAS_min = 3000,
+			.tCEH_min = 20000,
+			.tCH_min = 3000,
+			.tCK_min = 15000,
+			.tCS_min = 15000,
+			.tDH_min = 1300,
+			.tDQSCK_min = 3000,
+			.tDQSCK_max = 25000,
+			.tDQSD_min = 0,
+			.tDQSD_max = 18000,
+			.tDQSHZ_max = 20000,
+			.tDQSQ_max = 1300,
+			.tDS_min = 1500,
+			.tDSC_min = 15000,
+			.tFEAT_max = 1000000,
+			.tITC_max = 1000000,
+			.tQHS_max = 1500,
+			.tRHW_min = 100000,
+			.tRR_min = 20000,
+			.tRST_max = 500000000,
+			.tWB_max = 100000,
+			.tWHR_min = 80000,
+			.tWRCK_min = 20000,
+			.tWW_min = 100000,
+		},
+	},
+	/* Mode 4 */
+	{
+		.type = NAND_NVDDR_IFACE,
+		.timings.mode = 4,
+		.timings.nvddr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tAC_min = 3000,
+			.tAC_max = 25000,
+			.tADL_min = 400000,
+			.tCAD_min = 45000,
+			.tCAH_min = 2500,
+			.tCALH_min = 2500,
+			.tCALS_min = 2500,
+			.tCAS_min = 2500,
+			.tCEH_min = 20000,
+			.tCH_min = 2500,
+			.tCK_min = 12000,
+			.tCS_min = 15000,
+			.tDH_min = 1100,
+			.tDQSCK_min = 3000,
+			.tDQSCK_max = 25000,
+			.tDQSD_min = 0,
+			.tDQSD_max = 18000,
+			.tDQSHZ_max = 20000,
+			.tDQSQ_max = 1000,
+			.tDS_min = 1100,
+			.tDSC_min = 12000,
+			.tFEAT_max = 1000000,
+			.tITC_max = 1000000,
+			.tQHS_max = 1200,
+			.tRHW_min = 100000,
+			.tRR_min = 20000,
+			.tRST_max = 500000000,
+			.tWB_max = 100000,
+			.tWHR_min = 80000,
+			.tWRCK_min = 20000,
+			.tWW_min = 100000,
+		},
+	},
+	/* Mode 5 */
+	{
+		.type = NAND_NVDDR_IFACE,
+		.timings.mode = 5,
+		.timings.nvddr = {
+			.tCCS_min = 500000,
+			.tR_max = 200000000,
+			.tPROG_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tBERS_max = 1000000ULL * ONFI_DYN_TIMING_MAX,
+			.tAC_min = 3000,
+			.tAC_max = 25000,
+			.tADL_min = 400000,
+			.tCAD_min = 45000,
+			.tCAH_min = 2000,
+			.tCALH_min = 2000,
+			.tCALS_min = 2000,
+			.tCAS_min = 2000,
+			.tCEH_min = 20000,
+			.tCH_min = 2000,
+			.tCK_min = 10000,
+			.tCS_min = 15000,
+			.tDH_min = 900,
+			.tDQSCK_min = 3000,
+			.tDQSCK_max = 25000,
+			.tDQSD_min = 0,
+			.tDQSD_max = 18000,
+			.tDQSHZ_max = 20000,
+			.tDQSQ_max = 850,
+			.tDS_min = 900,
+			.tDSC_min = 10000,
+			.tFEAT_max = 1000000,
+			.tITC_max = 1000000,
+			.tQHS_max = 1000,
+			.tRHW_min = 100000,
+			.tRR_min = 20000,
+			.tRST_max = 500000000,
+			.tWB_max = 100000,
+			.tWHR_min = 80000,
+			.tWRCK_min = 20000,
+			.tWW_min = 100000,
+		},
+	},
+};
+
 /* All NAND chips share the same reset data interface: SDR mode 0 */
 const struct nand_interface_config *nand_get_reset_interface_config(void)
 {
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 24aee0af5421..a53a1543d1d4 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -471,12 +471,100 @@ struct nand_sdr_timings {
 	u32 tWW_min;
 };
 
+/**
+ * struct nand_nvddr_timings - NV-DDR NAND chip timings
+ *
+ * This struct defines the timing requirements of a NV-DDR NAND data interface.
+ * These information can be found in every NAND datasheets and the timings
+ * meaning are described in the ONFI specifications:
+ * https://media-www.micron.com/-/media/client/onfi/specs/onfi_4_1_gold.pdf
+ * (chapter 4.18.2 NV-DDR)
+ *
+ * All these timings are expressed in picoseconds.
+ *
+ * @tBERS_max: Block erase time
+ * @tCCS_min: Change column setup time
+ * @tPROG_max: Page program time
+ * @tR_max: Page read time
+ * @tAC_min: Access window of DQ[7:0] from CLK
+ * @tAC_max: Access window of DQ[7:0] from CLK
+ * @tADL_min: ALE to data loading time
+ * @tCAD_min: Command, Address, Data delay
+ * @tCAH_min: Command/Address DQ hold time
+ * @tCALH_min: W/R_n, CLE and ALE hold time
+ * @tCALS_min: W/R_n, CLE and ALE setup time
+ * @tCAS_min: Command/address DQ setup time
+ * @tCEH_min: CE# high hold time
+ * @tCH_min:  CE# hold time
+ * @tCK_min: Average clock cycle time
+ * @tCS_min: CE# setup time
+ * @tDH_min: Data hold time
+ * @tDQSCK_min: Start of the access window of DQS from CLK
+ * @tDQSCK_max: End of the access window of DQS from CLK
+ * @tDQSD_min: Min W/R_n low to DQS/DQ driven by device
+ * @tDQSD_max: Max W/R_n low to DQS/DQ driven by device
+ * @tDQSHZ_max: W/R_n high to DQS/DQ tri-state by device
+ * @tDQSQ_max: DQS-DQ skew, DQS to last DQ valid, per access
+ * @tDS_min: Data setup time
+ * @tDSC_min: DQS cycle time
+ * @tFEAT_max: Busy time for Set Features and Get Features
+ * @tITC_max: Interface and Timing Mode Change time
+ * @tQHS_max: Data hold skew factor
+ * @tRHW_min: Data output cycle to command, address, or data input cycle
+ * @tRR_min: Ready to RE# low (data only)
+ * @tRST_max: Device reset time, measured from the falling edge of R/B# to the
+ *	      rising edge of R/B#.
+ * @tWB_max: WE# high to SR[6] low
+ * @tWHR_min: WE# high to RE# low
+ * @tWRCK_min: W/R_n low to data output cycle
+ * @tWW_min: WP# transition to WE# low
+ */
+struct nand_nvddr_timings {
+	u64 tBERS_max;
+	u32 tCCS_min;
+	u64 tPROG_max;
+	u64 tR_max;
+	u32 tAC_min;
+	u32 tAC_max;
+	u32 tADL_min;
+	u32 tCAD_min;
+	u32 tCAH_min;
+	u32 tCALH_min;
+	u32 tCALS_min;
+	u32 tCAS_min;
+	u32 tCEH_min;
+	u32 tCH_min;
+	u32 tCK_min;
+	u32 tCS_min;
+	u32 tDH_min;
+	u32 tDQSCK_min;
+	u32 tDQSCK_max;
+	u32 tDQSD_min;
+	u32 tDQSD_max;
+	u32 tDQSHZ_max;
+	u32 tDQSQ_max;
+	u32 tDS_min;
+	u32 tDSC_min;
+	u32 tFEAT_max;
+	u32 tITC_max;
+	u32 tQHS_max;
+	u32 tRHW_min;
+	u32 tRR_min;
+	u32 tRST_max;
+	u32 tWB_max;
+	u32 tWHR_min;
+	u32 tWRCK_min;
+	u32 tWW_min;
+};
+
 /**
  * enum nand_interface_type - NAND interface type
  * @NAND_SDR_IFACE:	Single Data Rate interface
+ * @NAND_NVDDR_IFACE:	Double Data Rate interface
  */
 enum nand_interface_type {
 	NAND_SDR_IFACE,
+	NAND_NVDDR_IFACE,
 };
 
 /**
@@ -485,6 +573,7 @@ enum nand_interface_type {
  * @timings:	 The timing information
  * @timings.mode: Timing mode as defined in the specification
  * @timings.sdr: Use it when @type is %NAND_SDR_IFACE.
+ * @timings.nvddr: Use it when @type is %NAND_NVDDR_IFACE.
  */
 struct nand_interface_config {
 	enum nand_interface_type type;
@@ -492,6 +581,7 @@ struct nand_interface_config {
 		unsigned int mode;
 		union {
 			struct nand_sdr_timings sdr;
+			struct nand_nvddr_timings nvddr;
 		};
 	} timings;
 };
@@ -505,6 +595,15 @@ static bool nand_interface_is_sdr(const struct nand_interface_config *conf)
 	return conf->type == NAND_SDR_IFACE;
 }
 
+/**
+ * nand_interface_is_nvddr - get the interface type
+ * @conf:	The data interface
+ */
+static bool nand_interface_is_nvddr(const struct nand_interface_config *conf)
+{
+	return conf->type == NAND_NVDDR_IFACE;
+}
+
 /**
  * nand_get_sdr_timings - get SDR timing from data interface
  * @conf:	The data interface
@@ -518,6 +617,19 @@ nand_get_sdr_timings(const struct nand_interface_config *conf)
 	return &conf->timings.sdr;
 }
 
+/**
+ * nand_get_nvddr_timings - get NV-DDR timing from data interface
+ * @conf:	The data interface
+ */
+static inline const struct nand_nvddr_timings *
+nand_get_nvddr_timings(const struct nand_interface_config *conf)
+{
+	if (!nand_interface_is_nvddr(conf))
+		return ERR_PTR(-EINVAL);
+
+	return &conf->timings.nvddr;
+}
+
 /**
  * struct nand_op_cmd_instr - Definition of a command instruction
  * @opcode: the command to issue in one cycle
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
