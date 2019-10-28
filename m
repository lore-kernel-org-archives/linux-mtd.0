Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117ADCA9EA0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 09:31:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D70DE20B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 09:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vup7y/re"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D70DE20B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vpp+CeFNy4ZeVc3aIoaMM5PxDc+TyBNobPDPwHOtt3o=; b=Vup7y/reJHDTq90G99eTk/bUXX
	kns5wRTxj63n4BvnymfKi9oOH8GSXisTOn3C9xCWVWCpnjKbDSYJgRd6oLQEyN1vKuhadeKSkU8E7
	Y0kjJ99wwWbJNabA0TJryNMPiQbC7o0NvwvSgyiKkZGVvj+AvfMcX0f6v0q0OVS6VRlkCHNjRHJGa
	nMSwNQjuP4r0KpyDZvLDiUIUem9FHuUZx9Cb0zqZdjCEG+QAKtApJqF7hZOdt8jXA0s/iqORxM+6F
	G1/lSqs+MCbsyvb2kzMVHTdqIC5wZItRYuod1irIIgG6STZJnRZaNhN+I4xtkBdrmbw8Tw6GMrcvq
	3yofQkEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP1Mm-0002rM-0W; Mon, 28 Oct 2019 09:31:12 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP1Ly-00022M-Iq
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 09:30:25 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x9S9TQPO013435;
 Mon, 28 Oct 2019 17:29:29 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com,
 dwmw2@infradead.org, bbrezillon@kernel.org,
 computersforpeace@gmail.com, vigneshr@ti.com
Subject: [PATCH v2 2/4] mtd: rawnand: Add support Macronix Block Protection
 function
Date: Mon, 28 Oct 2019 17:55:25 +0800
Message-Id: <1572256527-5074-3-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com x9S9TQPO013435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_023022_904639_10A6B138 
X-CRM114-Status: GOOD (  11.71  )
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

Macronix AC series support using SET_FEATURES to change
Block Protection and Unprotection.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 69 +++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 58511ae..13929bf 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -11,6 +11,10 @@
 #define MACRONIX_READ_RETRY_BIT BIT(0)
 #define MACRONIX_NUM_READ_RETRY_MODES 6
 
+#define ONFI_FEATURE_ADDR_MXIC_PROTECTION 0xA0
+#define MXIC_BLOCK_PROTECTION_ALL_LOCK 0x38
+#define MXIC_BLOCK_PROTECTION_ALL_UNLOCK 0x0
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -57,7 +61,7 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
  * the timings unlike what is declared in the parameter page. Unflag
  * this feature to avoid unnecessary downturns.
  */
-static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
+static int macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 {
 	unsigned int i;
 	static const char * const broken_get_timings[] = {
@@ -78,7 +82,7 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 	};
 
 	if (!chip->parameters.supports_set_get_features)
-		return;
+		return 0;
 
 	for (i = 0; i < ARRAY_SIZE(broken_get_timings); i++) {
 		if (!strcmp(broken_get_timings[i], chip->parameters.model))
@@ -86,22 +90,79 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 	}
 
 	if (i == ARRAY_SIZE(broken_get_timings))
-		return;
+		return 0;
 
 	bitmap_clear(chip->parameters.get_feature_list,
 		     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
 	bitmap_clear(chip->parameters.set_feature_list,
 		     ONFI_FEATURE_ADDR_TIMING_MODE, 1);
+	return 1;
+}
+
+/*
+ * Macronix NAND supports Block Protection by Protectoin(PT) pin;
+ * active high at power-on which protects the entire chip even the #WP is
+ * disabled. Lock/unlock protection area can be partition according to
+ * protection bits, i.e. upper 1/2 locked, upper 1/4 locked and so on.
+ */
+static int mxic_nand_lock(struct nand_chip *chip, loff_t ofs, uint64_t len)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
+	int ret;
+
+	feature[0] = MXIC_BLOCK_PROTECTION_ALL_LOCK;
+	nand_select_target(chip, 0);
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_PROTECTION,
+				feature);
+	nand_deselect_target(chip);
+	if (ret)
+		pr_err("%s all blocks failed\n", __func__);
+
+	return ret;
+}
+
+static int mxic_nand_unlock(struct nand_chip *chip, loff_t ofs, uint64_t len)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
+	int ret;
+
+	feature[0] = MXIC_BLOCK_PROTECTION_ALL_UNLOCK;
+	nand_select_target(chip, 0);
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_PROTECTION,
+				feature);
+	nand_deselect_target(chip);
+	if (ret)
+		pr_err("%s all blocks failed\n", __func__);
+
+	return ret;
 }
 
+/*
+ * Macronix NAND AC series support Block Protection by SET_FEATURES
+ * to lock/unlock blocks.
+ */
 static int macronix_nand_init(struct nand_chip *chip)
 {
+	bool blockprotected = false;
+
 	if (nand_is_slc(chip))
 		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
 
-	macronix_nand_fix_broken_get_timings(chip);
+	if (macronix_nand_fix_broken_get_timings(chip))
+		blockprotected = true;
+
 	macronix_nand_onfi_init(chip);
 
+	if (blockprotected) {
+		bitmap_set(chip->parameters.set_feature_list,
+			   ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
+		bitmap_set(chip->parameters.get_feature_list,
+			   ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
+
+		chip->_lock = mxic_nand_lock;
+		chip->_unlock = mxic_nand_unlock;
+	}
+
 	return 0;
 }
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
