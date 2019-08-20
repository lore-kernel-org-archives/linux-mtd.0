Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29280C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 05:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6AF8216F4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 05:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cDZaEVVV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6AF8216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jK/o1Vs9NJxex3O34aH+meS1f56upIjOGuW2lNigem4=; b=cDZ
	aEVVVM3v3VCGm9G0dMXbteJSjptajJvSx3ZqaKHWafzdvBSPihYALBdXtolqqvA7BnvFi7uMZeIYx
	S0VhjeVKHExTSed2REV2gzxxJlxP51S7ome209tJ/0V1la5JKz0mI3zD5ru6wWkNJN8xJehKp+32w
	a9SkuSZ5ke+aTrNAAPb+0okzoqU1EGmdVYHOOSbeOpq8AdAQXKkFCjmIrO5mCVgwx0IOr/2rFIosS
	YfIzmbFDpdNzhBFPGT+hcvpj4PXXUeVQy99+w2bFD3eFfrVV4wVqaT6Mw8wKpF6ONvvgf2j25fu22
	XdH/SDb8kt+gNUavCc1krthySZLnTjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzwiW-0005fl-B8; Tue, 20 Aug 2019 05:30:00 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzwiS-0005fP-VQ
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 05:29:58 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x7K5Sv5o006682;
 Tue, 20 Aug 2019 13:28:57 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com,
 dwmw2@infradead.org, bbrezillon@kernel.org,
 computersforpeace@gmail.com, vigneshr@ti.com
Subject: [PATCH] Add support for Macronix NAND randomizer
Date: Tue, 20 Aug 2019 13:53:48 +0800
Message-Id: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com x7K5Sv5o006682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_222957_271235_D330D3EE 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: kstewart@linuxfoundation.org, juliensu@mxic.com.tw,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, masonccyang@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Macronix NANDs support randomizer operation for user data scrambled,
which can be enabled with a SET_FEATURE.

User data written to the NAND device without randomizer is still readable
after randomizer function enabled.
The penalty of randomizer are NOP = 1 instead of NOP = 4 and more time period
is needed in program operation and entering deep power-down mode.
i.e., tPROG 300us to 340us(randomizer enabled)

If subpage write not available with hardware ECC, for example,
NAND chip options NAND_NO_SUBPAGE_WRITE be set in driver and
randomizer function is recommended for high-reliability.
Driver checks byte 167 of Vendor Blocks in ONFI parameter page table
to see if this high-reliability function is supported.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/nand_macronix.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 58511ae..b8b5bcb 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -11,6 +11,13 @@
 #define MACRONIX_READ_RETRY_BIT BIT(0)
 #define MACRONIX_NUM_READ_RETRY_MODES 6
 
+#define MACRONIX_RANDOMIZER_BIT BIT(1)
+#define ONFI_FEATURE_ADDR_MXIC_RANDOMIZER 0xB0
+#define MACRONIX_RANDOMIZER_ENPGM BIT(0)
+#define MACRONIX_RANDOMIZER_RANDEN BIT(1)
+#define MACRONIX_RANDOMIZER_RANDOPT BIT(2)
+#define MACRONIX_RANDOMIZER_MODE_EXIT 0
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved;
 	u8 reliability_func;
@@ -29,6 +36,42 @@ static int macronix_nand_setup_read_retry(struct nand_chip *chip, int mode)
 	return nand_set_features(chip, ONFI_FEATURE_ADDR_READ_RETRY, feature);
 }
 
+static void macronix_nand_randomizer_check_enable(struct nand_chip *chip)
+{
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
+	int ret;
+
+	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	if (feature[0]) {
+		pr_info("Macronix NAND randomizer enabled:0x%x\n", feature[0]);
+		return;
+	}
+
+	feature[0] = MACRONIX_RANDOMIZER_ENPGM | MACRONIX_RANDOMIZER_RANDEN |
+		     MACRONIX_RANDOMIZER_RANDOPT;
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	if (ret)
+		goto err;
+
+	feature[0] = 0x0;
+	ret = nand_prog_page_op(chip, 0, 0, feature, 1);
+	if (ret)
+		goto err;
+
+	feature[0] = MACRONIX_RANDOMIZER_MODE_EXIT;
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
+				feature);
+	if (ret)
+		goto err;
+
+	pr_info("Macronix NAND randomizer enable ok\n");
+	return;
+err:
+	pr_err("Macronix NAND randomizer enable failed\n");
+}
+
 static void macronix_nand_onfi_init(struct nand_chip *chip)
 {
 	struct nand_parameters *p = &chip->parameters;
@@ -38,6 +81,17 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
 		return;
 
 	mxic = (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
+	if (chip->options & NAND_NO_SUBPAGE_WRITE &&
+	    mxic->reliability_func & MACRONIX_RANDOMIZER_BIT) {
+		if (p->supports_set_get_features) {
+			bitmap_set(p->set_feature_list,
+				   ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
+			bitmap_set(p->get_feature_list,
+				   ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
+			macronix_nand_randomizer_check_enable(chip);
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
