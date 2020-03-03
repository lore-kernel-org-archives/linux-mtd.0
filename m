Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5380CC3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 07:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB0F2146E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 07:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OG7fFZ2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB0F2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8CxGI/2470IkG5yc16/XKzuIyjLQVmjk86FHlVcRMmE=; b=OG7fFZ2boi2NvREHzU4icEkOdE
	Fuos7GEjQRZOKLAPv8+n0GYGgGYClIvXwfMA+VSttmE5HJexKJG30lix1l1L0BNPpopsRB0daHtFM
	sYv3jWwKZRBMwKrPl2e/hmbq0Gdt/gg3+XIe0jIItPXLUbaTRaMkpXeBSIVVg3yBYl4E6JR7efKne
	U5IhjdygDbXrH6/bai6/YNJ5UNL7cpjLJ3NO22JZuYB5fzbteFKGOFT3vdNnT3/Yq82iZnFR6zbUT
	P4xqCRFvtKx5uL3edXSAa5464JTaxb3NNnpMLSBNMzOH53ALrNpNTD4lDhXek1NOpaoEuc8rrjhPz
	eM4zYiiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j91t6-0008MC-R1; Tue, 03 Mar 2020 07:22:44 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j91sw-0008B8-Sa
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 07:22:36 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 0237LRLD023026;
 Tue, 3 Mar 2020 15:21:32 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v3 4/4] mtd: rawnand: Add support Macronix deep power down mode
Date: Tue,  3 Mar 2020 15:21:24 +0800
Message-Id: <1583220084-10890-5-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
References: <1583220084-10890-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 0237LRLD023026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_232235_347603_827D492F 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, s.hauer@pengutronix.de,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org, stefan@agner.ch,
 rfontana@redhat.com, linux-mtd@lists.infradead.org,
 frieder.schrempf@kontron.de, tglx@linutronix.de,
 Mason Yang <masonccyang@mxic.com.tw>, allison@lohutok.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Macronix AD series support deep power down mode for a minimum
power consumption state.

Patch nand_suspend() & nand_resume() by Macronix specific deep
power down mode command and exit it.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 74 ++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index a4cd12c..ca46ec1 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -6,6 +6,7 @@
  * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
+#include "linux/delay.h"
 #include "internals.h"
 
 #define MACRONIX_READ_RETRY_BIT BIT(0)
@@ -15,6 +16,8 @@
 #define MXIC_BLOCK_PROTECTION_ALL_LOCK 0x38
 #define MXIC_BLOCK_PROTECTION_ALL_UNLOCK 0x0
 
+#define MXIC_CMD_POWER_DOWN 0xB9
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -162,6 +165,76 @@ static void macronix_nand_block_protection_support(struct nand_chip *chip)
 	chip->unlock_area = mxic_nand_unlock;
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
+	chip->_suspend = mxic_nand_suspend;
+	chip->_resume = mxic_nand_resume;
+}
+
 static int macronix_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -170,6 +243,7 @@ static int macronix_nand_init(struct nand_chip *chip)
 	macronix_nand_fix_broken_get_timings(chip);
 	macronix_nand_onfi_init(chip);
 	macronix_nand_block_protection_support(chip);
+	macronix_nand_deep_power_down_support(chip);
 
 	return 0;
 }
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
