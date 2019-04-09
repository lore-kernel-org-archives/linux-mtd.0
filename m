Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC7FC10F13
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 03:03:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC84120883
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 03:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qLawv2qX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC84120883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qsLCjmihlPE28BOgBLEicGv+Dzqrycx6q/nMJ/LzQlU=; b=qLa
	wv2qXNU/mjNuE8eFxjZcfw54BYFWmLjhwLDmFWk0vt0My7OF4S3ssv0ST7jLjxlqWkrcdQV/9BBqX
	dn37n+ysWXOQfXCHHSOSPApUrTXEG3zP3XdnLd+BYh8ix+u4/uedWAY2dZCZHDqBApq16KblWB1uw
	zDs8i1GKVFTIjQxVSgdBV5zdZ7Uu1GutGb47po5B3JUf7n7FqiAuFPcAZGo2M904VCjPUflSYmnzZ
	zEM19W83c6spoyQtWJXsmd/L1jxrVm3KbHnejrJwxmrjhqdccLFghQ6BVyA/nFNO2PadpEFnndJLM
	d+DNoE1ZL1eC91+V5gstPLvZ4+bGtQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDh2a-0005f6-Sr; Tue, 09 Apr 2019 03:03:16 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDh2X-0005ec-Ub
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 03:03:15 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x3932mNJ092915;
 Tue, 9 Apr 2019 11:02:48 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: bbrezillon@kernel.org, marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: Add Macronix NAND read retry and randomizer
 support
Date: Tue,  9 Apr 2019 11:22:52 +0800
Message-Id: <1554780172-23111-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com x3932mNJ092915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_200314_264012_8040707D 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 zhengxunli@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add a driver for Macronix NAND read retry and randomizer.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 169 +++++++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 47d8cda..a19caa4 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -17,6 +17,174 @@
 
 #include "internals.h"
 
+#define MACRONIX_READ_RETRY_BIT BIT(0)
+#define MACRONIX_RANDOMIZER_BIT BIT(1)
+#define MACRONIX_READ_RETRY_MODE 5
+
+#define ONFI_FEATURE_ADDR_MXIC_RANDOMIZER 0xB0
+
+struct nand_onfi_vendor_macronix {
+	u8 reserved[1];
+	u8 reliability_func;
+} __packed;
+
+struct nand_chip *mxic_sysfs;
+
+static int macronix_nand_setup_read_retry(struct nand_chip *chip, int mode)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {0};
+	int ret;
+
+	if (mode > MACRONIX_READ_RETRY_MODE)
+		mode = MACRONIX_READ_RETRY_MODE;
+
+	feature[0] = mode;
+	ret =  nand_set_features(chip, ONFI_FEATURE_ADDR_READ_RETRY, feature);
+	if (ret)
+		pr_err("failed to enter read retry moded:%d\n", mode);
+
+	if (mode == 0)
+		ret =  nand_get_features(chip, ONFI_FEATURE_ADDR_READ_RETRY,
+					 feature);
+		if (ret)
+			pr_err("failed to exits read retry moded:%d\n", mode);
+
+	return ret;
+}
+
+static ssize_t mxic_nand_rand_type_show(struct kobject *kobj,
+					struct kobj_attribute *attr, char *buf)
+{
+	struct nand_chip *chip = mxic_sysfs;
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {0};
+	int ret;
+
+	nand_select_target(chip, 0);
+	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	nand_deselect_target(chip);
+	if (ret)
+		pr_err("failed to check mxic nand device randomizer\n");
+
+	return sprintf(buf, "MXIC NAND device randomizer %s(0x%x)\n",
+		       feature[0] & MACRONIX_RANDOMIZER_BIT ?
+		       "enable" : "disable", feature[0]);
+}
+
+static ssize_t mxic_nand_rand_type_store(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct nand_chip *chip = mxic_sysfs;
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {0};
+	unsigned int rand_layout;
+	int ret;
+
+	nand_select_target(chip, 0);
+	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	nand_deselect_target(chip);
+
+	if (feature[0]) {
+		pr_err("Randomizer is enabled 0x%x\n", feature[0]);
+		goto err_out;
+	}
+
+	ret = kstrtouint(buf, 0, &rand_layout);
+	if (ret)
+		goto err_out;
+
+	if (rand_layout > 7) {
+		pr_err("Error parameter value:0x%x\n", rand_layout);
+		goto err_out;
+	}
+
+	feature[0] = rand_layout & 0x07;
+	nand_select_target(chip, 0);
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	nand_deselect_target(chip);
+	if (ret) {
+		pr_err("device randomizer set feature failed\n");
+		goto err_out;
+	}
+
+	feature[0] = 0x0;
+	nand_select_target(chip, 0);
+	ret = nand_prog_page_op(chip, 0, 0, feature, 1);
+	nand_deselect_target(chip);
+	if (ret) {
+		pr_err("Prog device randomizer failed\n");
+		goto err_out;
+	}
+
+	feature[0] = 0x0;
+	nand_select_target(chip, 0);
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	nand_deselect_target(chip);
+	if (ret)
+		pr_err("failed to exits prog device randomizer\n");
+
+err_out:
+	return count;
+}
+
+static const struct kobj_attribute sysfs_mxic_nand =
+	__ATTR(nand_random, S_IRUGO | S_IWUSR,
+	       mxic_nand_rand_type_show,
+	       mxic_nand_rand_type_store);
+
+static void macronix_nand_onfi_init(struct nand_chip *chip)
+{
+	struct nand_parameters *p = &chip->parameters;
+	struct kobject *kobj;
+	int ret;
+
+	mxic_sysfs = chip;
+	if (p->onfi) {
+		struct nand_onfi_vendor_macronix *mxic =
+				(void *)p->onfi->vendor;
+
+		if (mxic->reliability_func & MACRONIX_READ_RETRY_BIT) {
+			chip->read_retries = MACRONIX_READ_RETRY_MODE + 1;
+			chip->setup_read_retry =
+				 macronix_nand_setup_read_retry;
+			if (p->supports_set_get_features) {
+				set_bit(ONFI_FEATURE_ADDR_READ_RETRY,
+					p->set_feature_list);
+				set_bit(ONFI_FEATURE_ADDR_READ_RETRY,
+					p->get_feature_list);
+			}
+		}
+
+		if (mxic->reliability_func & MACRONIX_RANDOMIZER_BIT) {
+			if (p->supports_set_get_features) {
+				set_bit(ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+					p->set_feature_list);
+				set_bit(ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+					p->get_feature_list);
+				/*
+				 * create syfs-fs for MXIC NAND device
+				 * randomizer status check & enable
+				 * operations.
+				 */
+				kobj = kobject_create_and_add("mxic_rand_nand",
+							      NULL);
+				if (!kobj)
+					return;
+
+				ret = sysfs_create_file(kobj,
+							&sysfs_mxic_nand.attr);
+				if (ret) {
+					pr_err("Err: mxic_rand_nand sysfs");
+					kobject_put(kobj);
+				}
+			}
+		}
+	}
+}
+
 /*
  * Macronix AC series does not support using SET/GET_FEATURES to change
  * the timings unlike what is declared in the parameter page. Unflag
@@ -65,6 +233,7 @@ static int macronix_nand_init(struct nand_chip *chip)
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
 	macronix_nand_fix_broken_get_timings(chip);
+	macronix_nand_onfi_init(chip);
 
 	return 0;
 }
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
