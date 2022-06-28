Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFA4C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAuhHXIhiWkC+ENyyF8W6Z4HYWAhmcBB4zJp3cn4ecc=; b=fDBWZJMi/DIV6M
	2Dzm8Ma1OEaVbVC20VE0CFJWcBMJIiK38ILEF2i0s1O06vfRQHWi8kTBQ+qWhsbdGbv3DdkZnLgy4
	gSiXd91fwlorX0Vy9h7Bl4eFF48QLAl7LewnTcn3lmb5fZG+YzNaJ7sk9gGUPlKMvfgww7cGQmBjW
	528AZEsrS9OnnXANp2Nim7GPwWzLAXNcFsuMRn3JAsJCSs3+JP2DiNBphUtlDWuuIJERyvmJzCKPl
	dybO94Jt1sW5JfUiKxAkZk/7Oh8oQs9fJ0przZdm9+Hel4i+6XzemIzO7j7u/VfIfC8ek96mSuNJq
	ZZ+9DMQMJ8NdZqcRjtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OH-005v9R-C5; Tue, 28 Jun 2022 11:28:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69OC-005v4X-OS
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 11:28:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u15so25075188ejc.10
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 04:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L/vVPNNNi/M5hFZ14uI3yR7vQmNxehz58sZt8wiaUeE=;
        b=HaWubVbNaxSD+nlcHJa49uO9e6VAh9gOOIRMAfHc/SGLurGEg8A6CZo1MHioC4yM9T
         BF0JznCyJN2tmhkcShwNh03rwsG6BUiTv87W8haV9GF/CxjpFVr2idmrgq0UJzzXm9/a
         uYVinDWBpYg40+c5lzK2vpa96lAZjgm7jWCu6pIX/lqRa0EYeZFjRqRDsg1d9NjGH15b
         CazDQm2NN45LJqPwSDHocRDtYiDhXJ7BJjO1W8qbAzWtWcLAiCrOXcF1vYw0WWHSIGlr
         IYM/6MascnMHRGlSBL5Z137juzIVHeHJAX8YM02AKrWrUgl+7SN4HmN2Y3Rhi5RWeAVI
         61jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/vVPNNNi/M5hFZ14uI3yR7vQmNxehz58sZt8wiaUeE=;
        b=tqYv/JPJ+K8b5CwcXIcwBxwvlnGaB1RhzK8nrVcldA2JoQ02fhBI0unsD/BG/TeuDV
         zw/OIbyE25IDZuHn5oW+YZRdEPQDdElyrRovxS4oS3t61Rd8AwCk+zWClkVF0DbpJPyL
         FsX9A1TH7R9yc/OaBFxADyqQuLUtgBoLqz3GEaay/CrhGUfnbW5J0ExvkDbEjxUpijq/
         /hT/OFM4l+RMSzBVIKtbF/CT+krUGSX2NPtvYp6EP1/HlZdIuLe1GoWVcQxTJmwO0vD6
         Groly43gtdDPVvA2U8wxB10PQUpLSvsK0rf0hp1CuwWJB/Hxcs0JtI/nvdqSda1p7jTI
         Xp/A==
X-Gm-Message-State: AJIora+/xw/EKX92OfYNVSMHY+miPkQpIyBWGnIJyeTxRNQOcN80lSEw
	KBOeSl/VuFzRe3RlixPKemQY1s9TId4=
X-Google-Smtp-Source: AGRyM1tn25cwZFHS/DKbUQZdk6M3oiSNF7RkIMRFB9m1OpkuIcAdUMVXZJI1tQCvfXCkFMcBZmC9pg==
X-Received: by 2002:a17:907:6d1d:b0:726:363e:cca3 with SMTP id sa29-20020a1709076d1d00b00726363ecca3mr17142850ejc.713.1656415692784;
        Tue, 28 Jun 2022 04:28:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-061-215.95.114.pool.telefonica.de. [95.114.61.215])
        by smtp.googlemail.com with ESMTPSA id h6-20020aa7cdc6000000b00435720b7a1csm9456318edw.20.2022.06.28.04.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 04:28:12 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 3/8] mtd: rawnand: intel: Read the chip-select line from the correct OF node
Date: Tue, 28 Jun 2022 13:27:26 +0200
Message-Id: <20220628112731.2041976-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_042816_831827_C09E66DD 
X-CRM114-Status: GOOD (  16.49  )
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

The chip select has to be read from the flash node which is a child node
of the NAND controller.

Fixes: 0b1039f016e8a3 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index e91b879b32bd..3df3f32423f9 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -16,6 +16,7 @@
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/nand.h>
 
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -580,6 +581,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ebu_nand_controller *ebu_host;
+	struct device_node *chip_np;
 	struct nand_chip *nand;
 	struct mtd_info *mtd;
 	struct resource *res;
@@ -604,7 +606,12 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (IS_ERR(ebu_host->hsnand))
 		return PTR_ERR(ebu_host->hsnand);
 
-	ret = device_property_read_u32(dev, "reg", &cs);
+	chip_np = of_get_next_child(dev->of_node, NULL);
+	if (!chip_np)
+		return dev_err_probe(dev, -EINVAL,
+				     "Could not find child node for the NAND chip\n");
+
+	ret = of_property_read_u32(chip_np, "reg", &cs);
 	if (ret) {
 		dev_err(dev, "failed to get chip select: %d\n", ret);
 		return ret;
@@ -660,7 +667,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	writel(ebu_host->cs[cs].addr_sel | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
 	       ebu_host->ebu + EBU_ADDR_SEL(cs));
 
-	nand_set_flash_node(&ebu_host->chip, dev->of_node);
+	nand_set_flash_node(&ebu_host->chip, chip_np);
 
 	mtd = nand_to_mtd(&ebu_host->chip);
 	if (!mtd->name) {
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
