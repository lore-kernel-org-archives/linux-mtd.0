Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C621EC28CC5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 02:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957E827AD3
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 02:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="piq8ygkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957E827AD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=mkEdZdDqV+5rjTwAyrvaVdJXsY1LDYEqNQSIpJG6tD4=; b=piq
	8ygkTTdGCeYET+nmZBWBusBM2LP5mIC9Oh/2NZLvExMi5QIBNkiUreuqGf2HPl0aF4MC9CqAJgbIL
	dreKxPJbrotcJbFVN6nlrB6LByEu7QlsnJxhDuhE3ILY0++QCa40F+F+IbEHecElk8oJQRbpFKgMh
	P2zrZdjWRzxAn+onRU8k94uNIMHAKlMiok74heCV3e2CRTqgJDcbUkZX2gSgHNEBCaesecNLhijZL
	AIi6OKN0ITXa7oMIHGtN7MzNOEc8jWzM8PkktQTrffi1K1Fldu1dVrCDqPfcFzQuGGu/PWpPxBBmb
	+asYmLe99cadwMWNECKtlzhAg993uYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXca9-0005Oo-Tn; Mon, 03 Jun 2019 02:20:17 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXca6-0004aB-A6
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 02:20:15 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x532JBjk041764;
 Mon, 3 Jun 2019 10:19:11 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, marek.vasut@gmail.com,
 linux-kernel@vger.kernel.org, bbrezillon@kernel.org, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, tglx@linutronix.de,
 frieder.schrempf@kontron.de, allison@lohutok.net
Subject: [PATCH v3] mtd: rawnand: Add Macronix NAND read retry support
Date: Mon,  3 Jun 2019 10:42:04 +0800
Message-Id: <1559529724-5454-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com x532JBjk041764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_192014_624028_3E9DEA85 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, masonccyang@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support for Macronix NAND read retry.

Macronix NANDs support specific read operation for data recovery,
which can be enabled with a SET_FEATURE.
Driver checks byte 167 of Vendor Blocks in ONFI parameter page table
to see if this high-reliability function is supported.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index fad57c3..58511ae 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -8,6 +8,50 @@
 
 #include "internals.h"
 
+#define MACRONIX_READ_RETRY_BIT BIT(0)
+#define MACRONIX_NUM_READ_RETRY_MODES 6
+
+struct nand_onfi_vendor_macronix {
+	u8 reserved;
+	u8 reliability_func;
+} __packed;
+
+static int macronix_nand_setup_read_retry(struct nand_chip *chip, int mode)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
+
+	if (!chip->parameters.supports_set_get_features ||
+	    !test_bit(ONFI_FEATURE_ADDR_READ_RETRY,
+		      chip->parameters.set_feature_list))
+		return -ENOTSUPP;
+
+	feature[0] = mode;
+	return nand_set_features(chip, ONFI_FEATURE_ADDR_READ_RETRY, feature);
+}
+
+static void macronix_nand_onfi_init(struct nand_chip *chip)
+{
+	struct nand_parameters *p = &chip->parameters;
+	struct nand_onfi_vendor_macronix *mxic;
+
+	if (!p->onfi)
+		return;
+
+	mxic = (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
+	if ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) == 0)
+		return;
+
+	chip->read_retries = MACRONIX_NUM_READ_RETRY_MODES;
+	chip->setup_read_retry = macronix_nand_setup_read_retry;
+
+	if (p->supports_set_get_features) {
+		bitmap_set(p->set_feature_list,
+			   ONFI_FEATURE_ADDR_READ_RETRY, 1);
+		bitmap_set(p->get_feature_list,
+			   ONFI_FEATURE_ADDR_READ_RETRY, 1);
+	}
+}
+
 /*
  * Macronix AC series does not support using SET/GET_FEATURES to change
  * the timings unlike what is declared in the parameter page. Unflag
@@ -56,6 +100,7 @@ static int macronix_nand_init(struct nand_chip *chip)
 		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
 	macronix_nand_fix_broken_get_timings(chip);
+	macronix_nand_onfi_init(chip);
 
 	return 0;
 }
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
