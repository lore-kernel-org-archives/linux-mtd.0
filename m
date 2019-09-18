Return-Path: <SRS0=mMzh=XN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F96AC4CEC9
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 07:33:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1100D21907
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 07:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B9F1CXIQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1100D21907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rokoFOJk1+JLk9YBsXBN6mcvsnFgsmCXvvADKHOyhBQ=; b=B9F1CXIQcy5uacNtcLcv5gnj5o
	Bwc8GM1KilXLhgKAEsRL3MvLG2wMSXMO6KVrWMo+eohnRF4rBTE09sL/QZFts4P5zx+2oO2mKXddW
	+tbX40lBcDVXw03GkglIXxdRoszJ9D4dlJ2D+bqD4dKfw6A5ZL6KKjWQ4lPlNDxZqxld0/gtvTt3J
	FpEjxT4MhhN7iNGhTWcR1qSkhQWWQMOwlBHhcX7OzU9K5UG13dHNbRh6SaBk9rX2dHk+G9vdJ6J75
	orLI5fsTg2Sfnw0T3hMTOQZjoP05iFb77xHH7qakn92cnl3n8CxF8wroXEeCTCO3pGWdfAavQxSIp
	iHI0yhYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAUT2-0001jV-Ny; Wed, 18 Sep 2019 07:33:36 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAUSg-0001Xi-0n
 for linux-mtd@lists.infradead.org; Wed, 18 Sep 2019 07:33:16 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x8I7VoOe060926;
 Wed, 18 Sep 2019 15:31:51 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com,
 dwmw2@infradead.org, bbrezillon@kernel.org,
 computersforpeace@gmail.com, vigneshr@ti.com
Subject: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block Protection
 function
Date: Wed, 18 Sep 2019 15:56:25 +0800
Message-Id: <1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com x8I7VoOe060926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_003314_337744_37DD6C01 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: marcel.ziswiler@toradex.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 juliensu@mxic.com.tw, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 masonccyang@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Macronix AC series support using SET/GET_FEATURES to change
Block Protection and Unprotection.

MTD default _lock/_unlock function replacement by manufacturer
postponed initialization.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 80 +++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 58511ae..991c636 100644
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
@@ -57,10 +61,7 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
  * the timings unlike what is declared in the parameter page. Unflag
  * this feature to avoid unnecessary downturns.
  */
-static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
-{
-	unsigned int i;
-	static const char * const broken_get_timings[] = {
+static const char * const broken_get_timings[] = {
 		"MX30LF1G18AC",
 		"MX30LF1G28AC",
 		"MX30LF2G18AC",
@@ -75,7 +76,11 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 		"MX30UF4G18AC",
 		"MX30UF4G16AC",
 		"MX30UF4G28AC",
-	};
+};
+
+static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
+{
+	unsigned int i;
 
 	if (!chip->parameters.supports_set_get_features)
 		return;
@@ -105,6 +110,71 @@ static int macronix_nand_init(struct nand_chip *chip)
 	return 0;
 }
 
+static int mxic_nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
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
+static int mxic_nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
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
+}
+
+/*
+ * Macronix AC series support using SET/GET_FEATURES to change
+ * Block Protection and Unprotection.
+ *
+ * MTD call-back function replacement by manufacturer postponed
+ * initialization.
+ */
+static void macronix_nand_post_init(struct nand_chip *chip)
+{
+	unsigned int i, blockprotected = 0;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	for (i = 0; i < ARRAY_SIZE(broken_get_timings); i++) {
+		if (!strcmp(broken_get_timings[i], chip->parameters.model)) {
+			blockprotected = 1;
+			break;
+		}
+	}
+
+	if (blockprotected && chip->parameters.supports_set_get_features) {
+		bitmap_set(chip->parameters.set_feature_list,
+			   ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
+		bitmap_set(chip->parameters.get_feature_list,
+			   ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
+
+		mtd->_lock = mxic_nand_lock;
+		mtd->_unlock = mxic_nand_unlock;
+	}
+}
+
 const struct nand_manufacturer_ops macronix_nand_manuf_ops = {
 	.init = macronix_nand_init,
+	.post_init = macronix_nand_post_init,
 };
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
