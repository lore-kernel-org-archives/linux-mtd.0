Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3BBC10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 07:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 121E120768
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 07:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OtzLMQa4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 121E120768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/5v7nRGgmvACGgVNsNvqjCMdQw0zgtvcsQr+6RGGD1g=; b=OtzLMQa4EcGl/6VTOdngOH4tZ/
	gV1uCk7mStxds89gpcgXvnsKeIkBqgqlI+m6uy7Z8gQ2MoUBdnq7u9ts+ICqyHqEQyyrvVmOIUnYP
	Fpk86ZZ0J9lQM68BWJijf2nCiQ3XjqSrdtr1a935o42YMyVaxVSwY0lbdOU5aTMc2XveTWBmpHO8P
	m9sgFiVRznAws2tKZvBj2Mcn9crFfOsH3hHWkX/v6+E7bg+jTycbYJ6SfxqGxHLqjeG1d+r/onT3n
	5sHxhaMVWRqE5XOxquKIjQSBhKwdySzHt+Yr6cYRLZ+873D8xU1JqavndjPHOH93vBgh8qQ0Lb3e2
	G6A9T/2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETMl-0005yN-MT; Wed, 18 Mar 2020 07:43:51 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jETMP-0005bo-P0
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 07:43:32 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 02I7gTOB041137;
 Wed, 18 Mar 2020 15:42:31 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 bbrezillon@kernel.org
Subject: [PATCH v4 2/2] mtd: rawnand: macronix: Add support for deep power
 down mode
Date: Wed, 18 Mar 2020 15:42:28 +0800
Message-Id: <1584517348-14486-3-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1584517348-14486-1-git-send-email-masonccyang@mxic.com.tw>
References: <1584517348-14486-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 02I7gTOB041137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_004330_088811_0020764C 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: juliensu@mxic.com.tw, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 frieder.schrempf@kontron.de, tglx@linutronix.de,
 Mason Yang <masonccyang@mxic.com.tw>, allison@lohutok.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Macronix AD series support deep power down mode for a minimum
power consumption state.

Overload nand_suspend() & nand_resume() in Macronix specific code to
support deep power down mode.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 74 ++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 3ff7ce0..756c175 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -6,11 +6,14 @@
  * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
+#include "linux/delay.h"
 #include "internals.h"
 
 #define MACRONIX_READ_RETRY_BIT BIT(0)
 #define MACRONIX_NUM_READ_RETRY_MODES 6
 
+#define MXIC_CMD_POWER_DOWN 0xB9
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -91,6 +94,76 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 		     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
 }
 
+static int nand_power_down_op(struct nand_chip *chip)
+{
+	int ret;
+
+	if (nand_has_exec_op(chip)) {
+		struct nand_op_instr instrs[] = {
+			NAND_OP_CMD(MXIC_CMD_POWER_DOWN, 0),
+		};
+
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+
+		ret = nand_exec_op(chip, &op);
+		if (ret)
+			return ret;
+
+	} else {
+		chip->legacy.cmdfunc(chip, MXIC_CMD_POWER_DOWN, -1, -1);
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
+		pr_err("Suspending MXIC NAND chip failed (%d)\n", ret);
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
+	 * A NAND controller ensure it is able to assert/de-assert #CS
+	 * by sending any byte over the NAND bus.
+	 * i.e.,
+	 * NAND power down command or reset command w/o R/B# status checking.
+	 */
+	nand_select_target(chip, 0);
+	nand_power_down_op(chip);
+	/* The minimum of a recovery time tRDP is 35 us */
+	usleep_range(35, 100);
+	nand_deselect_target(chip);
+}
+
+static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
+{
+	int i;
+	static const char * const deep_power_down_dev[] = {
+		"MX30UF1G28AD",
+		"MX30UF2G28AD",
+		"MX30UF4G28AD",
+	};
+
+	i = match_string(deep_power_down_dev, ARRAY_SIZE(deep_power_down_dev),
+			 chip->parameters.model);
+	if (i < 0)
+		return;
+
+	chip->suspend = mxic_nand_suspend;
+	chip->resume = mxic_nand_resume;
+}
+
 static int macronix_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -98,6 +171,7 @@ static int macronix_nand_init(struct nand_chip *chip)
 
 	macronix_nand_fix_broken_get_timings(chip);
 	macronix_nand_onfi_init(chip);
+	macronix_nand_deep_power_down_support(chip);
 
 	return 0;
 }
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
