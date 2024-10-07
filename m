Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB610CFB442
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTfmCE3nOzEQ8gCwCuSI3lnh2frpWyWMbQxysr69REo=; b=CzMLMVD4zChPvY
	RhYDXbvq6hBh2X+MvmfD+kguLMjy0iFnReaJFbMv2zH8yBfY+pgLZJ0Uul9/li6xbhfz33TBm7Ztz
	Gv5N0NikzGvJEGY1Bg1cIiytN5qU1vfSdcS4Yd9qiOgiMit8jDxbnkRO1XxydlPX1VtMWSwJgPGBF
	AT1NBkXAc4FNx4K4M7uG24mIshIrYSVIdXPADPWqGQkVvIwuNIFeshnTIfCWwxxwAxhClBIk0Bdhb
	rXeL3gxgFkQ11t/s6a5WR245fTnlQGNxp4uws2nZhrBW4W1wZx48MczfgAoUPdRKGOrL+duwfBQu1
	UKZAuAfCwj6VNzHCe+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxn6W-00000002O0i-2o4K;
	Mon, 07 Oct 2024 12:44:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmmS-00000002JjQ-3q1q
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 12:24:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37cc846fbc4so3437595f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2024 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728303843; x=1728908643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGEx0PqXJtkFOmfslpcNhDWKLxmXujVpKffyfiMkAQo=;
        b=jNaSpubPtv+lInLbgPvmfuO/JkC4CHDVlOEXkjQ7ug1huMK5ea5r9GUfhRPWYa9N5B
         fvrH0LlVKwWvNiCcZkSTQFj2ccGzBvi8loCoHHOUQX3U1H+Tqg1jqMGih5h/a7NmJRxW
         pe0afU6sZuNyUJuBXjEYLwNmHQ0kAV+Uz4gKVeMWKS6s5EbJgSC+oiMd2AfWonrhB6tD
         O8gw0PHJuORps1q40BzbH31XcVqy7AeBUDPgIuvppJYn3m6Hw3cs9nOjhIlLf5/Z6UUA
         WvfB9MJvGcbrIDorcBFhuvRRFiDg1PrRhQMvYwamI258n+Jhy7omPYTj3ZbxhEi/fnUv
         zBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303843; x=1728908643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGEx0PqXJtkFOmfslpcNhDWKLxmXujVpKffyfiMkAQo=;
        b=EtwVu57GwzVNMPoC8ySXh6vxPDP4ckJA3PbnOiLujGVrH2aIhkZwvS6fUsuUSfs2tr
         TwHXLDaipsM+AgEMdl+54SOLxbhhE0M6dzYCrkmYdB9BuBHP700vejl3MkDflVQHbnss
         3nKr//mOV1sZ8aYyXmYrtaExBADVwjjex6nvsSEqeuOxZwPcNUxbjsSOa3ns4wqC0unr
         2cqhL8glZgZS66x/c5cP37VyYmpyGw4livIn/yHX2PU73CYEj4KTHz0LxoqA49oUD8n1
         cIM0I9Z3srJj2PRU4ikKkZg/xhuqNNKGoeJzgQs+XjFC6wn66gGOMq77LOvBU5ZRsoN2
         Qoaw==
X-Gm-Message-State: AOJu0Yzp3UmqqV9vg8KGeYXpmS6arTytf967q3T8SQ0wcp0gBvRlX/y+
	9GjXVEpCanG6xOLgzuZOHEAUklEJc115dU5ApquATx2XtcG4yY67O2AL14+z0U0=
X-Google-Smtp-Source: AGHT+IG3223yd5krdGXCAeXQtchm5yoDR1rjmKlsg43mtdR4eUr7d5W6MmDV+vaoAWxHhdsKeuM+aw==
X-Received: by 2002:a05:6000:4586:b0:371:8a90:112f with SMTP id ffacd0b85a97d-37d0e8df590mr6469416f8f.44.1728303843426;
        Mon, 07 Oct 2024 05:24:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695eee7sm5626914f8f.82.2024.10.07.05.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:24:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] mtd: rawnand: davinci: use generic device property helpers
