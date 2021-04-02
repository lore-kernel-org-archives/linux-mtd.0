Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9CEC433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:03:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776CC60FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 776CC60FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DXkYrRhOc4MzQDXnop30fivU8fnoP7r81ixVOZSUXEk=; b=oxR7sGhxXgVkjEeTtKJ1uIUck
	vWVBOsp+6QxHpawnVDbWAmkd3V1VfW4/RVlSW4HK4VSCr9yVo6vlePcO9LzLumUPYm8SDhBgwR5Xb
	Guo8pxQjX+fvcTUK7cSN2AYRPmVN87jchbTK3KAok3wuB0nSoOJSK15LyaV9hhoCTHCkA+vmmTTni
	ORxkQEbBJUDdRQYL0mQ8BSw2oO8UkXUwPtG+CiJhtr9YLWK2ityz4gznBMY0mnLKiAZ5dYMrlI+SE
	VRi0OqTpS9Rd0NVqmrcaIbt7NZUAzEUpn1C4wXkrlxXzrA5QNzBUnMnXhT8wRpB9RAewEn3wqGw9z
	XOgmwlVrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGch-00CgXs-Lt; Fri, 02 Apr 2021 10:01:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTn-00Cf1j-MJ
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:44 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 127DA1C000A;
 Fri,  2 Apr 2021 09:52:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 13/16] mtd: rawnand: Access SDR and NV-DDR timings through
 a common macro
Date: Fri,  2 Apr 2021 11:51:42 +0200
Message-Id: <20210402095145.254867-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105239_990705_50BABBA0 
X-CRM114-Status: GOOD (  18.61  )
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

Most timings related to the bus timings are different between SDR and
NV-DDR. However, we identified 9 individual timings which are more
related to the NAND chip internals. These are common between the two
interface types. Fortunately, only these common timings are being shared
through the NAND core and its ->exec_op() interface, which allows the
writing of a simple macro checking the interface type and depending on
it, returning either the relevant SDR timing or the NV-DDR timing. This
is the purpose of the NAND_COMMON_TIMING_PS() macro.

As all this is evaluated at build time, one will immediately be notified
in case a non common timing is being accessed through this macro.

Two handy macros are also inserted at the same time, which use
PSEC_TO_NSEC or PSEC_TO_MSEC so that it is very easy to return timings
in milli-, nano- or pico-seconds, as usually requested by the internal
API.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 131 +++++++++++++++++--------------
 include/linux/mtd/rawnand.h      |  28 +++++++
 2 files changed, 99 insertions(+), 60 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a2822b8b3e53..e43ea20d7483 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -606,7 +606,7 @@ static int nand_block_checkbad(struct nand_chip *chip, loff_t ofs, int allowbbt)
  */
 int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 {
-	const struct nand_sdr_timings *timings;
+	const struct nand_interface_config *conf;
 	u8 status = 0;
 	int ret;
 
@@ -614,8 +614,8 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
 		return -ENOTSUPP;
 
 	/* Wait tWB before polling the STATUS reg. */
-	timings = nand_get_sdr_timings(nand_get_interface_config(chip));
-	ndelay(PSEC_TO_NSEC(timings->tWB_max));
+	conf = nand_get_interface_config(chip);
+	ndelay(NAND_COMMON_TIMING_NS(conf, tWB_max));
 
 	ret = nand_status_op(chip, NULL);
 	if (ret)
@@ -1005,15 +1005,15 @@ static int nand_sp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 				     unsigned int offset_in_page, void *buf,
 				     unsigned int len)
 {
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(nand_get_interface_config(chip));
+	const struct nand_interface_config *conf =
+		nand_get_interface_config(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 addrs[4];
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
-		NAND_OP_ADDR(3, addrs, PSEC_TO_NSEC(sdr->tWB_max)),
-		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
-				 PSEC_TO_NSEC(sdr->tRR_min)),
+		NAND_OP_ADDR(3, addrs, NAND_COMMON_TIMING_NS(conf, tWB_max)),
+		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max),
+				 NAND_COMMON_TIMING_NS(conf, tRR_min)),
 		NAND_OP_DATA_IN(len, buf, 0),
 	};
 	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
@@ -1048,15 +1048,15 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 				     unsigned int offset_in_page, void *buf,
 				     unsigned int len)
 {
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(nand_get_interface_config(chip));
+	const struct nand_interface_config *conf =
+		nand_get_interface_config(chip);
 	u8 addrs[5];
 	struct nand_op_instr instrs[] = {
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
 		NAND_OP_ADDR(4, addrs, 0),
-		NAND_OP_CMD(NAND_CMD_READSTART, PSEC_TO_NSEC(sdr->tWB_max)),
-		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
-				 PSEC_TO_NSEC(sdr->tRR_min)),
+		NAND_OP_CMD(NAND_CMD_READSTART, NAND_COMMON_TIMING_NS(conf, tWB_max)),
+		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max),
+				 NAND_COMMON_TIMING_NS(conf, tRR_min)),
 		NAND_OP_DATA_IN(len, buf, 0),
 	};
 	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
