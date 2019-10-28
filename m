Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103BECA9EA0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 09:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D572120717
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 09:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6y5yqfs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D572120717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jEMwGeGO+0nO06YpPxz6vCdUZT3FElETXCamQja1rnc=; b=c6y5yqfslMeogCbRQNN9ANvlWH
	PBgq98ABxvHKMI9B3UiytN8UytEDLPujIQgc5/ZqiGPu7KnXGhuwZDf5oEQOpkYP4XNo6yBbWwXut
	oFnO9n2mUwEXGjuv/Q7qxPEiQST/xWj3BQI7D7AEpgJSNv4w15/CFg1Qb6ooDP7buzy3ucYh7umjN
	G0eithLApU55uFt0yxxE8lbErUxS9Y6DRTvw6/bwXxpJIvMOeOpZVy71g76ZNuK+qfg9hwt37luNK
	obEILtRiEevmU9VNc48uxj91VYBROdQshZmuL1DEIp4+2YXkM9B3CII5B2pZlMX/0XY6fZ1dUTxwS
	zE/EVT2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP1MA-0002Du-7e; Mon, 28 Oct 2019 09:30:34 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP1Ly-00022K-Is
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 09:30:24 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x9S9TQPQ013435;
 Mon, 28 Oct 2019 17:29:30 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com,
 dwmw2@infradead.org, bbrezillon@kernel.org,
 computersforpeace@gmail.com, vigneshr@ti.com
Subject: [PATCH v2 4/4] mtd: rawnand: Add support Macronix deep power down mode
Date: Mon, 28 Oct 2019 17:55:27 +0800
Message-Id: <1572256527-5074-5-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com x9S9TQPQ013435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_023022_897451_1297EEAF 
X-CRM114-Status: GOOD (  12.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, masonccyang@mxic.com.tw,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Macronix AD series support deep power down mode for a minimum
power consumption state.

Patch nand_suspend() & nand_resume() by Macronix specific
deep power down mode command and exit it.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 72 +++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 13929bf..3098bc0 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -15,6 +15,8 @@
 #define MXIC_BLOCK_PROTECTION_ALL_LOCK 0x38
 #define MXIC_BLOCK_PROTECTION_ALL_UNLOCK 0x0
 
+#define NAND_CMD_POWER_DOWN 0xB9
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -137,13 +139,66 @@ static int mxic_nand_unlock(struct nand_chip *chip, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+int nand_power_down_op(struct nand_chip *chip)
+{
+	int ret;
+
+	if (nand_has_exec_op(chip)) {
+		struct nand_op_instr instrs[] = {
+			NAND_OP_CMD(NAND_CMD_POWER_DOWN, 0),
+		};
+
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+
+		ret = nand_exec_op(chip, &op);
+		if (ret)
+			return ret;
+
+	} else {
+		chip->legacy.cmdfunc(chip, NAND_CMD_POWER_DOWN, -1, -1);
+	}
+
+	return 0;
+}
+
+static int mxic_nand_suspend(struct nand_chip *chip)
+{
+	int ret;
+
+	nand_select_target(chip, 0);
+	ret = nand_power_down_op(chip);
+	if (ret < 0)
+		pr_err("%s called for chip into suspend failed\n", __func__);
+	nand_deselect_target(chip);
+
+	return ret;
+}
+
+static void mxic_nand_resume(struct nand_chip *chip)
+{
+	/*
+	 * Toggle #CS pin to resume NAND device and don't care
+	 * of the others CLE, #WE, #RE pins status.
+	 * Here sending power down command to toggle #CS line.
+	 */
+	nand_select_target(chip, 0);
+	nand_power_down_op(chip);
+	nand_deselect_target(chip);
+}
+
 /*
- * Macronix NAND AC series support Block Protection by SET_FEATURES
+ * Macronix NAND AC & AD series support Block Protection by SET_FEATURES
  * to lock/unlock blocks.
  */
 static int macronix_nand_init(struct nand_chip *chip)
 {
-	bool blockprotected = false;
+	unsigned int i;
+	bool blockprotected = false, powerdown = false;
+	static const char * const power_down_dev[] = {
+		"MX30LF1G28AD",
+		"MX30LF2G28AD",
+		"MX30LF4G28AD",
+	};
 
 	if (nand_is_slc(chip))
 		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
@@ -153,6 +208,14 @@ static int macronix_nand_init(struct nand_chip *chip)
 
 	macronix_nand_onfi_init(chip);
 
+	for (i = 0; i < ARRAY_SIZE(power_down_dev); i++) {
+		if (!strcmp(power_down_dev[i], chip->parameters.model)) {
+			blockprotected = true;
+			powerdown = true;
+			break;
+		}
+	}
+
 	if (blockprotected) {
 		bitmap_set(chip->parameters.set_feature_list,
 			   ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
@@ -163,6 +226,11 @@ static int macronix_nand_init(struct nand_chip *chip)
 		chip->_unlock = mxic_nand_unlock;
 	}
 
+	if (powerdown) {
+		chip->_suspend = mxic_nand_suspend;
+		chip->_resume = mxic_nand_resume;
+	}
+
 	return 0;
 }
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
