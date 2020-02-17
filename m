Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB53BC35242
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 06:58:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE82206D5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 06:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fDa/eRVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE82206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N7qhHhvmDLx9bHwa/xUp31MXwXA783WA0JZjUdd76GE=; b=fDa/eRVOw0Kdx1MsdTObQb2lOA
	J8nqYTlpu+bD7bxmlbuoSvFjsPZz0eCG3yclutQxXe4/WeSdQ86qIGYZHQotAL8kej71EfqUVVjE0
	Rx0RnrF6ngLpyyjRZTn3nON0dYyUgZ9cgnOtyHR9b2yHFh0fGy4PaKfonwk+x999+cnOjuA5diEUy
	FPHu/Xnp6Xzbd5WD4/4S3zZjnC7HypB5MqCPRur2M5ESqtzUypG4bpj370m1ntLTxmg9/v6BlTp2X
	1LA2QTwH3KcZgYRiYo+j97AFUjsjoBpGrJJaDZAZ4UB5k+A/S4ovRGcdT0soI3pWluweovFgibAgY
	TVgVpJDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3aMH-0001zz-Gp; Mon, 17 Feb 2020 06:58:21 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3aLk-0001Y5-4l
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 06:57:50 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 01H6ug7Q005796;
 Mon, 17 Feb 2020 14:56:43 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH v5 1/2] mtd: rawnand: Add support for Macronix NAND randomizer
Date: Mon, 17 Feb 2020 14:56:39 +0800
Message-Id: <1581922600-25461-2-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581922600-25461-1-git-send-email-masonccyang@mxic.com.tw>
References: <1581922600-25461-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 01H6ug7Q005796
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_225748_450331_FE3257EB 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: devicetree@vger.kernel.org, juliensu@mxic.com.tw, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 linux-mtd@lists.infradead.org, tglx@linutronix.de,
 Mason Yang <masonccyang@mxic.com.tw>, allison@lohutok.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Macronix NANDs support randomizer operation for user data scrambled,
which can be enabled with a SET_FEATURE.

User data written to the NAND device without randomizer is still readable
after randomizer function enabled.
The penalty of randomizer are subpage accesses prohibited and more time
period is needed in program operation and entering deep power-down mode.
i.e., tPROG 300us to 340us(randomizer enabled)

For more high-reliability concern, if subpage write not available with
hardware ECC and then to enable randomizer is recommended by default.
Driver checks byte 167 of Vendor Blocks in ONFI parameter page table
to see if this high-reliability function is supported. By adding a new
specific DT property in children nodes to enable randomizer function.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_macronix.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 3ff7ce0..0a2fe25 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -11,6 +11,19 @@
 #define MACRONIX_READ_RETRY_BIT BIT(0)
 #define MACRONIX_NUM_READ_RETRY_MODES 6
 
+#define ONFI_FEATURE_ADDR_MXIC_RANDOMIZER 0xB0
+#define MACRONIX_RANDOMIZER_BIT BIT(1)
+#define MACRONIX_RANDOMIZER_ENPGM BIT(0)
+#define MACRONIX_RANDOMIZER_RANDEN BIT(1)
+#define MACRONIX_RANDOMIZER_RANDOPT BIT(2)
+#define MACRONIX_RANDOMIZER_MODE_ENTER	\
+	(MACRONIX_RANDOMIZER_ENPGM |	\
+	 MACRONIX_RANDOMIZER_RANDEN |	\
+	 MACRONIX_RANDOMIZER_RANDOPT)
+#define MACRONIX_RANDOMIZER_MODE_EXIT	\
+	(MACRONIX_RANDOMIZER_RANDEN |	\
+	 MACRONIX_RANDOMIZER_RANDOPT)
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -29,15 +42,83 @@ static int macronix_nand_setup_read_retry(struct nand_chip *chip, int mode)
 	return nand_set_features(chip, ONFI_FEATURE_ADDR_READ_RETRY, feature);
 }
 
+static int macronix_nand_randomizer_check_enable(struct nand_chip *chip)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
+	int ret;
+
+	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	if (ret < 0)
+		return ret;
+
+	if (feature[0])
+		return feature[0];
+
+	feature[0] = MACRONIX_RANDOMIZER_MODE_ENTER;
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	if (ret < 0)
+		return ret;
+
+	/* RANDEN and RANDOPT OTP bits are programmed */
+	feature[0] = 0x0;
+	ret = nand_prog_page_op(chip, 0, 0, feature, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	if (ret < 0)
+		return ret;
+
+	feature[0] &= MACRONIX_RANDOMIZER_MODE_EXIT;
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static void macronix_nand_onfi_init(struct nand_chip *chip)
 {
 	struct nand_parameters *p = &chip->parameters;
 	struct nand_onfi_vendor_macronix *mxic;
+	struct device_node *dn = nand_get_flash_node(chip);
+	int rand_otp = 0;
+	int ret;
 
 	if (!p->onfi)
 		return;
 
+	if (of_find_property(dn, "mxic,enable-randomizer-otp", NULL))
+		rand_otp = 1;
+
 	mxic = (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
+	/* Subpage write is prohibited in randomizer operatoin */
+	if (rand_otp && chip->options & NAND_NO_SUBPAGE_WRITE &&
+	    mxic->reliability_func & MACRONIX_RANDOMIZER_BIT) {
+		if (p->supports_set_get_features) {
+			bitmap_set(p->set_feature_list,
+				   ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
+			bitmap_set(p->get_feature_list,
+				   ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
+			ret = macronix_nand_randomizer_check_enable(chip);
+			if (ret < 0) {
+				bitmap_clear(p->set_feature_list,
+					     ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+					     1);
+				bitmap_clear(p->get_feature_list,
+					     ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+					     1);
+				pr_info("Macronix NAND randomizer failed\n");
+			} else {
+				pr_info("Macronix NAND randomizer enabled\n");
+			}
+		}
+	}
+
 	if ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) == 0)
 		return;
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
