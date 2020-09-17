Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AE2C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6F821D41
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HOE7miDf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XfVFDzff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6F821D41
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iWO/SBVOsPI7jkHqQoymOhq1t73bFSBmUPHtc2oh6bc=; b=HOE7miDfDG1dVFUnKUgJzpHd9
	+dRIge5kXgJ773NRTHTsxb6jGcB71EnudS9FgUe1BUPXf4m34s0PWlbpnuvnH5ehxBdRxAl33z5ed
	O9B/QDUYsrS9tl+Rd4tJroOdSzXeLfdvIe2NoWKpk/Dpr12J7Wk7vX8wKGkTE7iDrskEL3L+XGIaM
	y47i9ZG5u3q2fL8sD5HVGM5iaDqc/rOe5CehD3GA9l8ztgnt4ObsCBfTlX4NHMwyvnOXs4cIgI7nT
	WK1qdEY9HNGEsH6HgkGHJfII3EDp4jW+MXT0XRMR7fgkhmyHHBiwYOwhfgtg378XbqkGO98uMTO5x
	1pgGmFzHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoeg-0000a6-GV; Thu, 17 Sep 2020 07:48:34 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoea-0000Xh-7e
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:48:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mOEw098051;
 Thu, 17 Sep 2020 02:48:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600328904;
 bh=XUWlwYnEa2/3Aqan6ilt7Si/rPK+fDEzdyGLCe7s26s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=XfVFDzffOZH+snsOjD7l30rhEKKlaWkQe+vP9JTPKsrN4oJGGx9RYZzs6jKALZTbm
 T0CAPjJWaUFqZJjV28Yok/6HEaG3nygfk6zWCc9Aiyv8Jh3AmlsosBv7CKSwsikuND
 zRQymHVKRpvLF87NLuxW0wPHWMC1UWBs3v/9u4GA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08H7mOQl102335
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 02:48:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 02:48:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 02:48:24 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mEdu100359;
 Thu, 17 Sep 2020 02:48:22 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 3/4] mtd: hyperbus: hbmc-am654: Drop pm_runtime* calls from
 probe
Date: Thu, 17 Sep 2020 13:17:48 +0530
Message-ID: <20200917074749.8957-4-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917074749.8957-1-vigneshr@ti.com>
References: <20200917074749.8957-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_034828_414354_D4453F9C 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Recent genpd changes for K3 platform ensure device is ON before driver
probe is called. Therefore, drop redundant pm_runtime_* calls from
driver to simplify the code.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/hyperbus/hbmc-am654.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index 1e70ecfffa39..b6a2400fcaa9 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/types.h>
 
 #define AM654_HBMC_CALIB_COUNT 25
@@ -89,13 +88,6 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 		priv->mux_ctrl = control;
 	}
 
-	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
-		goto disable_pm;
-	}
-
 	priv->hbdev.map.size = resource_size(&res);
 	priv->hbdev.map.virt = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(priv->hbdev.map.virt))
@@ -107,13 +99,11 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 	ret = hyperbus_register_device(&priv->hbdev);
 	if (ret) {
 		dev_err(dev, "failed to register controller\n");
-		pm_runtime_put_sync(&pdev->dev);
-		goto disable_pm;
+		goto disable_mux;
 	}
 
 	return 0;
-disable_pm:
-	pm_runtime_disable(dev);
+disable_mux:
 	if (priv->mux_ctrl)
 		mux_control_deselect(priv->mux_ctrl);
 	return ret;
@@ -127,8 +117,6 @@ static int am654_hbmc_remove(struct platform_device *pdev)
 	ret = hyperbus_unregister_device(&priv->hbdev);
 	if (priv->mux_ctrl)
 		mux_control_deselect(priv->mux_ctrl);
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
