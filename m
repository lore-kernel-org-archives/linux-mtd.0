Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342D0C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC8FF21973
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxF8zm6o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="STXDMYpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC8FF21973
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ml4yyCS6WYURkzZ0udK5Hr+IHa356UwRMLjRCrX3sHU=; b=bxF8zm6oMpprOb3ehCYMBdPh1
	Ks8c/IFLUlY3DlevuwkZ09mxnF9wnzPFrcIM1vf/uVK6O7Fg3w6ycNOKpTVqyIQhl5r1AT5X91VI9
	R1FPqW9Eo1H90wcUWwfEb/YmyH6EJd/AJ59QZ4+7KM76g6fX1zOiI1DmOI/CAw27ED5MfBg7yQRL0
	R8lVejjoOlPtqEDy8UR3UQBpkkjLVW0z5BEM4zzuVJuJH+rGzhphxD/1/84hkrL8+9z2cs08ObcmL
	Exj3HrcnVB3K2nJnhPfsnt9Q7DBEBYbMaqha2VnZAJl1q4QpTtjKc4X7KLHSWUDtjOiXvx74O2TMk
	FIpkrM/ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoec-0000Yp-Cu; Thu, 17 Sep 2020 07:48:30 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoeW-0000Wb-UT
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:48:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mMUw098041;
 Thu, 17 Sep 2020 02:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600328902;
 bh=SHgXttKECBGQDR9ohxlLnwKQKV//DVB9akw0KXwlW2U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=STXDMYpH8YG2YYjA2oRpmKjST6laTX4vlvGdasGxq4mKKbT78XN5JsITm8QSWQjiY
 D88xsrbu3oPbfMamp35Wz4Huy5lPa275h3ALQSKq+6DDbKQzhH7yss9WFya/fHsfb9
 zkP1kX9etsK7XooaasQ8uN2D/QXPPvII4+cJOwXk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08H7mMR5102292
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 02:48:22 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 02:48:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 02:48:21 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mEdt100359;
 Thu, 17 Sep 2020 02:48:19 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 2/4] mtd: hyperbus: hbmc-am654: Fix direct mapping setup flash
 access
Date: Thu, 17 Sep 2020 13:17:47 +0530
Message-ID: <20200917074749.8957-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917074749.8957-1-vigneshr@ti.com>
References: <20200917074749.8957-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_034825_091199_D2A40E92 
X-CRM114-Status: GOOD (  14.62  )
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

Setting up of direct mapping should be done with flash node's IO
address space and not with controller's IO region.

Fixes: b6fe8bc67d2d3 ("mtd: hyperbus: move direct mapping setup to AM654 HBMC driver")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/hyperbus/hbmc-am654.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index e0e33f6bf513..1e70ecfffa39 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -70,7 +70,8 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
-	ret = of_address_to_resource(np, 0, &res);
+	priv->hbdev.np = of_get_next_child(np, NULL);
+	ret = of_address_to_resource(priv->hbdev.np, 0, &res);
 	if (ret)
 		return ret;
 
@@ -103,7 +104,6 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 	priv->ctlr.dev = dev;
 	priv->ctlr.ops = &am654_hbmc_ops;
 	priv->hbdev.ctlr = &priv->ctlr;
-	priv->hbdev.np = of_get_next_child(dev->of_node, NULL);
 	ret = hyperbus_register_device(&priv->hbdev);
 	if (ret) {
 		dev_err(dev, "failed to register controller\n");
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