@@ -1145,13 +1145,14 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_PARAM, 0),
-			NAND_OP_ADDR(1, &page, PSEC_TO_NSEC(sdr->tWB_max)),
-			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tR_max),
-					 PSEC_TO_NSEC(sdr->tRR_min)),
+			NAND_OP_ADDR(1, &page,
+				     NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max),
+					 NAND_COMMON_TIMING_NS(conf, tRR_min)),
 			NAND_OP_8BIT_DATA_IN(len, buf, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
@@ -1200,14 +1201,14 @@ int nand_change_read_column_op(struct nand_chip *chip,
 		return -ENOTSUPP;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		u8 addrs[2] = {};
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RNDOUT, 0),
 			NAND_OP_ADDR(2, addrs, 0),
 			NAND_OP_CMD(NAND_CMD_RNDOUTSTART,
-				    PSEC_TO_NSEC(sdr->tCCS_min)),
+				    NAND_COMMON_TIMING_NS(conf, tCCS_min)),
 			NAND_OP_DATA_IN(len, buf, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
@@ -1275,8 +1276,8 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 				  unsigned int offset_in_page, const void *buf,
 				  unsigned int len, bool prog)
 {
-	const struct nand_sdr_timings *sdr =
-		nand_get_sdr_timings(nand_get_interface_config(chip));
+	const struct nand_interface_config *conf =
+		nand_get_interface_config(chip);
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 addrs[5] = {};
 	struct nand_op_instr instrs[] = {
@@ -1287,10 +1288,11 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 		 */
 		NAND_OP_CMD(NAND_CMD_READ0, 0),
 		NAND_OP_CMD(NAND_CMD_SEQIN, 0),
-		NAND_OP_ADDR(0, addrs, PSEC_TO_NSEC(sdr->tADL_min)),
+		NAND_OP_ADDR(0, addrs, NAND_COMMON_TIMING_NS(conf, tADL_min)),
 		NAND_OP_DATA_OUT(len, buf, 0),
-		NAND_OP_CMD(NAND_CMD_PAGEPROG, PSEC_TO_NSEC(sdr->tWB_max)),
-		NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tPROG_max), 0),
+		NAND_OP_CMD(NAND_CMD_PAGEPROG,
+			    NAND_COMMON_TIMING_NS(conf, tWB_max)),
+		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tPROG_max), 0),
 	};
 	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 	int naddrs = nand_fill_column_cycles(chip, addrs, offset_in_page);
@@ -1389,12 +1391,13 @@ int nand_prog_page_end_op(struct nand_chip *chip)
 	u8 status;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_PAGEPROG,
-				    PSEC_TO_NSEC(sdr->tWB_max)),
-			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tPROG_max), 0),
+				    NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tPROG_max),
+					 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
@@ -1507,12 +1510,12 @@ int nand_change_write_column_op(struct nand_chip *chip,
 		return -ENOTSUPP;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		u8 addrs[2];
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_RNDIN, 0),
-			NAND_OP_ADDR(2, addrs, PSEC_TO_NSEC(sdr->tCCS_min)),
+			NAND_OP_ADDR(2, addrs, NAND_COMMON_TIMING_NS(conf, tCCS_min)),
 			NAND_OP_DATA_OUT(len, buf, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
@@ -1562,11 +1565,12 @@ int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 		return -EINVAL;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_READID, 0),
-			NAND_OP_ADDR(1, &addr, PSEC_TO_NSEC(sdr->tADL_min)),
+			NAND_OP_ADDR(1, &addr,
+				     NAND_COMMON_TIMING_NS(conf, tADL_min)),
 			NAND_OP_8BIT_DATA_IN(len, buf, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
@@ -1601,11 +1605,11 @@ EXPORT_SYMBOL_GPL(nand_readid_op);
 int nand_status_op(struct nand_chip *chip, u8 *status)
 {
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_STATUS,
-				    PSEC_TO_NSEC(sdr->tADL_min)),
+				    NAND_COMMON_TIMING_NS(conf, tADL_min)),
 			NAND_OP_8BIT_DATA_IN(1, status, 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
@@ -1670,15 +1674,16 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 	u8 status;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		u8 addrs[3] = {	page, page >> 8, page >> 16 };
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_ERASE1, 0),
 			NAND_OP_ADDR(2, addrs, 0),
 			NAND_OP_CMD(NAND_CMD_ERASE2,
-				    PSEC_TO_MSEC(sdr->tWB_max)),
-			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tBERS_max), 0),
+				    NAND_COMMON_TIMING_MS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tBERS_max),
+					 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
@@ -1729,14 +1734,17 @@ static int nand_set_features_op(struct nand_chip *chip, u8 feature,
 	int i, ret;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_SET_FEATURES, 0),