Date: Mon,  7 Oct 2024 14:23:50 +0200
Message-ID: <20241007122350.75285-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007122350.75285-1-brgl@bgdev.pl>
References: <20241007122350.75285-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_052404_994827_FF5276DF 
X-CRM114-Status: GOOD (  13.28  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason for this driver to be using OF-specific property
accessors. Switch to using generic device property interfaces and
replace the of.h include with property.h. This allows us to no longer
check the existence of the associated of_node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mtd/nand/raw/davinci_nand.c | 42 ++++++++++++++---------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 6c884b59bc98..aa7619eec59e 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -16,8 +16,8 @@
 #include <linux/module.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #define NRCSR_OFFSET		0x00
@@ -490,7 +490,7 @@ MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
 static struct davinci_nand_pdata *
 nand_davinci_get_pdata(struct platform_device *pdev)
 {
-	if (!dev_get_platdata(&pdev->dev) && pdev->dev.of_node) {
+	if (!dev_get_platdata(&pdev->dev)) {
 		struct davinci_nand_pdata *pdata;
 		const char *mode;
 		u32 prop;
@@ -501,23 +501,24 @@ nand_davinci_get_pdata(struct platform_device *pdev)
 		pdev->dev.platform_data = pdata;
 		if (!pdata)
 			return ERR_PTR(-ENOMEM);
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-chipselect", &prop))
+		if (!device_property_read_u32(&pdev->dev,
+					      "ti,davinci-chipselect", &prop))
 			pdata->core_chipsel = prop;
 		else
 			return ERR_PTR(-EINVAL);
 
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-mask-ale", &prop))
+		if (!device_property_read_u32(&pdev->dev,
+					      "ti,davinci-mask-ale", &prop))
 			pdata->mask_ale = prop;
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-mask-cle", &prop))
+		if (!device_property_read_u32(&pdev->dev,
+					      "ti,davinci-mask-cle", &prop))
 			pdata->mask_cle = prop;
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-mask-chipsel", &prop))
+		if (!device_property_read_u32(&pdev->dev,
+					      "ti,davinci-mask-chipsel", &prop))
 			pdata->mask_chipsel = prop;
-		if (!of_property_read_string(pdev->dev.of_node,
-			"ti,davinci-ecc-mode", &mode)) {
+		if (!device_property_read_string(&pdev->dev,
+						 "ti,davinci-ecc-mode",
+						 &mode)) {
 			if (!strncmp("none", mode, 4))
 				pdata->engine_type = NAND_ECC_ENGINE_TYPE_NONE;
 			if (!strncmp("soft", mode, 4))
@@ -525,16 +526,17 @@ nand_davinci_get_pdata(struct platform_device *pdev)
 			if (!strncmp("hw", mode, 2))
 				pdata->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 		}
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-ecc-bits", &prop))
+		if (!device_property_read_u32(&pdev->dev,
+					      "ti,davinci-ecc-bits", &prop))
 			pdata->ecc_bits = prop;
 
-		if (!of_property_read_u32(pdev->dev.of_node,
-			"ti,davinci-nand-buswidth", &prop) && prop == 16)
+		if (!device_property_read_u32(&pdev->dev,
+					      "ti,davinci-nand-buswidth",
+					      &prop) && prop == 16)
 			pdata->options |= NAND_BUSWIDTH_16;
 
-		if (of_property_read_bool(pdev->dev.of_node,
-			"ti,davinci-nand-use-bbt"))
+		if (device_property_read_bool(&pdev->dev,
+					      "ti,davinci-nand-use-bbt"))
 			pdata->bbt_options = NAND_BBT_USE_FLASH;
 
 		/*
@@ -548,10 +550,8 @@ nand_davinci_get_pdata(struct platform_device *pdev)
 		 * then use "ti,davinci-nand" as the compatible in your
 		 * device-tree file.
 		 */
-		if (of_device_is_compatible(pdev->dev.of_node,
-					    "ti,keystone-nand")) {
+		if (device_is_compatible(&pdev->dev, "ti,keystone-nand"))
 			pdata->options |= NAND_NO_SUBPAGE_WRITE;
-		}
 	}
 
 	return dev_get_platdata(&pdev->dev);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
