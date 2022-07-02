Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D68C43334
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Jul 2022 23:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuzYPkR1z0kbdFVGV5khKMThQGyW9pWahTimc2LmhB4=; b=W8v6mqq88AlAZy
	OI9flLriy0T5IdJazUH/KZUkz4B7sBj5XrbnY9Wwl4QDDAOIOKCCFQZ1DNEDhuBNXJZkP22YXeVo2
	gVMlxN41tO4DhtSacHosSWcNfC55/dnkgK8hdGiFpp0e19nHKUuWcQqL911quVwKWhOrfmenAEW8l
	d7DOYEhyT0njtHzxOvabs9ugF44gf+l23beycHaToSnyBTLgPa7Ain86F46IMsXU69CRYyYkd6M5d
	aEyZNa+unJUbEK/RHQsMGUMch8sQ/9wAB29uyY4+Cvy5CNCcNVDcartDNU6brDNEk87zG/d0UgEKM
	uLrENzDJyWgyegXuhFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mIE-00C94Y-Td; Sat, 02 Jul 2022 23:12:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7mI8-00C90H-9w
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2022 23:12:45 +0000
Received: by mail-ed1-x536.google.com with SMTP id y8so1399013eda.3
        for <linux-mtd@lists.infradead.org>; Sat, 02 Jul 2022 16:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yCQTaNx44e60e0RQIQkoEDKE0jArPjhRbsgoDMKp9c8=;
        b=dgxlSIjFJwSCBjcvyW+PrWZomTklrALAUl2SxmBCl2+hC6/UnRF5C/QTl3DI+XlaVm
         zPO8X3hufGMWdx72k5+9W8OKCvBdvH9sJi62Lzdwy1jCQ7DwQFh/WtXIhbtDXFnP9DF3
         n+xyF3SF1GEjaCY5YFD4IqX8XYShGmQ1AP1p/mxjajLRY0pMb941kFcCysS76Nv/vosM
         Y+1pJzmWG6ZcEky7XuMSGEC9onUjyVQF57dI7uMF/+4W9DNHFjHZZ3esF62Jw1IBV1I3
         8Ihy3m3EuL2VX4CoUBd3zbxYNfVrTfaHzHIlvmn1KYV702KpO0NM4K51sbBbVJVeNEM2
         +tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCQTaNx44e60e0RQIQkoEDKE0jArPjhRbsgoDMKp9c8=;
        b=H/8qWEyKdwFiNNnRqsO8a6AMJuXi5tEruhlg/ma5EbwjGZ5kvLVIibjSJfjzwYeq9Z
         rqjTQ26dEYxZMH03RHnrlBOOHWEGwXp6cn0LntznXahBJPT5H2id4P+jDiZIBEkU3s1T
         oQulWvU5n2hr9ftBK0VnM/LB4n0t5rJaxz+B++yiCSZL9aihuDE3Zvkkx7NLhwf9oRBO
         uxVDex5toqj8hTSqvXZ4b18nV+kCVimFlCFqQmMDwiU3k2X70dzHPdJtplzZas0lZ8BU
         0cLccsw2qpfnxSUGL4yZjNsqGbipAFbevrq4b+tYY5c5ndOmUp81JSwKEzJTTKo04326
         L7tg==
X-Gm-Message-State: AJIora9i45Y5+/Bs6PbfcDNgo8oArjv+qn/d98+6UeBkdJkgQIFMUe7m
	ldrR66FAJtWmy8LOe36i7P9lRSG1Kv8=
X-Google-Smtp-Source: AGRyM1sKu0kp3FtCCbBKNYht3OJTpZgRKfuJVirFs6MCvvcbODpijjhQI7TKv9HNwbq7BMmmy6Kzag==
X-Received: by 2002:aa7:c9cf:0:b0:435:de3b:c499 with SMTP id i15-20020aa7c9cf000000b00435de3bc499mr27700806edt.321.1656803562966;
        Sat, 02 Jul 2022 16:12:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4d4-2700-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4d4:2700:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm12234329ejb.28.2022.07.02.16.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 16:12:42 -0700 (PDT)
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
Subject: [PATCH v3 3/8] mtd: rawnand: intel: Read the chip-select line from the correct OF node
Date: Sun,  3 Jul 2022 01:12:22 +0200
Message-Id: <20220702231227.1579176-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_161244_383306_33DD1972 
X-CRM114-Status: GOOD (  16.33  )
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
