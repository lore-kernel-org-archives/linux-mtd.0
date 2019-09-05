Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C20C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:21:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6342420640
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NucJXmXn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxDSo4U5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6342420640
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lfUcEx7qNplgv0iB43d2hRkICqlUIifl8mZi8mZvH1A=; b=NucJXmXnKcpbHOLk8xVh8RtiI/
	EyrRDL/rnA1nFo53T8NN3e8aA0aXL/FDIhh2w/XKIEMuO7tEcc1+NBEI2F8VcUmVbC6eXbG98U8T7
	iKvvyjL0m/xZ/bBOEfmvLtbaGW1CshI0UH/nId3XpVz19taQDh22x9Ve6CHyhgYiepTMaJimD83oi
	uBcBe5JxS75XHE9JdOgRrae03DxQ6D1sOkOIWKWxskNKAaup6QJjandgaFbE/0Oib/TquCMpBNJrC
	qcAIpXfKpOVDFr4+oDL8wkAyDdx2c2639606r+PEJ5S9vRX4BWP8zFLrikmagTlmhGpwq92fqe2ni
	zYGsIGmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uVJ-0005j5-Jd; Thu, 05 Sep 2019 16:21:01 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSg-0001B5-PG
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:21 +0000
Received: by mail-pg1-x541.google.com with SMTP id n9so1698168pgc.1
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oVyIDYAYI+VGDpI/lL7N1eH8i3MwtZKf3xtD/r8Rq24=;
 b=RxDSo4U5spH1guQJnwpIC/IDoB9wBeRnVHNJlU6ZkPdlDZGnci2vz8qQzeVqj6sHk8
 OIEP3Aw69I/XCmA2b4iKpZz7pSTX9yIxzmguy6LxNFNRQtOD1hZHZx50CRC8PIff6+Jn
 /PplH+b2d5ldVWpeCS9ka4uiFItzl73R1+KOe4NeD4/11/kYAn/1IySNj9Bit9gvqtaq
 BVSsW9xsV/zkaN+MU/3pg6WNWNHQQdNWpTw8n5BgEs56iSr3vf+9eqggw+5lcrUcaiuI
 sjZLImwlXI8C+gUp7XbIVlhEkMi75jmc05IAcQed1JPfpUYfVzvU+urgBPc0BaBeFAqr
 CjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oVyIDYAYI+VGDpI/lL7N1eH8i3MwtZKf3xtD/r8Rq24=;
 b=BlLk/X63iBuL10GXfYF2cLTSPDqx26T6nl0xTXhFdVJqzBTf1Mf++DqA5FVESITg8f
 gH8U3m6t99Pfp9zHXqxRtJTqQutI0vF4o7tAatgN2fz4zCla2aUeZnnfj0YFYad02Cgs
 c1rDjkqXAEjkaNVTGjConhuEkoU8sTiOgup/HaSp/nGKnIVa6GZ16VGZDBbZnwT3zGbl
 UmDDPQA29GgdpU8yiW0MryOmVC8L6i1aQbpIL+s7fdnnQflkMAJtGVkxgqBG1o2hrQzr
 9nSBD0pMPqSjOPyB/8uZYPX4aLQzvL4U2IFnq0JAbMeSJryUpcVqA2zC0ZmwmJyoRENL
 utvQ==
X-Gm-Message-State: APjAAAVsAZMToSoSphv3TdwAhuj1S/jbGck89mxllSUpw+6KVjjManb4
 z2u9mfwM0JtdZJCDLhxZ/oSOTA==
X-Google-Smtp-Source: APXvYqzhTRlr7lMleWMm7PihRHJXTyTnHKtYgBmHBckAchkD+HJXwuNJjzGA3Uqro4QttUg4ocqrjA==
X-Received: by 2002:a63:ea14:: with SMTP id c20mr3836155pgi.185.1567700298006; 
 Thu, 05 Sep 2019 09:18:18 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:17 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 14/18] ASoC: davinci-mcasp: Handle return value of
 devm_kasprintf
Date: Thu,  5 Sep 2019 10:17:55 -0600
Message-Id: <20190905161759.28036-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091818_898133_FD347BA1 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

commit 0c8b794c4a10aaf7ac0d4a49be2b2638e2038adb upstream

devm_kasprintf() can fail here and we must check its return value.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 sound/soc/davinci/davinci-mcasp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/davinci/davinci-mcasp.c b/sound/soc/davinci/davinci-mcasp.c
index 0480ec4c8035..af6cd8b874f5 100644
--- a/sound/soc/davinci/davinci-mcasp.c
+++ b/sound/soc/davinci/davinci-mcasp.c
@@ -1894,6 +1894,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_common",
 					  dev_name(&pdev->dev));
+		if (!irq_name) {
+			ret = -ENOMEM;
+			goto err;
+		}
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						davinci_mcasp_common_irq_handler,
 						IRQF_ONESHOT | IRQF_SHARED,
@@ -1911,6 +1915,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_rx",
 					  dev_name(&pdev->dev));
+		if (!irq_name) {
+			ret = -ENOMEM;
+			goto err;
+		}
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						davinci_mcasp_rx_irq_handler,
 						IRQF_ONESHOT, irq_name, mcasp);
@@ -1926,6 +1934,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_tx",
 					  dev_name(&pdev->dev));
+		if (!irq_name) {
+			ret = -ENOMEM;
+			goto err;
+		}
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						davinci_mcasp_tx_irq_handler,
 						IRQF_ONESHOT, irq_name, mcasp);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