-			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tADL_min)),
+			NAND_OP_ADDR(1, &feature, NAND_COMMON_TIMING_NS(conf,
+									tADL_min)),
 			NAND_OP_8BIT_DATA_OUT(ONFI_SUBFEATURE_PARAM_LEN, data,
-					      PSEC_TO_NSEC(sdr->tWB_max)),
-			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tFEAT_max), 0),
+					      NAND_COMMON_TIMING_NS(conf,
+								    tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tFEAT_max),
+					 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
@@ -1776,13 +1784,14 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 	int i;
 
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
 			NAND_OP_CMD(NAND_CMD_GET_FEATURES, 0),
-			NAND_OP_ADDR(1, &feature, PSEC_TO_NSEC(sdr->tWB_max)),
-			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tFEAT_max),
-					 PSEC_TO_NSEC(sdr->tRR_min)),
+			NAND_OP_ADDR(1, &feature,
+				     NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tFEAT_max),
+					 NAND_COMMON_TIMING_NS(conf, tRR_min)),
 			NAND_OP_8BIT_DATA_IN(ONFI_SUBFEATURE_PARAM_LEN,
 					     data, 0),
 		};
@@ -1833,11 +1842,13 @@ static int nand_wait_rdy_op(struct nand_chip *chip, unsigned int timeout_ms,
 int nand_reset_op(struct nand_chip *chip)
 {
 	if (nand_has_exec_op(chip)) {
-		const struct nand_sdr_timings *sdr =
-			nand_get_sdr_timings(nand_get_interface_config(chip));
+		const struct nand_interface_config *conf =
+			nand_get_interface_config(chip);
 		struct nand_op_instr instrs[] = {
-			NAND_OP_CMD(NAND_CMD_RESET, PSEC_TO_NSEC(sdr->tWB_max)),
-			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tRST_max), 0),
+			NAND_OP_CMD(NAND_CMD_RESET,
+				    NAND_COMMON_TIMING_NS(conf, tWB_max)),
+			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tRST_max),
+					 0),
 		};
 		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
 
@@ -3095,13 +3106,13 @@ static int nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
 
 static void nand_wait_readrdy(struct nand_chip *chip)
 {
-	const struct nand_sdr_timings *sdr;
+	const struct nand_interface_config *conf;
 
 	if (!(chip->options & NAND_NEED_READRDY))
 		return;
 
-	sdr = nand_get_sdr_timings(nand_get_interface_config(chip));
-	WARN_ON(nand_wait_rdy_op(chip, PSEC_TO_MSEC(sdr->tR_max), 0));
+	conf = nand_get_interface_config(chip);
+	WARN_ON(nand_wait_rdy_op(chip, NAND_COMMON_TIMING_MS(conf, tR_max), 0));
 }
 
 /**
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index a21cb3259a2a..8d04519f0917 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -557,6 +557,34 @@ struct nand_nvddr_timings {
 	u32 tWW_min;
 };
 
+/*
+ * While timings related to the data interface itself are mostly different
+ * between SDR and NV-DDR, timings related to the internal chip behavior are
+ * common. IOW, the following entries which describe the internal delays have
+ * the same definition and are shared in both SDR and NV-DDR timing structures:
+ * - tADL_min
+ * - tBERS_max
+ * - tCCS_min
+ * - tFEAT_max
+ * - tPROG_max
+ * - tR_max
+ * - tRR_min
+ * - tRST_max
+ * - tWB_max
+ *
+ * The below macros return the value of a given timing, no matter the interface.
+ */
+#define NAND_COMMON_TIMING_PS(conf, timing_name) \
+	nand_interface_is_sdr(conf) ? \
+		nand_get_sdr_timings(conf)->timing_name : \
+		nand_get_nvddr_timings(conf)->timing_name
+
+#define NAND_COMMON_TIMING_MS(conf, timing_name) \
+	PSEC_TO_MSEC(NAND_COMMON_TIMING_PS((conf), timing_name))
+
+#define NAND_COMMON_TIMING_NS(conf, timing_name) \
+	PSEC_TO_NSEC(NAND_COMMON_TIMING_PS((conf), timing_name))
+
 /**
  * enum nand_interface_type - NAND interface type
  * @NAND_SDR_IFACE:	Single Data Rate interface
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
