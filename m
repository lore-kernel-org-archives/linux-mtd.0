Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB196C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 21:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuzYPkR1z0kbdFVGV5khKMThQGyW9pWahTimc2LmhB4=; b=XWftpmPzVEZ7El
	q8y4s4rOy+hFrmOxM6ku2dxE7EqW6LnYKdkcmwNw0GOB1DHTlxzTuo4rRfjbuhGfjMBXj59ej3d+3
	pUonqCRdFk19AVnQpyXqMruKsCCbDCjxiPIzrFIFuo1eryFlM+/KzzuqAnO/vOkA5cjrvm6PHU/OV
	jykjCHF7/KDsHteddhydOO6eE1z3GQUC3Ol3jStv6kr4oRKOWC1E6RQARnw+uZsDCeVcN2jQqiGQN
	OO/xfg4qWp7GeIBbNeGpeBb4w6e5CdWdKdw1DC7FOapaHuwW8eW0Y/n+/CBNCW9SsIkz9SgYw0EoZ
	QqlQV5WMjx2JaKdppSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLe-00E8Xf-4G; Wed, 29 Jun 2022 21:35:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLR-00E8Nh-US
	for linux-mtd@bombadil.infradead.org; Wed, 29 Jun 2022 21:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yCQTaNx44e60e0RQIQkoEDKE0jArPjhRbsgoDMKp9c8=; b=bA0y1W5Z8neKmPABNdhCmofY8J
	iB7Ztd3joGB8qrirjicSboGyHBq+qPi133hYDVNvgw4raJSxw9Q6QKfG1KY52HASs+QM1HpbO6Kv+
	0yXUm/uDIG0iRe4qsNXr1YJ86jsNvNYMBM0VUry4sFElM9BhGPpvgFV6U1xXRGmuZwLwdHGujuuoU
	NKqmv1JgMl7jm4/ABFwROYQaenkGVHoPKTVmy3f+GGNlWJEqFsrRxHeG/BFNCocqka6HabKFluVu+
	tzL54Y0bs0LnmzSi85kYdFw4FW+FOqxeul6qJDJoAqF5eqVMbTY572du+CeGq3eX+tJO/xj02aMpU
	VYqUSABg==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6fLJ-00EsQl-DL
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 21:35:31 +0000
Received: by mail-ej1-x635.google.com with SMTP id sb34so35083220ejc.11
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yCQTaNx44e60e0RQIQkoEDKE0jArPjhRbsgoDMKp9c8=;
        b=j04Az8TdKock4zqoZCFJWAmKg8CGvIBEZlebcrwoG9NI4+Cks/OetYkjlYXfuHSIDl
         a5AkXoBaHwPrBtTLNXjds2Wt9iHbddbpfGm3ZhSb2lzBvogs8wQAyb3xZkHlVab5gRGn
         boI1numWT38W66YUI0stYYSGBbr8IUJ0W4O332OVHt6K3p7sCN52epmBMGgw237BvMhr
         MGXIKghGa8ngKh0AbAfT108AJCUKqyiWP3NmWO0quDc242lNWqaR0MBbiszNE4ediiI8
         KqTXYTjxm+p8IlynNGlyw1evF267B91FfPy3jqOmGMFUbR5H/Gyfws3eFqF7cfjC0dy/
         OFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCQTaNx44e60e0RQIQkoEDKE0jArPjhRbsgoDMKp9c8=;
        b=Bc/c5l5B7RwF4XMkrAu/uutfgkPsQMK5WQyy+yDgqdVJuA2tzH8JyUiiY5j6SCipBk
         D1jKu+VCzH4GDMBz2rAAu4p8golHFtcaSO1nYZxUhKa1qoxfpvZR+icc4YzDmvPOtHKK
         B7iK6dkAspLUAugu68iQ0MMPL9Lgt1gllcPpLHmCHIkbPrFP6sMkvQ7q5EaWnIuzavNn
         GywGA26Fsp8Z+veO65e4AZpM3hkSML01BDv5zHm/umFUv5swXMA4WKSidABfFS/UZhCK
         OD62R691ljo1/m30g4qcT2nONE9n5CkJerly++lysBU/fd4pEJnFqSjiNdD/DocB/QxA
         QCFQ==
X-Gm-Message-State: AJIora99GxXN96/G6xKA+ZSfm5UtLqtk8PLoIx5cxss6wJ87i+1LKLQ6
	LVZp0r/EeoJQfqZ8hYRSGJ3tdECN8k8=
X-Google-Smtp-Source: AGRyM1uI95qYilUtEQg7IwrvE8KFpZWoFelSQCO8lBL60wNYpCupJqBQwTiyo5Uq0CDT6XYXynIXUA==
X-Received: by 2002:a17:907:3ea6:b0:726:3554:cf7a with SMTP id hs38-20020a1709073ea600b007263554cf7amr5406240ejc.384.1656538522228;
        Wed, 29 Jun 2022 14:35:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-003-132.77.7.pool.telefonica.de. [77.7.3.132])
        by smtp.googlemail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm8237889ejr.158.2022.06.29.14.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 14:35:21 -0700 (PDT)
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
Subject: [PATCH v2 3/8] mtd: rawnand: intel: Read the chip-select line from the correct OF node
Date: Wed, 29 Jun 2022 23:35:03 +0200
Message-Id: <20220629213508.1989600-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
References: <20220629213508.1989600-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_223527_018593_74ADB3F5 
X-CRM114-Status: GOOD (  16.54  )
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
2.37.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
